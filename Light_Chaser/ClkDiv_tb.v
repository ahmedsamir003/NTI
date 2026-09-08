`timescale 1ns/1ps;
module ClkDiv_tb ();

reg         i_ref_clk_tb;
reg         i_rst_n_tb;
reg         i_clk_en_tb;
reg  [7:0]  i_div_ratio_tb;
wire         o_div_clk_tb;

ClkDiv U0 (
    .i_ref_clk(i_ref_clk_tb),
    .i_rst_n(i_rst_n_tb),
    .i_clk_en(i_clk_en_tb),
    .i_div_ratio(i_div_ratio_tb),
    .o_div_clk(o_div_clk_tb)
);

always #5 i_ref_clk_tb = !i_ref_clk_tb ;
initial
    begin
        ////////initialize////////
        i_ref_clk_tb    = 1'b0;
        i_rst_n_tb      = 1'b0;
        i_clk_en_tb     = 1'b0;
        i_div_ratio_tb  = 8'd0;
        ////case_1 divide_by_2////
        #10;
        i_rst_n_tb      = 1'b1;
        i_clk_en_tb     = 1'b1;
        i_div_ratio_tb  = 8'd2;
        ////case_2 divide_by_3////
        #100;
        i_rst_n_tb      = 1'b1;
        i_clk_en_tb     = 1'b1;
        i_div_ratio_tb  = 8'd3;
        ////case_3 divide_by_4////
        #100;
        i_rst_n_tb      = 1'b1;
        i_clk_en_tb     = 1'b1;
        i_div_ratio_tb  = 8'd4;
        ////case_4 divide_by_5////
        #100;
        i_rst_n_tb      = 1'b1;
        i_clk_en_tb     = 1'b1;
        i_div_ratio_tb  = 8'd5;
        ////case_5 divide_by_6////
        #100;
        i_rst_n_tb      = 1'b1;
        i_clk_en_tb     = 1'b1;
        i_div_ratio_tb  = 8'd6;
        ////case_6 check_enable////
        i_rst_n_tb      = 1'b1;
        i_clk_en_tb     = 1'b0;
        i_div_ratio_tb  = 8'd6;
        #100;
        $stop;
    end
endmodule