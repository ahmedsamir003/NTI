module System_Top #(
    parameter IN_WIDTH  = 4,
    parameter OUT_WIDTH = 7
)(
    input   wire                    clk_50M,
    input   wire                    rst,
    input   wire                    IN,
    output  wire    [OUT_WIDTH-1:0] seg_R,
    output  wire    [OUT_WIDTH-1:0] seg_RC,
    output  wire    [OUT_WIDTH-1:0] seg_F,
    output  wire    [OUT_WIDTH-1:0] seg_FC,
    output  wire    [OUT_WIDTH-1:0] seg_T,
    output  wire    [OUT_WIDTH-1:0] seg_TC 
);

    wire                    clk_100;
    wire                    rise_tick, fall_tick, edge_tick;
    wire [IN_WIDTH-1:0]     rise_count, fall_count, total_count;

    ClkDiv u_clk_div (
        .i_ref_clk   (clk_50M),
        .i_rst_n     (rst),
        .i_clk_en    (1'b1),
        .i_div_ratio (8'd250),
        .o_div_clk   (clk_100)
    );

    Moore u_edge_det (
        .clk       (clk_100),
        .rst       (rst),
        .level     (IN),
        .rise_tick (rise_tick),
        .fall_tick (fall_tick),
        .edge_tick (edge_tick)
    );

    edge_counter #(
        .WIDTH(IN_WIDTH)
    ) u_edge_counter (
        .clk         (clk_100),
        .rst         (rst),
        .rise_tick   (rise_tick),
        .fall_tick   (fall_tick),
        .edge_tick   (edge_tick),
        .rise_count  (rise_count),
        .fall_count  (fall_count),
        .total_count (total_count)
    );

    six_sev_seg #(
        .IN_WIDTH  (IN_WIDTH),
        .OUT_WIDTH (OUT_WIDTH)
    ) u_sev_seg (
        .rst         (rst),
        .rise_count  (rise_count),
        .fall_count  (fall_count),
        .total_count (total_count),
        .R           (seg_R),
        .RC          (seg_RC),
        .F           (seg_F),
        .FC          (seg_FC),
        .T           (seg_T),
        .TC          (seg_TC)
    );

endmodule