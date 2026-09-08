module Enccoder #(
    parameter   IN_WIDTH    = 4,
    parameter   OUT_WIDTH   = 2
)(
    input   wire                        En,
    input   wire    [IN_WIDTH-1:0]      In,
    output  reg     [OUT_WIDTH-1:0]     out
);

integer i;

always@(*)
    begin
        out = {OUT_WIDTH{1'b0}};
        if(En)
            begin
                for(i = 0 ; i < IN_WIDTH ; i = i + 1)
                    begin
                        if(In[i])
                            out = i;
                    end
            end
    end
endmodule