`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: MultCIC (Corrected Control Signal Version)
// Description: CIC滤波器顶层模块，已修正插值模式下的控制信号bug
//////////////////////////////////////////////////////////////////////////////////
module MultCIC #(
    parameter MODE = "DEC",      // "DEC" 或 "INT" 模式，选择处理模式
    parameter R = 5,             // 抽取或插值的倍数，影响采样率
    parameter D = 3,             // 积分级数，控制CIC滤波器的级数
    parameter INPUT_WIDTH = 14,  // 输入数据位宽
    parameter OUTPUT_WIDTH = 22  // 输出数据位宽
)(
    input        rst,            // 复位信号，高电平有效
    input        clk,            // 时钟信号
    input  [INPUT_WIDTH-1:0] Xin, // 输入数据
    // --- START: 新增修改 ---
    input        Xin_valid,      // 为插值模式新增的输入有效信号
    // --- END: 新增修改 ---
    output [OUTPUT_WIDTH-1:0] Yout, // 输出数据
    output        rdy            // 数据有效指示信号
);


    // 中间信号
    wire signed [OUTPUT_WIDTH-1:0] Intout;   // 积分模块输出数据
    wire signed [OUTPUT_WIDTH-1:0] dout;     // 抽取模块输出数据
    wire ND;  // 数据有效信号


    // 生成不同模式下的模块实例
    generate
        // 如果选择抽取模式（"DEC"），则执行以下代码
        if (MODE == "DEC") begin : DEC_MODE

            // 1. 实例化积分器模块
            Integrated #(
                .D(D),                // 积分级数
                .INPUT_WIDTH(INPUT_WIDTH),  // 输入数据位宽
                .OUTPUT_WIDTH(OUTPUT_WIDTH) // 输出数据位宽
            ) U_Int (
                .rst(rst),            // 复位信号
                .clk(clk),            // 时钟信号
                .Xin(Xin),            // 输入数据
                .Intout(Intout)       // 积分输出数据
            );



            // 2. 实例化抽取模块
            // 抽取模块根据R值决定抽取的倍数，减小输出数据的速率
            Decimate #(
                .R(R),                // 抽取因子
                .DATA_WIDTH(OUTPUT_WIDTH)  // 输出数据宽度
            ) U_Dec (
                .rst(rst),            // 复位信号
                .clk(clk),            // 时钟信号
                .Iin(Intout),         // 输入数据
                .dout(dout),          // 抽取后的数据
                .rdy(ND)              // 数据有效指示信号
            );



            // 3. 实例化梳状滤波器（Comb），进行差分操作
            Comb #(
                .D(D),                        // 差分级数
                .DATA_WIDTH(OUTPUT_WIDTH)     // 输出数据宽度
            ) U_Comb (
                .rst(rst),                    // 复位信号
                .clk(clk),                    // 时钟信号
                .ND(ND),                      // 数据有效信号
                .Xin(dout),                   // 输入数据
                .Yout(Yout)                   // 梳状滤波器的输出数据
            );

            // 输出数据有效信号
            assign rdy = ND;

        end else if (MODE == "INT") begin : INT_MODE

            // 1. 插值模式下的梳状滤波器（Comb）
            wire signed [OUTPUT_WIDTH-1:0] comb_out;    // 梳状滤波器输出数据
            wire signed [OUTPUT_WIDTH-1:0] interp_out;  // 插值后的数据
            wire interp_rdy;                           // 插值模块的数据有效信号


            // --- START: 新增修改 ---
            // 梳状滤波器只在输入有效时才使能
            Comb #(
                .D(D),                        // 差分级数
                .DATA_WIDTH(OUTPUT_WIDTH)     // 输出数据宽度
            ) U_Comb_int (
                .rst(rst),                    // 复位信号
                .clk(clk),                    // 时钟信号
                .ND(Xin_valid),               // <<--- 修改点：使用外部有效信号
                .Xin({{(OUTPUT_WIDTH-INPUT_WIDTH){Xin[INPUT_WIDTH-1]}}, Xin}),  // 输入信号符号扩展
                .Yout(comb_out)               // 梳状滤波器的输出
            );


            // 2. 实例化插值模块（Interpolate）
            // 根据插值因子R，在输出中插入R-1个零点
            Interpolate #(
                .R(R),                // 插值因子
                .INPUT_WIDTH(OUTPUT_WIDTH),  // 输入数据位宽
                .OUTPUT_WIDTH(OUTPUT_WIDTH)  // 输出数据位宽
            ) U_Interp (
                .rst(rst),            // 复位信号
                .clk(clk),            // 时钟信号
                .Xin(comb_out),       // 传递给插值模块的数据
                .Xin_valid(Xin_valid), // <<--- 修改点：使用外部有效信号
                .Xout(interp_out),    // 插值后的数据
                .Xout_valid(interp_rdy) // 插值有效信号
            );
            // --- END: 新增修改 ---
            

            // 3. 插值后数据进入积分器
            Integrated #(
                .D(D),                // 积分级数
                .INPUT_WIDTH(OUTPUT_WIDTH),  // 输入数据位宽
                .OUTPUT_WIDTH(OUTPUT_WIDTH) // 输出数据位宽
            ) U_Int_int (
                .rst(rst),            // 复位信号
                .clk(clk),            // 时钟信号
                .Xin(interp_out[OUTPUT_WIDTH-1:0]),  // 插值后的数据（可能需要截断）
                .Intout(Yout)         // 积分器输出数据
            );

            // 输出插值数据有效信号
            assign rdy = interp_rdy;

        end else begin : DEFAULT_MODE
            // 默认模式，当MODE既不是"DEC"也不是"INT"时，输出无效
            assign Yout = {OUTPUT_WIDTH{1'b0}}; // 输出全0
            assign rdy = 1'b0; // 输出无效信号
        end
    endgenerate

endmodule
