module gray2bin_gate_level #(
    parameter WIDTH = 4
)(
    input   wire    [WIDTH-1:0] in_gray,
    output  wire    [WIDTH-1:0] out_bin
);

assign out_bin[WIDTH-1] = in_gray[WIDTH-1];

genvar i;
generate
    for(i = WIDTH-2 ; i >= 0 ; i = i - 1)
        begin : gen_gray2bin
            xor (out_bin[i], out_bin[i+1], in_gray[i]);
        end
endgenerate

/*
xor (out_bin[WIDTH-2], out_bin[WIDTH-1], in_gray[WIDTH-2]);
xor (out_bin[WIDTH-3], out_bin[WIDTH-2], in_gray[WIDTH-3]);
xor (out_bin[WIDTH-4], out_bin[WIDTH-3], in_gray[WIDTH-4]);
*/

endmodule