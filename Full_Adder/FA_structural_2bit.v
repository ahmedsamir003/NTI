module FA_structural_2bit (
    input  wire [1:0] A,
    input  wire [1:0] B,
    input  wire       Cin,
    output wire [1:0] Sum,
    output wire       Cout
);

    wire C1;

    FA_structural FA0 (
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .Sum(Sum[0]),
        .Cout(C1)
    );

    FA_structural FA1 (
        .A(A[1]),
        .B(B[1]),
        .Cin(C1),
        .Sum(Sum[1]),
        .Cout(Cout)
    );

endmodule