module Full_Adder_tb ();

    reg  [1:0] A_tb;
    reg  [1:0] B_tb;
    reg        Cin_tb;

    wire       Cout_gate;
    wire [1:0] Sum_gate;

    wire       Cout_struct;
    wire [1:0] Sum_struct;

    wire       Cout_behav;
    wire [1:0] Sum_behav;

    FA_gate_2bit_flat U0 (
        .A(A_tb),
        .B(B_tb),
        .Cin(Cin_tb),
        .Sum(Sum_gate),
        .Cout(Cout_gate)
    );

    FA_structural_2bit U1 (
        .A(A_tb),
        .B(B_tb),
        .Cin(Cin_tb),
        .Sum(Sum_struct),
        .Cout(Cout_struct)
    );

    FA_behavioral #(.WIDTH(2)) U2 (
        .A(A_tb),
        .B(B_tb),
        .Cin(Cin_tb),
        .Sum(Sum_behav),
        .Cout(Cout_behav)
    );

    initial begin
        $monitor("A=%b B=%b Cin=%b | Gate: %b %b | Struct: %b %b | Behav: %b %b",
                 A_tb, B_tb, Cin_tb, Sum_gate, Cout_gate, Sum_struct, Cout_struct, Sum_behav, Cout_behav);

        A_tb = 2'b00; B_tb = 2'b00; Cin_tb = 1'b0; #10;
        A_tb = 2'b01; B_tb = 2'b01; Cin_tb = 1'b0; #10;
        A_tb = 2'b10; B_tb = 2'b01; Cin_tb = 1'b1; #10;
        A_tb = 2'b11; B_tb = 2'b11; Cin_tb = 1'b1; #10;

        $finish;
    end

endmodule