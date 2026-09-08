module light_chaser #(
    parameter WIDTH = 10
)(
    input                      clk,
    input                       rst,
    input                      clk_en,
    input       [7:0]           i_div_ratio,
    input                       hold_shift,
    output      [WIDTH-1:0]     shift_out
);

wire    div_clk;

ClkDiv U0 (
    .i_ref_clk(clk),
    .i_rst_n(rst),
    .i_clk_en(clk_en),
    .i_div_ratio(i_div_ratio),
    .o_div_clk(div_clk)
);

shift_reg #(
    .WIDTH(WIDTH)
) U1 (
    .clk(div_clk),
    .rst(rst),
    .hold(hold_shift),
    .shift_out(shift_out)
);

endmodule