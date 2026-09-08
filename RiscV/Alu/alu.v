module alu #(
  parameter WIDTH = 8
)(
  input   wire  [WIDTH-1:0] in_a,
  input   wire  [WIDTH-1:0] in_b,
  input   wire  [2:0]       opcode,
  output  reg   [WIDTH-1:0] alu_out,
  output  wire              a_is_zero
);

assign a_is_zero = ~(|in_a);

always@(*)
  begin
  case(opcode)
  3'b000:  alu_out = in_a;            //HLT
  3'b001:  alu_out = in_a;            //SKZ
  3'b010:  alu_out = in_a + in_b;     //ADD
  3'b011:  alu_out = in_a & in_b;     //AND
  3'b100:  alu_out = in_a ^ in_b;     //XOR
  3'b101:  alu_out = in_b;            //LDA
  3'b110:  alu_out = in_a;            //STOP
  3'b111:  alu_out = in_a;            //JMP
  default:  alu_out = {WIDTH{1'b0}};  //Default_Zero
  endcase
end

endmodule
