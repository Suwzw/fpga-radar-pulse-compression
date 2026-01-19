`timescale 1ns / 1ps
// =============================================================================
// Module: radar_top (最终版 - 已集成硬件噪声发生器)
// Description:
//   整个雷达脉冲压缩项目的最终顶层模块。
//   连接了：ROM -> 噪声发生器 -> 加法器 -> 手写DDC -> 脉冲压缩模块 -> CORDIC IP核
// =============================================================================
module radar_top(
        input wire clk,
        input wire rst,
        input wire [2:0] debug_switch, // 【新增】接收外部的按键状态 (0~6)
        output wire uart_tx_pin, // UART发送引脚
        
        // --- START: 为DAC波形选择器模块增加输出端口 ---
        output wire signed [11:0] rom_data_out_raw,   // 新增：原始ROM信号
        output wire signed [11:0] noisy_if_data_out,
        output wire signed [43:0] ddc_i_out_raw,
        output wire signed [43:0] ddc_q_out_raw,
        output wire             ddc_valid_raw,
        output wire signed [48:0] comp_i_out_raw,
        output wire signed [48:0] comp_q_out_raw,
        output wire             fir_valid_raw,
        output wire signed [47:0] mag_interp_out_raw,
        // --- END: 为DAC波形选择器模块增加输出端口 ---
        
        // 【新增】把内部的高精度模值引出来给ILA看旁瓣
        output wire [31:0] final_magnitude_monitor
    );

    // --- ROM -> DDC ---
    wire signed [11:0] rom_data_out; // ROM输出的"干净"信号
    reg  [10:0]        rom_addr;

    if_data_rom rom_inst (
                    .clka(clk),
                    .ena(1'b1),
                    .addra(rom_addr),
                    .douta(rom_data_out)
                );

    always @(posedge clk or posedge rst) begin
        if (rst)
            rom_addr <= 0;
        else if (rom_addr < 1500 - 1)
            rom_addr <= rom_addr + 1;
        else
            rom_addr <= 0; // 当地址达到1499后，在下一个时钟周期将其清零
    end

    // =====================================================================
    // ======================== 新增修改部分：开始 ===========================
    // =====================================================================
    wire pulse_start_sync;
    assign pulse_start_sync = (rom_addr == 11'd0); // 当ROM地址为0时，产生一个高电平
    // ======================== 新增修改部分：结束 ===========================
    // =====================================================================

    // 1. 例化高斯白噪声发生器
    wire signed [4:0] generated_noise; // 来自噪声模块的原始噪声 [-6, 6]

    clt_noise_generator noise_gen_inst (
                            .clk(clk),
                            .rst_n(~rst), // 注意：我们的噪声模块用的是低电平复位
                            .noise_out(generated_noise)
                        );

    // 2. 噪声幅度缩放
    //    直接将[-6, 6]的噪声加到[-2048, 2047]的信号上效果不明显。
    //    需要乘以一个系数来放大噪声，这个系数可以根据仿真结果来调整。
    localparam NOISE_SCALE_FACTOR = 100; // 可调参数：噪声放大系数 (重新启用噪声)
    wire signed [11:0] scaled_noise;   // 放大后的噪声

    // 乘法器实现缩放： 5位噪声 * 7位系数 (50) -> 12位结果
    assign scaled_noise = generated_noise * NOISE_SCALE_FACTOR;

    // 3. 将干净信号与噪声相加
    wire signed [11:0] noisy_if_data; // 加噪后的信号

    // 将12位的干净信号和12位的噪声信号相加。
    // 结果理论上会超出12位，但DDC的输入是12位，所以我们直接截断，
    // 这在硬件上是最简单的实现，相当于只取低12位。
    assign noisy_if_data = rom_data_out + scaled_noise; // 恢复噪声功能
    // assign noisy_if_data = rom_data_out;                  // 纯净信号（调试用）

    // ======================== 新增修改部分：结束 ===========================
    // =====================================================================

    // --- DDC -> Pulse Compressor ---
    wire signed [43:0] ddc_i_out;
    wire signed [43:0] ddc_q_out;
    wire               ddc_valid;

    // **关键修改**: 将DDC的输入从 rom_data_out 改为 noisy_if_data
    handwritten_ddc ddc_inst (
                        .clk(clk),
                        .rst(rst),
                        .if_data_in(noisy_if_data), // <--- 输入已加噪的信号
                        .i_data_out(ddc_i_out),
                        .q_data_out(ddc_q_out),
                        .data_out_valid(ddc_valid)
                    );

    // --- Pulse Compressor -> CORDIC ---
    wire signed [48:0] fir_i_out_full; // FIR输出的全精度结果 (49位)
    wire signed [48:0] fir_q_out_full;
    wire               fir_valid;

    pulse_compressor compressor_inst (
                         .clk(clk),
                         .rst(rst),
                         .data_valid_in(ddc_valid),
                         .ddc_i_in(ddc_i_out),
                         .ddc_q_in(ddc_q_out),
                         .data_valid_out(fir_valid),
                         .i_data_out(fir_i_out_full),
                         .q_data_out(fir_q_out_full)
                     );

    // **位宽截断逻辑** (从49位截断为CORDIC可以接收的48位)
    wire signed [47:0] cordic_i_in;
    wire signed [47:0] cordic_q_in;
    assign cordic_i_in = fir_i_out_full[48:1]; // 保留高48位
    assign cordic_q_in = fir_q_out_full[48:1]; // 保留高48位

    // --- CORDIC -> 最终结果 ---
    wire [63:0] cordic_out_tdata; // CORDIC AXI-Stream输出 (Phase在高位, Mag在低位)
    wire        cordic_out_tvalid;
    localparam CORDIC_MAG_WIDTH = 32; // CORDIC输出位宽，根据你的配置

    cordic_magnitude cordic_inst (
                         .aclk(clk),
                         .aresetn(~rst), // 假设CORDIC有复位端口
                         .s_axis_cartesian_tvalid(fir_valid),
                         .s_axis_cartesian_tdata({cordic_q_in, cordic_i_in}),
                         .m_axis_dout_tvalid(cordic_out_tvalid),
                         .m_axis_dout_tdata(cordic_out_tdata)
                     );

    // 从AXI-Stream总线中提取我们需要的幅度信号
    wire signed [CORDIC_MAG_WIDTH-1:0] final_magnitude;
    assign final_magnitude = cordic_out_tdata[CORDIC_MAG_WIDTH-1:0];


    // =====================================================================
    // ======================== 【新增】UART 数据多路选择器 ==================
    // =====================================================================
    reg [31:0] uart_monitor_data; // 准备送给串口的32位数据

    always @(*) begin
        case (debug_switch)
            // 模式0: 原始ROM (12位 -> 补零到32位)
            3'd0: uart_monitor_data = {20'd0, rom_data_out}; 
            
            // 模式1: 加噪信号 (12位 -> 补零到32位)
            3'd1: uart_monitor_data = {20'd0, noisy_if_data};

            // 模式2: DDC I路 (44位 -> 截取高32位)
            3'd2: uart_monitor_data = ddc_i_out[43:12];     

            // 模式3: DDC Q路 (44位 -> 截取高32位)
            3'd3: uart_monitor_data = ddc_q_out[43:12];

            // 模式4: 脉压 I路 (49位 -> 截取高32位)
            3'd4: uart_monitor_data = fir_i_out_full[48:17];

            // 模式5: 脉压 Q路 (49位 -> 截取高32位)
            3'd5: uart_monitor_data = fir_q_out_full[48:17];

            // 模式6: 最终模值 (32位 -> 直接连接)
            3'd6: uart_monitor_data = final_magnitude;

            // 默认: 发送最终模值
            default: uart_monitor_data = final_magnitude;
        endcase
    end

    // =====================================================================
    // ======================== UART 发送逻辑 (最终修正版) ===================
    // =====================================================================
    reg [7:0] tx_data_reg;
    reg       tx_start_reg;
    wire      tx_busy_wire;
    
    reg [31:0] mag_buffer_reg; // 存储幅度的缓冲区
    reg [3:0]  send_state_reg; // 状态机寄存器 (位宽增加到4位)

    // 例化 UART TX 模块
    uart_tx #(
        .CLK_FREQ(100_000_000), // 系统时钟为100MHz
        .BAUD_RATE(115200)      // 波特率设为115200
    ) u_uart_tx (
        .i_clk(clk),
        .i_rst(rst),
        .i_tx_start(tx_start_reg),
        .i_tx_data(tx_data_reg),
        .o_tx_busy(tx_busy_wire),
        .o_uart_tx(uart_tx_pin)    // 连接到顶层输出
    );

    // 发送控制状态机 (最终修正版 - 真正稳定的握手逻辑)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            send_state_reg <= 0;
            tx_start_reg   <= 1'b0;
            tx_data_reg    <= 8'd0;
            mag_buffer_reg <= 0;
        end else begin
            tx_start_reg <= 1'b0; // 默认不启动
            case (send_state_reg)
                0: // IDLE: 等待有效数据
                    if (cordic_out_tvalid) begin
                        mag_buffer_reg <= uart_monitor_data; // 【修改】根据按键状态发送对应的数据
                        send_state_reg <= 1;
                    end

                // --- 发送帧头 ---
                1: // 准备发送 0xA5
                    if (!tx_busy_wire) begin
                        tx_data_reg  <= 8'hA5;
                        tx_start_reg <= 1'b1;
                        send_state_reg <= 2;
                    end
                2: // 等待 0xA5 发送完毕
                    if (!tx_busy_wire) begin
                        send_state_reg <= 3;
                    end
                3: // 准备发送 0x5A
                    if (!tx_busy_wire) begin
                        tx_data_reg  <= 8'h5A;
                        tx_start_reg <= 1'b1;
                        send_state_reg <= 4;
                    end
                4: // 等待 0x5A 发送完毕
                    if (!tx_busy_wire) begin
                        send_state_reg <= 5;
                    end
                
                // --- 发送数据 ---
                5: // 准备发送 Byte 3 (MSB)
                    if (!tx_busy_wire) begin
                        tx_data_reg  <= mag_buffer_reg[31:24];
                        tx_start_reg <= 1'b1;
                        send_state_reg <= 6;
                    end
                6: // 等待 Byte 3 发送完毕
                    if (!tx_busy_wire) begin
                        send_state_reg <= 7;
                    end
                7: // 准备发送 Byte 2
                    if (!tx_busy_wire) begin
                        tx_data_reg  <= mag_buffer_reg[23:16];
                        tx_start_reg <= 1'b1;
                        send_state_reg <= 8;
                    end
                8: // 等待 Byte 2 发送完毕
                    if (!tx_busy_wire) begin
                        send_state_reg <= 9;
                    end
                9: // 准备发送 Byte 1
                    if (!tx_busy_wire) begin
                        tx_data_reg  <= mag_buffer_reg[15:8];
                        tx_start_reg <= 1'b1;
                        send_state_reg <= 10;
                    end
                10: // 等待 Byte 1 发送完毕
                    if (!tx_busy_wire) begin
                        send_state_reg <= 11;
                    end
                11: // 准备发送 Byte 0 (LSB)
                    if (!tx_busy_wire) begin
                        tx_data_reg  <= mag_buffer_reg[7:0];
                        tx_start_reg <= 1'b1;
                        send_state_reg <= 12;
                    end
                12: // 等待 Byte 0 发送完毕
                    if (!tx_busy_wire) begin
                        send_state_reg <= 0; // 全部发送完毕, 返回IDLE
                    end
                
                default:
                    send_state_reg <= 0;
            endcase
        end
    end


    // =====================================================================
    // ======================== START: DAC Integration (FIR Interpolator) ===
    // =====================================================================
    
    // --- 1. 声明连接IP核所需的wire ---
    wire fir_tready;
    wire dac_valid;
    // 根据您的.veo文件，IP核的输出数据位宽是48位
    wire signed [47:0] dac_fir_output; 


    // --- 2. 使用正确的端口名例化IP核 ---
    fir_interpolator_0 fir_interp_inst (
        // 控制信号
        .aclk(clk),
        .aresetn(~rst),                 // <<--- 连接新添加的、正确的复位端口 (AXI复位通常是低电平有效)

        // 输入端 (AXI-Stream接口)
        .s_axis_data_tvalid(cordic_out_tvalid),
        .s_axis_data_tready(fir_tready),
        .s_axis_data_tdata(final_magnitude),
        
        // 输出端 (AXI-Stream接口)
        .m_axis_data_tvalid(dac_valid),
        .m_axis_data_tdata(dac_fir_output)
    );


    // =====================================================================
    // ==================== 输出端口连接 (用于DAC波形选择器) =================
    // =====================================================================
    
    // 将内部信号连接到输出端口，供外部DAC波形选择器使用
    assign rom_data_out_raw  = rom_data_out;    // 新增：原始ROM信号
    assign noisy_if_data_out = noisy_if_data;
    assign ddc_i_out_raw     = ddc_i_out;
    assign ddc_q_out_raw     = ddc_q_out;
    assign ddc_valid_raw     = ddc_valid;
    assign comp_i_out_raw    = fir_i_out_full;
    assign comp_q_out_raw    = fir_q_out_full;
    assign fir_valid_raw     = fir_valid;
    assign mag_interp_out_raw= dac_fir_output;
    
    // 【新增】将高精度幅度值引出给ILA观察旁瓣
    assign final_magnitude_monitor = final_magnitude;

    // =====================================================================
    // ========================= END: DAC Integration ======================
    // =====================================================================


endmodule
