`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Module Name: Integrated (Corrected Pipelined Version)
// Description: 带参数化积分级数D的积分模块 (已修正为完全流水线结构)
//////////////////////////////////////////////////////////////////////////////////
module Integrated #(
    parameter D = 3,
    parameter INPUT_WIDTH = 14,
    parameter OUTPUT_WIDTH = 20
)(
    input                           rst,
    input                           clk,
    input      signed [INPUT_WIDTH-1:0]  Xin,
    output     signed [OUTPUT_WIDTH-1:0] Intout
);

    // 定义D+1级流水线，用于连接每一级积分器
    wire signed [OUTPUT_WIDTH-1:0] integrator_stages [0:D];
    
    // 将输入符号位扩展后作为第0级输入
    assign integrator_stages[0] = {{(OUTPUT_WIDTH-INPUT_WIDTH){Xin[INPUT_WIDTH-1]}}, Xin};

    // 使用 generate for 循环生成D级独立的流水线积分器
    genvar i;
    generate
        for (i = 0; i < D; i = i + 1) begin : integrator_pipeline_stage
            reg signed [OUTPUT_WIDTH-1:0] accumulator = 0;
            
            always @(posedge clk or posedge rst) begin
                if (rst) begin
                    accumulator <= 0;
                end else begin
                    // 每一级都累加前一级的输出 (来自上一个时钟周期的结果)
                    accumulator <= accumulator + integrator_stages[i];
                end
            end
            
            // 将当前级的累加结果输出给下一级
            assign integrator_stages[i+1] = accumulator;
        end
    endgenerate

    // 最终输出是最后一级的累加结果
    assign Intout = integrator_stages[D];
    
endmodule
