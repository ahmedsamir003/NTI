module six_sev_seg #(
    parameter IN_WIDTH  = 4,
    parameter OUT_WIDTH = 7
)(
    input   wire                    rst,
    input   wire    [IN_WIDTH-1:0]  rise_count,
    input   wire    [IN_WIDTH-1:0]  fall_count,
    input   wire    [IN_WIDTH-1:0]  total_count,

    output  wire     [OUT_WIDTH-1:0] R,
    output  wire     [OUT_WIDTH-1:0] RC,
    output  wire     [OUT_WIDTH-1:0] F,
    output  wire     [OUT_WIDTH-1:0] FC,
    output  wire     [OUT_WIDTH-1:0] T,
    output  wire     [OUT_WIDTH-1:0] TC
);

localparam      [IN_WIDTH-1:0]      RISE  = 4'b1010,
                                    FALL  = 4'b1111,
                                    TOTAL = 4'b1011,
                                    n     = 4'b1101,
                                    u     = 4'b1110,
                                    l     = 4'b1100;

wire    [IN_WIDTH-1:0]  dis_r  = (!rst) ? n   : RISE;
wire    [IN_WIDTH-1:0]  dis_rc = (!rst) ? u   : rise_count;
wire    [IN_WIDTH-1:0]  dis_f  = (!rst) ? l   : FALL;
wire    [IN_WIDTH-1:0]  dis_fc = (!rst) ? l   : fall_count;

wire [OUT_WIDTH-1:0] T_decoded, T_C_decoded;



bin_to_7seg #(
    .IN_WIDTH(IN_WIDTH),
    .OUT_WIDTH(OUT_WIDTH)

) U0 (
    .seg_in(dis_r),
    .seg_out(R)
);
///////////////////////////////

bin_to_7seg #(
    .IN_WIDTH(IN_WIDTH),
    .OUT_WIDTH(OUT_WIDTH)

) U1 (
    .seg_in(dis_rc),
    .seg_out(RC)
);
///////////////////////////////

bin_to_7seg #(
    .IN_WIDTH(IN_WIDTH),
    .OUT_WIDTH(OUT_WIDTH)

) U2 (
    .seg_in(dis_f),
    .seg_out(F)
);
///////////////////////////////

bin_to_7seg #(
    .IN_WIDTH(IN_WIDTH),
    .OUT_WIDTH(OUT_WIDTH)

) U3 (
    .seg_in(dis_fc),
    .seg_out(FC)
);
///////////////////////////////

bin_to_7seg #(
    .IN_WIDTH(IN_WIDTH),
    .OUT_WIDTH(OUT_WIDTH)

) U4 (
    .seg_in(TOTAL),
    .seg_out(T_decoded)
);
///////////////////////////////

bin_to_7seg #(
    .IN_WIDTH(IN_WIDTH),
    .OUT_WIDTH(OUT_WIDTH)

) U5 (
    .seg_in(total_count),
    .seg_out(T_C_decoded)
);
///////////////////////////////

assign T   = (!rst) ? 7'b111_1111 : T_decoded;
assign T_C = (!rst) ? 7'b111_1111 : T_C_decoded;

endmodule