# 基于FPGA的雷达脉冲压缩系统

**FPGA-based radar pulse compression system implemented on ZYNQ 7020**

> ⚠️ **说明**: 这是大学数字电路实验课程的自主选题项目，在FPGA硬件上完整实现了雷达信号处理算法。

## 项目简介

本项目在ZYNQ 7020 FPGA上使用Xilinx Vivado实现了完整的雷达脉冲压缩系统。系统通过数字下变频（DDC）、脉冲压缩（匹配滤波）和CORDIC算法进行幅度提取，实现对雷达信号的实时处理。

## 主要特性

- **基于ROM的IF信号生成器**: 预存储雷达中频信号
- **硬件噪声生成器**: 基于中心极限定理（CLT）的高斯白噪声生成
- **手动DDC实现**: 自主设计的数字下变频器，包含NCO（数控振荡器）
- **脉冲压缩**: 使用Xilinx FIR Compiler IP核实现匹配滤波
- **幅度提取**: 使用CORDIC算法计算信号幅度
- **DAC波形输出**: 通过ADDA106 DAC模块实时输出模拟信号
- **UART数据传输**: 实时数据流传输到PC进行分析
- **多阶段调试**: 支持ILA（集成逻辑分析仪）观察各处理阶段波形

## 系统架构

```
IF信号ROM → 噪声生成器 → 加法器 → DDC → 脉冲压缩器 → CORDIC → DAC/UART
                                                                    ↓
                                                                幅度输出
```

