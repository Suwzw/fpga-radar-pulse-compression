`timescale 1ns / 1ps
// =============================================================================
// Module: pulse_compressor (多驱动源终极修正版)
// Description:
//   - 修正了因多个FIR IP核的tready和tvalid输出连接到同一根wire而导致的多驱动源错误。
// =============================================================================
module pulse_compressor (
    input wire clk,
    input wire rst, // 高电平有效复位

    // 来自DDC的输入
    input wire data_valid_in,
    input wire signed [43:0] ddc_i_in,
    input wire signed [43:0] ddc_q_in,

    // 最终的复数输出
    output wire data_valid_out,
    output wire signed [48:0] i_data_out, // 位宽是48+1=49位
    output wire signed [48:0] q_data_out
);

    // --- 内部信号线 ---
    localparam FIR_IO_WIDTH = 48; 
    
    wire signed [FIR_IO_WIDTH-1:0] fir_in_i;
    wire signed [FIR_IO_WIDTH-1:0] fir_in_q;
    assign fir_in_i = {{4{ddc_i_in[43]}}, ddc_i_in}; // 44位扩展到48位
    assign fir_in_q = {{4{ddc_q_in[43]}}, ddc_q_in};

    wire signed [FIR_IO_WIDTH-1:0] i_conv_hi_out;
    wire signed [FIR_IO_WIDTH-1:0] q_conv_hq_out;
    wire signed [FIR_IO_WIDTH-1:0] i_conv_hq_out;
    wire signed [FIR_IO_WIDTH-1:0] q_conv_hi_out;
    
    // ============================ 关键修改点 ================================
    // 为每一个我们不关心的输出端口，都声明一根独立的wire
    wire valid_out_ignored_1, valid_out_ignored_2, valid_out_ignored_3;
    wire ready_in_ignored_1, ready_in_ignored_2, ready_in_ignored_3, ready_in_ignored_4;
    // ========================================================================


    // --- 1. 例化第一路: I_in * h_i ---
    fir_i_compiler fir_i_hi (
      .aclk(clk),
      .aresetn(~rst),
      .s_axis_data_tvalid(data_valid_in),
      .s_axis_data_tready(ready_in_ignored_1), 
      .s_axis_data_tdata(fir_in_i),
      .m_axis_data_tvalid(data_valid_out), // 我们用这一路的valid作为总的输出valid
      .m_axis_data_tdata(i_conv_hi_out)
    );

    // --- 2. 例化第二路: Q_in * h_q ---
    fir_q_compiler fir_q_hq (
      .aclk(clk),
      .aresetn(~rst),
      .s_axis_data_tvalid(data_valid_in),
      .s_axis_data_tready(ready_in_ignored_2),
      .s_axis_data_tdata(fir_in_q),
      .m_axis_data_tvalid(valid_out_ignored_1), // 连接到专属的wire
      .m_axis_data_tdata(q_conv_hq_out)
    );

    // --- 3. 例化第三路: I_in * h_q ---
    fir_q_compiler fir_i_hq (
      .aclk(clk),
      .aresetn(~rst),
      .s_axis_data_tvalid(data_valid_in),
      .s_axis_data_tready(ready_in_ignored_3),
      .s_axis_data_tdata(fir_in_i),
      .m_axis_data_tvalid(valid_out_ignored_2), // 连接到专属的wire
      .m_axis_data_tdata(i_conv_hq_out)
    );

    // --- 4. 例化第四路: Q_in * h_i ---
    fir_i_compiler fir_q_hi (
      .aclk(clk),
      .aresetn(~rst),
      .s_axis_data_tvalid(data_valid_in),
      .s_axis_data_tready(ready_in_ignored_4),
      .s_axis_data_tdata(fir_in_q),
      .m_axis_data_tvalid(valid_out_ignored_3), // 连接到专属的wire
      .m_axis_data_tdata(q_conv_hi_out)
    );


    // --- 5. 最终的加减法运算 ---
    assign i_data_out = i_conv_hi_out - q_conv_hq_out;
    assign q_data_out = i_conv_hq_out + q_conv_hi_out;

endmodule