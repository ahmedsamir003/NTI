module bin_to_7seg #(
    parameter IN_WIDTH  = 4,
    parameter OUT_WIDTH = 7
)(
    input   wire    [IN_WIDTH-1:0]  seg_in,
    output  reg     [OUT_WIDTH-1:0] seg_out
);

always @(*) begin
    case (seg_in)
        4'b0000: seg_out = 7'b100_0000; // 0
        4'b0001: seg_out = 7'b111_1001; // 1
        4'b0010: seg_out = 7'b010_0100; // 2
        4'b0011: seg_out = 7'b011_0000; // 3
        4'b0100: seg_out = 7'b001_1001; // 4
        4'b0101: seg_out = 7'b001_0010; // 5
        4'b0110: seg_out = 7'b000_0010; // 6
        4'b0111: seg_out = 7'b111_1000; // 7
        4'b1000: seg_out = 7'b000_0000; // 8
        4'b1001: seg_out = 7'b001_0000; // 9

        4'b1010: seg_out = 7'b000_1000; // R

        4'b1111: seg_out = 7'b000_1110; // F 

        4'b1011: seg_out = 7'b000_0111; // t

        4'b1101: seg_out = 7'b010_1010; // n
        4'b1110: seg_out = 7'b100_0001; // u
        4'b1100: seg_out = 7'b100_1110; // L

        default: seg_out = {OUT_WIDTH{1'b1}};
    endcase
end

endmodule