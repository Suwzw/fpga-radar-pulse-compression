// =============================================================================
// Verilog Testbench for 'sine_cos_rom' Dual Port ROM IP Core - 修正版
//
// 功能:
// 1. 实例化 `sine_cos_rom` IP核。
// 2. 生成时钟和地址。
// 3. **新增**: 正确驱动 ena 和 enb 使能端口，确保ROM正常输出数据。
//
// 作者: Gemini
// =============================================================================

`timescale 1ns / 1ps

module tb_sine_cos_rom();

    // --- 参数定义 ---
    localparam CLK_PERIOD = 10;    // 时钟周期 10ns -> 100MHz
    localparam ADDR_WIDTH = 10;    // ROM 地址位宽 (2^10 = 1024)
    localparam DATA_WIDTH = 12;    // ROM 数据位宽

    // --- 信号声明 ---
    reg clk;
    reg rst;
    
    // --- 新增使能信号 ---
    reg enable_a;
    reg enable_b;
    
    reg  [ADDR_WIDTH-1:0] addr_a; // A端口的地址
    wire [ADDR_WIDTH-1:0] addr_b; // B端口的地址
    
    wire signed [DATA_WIDTH-1:0] sine_out;   // A端口的输出
    wire signed [DATA_WIDTH-1:0] cosine_out; // B端口的输出

    // --- 1. 实例化待测试模块 (DUT: Device Under Test) ---
    //    确保这里的模块名和端口名与你的IP核完全一致
    sine_cos_rom dut (
      .clka(clk),          // 端口A的时钟
      .ena(enable_a),      // **新增**: 端口A的使能
      .addra(addr_a),      // 端口A的地址
      .douta(sine_out),    // 端口A的输出 (sin)

      .clkb(clk),          // 端口B的时钟
      .enb(enable_b),      // **新增**: 端口B的使能
      .addrb(addr_b),      // 端口B的地址
      .doutb(cosine_out)   // 端口B的输出 (cos)
    );

    // --- 2. 生成时钟信号 ---
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    // --- 3. 生成激励信号 (地址) ---
    assign addr_b = addr_a + (1 << (ADDR_WIDTH - 2));

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            addr_a <= 0;
        end else begin
            addr_a <= addr_a + 1;
        end
    end

    // --- 4. 仿真控制 (复位和使能) ---
    initial begin
        // 初始化
        rst = 1;
        enable_a = 0; // 初始不使能
        enable_b = 0;
        #50; // 保持复位50ns

        // 释放复位，并**使能**ROM的两个端口
        rst = 0;
        enable_a = 1;
        enable_b = 1;
        
        // 让仿真运行一段时间
        #(CLK_PERIOD * 1200);

        // 停止仿真
        $stop;
    end

endmodule