![系统框图](https://s1.vika.cn/space/2026/01/19/66277f70a55c4bf2b7c23e3f4f954613)

![系统框图](https://s1.vika.cn/space/2026/01/19/195fde7feff54dad88e9b771b428e1b5)

## 硬件平台

- **FPGA开发板**: ZYNQ 7020 (XC7Z020)
- **DAC模块**: ADDA106 (8位并行接口)
- **开发工具**: Xilinx Vivado 2024.2
- **时钟**: 50MHz外部振荡器（内部转换为100MHz）

## 引脚分配

| 功能模块 | 信号 | Verilog端口 | FPGA引脚 | IO标准 |
|----------|------|-------------|-----------|---------|
| 系统时钟 | 时钟输入 | `clk_pin_in` | **U18** | LVCMOS33 |
| UART | UART TX | `uart_tx_pin_out` | **J16** | LVCMOS33 |
| DAC | DAC时钟 | `dac_clk_pin` | **E18** | LVCMOS33 |
| DAC | DAC使能 | `dac_pd_pin` | **D19** | LVCMOS33 |
| DAC | 数据[7:0] | `dac_data_pins[7:0]` | **L15:D18** | LVCMOS33 |
| 控制 | 波形选择 | `btn_next_pin` | **F20** | LVCMOS33 |

**总I/O引脚数: 12**

## 项目结构

```
.
├── user/
│   ├── src/
│   │   └── new/                 # 主Verilog源文件
│   │       ├── system_top.v    # 顶层模块（时钟/复位管理）
│   │       ├── radar_top.v     # 核心雷达处理模块
│   │       ├── pulse_compressor.v  # 匹配滤波器实现
│   │       ├── handwritten_ddc.v  # 数字下变频器
│   │       ├── nco.v           # 数控振荡器
│   │       ├── clt_noise_generator.v  # 高斯噪声生成器
│   │       ├── dac_waveform_selector.v  # DAC波形输出控制
│   │       └── uart_tx.v       # UART发送器
│   ├── ip/                     # Xilinx IP核配置
│   │   ├── cordic_magnitude/   # CORDIC幅度计算器
│   │   ├── fir_i_compiler/     # FIR滤波器（I通道系数）
│   │   ├── fir_q_compiler/     # FIR滤波器（Q通道系数）
│   │   ├── if_data_rom/        # IF信号存储ROM
│   │   └── sine_cos_rom/       # NCO正弦/余弦ROM
│   ├── sim/                    # 仿真测试台
│   └── data/                   # 数据文件
├── *.coe                       # ROM系数文件
├── gemini_sim.m                # MATLAB仿真代码
├── requirements.txt             # Python依赖列表
├── README.md                   # 本文件
└── .gitignore                  # Git忽略规则
```

## 源代码模块

### 核心模块

- **`system_top.v`**: 顶层模块，使用Clocking Wizard生成稳定的100MHz时钟和自动复位逻辑
- **`radar_top.v`**: 主雷达信号处理流水线，集成所有子模块
- **`pulse_compressor.v`**: 使用4个并行FIR滤波器实现匹配滤波（I×hI, Q×hQ, I×hQ, Q×hI）
- **`handwritten_ddc.v`**: 自主设计的数字下变频器，支持正交混频
- **`nco.v`**: 数控振荡器，用于生成本地振荡器信号

### 支持模块

- **`clt_noise_generator.v`**: 基于中心极限定理的高斯白噪声生成器，使用LFSR
- **`dac_waveform_selector.v`**: 选择7种不同波形阶段的DAC输出
- **`uart_tx.v`**: UART发送器（115200波特率），用于实时数据流传输

## 数据文件

- **`echo_rom_data.coe`**: 预生成的雷达回波信号（IF数据）
- **`sine_rom.coe`**: NCO正弦波查找表
- **`fir_coeffs_i.coe`**: I通道FIR滤波器系数
- **`fir_coeffs_q.coe`**: Q通道FIR滤波器系数
- **`fir_coeffs_interp.coe`**: DAC输出的FIR插值器系数

## 波形选择

系统支持7种不同的波形输出（可通过按钮选择）：

1. **模式0**: 原始ROM信号（干净IF信号）
2. **模式1**: 含噪IF信号（信号+高斯噪声）
3. **模式2**: DDC I通道输出
4. **模式3**: DDC Q通道输出
5. **模式4**: 脉冲压缩器I通道输出
6. **模式5**: 脉冲压缩器Q通道输出
7. **模式6**: 最终幅度输出（压缩脉冲）

## 使用方法

### 前置条件

- Xilinx Vivado 2024.2或更高版本
- ZYNQ 7020开发板
- ADDA106 DAC模块（用于模拟输出，可选）

### 构建步骤

1. 创建新的Vivado项目
2. 从`user/src/new/`添加所有源文件
3. 从`user/ip/`配置并生成IP核
4. 导入`.coe`系数文件
5. 根据引脚分配表应用引脚约束
6. 综合、实现并生成比特流
7. 下载到FPGA

### 数据采集

- **UART模式**: 连接UART到PC（115200波特率，8N1）接收实时幅度数据
  - 运行`pip install -r requirements.txt`安装Python依赖
  - 执行`python user/radar_scope.py`启动雷达监控GUI
- **DAC模式**: 使用DAC波形选择器将不同处理阶段输出为模拟信号
- **ILA模式**: 使用Vivado集成逻辑分析仪观察内部信号

### MATLAB仿真

运行`gemini_sim.m`可查看完整的雷达信号处理仿真：
- LFM信号生成
- 匹配滤波器设计（矩形窗vs汉明窗对比）
- 脉冲压缩仿真
- 10倍插值FIR滤波器设计
- 详细的波形可视化分析

## 技术规格

| 参数 | 数值 |
|------|------|
| 系统时钟 | 100 MHz |
| 输入采样率 | 50 MHz |
| DAC采样率 | 100 MHz |
| UART波特率 | 115200 |
| IF信号位宽 | 12 bits |
| DDC输出位宽 | 44 bits |
| FIR输出位宽 | 49 bits |
| CORDIC输出位宽 | 32 bits |
| DAC输出位宽 | 8 bits |
| 噪声类型 | 高斯白噪声 |

## 核心算法

### 数字下变频（DDC）
- 使用NCO生成的正弦/余弦进行正交混频
- 通过FIR Compiler IP进行低通滤波

### 脉冲压缩
- 使用发射信号的复共轭进行匹配滤波
- 并行实现：4个FIR滤波器用于I/Q乘法
- 高精度运算（48位内部精度）

### 幅度提取
- CORDIC算法计算 sqrt(I² + Q²)
- AXI-Stream接口实现高效数据流

## 依赖

### Python依赖
- `pyserial` - 串口通信
- `numpy` - 数据处理
- `PyQt5` - GUI框架
- `pyqtgraph` - 实时绘图

安装: `pip install -r requirements.txt`

## 许可证

本项目为大学课程的教育项目，欢迎用于学习和参考。

## 致谢

本项目作为大学数字电路实验课程的自主选题开发完成。
