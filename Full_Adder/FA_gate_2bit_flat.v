module FA_gate_2bit_flat (
    input  wire [1:0] A,
    input  wire [1:0] B,
    input  wire       Cin,
    output wire [1:0] Sum,
    output wire       Cout
);

    wire X0, W0_1, W0_2, C1;
    wire X1, W1_1, W1_2;

    xor (X0,   A[0], B[0]);
    xor (Sum[0], X0, Cin);

    and (W0_1, A[0], B[0]);
    and (W0_2, X0,   Cin);

    or  (C1,   W0_1, W0_2);

    xor (X1,   A[1], B[1]);
    xor (Sum[1], X1, C1);

    and (W1_1, A[1], B[1]);
    and (W1_2, X1,   C1);

    or  (Cout, W1_1, W1_2);
endmodule