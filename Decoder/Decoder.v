module Decoder #(
    parameter   IN_WIDTH    = 2,
    parameter   OUT_WIDTH   = 4
)(
    input   wire                        En,
    input   wire    [IN_WIDTH-1:0]      In,
    output  reg     [OUT_WIDTH-1:0]     out
);

always@(*)
    begin
        out = {OUT_WIDTH{1'b0}};
        if(En)
            begin
                out[In] = 1'b1;
            end
    end
endmodule