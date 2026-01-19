# =============================================================================
# ZYNQ 7020 开发板约束文件 (自动复位终极版)
# =============================================================================

# --- 系统时钟约束 ---
# 根据你的发现，PL端有一个50MHz的时钟输入到引脚 U18
set_property PACKAGE_PIN U18 [get_ports clk_pin_in]
set_property IOSTANDARD LVCMOS33 [get_ports clk_pin_in]
# 50MHz对应的时钟周期是 1000 / 50 = 20.000 ns
# create_clock -period 20.000 -name sys_clk_pin -waveform {0.000 10.000} [get_ports clk_pin_in]

# --- 复位信号约束 ---
# 我们不再需要外部复位按键，所以这里是空的！

# --- UART TX 引脚约束 ---
# 将UART TX信号分配给引脚J16 (根据开发板实际UART TX引脚)
set_property PACKAGE_PIN J16 [get_ports uart_tx_pin_out]
set_property IOSTANDARD LVCMOS33 [get_ports uart_tx_pin_out]

# =============================================================================
# 2. Push Buttons for Waveform Selection (Single Button Version)
# =============================================================================
# 使用开发板上唯一的PL端按键 F20 进行循环切换波形
set_property PACKAGE_PIN F20 [get_ports btn_next_pin]
set_property IOSTANDARD LVCMOS33 [get_ports btn_next_pin]

# =============================================================================
# 3. DAC Interface (for ADDA106 Board) - 基于通用扩展接口
# =============================================================================
#
# Verilog Port      ADDA106 Signal      FPGA Pin
# ----------------- ------------------  ----------
# dac_clk_pin       DAC_CLK             E18
# dac_pd_pin        DAC_PD              D19
# dac_data_pins[7]  DAC_D7              L15
# dac_data_pins[6]  DAC_D6              K14
# dac_data_pins[5]  DAC_D5              J14
# dac_data_pins[4]  DAC_D4              G14
# dac_data_pins[3]  DAC_D3              H15
# dac_data_pins[2]  DAC_D2              F16
# dac_data_pins[1]  DAC_D1              E17
# dac_data_pins[0]  DAC_D0              D18
# -------------------------------------------------------------------

# DAC Clock Output Pin
set_property PACKAGE_PIN E18 [get_ports dac_clk_pin]
set_property IOSTANDARD LVCMOS33 [get_ports dac_clk_pin]

# DAC Power-Down Pin (Active Low)
set_property PACKAGE_PIN D19 [get_ports dac_pd_pin]
set_property IOSTANDARD LVCMOS33 [get_ports dac_pd_pin]

# DAC 8-bit Data Bus
set_property PACKAGE_PIN L15 [get_ports {dac_data_pins[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data_pins[7]}]
set_property PACKAGE_PIN K14 [get_ports {dac_data_pins[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data_pins[6]}]
set_property PACKAGE_PIN J14 [get_ports {dac_data_pins[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data_pins[5]}]
set_property PACKAGE_PIN G14 [get_ports {dac_data_pins[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data_pins[4]}]
set_property PACKAGE_PIN H15 [get_ports {dac_data_pins[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data_pins[3]}]
set_property PACKAGE_PIN F16 [get_ports {dac_data_pins[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data_pins[2]}]
set_property PACKAGE_PIN E17 [get_ports {dac_data_pins[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data_pins[1]}]
set_property PACKAGE_PIN D18 [get_ports {dac_data_pins[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data_pins[0]}]



