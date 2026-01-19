// =============================================================================
// Verilog Testbench for 'if_data_rom' IP Core
//
// 功能:
// 1. 实例化我们想要测试的 `if_data_rom` 模块 (这个模块被称为 DUT: Device Under Test)。
// 2. 生成一个 100MHz 的时钟信号来驱动 DUT。
// 3. 生成一个地址计数器，从地址 0 开始，依次读取 ROM 中的所有 1500 个数据。
// 4. 在仿真环境中，我们可以观察 `rom_data_out` 的波形，并与 .coe
//    文件中的数据进行对比，以验证 ROM 配置的正确性。
//
// 作者: Gemini
// 更新: 修正了DUT模块名以匹配用户生成的核心，并添加了ena端口连接。
// =============================================================================

`timescale 1ns / 1ps // 定义仿真时间单位

module tb_if_data_rom(); // Testbench模块没有输入输出端口

    // --- 参数定义 ---
    localparam CLK_PERIOD = 10; // 时钟周期为 10ns (对应 100MHz)
    localparam ADDR_WIDTH = 11; // ROM 地址位宽，2^11 = 2048 > 1500
    localparam DATA_WIDTH = 12; // ROM 数据位宽
    localparam ROM_DEPTH  = 1500;// ROM 的深度

    // --- 信号声明 ---
    reg clk;                  // 时钟信号
    reg rst;                  // 复位信号
    reg enable;               // 使能信号
    reg [ADDR_WIDTH-1:0] rom_addr; // 连接到ROM地址端口的信号
    wire [DATA_WIDTH-1:0] rom_data_out; // 从ROM数据端口引出的信号

    // --- 1. 实例化待测试模块 (DUT) ---
    // 这里的 `if_data_rom` 必须与你在Vivado中给IP核起的名字完全一样
    if_data_rom dut (
        .clka(clk),          // 时钟端口连接
        .ena(enable),        // 使能端口连接
        .addra(rom_addr),    // 地址端口连接
        .douta(rom_data_out) // 数据输出端口连接
    );

    // --- 2. 生成时钟信号 ---
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk; // 每隔5ns，时钟电平翻转一次
    end

    // --- 3. 生成激励信号 (地址计数器和使能) ---
    initial begin
        // 初始化
        rst = 1;
        enable = 0; // 初始不使能
        rom_addr = 0;
        #20; // 等待一小段时间，让系统稳定

        // 释放复位并使能
        rst = 0;
        enable = 1; // 设为高电平，一直使能ROM
        #(CLK_PERIOD);

        // 开始从地址0依次读取数据
        for (integer i = 0; i < ROM_DEPTH; i = i + 1) begin
            rom_addr <= i;
            #(CLK_PERIOD); // 每个时钟周期，地址加1
        end

        // 读取完毕，可以停止仿真
        enable = 0;
        #(CLK_PERIOD * 5);
        $stop;
    end

endmodule
