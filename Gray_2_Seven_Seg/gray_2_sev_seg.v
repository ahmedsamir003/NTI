module gray_2_sev_seg #(
    parameter IN_WIDTH  = 4,
    parameter OUT_WIDTH = 7
)(
    input   [IN_WIDTH-1:0]  in_gray,
    output  [OUT_WIDTH-1:0] seg_out
);

wire    [IN_WIDTH-1:0]    encoder_to_seg;

gray2bin_gate_level #(
    .WIDTH(IN_WIDTH)
) U0 (
    .in_gray(in_gray),
    .out_bin(encoder_to_seg)
);

bin_to_7seg #(
    .IN_WIDTH(IN_WIDTH),
    .OUT_WIDTH(OUT_WIDTH)
) U1 (
    .seg_in(encoder_to_seg),
    .seg_out(seg_out)
);

endmodule