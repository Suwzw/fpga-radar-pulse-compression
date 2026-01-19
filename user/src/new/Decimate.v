`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Module Name: Decimate
// Description: R倍抽取模块，通过参数R控制抽取倍数
//////////////////////////////////////////////////////////////////////////////////

module Decimate #(
    parameter R = 5,               // 抽取倍数参数，可根据需要调整
    parameter DATA_WIDTH = 22      // 输入输出数据位宽，可根据实际情况调整
)(
    input               rst,       // 复位信号，高电平有效
    input               clk,       // FPGA系统时钟
    input  signed [DATA_WIDTH-1:0] Iin,  // 输入数据
    output signed [DATA_WIDTH-1:0] dout, // 输出数据(抽取后)
    output              rdy        // 数据有效输出信号
);

    // 计数器用于控制何时输出数据
    // 当计数器从0计数到R-1时输出数据，然后清零
    reg [$clog2(R)-1:0] c = 0;      // 计数器宽度取决于R的大小
    reg signed [DATA_WIDTH-1:0] dout_tem = 0; // 输出数据
    reg rdy_tem = 0;                 // 数据有效信号

    // 复位逻辑，初始化所有寄存器
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // 如果复位信号为高，所有寄存器清零
            c <= 0;
            dout_tem <= {DATA_WIDTH{1'b0}}; // 复位时清零数据
            rdy_tem <= 1'b0;                // 数据有效信号清零
        end else begin
            // 非复位状态，执行抽取逻辑
            if (c == R-1) begin
                // 计数达到R-1时，输出数据有效
                rdy_tem <= 1'b1;
                dout_tem <= Iin;  // 存储输入数据到输出数据寄存器
                c <= 0;            // 重置计数器
            end else begin
                // 计数器未达到R-1时，不输出数据
                rdy_tem <= 1'b0;
                c <= c + 1;        // 计数器加1
            end
        end
    end

    // 输出结果：将计算的结果赋给输出信号
    assign dout = dout_tem; // 输出抽取后的数据
    assign rdy  = rdy_tem;  // 输出数据有效信号

endmodule
