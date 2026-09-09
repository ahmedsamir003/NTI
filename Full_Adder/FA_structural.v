module FA_structural (
    input  wire A,
    input  wire B,
    input  wire Cin,
    output wire Sum,
    output wire Cout
);
    wire S1, C1, C2;

    Half_Adder U0 (
        .A(A),
        .B(B),
        .Sum(S1),
        .Cout(C1)
    );

    Half_Adder U1 (
        .A(S1),
        .B(Cin),
        .Sum(Sum),
        .Cout(C2)
    );

    or (Cout, C1, C2);
endmodule