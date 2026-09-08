`timescale 1ns/1ps
module light_chaser_tb #(
    parameter WIDTH = 10
);
    reg                       clk_tb;
    reg                       rst_tb;
    reg                       clk_en_tb;
    reg       [7:0]           i_div_ratio_tb;
    reg                       hold_shift_tb;
    wire      [WIDTH-1:0]     shift_out_tb;

light_chaser #(
    .WIDTH(WIDTH)
) DUT (
    .clk(clk_tb),
    .rst(rst_tb),
    .clk_en(clk_en_tb),
    .i_div_ratio(i_div_ratio_tb),
    .hold_shift(hold_shift_tb),
    .shift_out(shift_out_tb)
);

always #5   clk_tb = ~clk_tb;

initial
    begin
        clk_tb         = 1'b0;
        rst_tb         = 1'b1;
        clk_en_tb      = 1'b0;
        i_div_ratio_tb = 8'd4;
        hold_shift_tb  = 1'b0;
        #10;

        rst_tb = 1'b0;
        #10;
        rst_tb = 1'b1;
        #10;
        $display("shift_out   %b", shift_out_tb);

        hold_shift_tb = 1'b1;
        #80;
        $display("shift_out   %b", shift_out_tb);

        clk_en_tb = 1'b1;
        #120;
        $display("shift_out   %b", shift_out_tb);

        hold_shift_tb = 1'b0;
        #80;
        $display("shift_out   %b", shift_out_tb);

        hold_shift_tb = 1'b1;
        #240;
        $display("shift_out   %b", shift_out_tb);

        #40;
        $display("shift_out   %b", shift_out_tb);

        #40;
        $display("shift_out   %b", shift_out_tb);

        i_div_ratio_tb = 8'd2;
        #40;
        $display("shift_out   %b", shift_out_tb);

        rst_tb = 1'b0;
        #5;
        $display("shift_out   %b", shift_out_tb);

        rst_tb = 1'b1;
        #40;
    
        $stop;
    end

endmodule