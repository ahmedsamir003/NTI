module FA_behavioral #(
    parameter WIDTH = 2 
)(
    input   wire    [WIDTH-1:0]    A,
    input   wire    [WIDTH-1:0]    B,
    input   wire                   Cin,
    output  wire    [WIDTH-1:0]    Sum,
    output  wire                   Cout
);

assign {Cout, Sum} = A + B + Cin;

endmodule
