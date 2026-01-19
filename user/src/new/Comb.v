`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Comb
// Description: 使用if语句根据参数D选择2~10级的梳状滤波器实现。
//              当D=2时为2级差分，当D=3时为3级差分，以此类推至D=10。
//              若D不在2~10范围内，则默认输出0。
//////////////////////////////////////////////////////////////////////////////////
module Comb #(
    parameter D = 3,                // 差分级数，支持D=2,3,4,5,6,7,8,9,10
    parameter DATA_WIDTH = 22       // 数据位宽
)(
    input               rst,        // 复位信号，高电平有效
    input               clk,        // FPGA系统时钟
    input               ND,         // 输入的数据准备好信号
    input  signed [DATA_WIDTH-1:0] Xin,  // 输入数据
    output reg  signed [DATA_WIDTH-1:0] Yout  // 滤波后的输出数据
);

generate
    if (D == 2) begin : D2_IMPL
        // 2级差分链
        reg signed [DATA_WIDTH-1:0] d1=0, d2=0, d3=0;
        wire signed [DATA_WIDTH-1:0] C1, Yout_tem;

        always @(posedge clk or posedge rst) begin
            if (rst) begin
                d1 <= 0;
                d2 <= 0;
                d3 <= 0;
            end else if (ND) begin
                d1 <= Xin;
                d2 <= d1;
                d3 <= C1;
            end
        end

        assign C1 = rst ? {DATA_WIDTH{1'b0}} : (d1 - d2);
        assign Yout_tem = rst ? {DATA_WIDTH{1'b0}} : (C1 - d3);

        always @(*) Yout = Yout_tem;

    end else if (D == 3) begin : D3_IMPL
        // 3级差分链
        reg signed [DATA_WIDTH-1:0] d1=0, d2=0, d3=0, d4=0;
        wire signed [DATA_WIDTH-1:0] C1, C2, Yout_tem;

        always @(posedge clk or posedge rst) begin
            if (rst) begin
                d1 <= {DATA_WIDTH{1'b0}};
                d2 <= {DATA_WIDTH{1'b0}};
                d3 <= {DATA_WIDTH{1'b0}};
                d4 <= {DATA_WIDTH{1'b0}};
            end else if (ND) begin
                d1 <= Xin;
                d2 <= d1;
                d3 <= C1;
                d4 <= C2;
            end
        end

        assign C1 = (rst ? {DATA_WIDTH{1'b0}} : (d1 - d2));
        assign C2 = (rst ? {DATA_WIDTH{1'b0}} : (C1 - d3));
        assign Yout_tem = (rst ? {DATA_WIDTH{1'b0}} : (C2 - d4));

        always @(*) Yout = Yout_tem;

    end else if (D == 4) begin : D4_IMPL
        // 4级差分链
        reg signed [DATA_WIDTH-1:0] d1=0, d2=0, d3=0, d4=0, d5=0;
        wire signed [DATA_WIDTH-1:0] C1, C2, C3, Yout_tem;

        always @(posedge clk or posedge rst) begin
            if (rst) begin
                d1 <= {DATA_WIDTH{1'b0}};
                d2 <= {DATA_WIDTH{1'b0}};
                d3 <= {DATA_WIDTH{1'b0}};
                d4 <= {DATA_WIDTH{1'b0}};
                d5 <= {DATA_WIDTH{1'b0}};
            end else if (ND) begin
                d1 <= Xin;
                d2 <= d1;
                d3 <= C1;
                d4 <= C2;
                d5 <= C3;
            end
        end

        assign C1 = (rst ? {DATA_WIDTH{1'b0}} : (d1 - d2));
        assign C2 = (rst ? {DATA_WIDTH{1'b0}} : (C1 - d3));
        assign C3 = (rst ? {DATA_WIDTH{1'b0}} : (C2 - d4));
        assign Yout_tem = (rst ? {DATA_WIDTH{1'b0}} : (C3 - d5));

        always @(*) Yout = Yout_tem;

    end else if (D == 5) begin : D5_IMPL
        // 5级差分链
        reg signed [DATA_WIDTH-1:0] d1=0, d2=0, d3=0, d4=0, d5=0, d6=0;
        wire signed [DATA_WIDTH-1:0] C1, C2, C3, C4, Yout_tem;

        always @(posedge clk or posedge rst) begin
            if (rst) begin
                d1 <= 0;
                d2 <= 0;
                d3 <= 0;
                d4 <= 0;
                d5 <= 0;
                d6 <= 0;
            end else if (ND) begin
                d1 <= Xin;
                d2 <= d1;
                d3 <= C1;
                d4 <= C2;
                d5 <= C3;
                d6 <= C4;
            end
        end

        assign C1 = (rst ? {DATA_WIDTH{1'b0}} : (d1 - d2));
        assign C2 = (rst ? {DATA_WIDTH{1'b0}} : (C1 - d3));
        assign C3 = (rst ? {DATA_WIDTH{1'b0}} : (C2 - d4));
        assign C4 = (rst ? {DATA_WIDTH{1'b0}} : (C3 - d5));
        assign Yout_tem = (rst ? {DATA_WIDTH{1'b0}} : (C4 - d6));

        always @(*) Yout = Yout_tem;

    end else if (D == 6) begin : D6_IMPL
        // 6级差分链
        reg signed [DATA_WIDTH-1:0] d1=0, d2=0, d3=0, d4=0, d5=0, d6=0, d7=0;
        wire signed [DATA_WIDTH-1:0] C1, C2, C3, C4, C5, Yout_tem;

        always @(posedge clk or posedge rst) begin
            if (rst) begin
                d1 <= 0;
                d2 <= 0;
                d3 <= 0;
                d4 <= 0;
                d5 <= 0;
                d6 <= 0;
                d7 <= 0;
            end else if (ND) begin
                d1 <= Xin;
                d2 <= d1;
                d3 <= C1;
                d4 <= C2;
                d5 <= C3;
                d6 <= C4;
                d7 <= C5;
            end
        end

        assign C1 = (rst ? {DATA_WIDTH{1'b0}} : (d1 - d2));
        assign C2 = (rst ? {DATA_WIDTH{1'b0}} : (C1 - d3));
        assign C3 = (rst ? {DATA_WIDTH{1'b0}} : (C2 - d4));
        assign C4 = (rst ? {DATA_WIDTH{1'b0}} : (C3 - d5));
        assign C5 = (rst ? {DATA_WIDTH{1'b0}} : (C4 - d6));
        assign Yout_tem = (rst ? {DATA_WIDTH{1'b0}} : (C5 - d7));

        always @(*) Yout = Yout_tem;

    end else if (D == 7) begin : D7_IMPL
        // 7级差分链
        reg signed [DATA_WIDTH-1:0] d1=0, d2=0, d3=0, d4=0, d5=0, d6=0, d7=0, d8=0;
        wire signed [DATA_WIDTH-1:0] C1, C2, C3, C4, C5, C6, Yout_tem;

        always @(posedge clk or posedge rst) begin
            if (rst) begin
                d1 <= 0;
                d2 <= 0;
                d3 <= 0;
                d4 <= 0;
                d5 <= 0;
                d6 <= 0;
                d7 <= 0;
                d8 <= 0;
            end else if (ND) begin
                d1 <= Xin;
                d2 <= d1;
                d3 <= C1;
                d4 <= C2;
                d5 <= C3;
                d6 <= C4;
                d7 <= C5;
                d8 <= C6;
            end
        end

        assign C1 = (rst ? {DATA_WIDTH{1'b0}} : (d1 - d2));
        assign C2 = (rst ? {DATA_WIDTH{1'b0}} : (C1 - d3));
        assign C3 = (rst ? {DATA_WIDTH{1'b0}} : (C2 - d4));
        assign C4 = (rst ? {DATA_WIDTH{1'b0}} : (C3 - d5));
        assign C5 = (rst ? {DATA_WIDTH{1'b0}} : (C4 - d6));
        assign C6 = (rst ? {DATA_WIDTH{1'b0}} : (C5 - d7));
        assign Yout_tem = (rst ? {DATA_WIDTH{1'b0}} : (C6 - d8));

        always @(*) Yout = Yout_tem;

    end else if (D == 8) begin : D8_IMPL
        // 8级差分链
        reg signed [DATA_WIDTH-1:0] d1=0, d2=0, d3=0, d4=0, d5=0, d6=0, d7=0, d8=0, d9=0;
        wire signed [DATA_WIDTH-1:0] C1, C2, C3, C4, C5, C6, C7, Yout_tem;

        always @(posedge clk or posedge rst) begin
            if (rst) begin
                d1 <= 0;
                d2 <= 0;
                d3 <= 0;
                d4 <= 0;
                d5 <= 0;
                d6 <= 0;
                d7 <= 0;
                d8 <= 0;
                d9 <= 0;
            end else if (ND) begin
                d1 <= Xin;
                d2 <= d1;
                d3 <= C1;
                d4 <= C2;
                d5 <= C3;
                d6 <= C4;
                d7 <= C5;
                d8 <= C6;
                d9 <= C7;
            end
        end

        assign C1 = (rst ? {DATA_WIDTH{1'b0}} : (d1 - d2));
        assign C2 = (rst ? {DATA_WIDTH{1'b0}} : (C1 - d3));
        assign C3 = (rst ? {DATA_WIDTH{1'b0}} : (C2 - d4));
        assign C4 = (rst ? {DATA_WIDTH{1'b0}} : (C3 - d5));
        assign C5 = (rst ? {DATA_WIDTH{1'b0}} : (C4 - d6));
        assign C6 = (rst ? {DATA_WIDTH{1'b0}} : (C5 - d7));
        assign C7 = (rst ? {DATA_WIDTH{1'b0}} : (C6 - d8));
        assign Yout_tem = (rst ? {DATA_WIDTH{1'b0}} : (C7 - d9));

        always @(*) Yout = Yout_tem;

    end else if (D == 9) begin : D9_IMPL
        // 9级差分链
        reg signed [DATA_WIDTH-1:0] d1=0, d2=0, d3=0, d4=0, d5=0, d6=0, d7=0, d8=0, d9=0, d10=0;
        wire signed [DATA_WIDTH-1:0] C1, C2, C3, C4, C5, C6, C7, C8, Yout_tem;

        always @(posedge clk or posedge rst) begin
            if (rst) begin
                d1 <= 0;
                d2 <= 0;
                d3 <= 0;
                d4 <= 0;
                d5 <= 0;
                d6 <= 0;
                d7 <= 0;
                d8 <= 0;
                d9 <= 0;
                d10 <= 0;
            end else if (ND) begin
                d1 <= Xin;
                d2 <= d1;
                d3 <= C1;
                d4 <= C2;
                d5 <= C3;
                d6 <= C4;
                d7 <= C5;
                d8 <= C6;
                d9 <= C7;
                d10 <= C8;
            end
        end

        assign C1 = (rst ? {DATA_WIDTH{1'b0}} : (d1 - d2));
        assign C2 = (rst ? {DATA_WIDTH{1'b0}} : (C1 - d3));
        assign C3 = (rst ? {DATA_WIDTH{1'b0}} : (C2 - d4));
        assign C4 = (rst ? {DATA_WIDTH{1'b0}} : (C3 - d5));
        assign C5 = (rst ? {DATA_WIDTH{1'b0}} : (C4 - d6));
        assign C6 = (rst ? {DATA_WIDTH{1'b0}} : (C5 - d7));
        assign C7 = (rst ? {DATA_WIDTH{1'b0}} : (C6 - d8));
        assign C8 = (rst ? {DATA_WIDTH{1'b0}} : (C7 - d9));
        assign Yout_tem = (rst ? {DATA_WIDTH{1'b0}} : (C8 - d10));

        always @(*) Yout = Yout_tem;

    end else if (D == 10) begin : D10_IMPL
        // 10级差分链
        reg signed [DATA_WIDTH-1:0] d1=0, d2=0, d3=0, d4=0, d5=0, d6=0, d7=0, d8=0, d9=0, d10=0, d11=0;
        wire signed [DATA_WIDTH-1:0] C1, C2, C3, C4, C5, C6, C7, C8, C9, Yout_tem;

        always @(posedge clk or posedge rst) begin
            if (rst) begin
                d1 <= 0;
                d2 <= 0;
                d3 <= 0;
                d4 <= 0;
                d5 <= 0;
                d6 <= 0;
                d7 <= 0;
                d8 <= 0;
                d9 <= 0;
                d10 <= 0;
                d11 <= 0;
            end else if (ND) begin
                d1 <= Xin;
                d2 <= d1;
                d3 <= C1;
                d4 <= C2;
                d5 <= C3;
                d6 <= C4;
                d7 <= C5;
                d8 <= C6;
                d9 <= C7;
                d10 <= C8;
                d11 <= C9;
            end
        end

        assign C1 = (rst ? {DATA_WIDTH{1'b0}} : (d1 - d2));
        assign C2 = (rst ? {DATA_WIDTH{1'b0}} : (C1 - d3));
        assign C3 = (rst ? {DATA_WIDTH{1'b0}} : (C2 - d4));
        assign C4 = (rst ? {DATA_WIDTH{1'b0}} : (C3 - d5));
        assign C5 = (rst ? {DATA_WIDTH{1'b0}} : (C4 - d6));
        assign C6 = (rst ? {DATA_WIDTH{1'b0}} : (C5 - d7));
        assign C7 = (rst ? {DATA_WIDTH{1'b0}} : (C6 - d8));
        assign C8 = (rst ? {DATA_WIDTH{1'b0}} : (C7 - d9));
        assign C9 = (rst ? {DATA_WIDTH{1'b0}} : (C8 - d10));
        assign Yout_tem = (rst ? {DATA_WIDTH{1'b0}} : (C9 - d11));

        always @(*) Yout = Yout_tem;

    end
endgenerate


endmodule
