`timescale 1ns/1ps
module Enccoder_tb #(
    parameter   IN_WIDTH    = 2,
    parameter   OUT_WIDTH   = 4
)();

    reg                        En_tb;
    reg    [IN_WIDTH-1:0]      In_tb;
    wire   [OUT_WIDTH-1:0]     out_tb;

Decoder #(
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
        In_tb = 2'b00;
        #10;
        $display("In = %b, | out = %b",In_tb, out_tb);


        En_tb = 1'b1;
        In_tb = 2'b01;
        #10;
        $display("In = %b, | out = %b",In_tb, out_tb);

        En_tb = 1'b1;
        In_tb = 2'b10;
        #10;
        $display("In = %b, | out = %b",In_tb, out_tb);

        En_tb = 1'b1;
        In_tb = 2'b11;
        #10;
        $display("In = %b, | out = %b",In_tb, out_tb);

        $stop;
    end
endmodule