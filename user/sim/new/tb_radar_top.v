`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/18 10:25:21
// Design Name: 
// Module Name: tb_radar_top
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

module tb_radar_top;

    // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire uart_tx_pin;
    
    // --- START: 新增修改 ---
    // 为新增的DAC端口声明对应的wire, 以便在仿真中观察
    wire dac_clk;
    wire dac_pd;
    wire [7:0] dac_data;
    
    integer file_handle; // 文件句柄
    // --- END: 新增修改 ---
    
    // Instantiate the Unit Under Test (UUT)
    // 注意：这里例化的顶层应该是 radar_top, 而不是 system_top, 
    // 因为 system_top 包含了时钟IP核，通常不在仿真中直接例化。
    radar_top u_radar_top (
        .clk(clk), 
        .rst(rst), 
        .uart_tx_pin(uart_tx_pin),
        
        // --- START: 新增修改 ---
        // 将新增的DAC端口连接到我们刚刚声明的wire上
        .dac_clk(dac_clk),
        .dac_pd(dac_pd),
        .dac_data(dac_data)
        // --- END: 新增修改 ---
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end
      
    // Reset generation
    initial begin
        // --- START: 新增修改 (文件操作) ---
        // 打开文件，准备写入
        file_handle = $fopen("verilog_fir_output.txt", "w");
        if (file_handle == 0) begin
            $display("错误: 无法打开文件 verilog_fir_output.txt");
            $finish;
        end
        // --- END: 新增修改 ---
        
        rst = 1;
        #100; // Wait for 100ns
        rst = 0;
        
        // --- 仿真时长 ---
        // 运行足够长的时间以观察一个完整的雷达脉冲处理周期
        #50000; 
        
        // --- START: 新增修改 (文件操作) ---
        $fclose(file_handle); // 仿真结束前关闭文件
        // --- END: 新增修改 ---
        
        $finish;
    end

    // --- START: 新增修改 (数据写入逻辑) ---
    // 在每个时钟上升沿记录DAC输出数据
    always @(posedge clk) begin
        // 确保在复位结束后才开始写入，并且只有当数据不为0时才记录
        if (!rst && (dac_data != 8'h00)) begin
            // 记录DAC数据输出（8位数据）
            $fdisplay(file_handle, "%d", dac_data);
        end
    end
    
    // 添加一些调试信息显示
    always @(posedge clk) begin
        if (!rst && $time > 1000) begin // 延迟一段时间开始显示
            if ($time % 10000 == 0) begin // 每10us显示一次
                $display("时间 %0t: DAC输出 = %d (0x%02h), 时钟 = %b, 功率下降 = %b", 
                         $time, dac_data, dac_data, dac_clk, dac_pd);
            end
        end
    end
    // --- END: 新增修改 ---
      
endmodule