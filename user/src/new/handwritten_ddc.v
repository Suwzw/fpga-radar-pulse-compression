`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/13 11:19:50
// Design Name: 
// Module Name: handwritten_ddc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
// Module: handwritten_ddc
// Description:
//   手写的数字下变频(DDC)模块。
//   1. 调用NCO模块产生本地正余弦波。
//   2. 将输入的IF信号与NCO输出相乘，完成混频。
//   3. 调用两个并行的CIC滤波器，分别处理I路和Q路信号。
//////////////////////////////////////////////////////////////////////////////////


module handwritten_ddc #(
    // --- NCO 参数 ---
    parameter NCO_PHASE_WIDTH = 32,
    parameter NCO_ADDR_BITS   = 10,
    parameter NCO_DATA_WIDTH  = 12,

    // --- 输入信号参数 ---
    parameter IF_DATA_WIDTH   = 12,

    // --- CIC 滤波器参数 ---
    parameter CIC_R = 10, // 抽取率 (100MHz -> 10MHz)
    parameter CIC_D = 5,  // CIC阶数
    // 输出位宽计算: InWidth + D*ceil(log2(R)) = (12+12) + 5*ceil(log2(10)) = 24 + 5*4 = 44
    parameter CIC_OUTPUT_WIDTH = 44 
)(
    input wire clk,
    input wire rst,

    // 数据输入 (来自if_data_rom)
    input wire signed [IF_DATA_WIDTH-1:0] if_data_in,

    // 数据输出 (送往后续的脉冲压缩滤波器)
    output wire signed [CIC_OUTPUT_WIDTH-1:0] i_data_out,
    output wire signed [CIC_OUTPUT_WIDTH-1:0] q_data_out,
    output wire data_out_valid
);

    // --- 内部信号线 ---
    wire signed [NCO_DATA_WIDTH-1:0] nco_sine;
    wire signed [NCO_DATA_WIDTH-1:0] nco_cosine;

    // 乘法结果位宽 = 12 + 12 = 24
    localparam MIXER_OUT_WIDTH = IF_DATA_WIDTH + NCO_DATA_WIDTH;
    wire signed [MIXER_OUT_WIDTH-1:0] mixed_i_raw;
    wire signed [MIXER_OUT_WIDTH-1:0] mixed_q_raw;

    reg  signed [MIXER_OUT_WIDTH-1:0] mixed_i_reg;
    reg  signed [MIXER_OUT_WIDTH-1:0] mixed_q_reg;
    
    // NCO频率控制字: round((20e6 / 100e6) * 2^32) = 858993459
    localparam PHASE_INCREMENT_20MHZ = 32'd858993459;


    // 1. 实例化NCO
    nco #(
        .PHASE_WIDTH(NCO_PHASE_WIDTH),
        .ADDR_BITS(NCO_ADDR_BITS),
        .DATA_WIDTH(NCO_DATA_WIDTH)
    ) nco_inst (
        .clk(clk),
        .rst(rst),
        .phase_increment(PHASE_INCREMENT_20MHZ),
        .sine_out(nco_sine),
        .cosine_out(nco_cosine)
    );

    // 2. 数字混频 (乘法器)
    //    I = In * cos, Q = In * (-sin)
    assign mixed_i_raw = if_data_in * nco_cosine;
    assign mixed_q_raw = if_data_in * (-nco_sine); 

    // 加一级寄存器，改善时序
    always @(posedge clk) begin
        mixed_i_reg <= mixed_i_raw;
        mixed_q_reg <= mixed_q_raw;
    end

    // 3. 实例化两个并行的CIC滤波器
    //    一个处理I路，一个处理Q路
    MultCIC #(
        .MODE("DEC"),
        .R(CIC_R),
        .D(CIC_D),
        .INPUT_WIDTH(MIXER_OUT_WIDTH),
        .OUTPUT_WIDTH(CIC_OUTPUT_WIDTH)
    ) cic_filter_i (
        .rst(rst),
        .clk(clk),
        .Xin(mixed_i_reg),
        .Yout(i_data_out),
        .rdy(data_out_valid) // I路和Q路的rdy是同步的，用一个即可
    );

    MultCIC #(
        .MODE("DEC"),
        .R(CIC_R),
        .D(CIC_D),
        .INPUT_WIDTH(MIXER_OUT_WIDTH),
        .OUTPUT_WIDTH(CIC_OUTPUT_WIDTH)
    ) cic_filter_q (
        .rst(rst),
        .clk(clk),
        .Xin(mixed_q_reg),
        .Yout(q_data_out),
        .rdy() // Q路的rdy可以悬空
    );

endmodule
