`timescale 1ns / 1ps
module system_top_tb;

    reg clk_50M;
    reg rst;
    reg IN;

    wire [6:0] seg_R, seg_RC;
    wire [6:0] seg_F, seg_FC;
    wire [6:0] seg_T, seg_TC;

    System_Top dut (
        .clk_50M (clk_50M),
        .rst     (rst),
        .IN      (IN),
        .seg_R   (seg_R),
        .seg_RC  (seg_RC),
        .seg_F   (seg_F),
        .seg_FC  (seg_FC),
        .seg_T   (seg_T),
        .seg_TC  (seg_TC)
    );

    always #10 clk_50M = ~clk_50M;

    initial begin
        clk_50M = 1'b0;
        rst     = 1'b0;
        IN      = 1'b0;


        #100;
        $display("[TIME %0t ns] Reset Active (rst = 0) -> Display showing 'n u L L'", $time);

        #40;
        rst = 1'b1;
        $display("[TIME %0t ns] Reset Released (rst = 1) -> Display showing 'R 0  F 0  t 0'", $time);

        #5000;
        $display("[TIME %0t ns] IN = 1 (Rising Edge 1)", $time);
        IN = 1'b1;

        #5000;
        $display("[TIME %0t ns] IN = 0 (Falling Edge 1)", $time);
        IN = 1'b0;

        #5000;
        $display("[TIME %0t ns] IN = 1 (Rising Edge 2)", $time);
        IN = 1'b1;

        #5000;
        $display("[TIME %0t ns] IN = 0 (Falling Edge 2)", $time);
        IN = 1'b0;

        #5000;
        $display("--- SIMULATION COMPLETE ---");
        $finish;
    end

endmodule