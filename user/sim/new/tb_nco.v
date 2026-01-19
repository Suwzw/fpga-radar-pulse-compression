`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/12 19:52:34
// Design Name: 
// Module Name: tb_nco
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
//////////////////////////////////////////////////////////////////////////////////


module tb_nco();

    // --- 参数定义 ---
    localparam CLK_PERIOD      = 10;    // 时钟周期 10ns -> 100MHz
    localparam PHASE_WIDTH     = 32;    // NCO内部相位累加器位宽
    localparam DATA_WIDTH      = 12;    // NCO输出数据位宽
    
    // ============================ 关键修改点 ================================
    // 将输出频率从20MHz改为1MHz，以便观察
    // 1MHz输出频率对应的相位增量 = round((1e6 / 100e6) * 2^32)
    localparam PHASE_INCREMENT_1MHZ = 32'd42949673; 
    // ========================================================================

    // --- 信号声明 ---
    reg clk;
    reg rst;
    
    wire signed [DATA_WIDTH-1:0] sine_wave_out;
    wire signed [DATA_WIDTH-1:0] cosine_wave_out;

    // --- 1. 实例化待测试模块 (DUT: Device Under Test) ---
    nco #(
        .PHASE_WIDTH(PHASE_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) nco_inst (
        .clk(clk),
        .rst(rst),
        .phase_increment(PHASE_INCREMENT_1MHZ), // **使用新的低频相位增量**
        .sine_out(sine_wave_out),
        .cosine_out(cosine_wave_out)
    );

    // --- 2. 生成时钟信号 ---
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    // --- 3. 仿真控制 ---
    initial begin
        // 初始化并施加复位
        rst = 1;
        #50; // 保持复位50ns

        // 释放复位，NCO开始工作
        rst = 0;
        
        // 让仿真运行足够长的时间，以便我们能看到几个完整的1MHz波形周期
        // 1MHz周期为1000ns，我们运行2000ns
        #(CLK_PERIOD * 200);

        // 停止仿真
        $stop;
    end

endmodule

