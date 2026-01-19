`timescale 1ns / 1ps
// =============================================================================
// Verilog Testbench for 'handwritten_ddc.v' Module
//
// 功能:
// 1. 实例化 `if_data_rom` 提供真实的带噪中频信号。
// 2. 实例化我们手写的 `handwritten_ddc` 模块。
// 3. 将两者连接，模拟完整的DDC工作流程。
// 4. 允许我们观察最终输出的基带I/Q信号。
// =============================================================================
module tb_handwritten_ddc();

    // --- 参数定义 ---
    localparam CLK_PERIOD = 10; // 100MHz 时钟
    localparam ROM_ADDR_WIDTH = 11;
    localparam ROM_DATA_WIDTH = 12;
    localparam ROM_DEPTH      = 1500;
    localparam DDC_OUT_WIDTH  = 44;

    // --- 信号声明 ---
    reg clk;
    reg rst;
    
    // ROM相关信号
    reg [ROM_ADDR_WIDTH-1:0] rom_addr;
    wire signed [ROM_DATA_WIDTH-1:0] rom_data_out;

    // DDC相关信号
    wire signed [DDC_OUT_WIDTH-1:0] ddc_i_out;
    wire signed [DDC_OUT_WIDTH-1:0] ddc_q_out;
    wire ddc_valid;

    // --- 1. 实例化信号源 (if_data_rom) ---
    //    确保模块名与你的IP核名字一致
    if_data_rom rom_inst (
        .clka(clk),
        .ena(1'b1), // 始终使能
        .addra(rom_addr),
        .douta(rom_data_out)
    );

    // --- 2. 实例化待测试模块 (handwritten_ddc) ---
    handwritten_ddc ddc_inst (
        .clk(clk),
        .rst(rst),
        .if_data_in(rom_data_out),
        .i_data_out(ddc_i_out),
        .q_data_out(ddc_q_out),
        .data_out_valid(ddc_valid)
    );

    // --- 3. 生成时钟 ---
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    // --- 4. 生成激励 (ROM地址计数器) ---
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            rom_addr <= 0;
        end else begin
            if (rom_addr < ROM_DEPTH - 1) begin
                rom_addr <= rom_addr + 1;
            end else begin
                rom_addr <= rom_addr; // 读完后保持在最后一个地址
            end
        end
    end

    // --- 5. 仿真控制 ---
    initial begin
        // 初始化并复位
        rst = 1;
        #50;
        rst = 0;

        // 运行足够长的时间
        #(CLK_PERIOD * 2000);
        $stop;
    end

endmodule

