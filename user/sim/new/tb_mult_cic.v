// =============================================================================
// Verilog Testbench for 'MultCIC.v' Module
//
// 功能:
// 1. 实例化 `MultCIC` 模块，并用我们项目所需的参数进行重载。
// 2. 提供一个简单的阶跃信号作为输入，以观察其滤波和抽取功能。
// 3. 验证输出数据 `Yout` 和数据有效信号 `rdy` 是否符合预期。
//
// 作者: Gemini
// =============================================================================
`timescale 1ns / 1ps

module tb_mult_cic();

    // --- 参数定义 ---
    localparam CLK_PERIOD = 10; // 100MHz 时钟

    // --- 我们项目需要的CIC参数 ---
    localparam CIC_R            = 10;
    localparam CIC_D            = 5;
    localparam CIC_INPUT_WIDTH  = 24;
    localparam CIC_OUTPUT_WIDTH = 44;

    // --- 信号声明 ---
    reg clk;
    reg rst;
    reg signed [CIC_INPUT_WIDTH-1:0] test_input; // 测试输入信号

    wire signed [CIC_OUTPUT_WIDTH-1:0] cic_output; // CIC输出
    wire cic_ready;      // CIC数据有效信号

    // --- 1. 实例化待测试模块 (DUT) ---
    MultCIC #(
        .MODE("DEC"),
        .R(CIC_R),
        .D(CIC_D),
        .INPUT_WIDTH(CIC_INPUT_WIDTH),
        .OUTPUT_WIDTH(CIC_OUTPUT_WIDTH)
    ) dut_cic (
        .rst(rst),
        .clk(clk),
        .Xin(test_input),
        .Yout(cic_output),
        .rdy(cic_ready)
    );

    // --- 2. 生成时钟 ---
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    // --- 3. 生成激励信号 ---
    initial begin
        // 初始化并复位
        rst = 1;
        test_input = 0;
        #50; // 保持复位

        // 释放复位，并施加一个阶跃输入
        rst = 0;
        #1;
        test_input = 1000; // 输入一个固定的直流值

        // 运行足够长的时间，观察多个输出
        #(CLK_PERIOD * 200);

        // 停止仿真
        $stop;
    end

endmodule
