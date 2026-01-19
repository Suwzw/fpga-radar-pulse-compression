`timescale 1ns / 1ps

module dac_waveform_selector #(
    parameter R = 10 // DDC和脉冲压缩后的数据与主时钟的速率比
)(
    input wire clk,
    input wire rst,
    input wire btn_next,

    // ---- 从 radar_top 模块传入的原始波形数据 ----
    // 1. 原始ROM中频信号 (12位, 100MSPS)
    input wire signed [11:0] if_clean_in,
    
    // 2. 加噪后的IF信号 (12位, 100MSPS)
    input wire signed [11:0] if_noisy_in,
    
    // 3. DDC I/Q信号 (44位, 10MSPS)
    input wire signed [43:0] ddc_i_in,
    input wire signed [43:0] ddc_q_in,
    input wire             ddc_valid_in,

    // 4. 脉冲压缩后I/Q信号 (49位, 10MSPS)
    input wire signed [48:0] comp_i_in,
    input wire signed [48:0] comp_q_in,
    input wire             fir_valid_in,

    // 5. 最终插值后幅度 (48位, 100MSPS)
    input wire signed [47:0] mag_interp_in,

    // ---- 连接到物理DAC的输出端口 ----
    output wire dac_clk_out,
    output wire dac_pd_out,
    output wire [7:0] dac_data_out,
    
    // ---- 状态输出 (用于ILA观察) ----
    output wire [2:0] waveform_select_out
);

    // =============================================================================
    // 1. 按键消抖与选择计数器
    // =============================================================================
    
    // 按键消抖 - Next按键
    reg [19:0] debounce_counter_next = 0;
    reg btn_next_prev = 0;
    reg btn_next_reg = 0;
    wire btn_next_pulse;
    
    always @(posedge clk) begin
        if (rst) begin
            debounce_counter_next <= 0;
            btn_next_prev <= 0;
            btn_next_reg <= 0;
        end else begin
            btn_next_prev <= btn_next;
            
            if (btn_next && !btn_next_prev) begin // 检测上升沿
                debounce_counter_next <= 20'd1000000; // 10ms debounce for real hardware @ 100MHz
                btn_next_reg <= 1'b0;
            end else if (debounce_counter_next > 0) begin
                debounce_counter_next <= debounce_counter_next - 1;
                if (debounce_counter_next == 1)
                    btn_next_reg <= 1'b1;
            end else begin
                btn_next_reg <= 1'b0;
            end
        end
    end
    assign btn_next_pulse = btn_next_reg;

    // 波形选择状态机 (单按键循环切换)
    reg [2:0] waveform_select = 0; // 3位 -> 8个波形，我们用0-6 (7个波形)
    always @(posedge clk) begin
        if (rst) begin
            waveform_select <= 0;
        end else if (btn_next_pulse) begin
            if (waveform_select == 6) // 当显示最后一个波形时，再按一次就回到第一个
                waveform_select <= 0;
            else
                waveform_select <= waveform_select + 1;
        end
    end
    
    assign waveform_select_out = waveform_select;

    // =============================================================================
    // 2. 准备并统一所有待选波形的格式
    // =============================================================================
    
    wire signed [7:0] dac_if_clean;     // 新增：原始ROM信号
    wire signed [7:0] dac_if_noisy;
    wire signed [7:0] dac_ddc_i;
    wire signed [7:0] dac_ddc_q;
    wire signed [7:0] dac_comp_i;
    wire signed [7:0] dac_comp_q;
    wire signed [7:0] dac_mag_interp;
    
    // 波形0: 原始ROM信号 (12位, 100MSPS) -> 8位有符号
    assign dac_if_clean = if_clean_in[11:4];
    
    // 波形1: 加噪IF信号 (12位, 100MSPS) -> 8位有符号
    assign dac_if_noisy = if_noisy_in[11:4];

    // 波形2,3: DDC I/Q (44位, 10MSPS) -> 8位有符号, 100MSPS (零阶保持升采样)
    reg signed [43:0] ddc_i_held, ddc_q_held;
    always @(posedge clk) begin
        if (rst) begin
            ddc_i_held <= 0;
            ddc_q_held <= 0;
        end else if (ddc_valid_in) begin
            ddc_i_held <= ddc_i_in;
            ddc_q_held <= ddc_q_in;
        end
    end
    assign dac_ddc_i = ddc_i_held[38:31]; // 调整截位范围优化显示效果
    assign dac_ddc_q = ddc_q_held[38:31]; // 调整截位范围优化显示效果

    // 波形4,5: 脉冲压缩I/Q (49位, 10MSPS) -> 8位有符号, 100MSPS (零阶保持升采样)
    reg signed [48:0] comp_i_held, comp_q_held;
    always @(posedge clk) begin
        if (rst) begin
            comp_i_held <= 0;
            comp_q_held <= 0;
        end else if (fir_valid_in) begin
            comp_i_held <= comp_i_in;
            comp_q_held <= comp_q_in;
        end
    end
    assign dac_comp_i = comp_i_held[36:29]; // 优化截位范围增大波形幅度
    assign dac_comp_q = comp_q_held[36:29]; // 优化截位范围增大波形幅度

    // 波形6: 最终插值幅度 (48位, 100MSPS) -> 8位有符号
    assign dac_mag_interp = mag_interp_in[35:28]; // 使用与当前系统相同的范围

    // =============================================================================
    // 3. 最终波形多路复用器
    // =============================================================================
    
    reg signed [7:0] dac_signed_data;
    always @(*) begin
        case (waveform_select)
            3'b000: dac_signed_data = dac_if_clean;     // 0: 原始ROM中频信号
            3'b001: dac_signed_data = dac_if_noisy;     // 1: 加噪后中频信号
            3'b010: dac_signed_data = dac_ddc_i;        // 2: DDC I路
            3'b011: dac_signed_data = dac_ddc_q;        // 3: DDC Q路
            3'b100: dac_signed_data = dac_comp_i;       // 4: 脉冲压缩后I路
            3'b101: dac_signed_data = dac_comp_q;       // 5: 脉冲压缩后Q路
            3'b110: dac_signed_data = dac_mag_interp;   // 6: 最终插值后幅度
            default: dac_signed_data = 8'h00;
        endcase
    end

    // =============================================================================
    // 4. 连接到物理DAC
    // =============================================================================
    
    assign dac_clk_out = clk;
    assign dac_pd_out = 1'b0; // DAC始终使能
    assign dac_data_out = dac_signed_data ^ 8'h80; // 转换为无符号（XOR翻转符号位）

endmodule