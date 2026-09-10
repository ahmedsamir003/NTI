`timescale 1ns/1ps
module FSM_tb();
    reg  clk_tb;
    reg  rst_tb;
    reg  level_tb;

    wire tick_moore;
    wire tick_mealy;

    Moore U0 (
        .clk(clk_tb),
        .rst(rst_tb),
        .level(level_tb),
        .tick(tick_moore)
    );

    Mealy U1 (
        .clk(clk_tb),
        .rst(rst_tb),
        .level(level_tb),
        .tick(tick_mealy)
    );

    always #5 clk_tb = ~clk_tb;

    initial begin
        clk_tb   = 1'b0;
        rst_tb   = 1'b0;
        level_tb = 1'b0;
        
        #15;
        rst_tb   = 1'b1;

  
        @(negedge clk_tb);
        level_tb = 1'b1;

        repeat(3) @(negedge clk_tb);
        level_tb = 1'b0;

        #50;
        level_tb = 1'b1;
        #1;
        level_tb = 1'b0;

        #80;
        level_tb = 1'b1;

        #20;
        level_tb = 1'b0;
        
        #50;
        $stop;
    end
endmodule