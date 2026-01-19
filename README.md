# FPGA Radar Pulse Compression System

**FPGA-based radar pulse compression system implemented in Verilog**

This is a self-selected project for a university Digital Electronics Laboratory course, demonstrating the implementation of radar signal processing algorithms on FPGA hardware.

## Project Overview

This project implements a complete radar pulse compression system on a ZYNQ 7020 FPGA using Xilinx Vivado. The system performs real-time processing of radar signals through digital down conversion (DDC), pulse compression (matched filtering), and magnitude extraction using CORDIC algorithms.

## Key Features

- **ROM-based IF Signal Generator**: Pre-stored radar intermediate frequency signals
- **Hardware Noise Generator**: CLT (Central Limit Theorem) based Gaussian white noise generation
- **Manual DDC Implementation**: Handwritten digital down converter with NCO (Numerically Controlled Oscillator)
- **Pulse Compression**: Matched filtering using Xilinx FIR Compiler IP cores
- **Magnitude Extraction**: CORDIC algorithm for computing signal magnitude
- **DAC Waveform Output**: Real-time analog signal output via ADDA106 DAC module
- **UART Data Transmission**: Real-time data streaming to PC for analysis
- **Multi-stage Debug**: ILA (Integrated Logic Analyzer) support for waveform observation at various processing stages

## System Architecture

```
IF Signal ROM → Noise Generator → Adder → DDC → Pulse Compressor → CORDIC → DAC/UART
                                                            ↓
                                                        Magnitude Output
```

## Hardware Platform

- **FPGA Board**: ZYNQ 7020 (XC7Z020)
- **DAC Module**: ADDA106 (8-bit parallel interface)
- **Development Tools**: Xilinx Vivado 2024.2
- **Clock**: 50MHz external oscillator (internally converted to 100MHz)

## Pin Assignment

| Function Module | Signal | Verilog Port | FPGA Pin | IO Standard |
|-----------------|--------|--------------|----------|-------------|
| System Clock | Clock Input | `clk_pin_in` | **U18** | LVCMOS33 |
| UART | UART TX | `uart_tx_pin_out` | **J16** | LVCMOS33 |
| DAC | DAC Clock | `dac_clk_pin` | **E18** | LVCMOS33 |
| DAC | DAC Enable | `dac_pd_pin` | **D19** | LVCMOS33 |
| DAC | Data[7:0] | `dac_data_pins[7:0]` | **L15:D18** | LVCMOS33 |
| Control | Waveform Select | `btn_next_pin` | **F20** | LVCMOS33 |

**Total I/O Pins: 12**

## Project Structure

```
.
├── user/
│   ├── src/
│   │   └── new/                 # Main Verilog source files
│   │       ├── system_top.v    # Top-level module (clock/reset management)
│   │       ├── radar_top.v     # Core radar processing module
│   │       ├── pulse_compressor.v  # Matched filter implementation
│   │       ├── handwritten_ddc.v  # Digital down converter
│   │       ├── nco.v           # Numerically controlled oscillator
│   │       ├── clt_noise_generator.v  # Gaussian noise generator
│   │       ├── dac_waveform_selector.v  # DAC waveform output control
│   │       └── uart_tx.v       # UART transmitter
│   ├── ip/                     # Xilinx IP core configurations
│   │   ├── cordic_magnitude/   # CORDIC magnitude calculator
│   │   ├── fir_i_compiler/     # FIR filter (I channel coefficients)
│   │   ├── fir_q_compiler/     # FIR filter (Q channel coefficients)
│   │   ├── if_data_rom/        # ROM for IF signal storage
│   │   └── sine_cos_rom/       # NCO sine/cosine ROM
│   ├── sim/                    # Simulation testbenches
│   └── data/                   # Data files
├── *.coe                       # ROM coefficient files
├── README.md                   # This file
└── .gitignore                  # Git ignore rules
```

## Source Modules

### Core Modules

- **`system_top.v`**: Top-level module with Clocking Wizard for stable 100MHz clock generation and automatic reset logic
- **`radar_top.v`**: Main radar signal processing pipeline integrating all submodules
- **`pulse_compressor.v`**: Implements matched filtering using 4 parallel FIR filters (I×hI, Q×hQ, I×hQ, Q×hI)
- **`handwritten_ddc.v`**: Custom digital down converter with quadrature mixing
- **`nco.v`**: Numerically controlled oscillator for generating local oscillator signals

### Support Modules

- **`clt_noise_generator.v`**: Central Limit Theorem based Gaussian white noise generator using LFSR
- **`dac_waveform_selector.v`**: Selects between 7 different waveform stages for DAC output
- **`uart_tx.v`**: UART transmitter (115200 baud) for real-time data streaming

## Data Files

- **`echo_rom_data.coe`**: Pre-generated radar echo signal (IF data)
- **`sine_rom.coe`**: Sine wave lookup table for NCO
- **`fir_coeffs_i.coe`**: FIR filter coefficients for I channel
- **`fir_coeffs_q.coe`**: FIR filter coefficients for Q channel
- **`fir_coeffs_interp.coe`**: FIR interpolator coefficients for DAC output

## Waveform Selection

The system supports 7 different waveform outputs (selectable via button):

1. **Mode 0**: Original ROM signal (clean IF signal)
2. **Mode 1**: Noisy IF signal (signal + Gaussian noise)
3. **Mode 2**: DDC I channel output
4. **Mode 3**: DDC Q channel output
5. **Mode 4**: Pulse compressor I channel output
6. **Mode 5**: Pulse compressor Q channel output
7. **Mode 6**: Final magnitude output (compressed pulse)

## Usage

### Prerequisites

- Xilinx Vivado 2024.2 or later
- ZYNQ 7020 development board
- ADDA106 DAC module (optional for analog output)

### Build Instructions

1. Create a new Vivado project
2. Add all source files from `user/src/new/`
3. Configure and generate IP cores from `user/ip/`
4. Import `.coe` coefficient files
5. Apply pin constraints according to the pin assignment table
6. Synthesize, implement, and generate bitstream
7. Download to FPGA

### Data Acquisition

- **UART Mode**: Connect UART to PC (115200 baud, 8N1) to receive real-time magnitude data
- **DAC Mode**: Use DAC waveform selector to output different processing stages as analog signals
- **ILA Mode**: Use Vivado Integrated Logic Analyzer to observe internal signals

## Technical Specifications

| Parameter | Value |
|-----------|-------|
| System Clock | 100 MHz |
| Input Sample Rate | 50 MHz |
| DAC Sample Rate | 100 MHz |
| UART Baud Rate | 115200 |
| IF Signal Bit Width | 12 bits |
| DDC Output Bit Width | 44 bits |
| FIR Output Bit Width | 49 bits |
| CORDIC Output Bit Width | 32 bits |
| DAC Output Bit Width | 8 bits |
| Noise Type | Gaussian white noise |

## Key Algorithms

### Digital Down Conversion (DDC)
- Quadrature mixing using NCO-generated sine/cosine
- Low-pass filtering via FIR Compiler IP

### Pulse Compression
- Matched filtering with complex conjugate of transmitted signal
- Parallel implementation: 4 FIR filters for I/Q multiplication
- High-precision arithmetic (48-bit internal)

### Magnitude Extraction
- CORDIC algorithm for sqrt(I² + Q²)
- AXI-Stream interface for efficient data flow

## License

This is an educational project for a university course. Feel free to use for learning and reference.

## Acknowledgments

This project was developed as a self-selected topic for a Digital Electronics Laboratory course at the university.
