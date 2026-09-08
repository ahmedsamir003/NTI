`timescale 1ns/1ps
module Enccoder_tb #(
    parameter   IN_WIDTH    = 4,
    parameter   OUT_WIDTH   = 2
)();

    reg                        En_tb;
    reg    [IN_WIDTH-1:0]      In_tb;
    wire   [OUT_WIDTH-1:0]   out_tb;

Enccoder #(
    .IN_WIDTH(IN_WIDTH),
    .OUT_WIDTH(OUT_WIDTH)
) DUT (
    .En(En_tb),
    .In(In_tb),
    .out(out_tb)
);

initial
    begin
        En_tb = 1'b0;
        In_tb = {IN_WIDTH{1'b0}};
        #10;

        En_tb = 1'b1;
        In_tb = 4'b0001;
        #10;
        $display("In = %b, | out = %b",In_tb, out_tb);


        En_tb = 1'b1;
        In_tb = 4'b0010;
        #10;
        $display("In = %b, | out = %b",In_tb, out_tb);

        En_tb = 1'b1;
        In_tb = 4'b0100;
        #10;
        $display("In = %b, | out = %b",In_tb, out_tb);

        En_tb = 1'b1;
        In_tb = 4'b1000;
        #10;
        $display("In = %b, | out = %b",In_tb, out_tb);

        $stop;
    end
endmodule