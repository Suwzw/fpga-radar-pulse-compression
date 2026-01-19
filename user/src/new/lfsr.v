//-----------------------------------------------------------------------------
// Module: lfsr (Linear Feedback Shift Register)
//
// Description:
//   一个16位的斐波那契LFSR，用于生成伪随机比特流。
//   多项式: x^16 + x^14 + x^13 + x^11 + 1 (常用的一个)
//   每次时钟上升沿，寄存器右移一位，并根据反馈多项式计算新的输入位。
//-----------------------------------------------------------------------------
module lfsr #(
    parameter WIDTH = 16,
    // 初始种子，每个LFSR实例必须不同，且不能为0
    parameter INITIAL_SEED = 16'hACE1
) (
    input  wire clk,
    input  wire rst_n, // 低电平复位

    output reg  random_bit_out
);

    // 内部移位寄存器
    reg [WIDTH-1:0] shift_reg;

    // 反馈逻辑 (taps at 16, 14, 13, 11)
    // 对应Verilog中的索引是 [15], [13], [12], [10]
    wire feedback_bit;
    assign feedback_bit = shift_reg[15] ^ shift_reg[13] ^ shift_reg[12] ^ shift_reg[10];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // 复位时，加载非零的初始种子
            shift_reg <= INITIAL_SEED;
        end else begin
            // 正常工作时，移位并载入反馈位
            shift_reg <= {shift_reg[WIDTH-2:0], feedback_bit};
        end
    end

    // 输出最高位作为随机比特
    // 也可以选择其他位，但通常用最高位或最低位
    always @(*) begin
        random_bit_out = shift_reg[WIDTH-1];
    end

endmodule