`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Interpolate
// Description: R倍插值模块。当收到一个输入有效样点时，输出R个采样点，
//              第一个为输入数据本身，其余R-1个为零。
//              等待下一输入时处于空闲状态。
//////////////////////////////////////////////////////////////////////////////////
module Interpolate #(
    parameter R = 4,               // 插值倍数，默认4倍插值
    parameter INPUT_WIDTH = 14,    // 输入数据位宽
    parameter OUTPUT_WIDTH = 22    // 输出数据位宽
)(
    input                       rst,        // 复位信号，高电平有效
    input                       clk,        // 时钟信号
    input  signed [INPUT_WIDTH-1:0] Xin,    // 输入数据样点
    input                       Xin_valid,  // 输入数据有效信号
    output reg signed [OUTPUT_WIDTH-1:0] Xout,  // 输出数据样点
    output reg                  Xout_valid  // 输出数据有效信号
);

    reg [31:0] count = 0;
    reg busy = 0;                   // 标记当前是否在输出插值数据
    reg signed [OUTPUT_WIDTH-1:0] sample_buffer;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            busy <= 0;
            Xout <= 0;
            Xout_valid <= 0;
            sample_buffer <= 0;
        end else begin
            Xout_valid <= 0; // 默认本周期无输出有效，除非满足条件
            if (busy) begin
                // 如果正忙于输出插值数据
                if (count < R) begin
                    // 输出第count个样点
                    if (count == 0) begin
                        // 第一个输出样点为存储的输入样点，符号扩展至OUTPUT_WIDTH
                        Xout <= {{(OUTPUT_WIDTH-INPUT_WIDTH){sample_buffer[INPUT_WIDTH-1]}}, sample_buffer[INPUT_WIDTH-1:0]};
                    end else begin
                        // 剩余的R-1个输出为0
                        Xout <= 0;
                    end
                    Xout_valid <= 1;
                    count <= count + 1;
                end else begin
                    // 已输出完R个点，进入空闲等待下一个输入样点
                    busy <= 0;
                end
            end else begin
                // 空闲状态下等待新的输入有效样点
                if (Xin_valid) begin
                    // 存储输入样点，准备输出R个点
                    sample_buffer <= {{(OUTPUT_WIDTH-INPUT_WIDTH){Xin[INPUT_WIDTH-1]}}, Xin};
                    count <= 0;
                    busy <= 1;
                end
            end
        end
    end
endmodule
