`timescale 1ns / 1ps
// =============================================================================
// Module: system_top (自动复位终极版)
// Description:
//   1. 接收来自板卡的50MHz物理时钟。
//   2. 调用你配置的、不带复位端口的Clocking Wizard IP核。
//   3. 使用时钟IP核的locked信号，生成一个可靠的内部复位信号。
//   4. 用生成的100MHz时钟和内部复位信号，来驱动我们核心的radar_top模块。
// =============================================================================
module system_top(
    // --- 这是连接到FPGA物理引脚的端口 ---
    input wire clk_pin_in, // 来自板卡的50MHz时钟
    output wire uart_tx_pin_out, // 新增顶层UART输出
    
    // --- START: 新增DAC物理引脚输出 ---
    output wire        dac_clk_pin,        // 连接到ADDA106的DAC_CLK
    output wire        dac_pd_pin,         // 连接到ADDA106的DAC_PD (使能)
    output wire [7:0]  dac_data_pins,      // 连接到ADDA106的DAC_D[7:0]
    // --- END: 新增DAC物理引脚输出 ---
    
    // --- START: 新增按键物理引脚 ---
    input wire         btn_next_pin        // 循环切换波形按键 (F20)
    // --- END: 新增按键物理引脚 ---
    );

    // --- 内部信号线 ---
    wire clk_100mhz; // 由IP核生成的100MHz时钟
    wire locked;     // 时钟IP核锁定信号
    wire internal_rst; // 我们生成的内部复位信号

    // 1. 实例化时钟IP核
    //    这里的模块名 `clk_wiz_0` 必须与你生成的IP核名字一致
    //    端口连接与你的源文件完全匹配
    clk_wiz_0 clk_wiz_inst
    (
        // Clock out ports
        .clk_100mhz(clk_100mhz),
        // Status and control signals
        .locked(locked),
        // Clock in ports
        .clk_in1(clk_pin_in)
    );
    
    // 2. 生成我们自己的高电平有效复位信号
    //    当locked为0时(时钟不稳定)，rst为1(复位)
    //    当locked为1时(时钟稳定)，rst为0(正常工作)
    assign internal_rst = ~locked;

    // --- 声明用于连接两个模块的中间信号 ---
    wire signed [11:0] rom_data_wire;       // 新增：原始ROM信号
    wire signed [11:0] noisy_if_data_wire;
    wire signed [43:0] ddc_i_wire;
    wire signed [43:0] ddc_q_wire;
    wire             ddc_valid_wire;
    wire signed [48:0] comp_i_wire;
    wire signed [48:0] comp_q_wire;
    wire             fir_valid_wire;
    wire signed [47:0] mag_interp_wire;

    // 声明波形选择状态信号，用于ILA观察和UART数据选择
    wire [2:0] waveform_select_wire;

    // 3. 实例化雷达处理核心
    radar_top radar_inst (
        .clk(clk_100mhz),
        .rst(internal_rst), // 使用我们生成的内部复位信号
        .debug_switch(waveform_select_wire), // 【新增】连接按键状态到UART数据选择
        .uart_tx_pin(uart_tx_pin_out), // 连接端口
        
        // --- START: 连接到中间信号 ---
        .rom_data_out_raw(rom_data_wire),       // 新增：原始ROM信号
        .noisy_if_data_out(noisy_if_data_wire),
        .ddc_i_out_raw(ddc_i_wire),
        .ddc_q_out_raw(ddc_q_wire),
        .ddc_valid_raw(ddc_valid_wire),
        .comp_i_out_raw(comp_i_wire),
        .comp_q_out_raw(comp_q_wire),
        .fir_valid_raw(fir_valid_wire),
        .mag_interp_out_raw(mag_interp_wire),
        // --- END: 连接到中间信号 ---
        
        // 【新增】连接高精度幅度调试信号
        .final_magnitude_monitor(final_magnitude_debug)
    );
    
    // 【新增】用于ILA观察高精度幅度值（旁瓣分析）
    wire [31:0] final_magnitude_debug;

    // 4. 实例化新的DAC波形选择器
    dac_waveform_selector dac_selector_inst (
        .clk(clk_100mhz),
        .rst(internal_rst),
        .btn_next(btn_next_pin),

        // 从radar_inst接收数据
        .if_clean_in(rom_data_wire),        // 新增：原始ROM信号
        .if_noisy_in(noisy_if_data_wire),
        .ddc_i_in(ddc_i_wire),
        .ddc_q_in(ddc_q_wire),
        .ddc_valid_in(ddc_valid_wire),
        .comp_i_in(comp_i_wire),
        .comp_q_in(comp_q_wire),
        .fir_valid_in(fir_valid_wire),
        .mag_interp_in(mag_interp_wire),

        // 连接到物理DAC引脚
        .dac_clk_out(dac_clk_pin),
        .dac_pd_out(dac_pd_pin),
        .dac_data_out(dac_data_pins),
        
        // 状态输出 (连接到ILA观察)
        .waveform_select_out(waveform_select_wire)
    );

    // =====================================================================
    // ========================= ILA调试核 (顶层观察) =======================
    // =====================================================================
    // 在顶层例化ILA，观察最终输出和系统状态
    ila_0 your_ila_instance (
        .clk(clk_100mhz),                   // 使用系统时钟
        .probe0(dac_data_pins),             // 观察最终8位DAC数据输出
        .probe1(waveform_select_wire),      // 观察当前波形选择状态 (0-6)
        .probe2(btn_next_pin),              // 观察循环切换按键状态
        .probe3(final_magnitude_debug),    // 【重要】高精度幅度值，用于观察旁瓣抑制效果 (需在IP核中将probe3位宽改为32位)
        .probe4(dac_clk_pin),               // 观察DAC时钟输出
        .probe5(dac_pd_pin),                // 观察DAC使能信号
        .probe6(rom_data_wire[7:0]),        // 观察原始ROM信号 (截取8位)
        .probe7(noisy_if_data_wire[7:0]),   // 观察加噪信号 (截取8位)
        .probe8(ddc_valid_wire),            // 观察DDC有效信号
        .probe9(fir_valid_wire)             // 观察FIR有效信号
    );

endmodule
