`timescale 1ns / 1ps
// =============================================================================
// Verilog Testbench for 'pulse_compressor.v' Module (延迟修正版)
//
// 关键修正:
//   - 大大延长了仿真时间，以等待FIR滤波器深流水线的第一个有效输出。
// =============================================================================
module tb_pulse_compressor();

    // --- 参数定义 ---
    localparam CLK_PERIOD = 10; // 100MHz 时钟
    localparam ROM_DEPTH  = 1500;

    // --- 信号声明 ---
    reg clk;
    reg rst;
    
    reg  [10:0] rom_addr;
    wire signed [11:0] rom_data_out;
    
    wire signed [43:0] ddc_i_out;
    wire signed [43:0] ddc_q_out;
    wire               ddc_valid;

    wire signed [48:0] fir_i_out; // 修正位宽：48+1=49位
    wire signed [48:0] fir_q_out;
    wire               fir_valid;



    // --- 1. 实例化信号源 (if_data_rom) ---
    if_data_rom rom_inst (
        .clka(clk), .ena(1'b1), .addra(rom_addr), .douta(rom_data_out)
    );

    // --- 2. 实例化激励生成器 (handwritten_ddc) ---
    handwritten_ddc ddc_inst (
        .clk(clk), .rst(rst), .if_data_in(rom_data_out),
        .i_data_out(ddc_i_out), .q_data_out(ddc_q_out), .data_out_valid(ddc_valid)
    );

    // --- 3. 实例化待测试模块 (pulse_compressor) ---
    pulse_compressor dut (
        .clk(clk), .rst(rst), .data_valid_in(ddc_valid),
        .ddc_i_in(ddc_i_out), .ddc_q_in(ddc_q_out),
        .data_valid_out(fir_valid), .i_data_out(fir_i_out), .q_data_out(fir_q_out)
    );

    // --- 4. 生成时钟和ROM地址 ---
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) rom_addr <= 0;
        else if (rom_addr < ROM_DEPTH - 1) rom_addr <= rom_addr + 1;
    end

    // --- 5. 仿真控制 ---
    initial begin        
        rst = 1;
        #50;
        rst = 0;

        // ============================ 关键修改点 ================================
        // 等待足够长的时间让整个流水线处理完所有数据
        // DDC输入1500个点，每个点需要10个周期，约15000周期
        // FIR流水线延迟约1000个有效数据点，需要 1000 * 10 = 10000 周期
        // 我们运行 30000 个时钟周期 (300 us) 来确保能看到结果
        #(CLK_PERIOD * 30000);
        // ========================================================================
        
        $stop;
    end


endmodule