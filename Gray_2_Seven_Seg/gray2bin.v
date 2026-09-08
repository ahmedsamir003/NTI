module gray2bin #(
    parameter WIDTH = 4
)(
    input   wire    [WIDTH-1:0] in_gray,
    output  reg     [WIDTH-1:0] out_bin
);

integer i;

always@(*)
    begin
        out_bin = in_gray;

        for(i = WIDTH-2 ; i >= 0 ; i = i - 1)
            begin
                out_bin[i] = in_gray[i] ^ out_bin[i+1];
            end
    end

endmodule