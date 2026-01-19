`timescale 1ns / 1ps
// =============================================================================
// Module: uart_tx (参数化的UART发送模块)
// Description:
//   - 将一个字节的数据按照UART协议串行发送出去。
//   - 通过参数配置系统时钟频率和波特率。
// =============================================================================
module uart_tx #(
    parameter CLK_FREQ = 100_000_000, // FPGA系统时钟频率 (100MHz)
    parameter BAUD_RATE = 115200     // 串口波特率
)(
    input wire i_clk,
    input wire i_rst,

    // -- 控制接口 --
    input wire       i_tx_start, // 发送启动信号 (单脉冲)
    input wire [7:0] i_tx_data,  // 待发送的8位数据
    output wire      o_tx_busy,  // 忙信号，为高时表示正在发送

    // -- 物理接口 --
    output reg o_uart_tx   // UART发送引脚
);

    // 波特率时钟分频系数
    localparam CLK_PER_BIT = CLK_FREQ / BAUD_RATE;

    // 内部状态机
    localparam S_IDLE = 2'b00;
    localparam S_START = 2'b01;
    localparam S_DATA = 2'b10;
    localparam S_STOP = 2'b11;

    reg [1:0]  state_reg;
    reg [3:0]  bit_index_reg;
    reg [19:0] clk_counter_reg;
    reg [7:0]  tx_data_reg;

    assign o_tx_busy = (state_reg != S_IDLE);

    always @(posedge i_clk or posedge i_rst) begin
        if (i_rst) begin
            state_reg <= S_IDLE;
            clk_counter_reg <= 0;
            bit_index_reg <= 0;
            o_uart_tx <= 1'b1; // UART空闲时为高电平
            tx_data_reg <= 0;
        end else begin
            case (state_reg)
                S_IDLE: begin
                    o_uart_tx <= 1'b1;
                    if (i_tx_start) begin
                        tx_data_reg <= i_tx_data;
                        clk_counter_reg <= 0;
                        state_reg <= S_START;
                    end
                end

                S_START: begin
                    o_uart_tx <= 1'b0; // 发送起始位
                    if (clk_counter_reg < CLK_PER_BIT - 1) begin
                        clk_counter_reg <= clk_counter_reg + 1;
                    end else begin
                        clk_counter_reg <= 0;
                        bit_index_reg <= 0;
                        state_reg <= S_DATA;
                    end
                end

                S_DATA: begin
                    o_uart_tx <= tx_data_reg[bit_index_reg];
                    if (clk_counter_reg < CLK_PER_BIT - 1) begin
                        clk_counter_reg <= clk_counter_reg + 1;
                    end else begin
                        clk_counter_reg <= 0;
                        if (bit_index_reg < 7) begin
                            bit_index_reg <= bit_index_reg + 1;
                        end else begin
                            bit_index_reg <= 0;
                            state_reg <= S_STOP;
                        end
                    end
                end

                S_STOP: begin
                    o_uart_tx <= 1'b1; // 发送停止位
                    if (clk_counter_reg < CLK_PER_BIT - 1) begin
                        clk_counter_reg <= clk_counter_reg + 1;
                    end else begin
                        clk_counter_reg <= 0;
                        state_reg <= S_IDLE;
                    end
                end
                default:
                    state_reg <= S_IDLE;
            endcase
        end
    end
endmodule