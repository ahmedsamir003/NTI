module controller (
  input   wire  [2:0]  phase,
  input   wire  [2:0]  opcode,
  input   wire         zero,
  output  reg          sel,
  output  reg          rd,
  output  reg          ld_ir,
  output  reg          halt,
  output  reg          inc_pc,
  output  reg          ld_ac,
  output  reg          wr,
  output  reg          ld_pc,
  output  reg          data_e
);

  localparam [2:0] HLT = 3'b000,
                     SKZ = 3'b001,
                     ADD = 3'b010,
                     AND = 3'b011,
                     XOR = 3'b100,
                     LDA = 3'b101,
                     STO = 3'b110,
                     JMP = 3'b111;

  reg H, A, Z, J, S;

  always @(*) begin
    H = (opcode == HLT);
    A = (opcode == ADD || opcode == AND || opcode == XOR || opcode == LDA);
    Z = (opcode == SKZ && zero);
    J = (opcode == JMP);
    S = (opcode == STO);

    sel    = 1'b0;
    rd     = 1'b0;
    ld_ir  = 1'b0;
    inc_pc = 1'b0;
    halt   = 1'b0;
    ld_pc  = 1'b0;
    data_e = 1'b0;
    ld_ac  = 1'b0;
    wr     = 1'b0;

    case (phase)
      3'd0: begin 
        sel = 1'b1;
      end

      3'd1: begin 
        sel = 1'b1; 
        rd  = 1'b1;
      end

      3'd2: begin 
        sel   = 1'b1; 
        rd    = 1'b1; 
        ld_ir = 1'b1;
      end

      3'd3: begin 
        sel   = 1'b1; 
        rd    = 1'b1; 
        ld_ir = 1'b1;
      end

      3'd4: begin 
        halt   = H; 
        inc_pc = 1'b1;
      end

      3'd5: begin 
        rd = A;
      end

      3'd6: begin 
        rd     = A; 
        inc_pc = Z;
        ld_pc  = J; 
        data_e = S;
      end

      3'd7: begin 
        rd     = A; 
        ld_pc  = J; 
        data_e = S; 
        ld_ac  = A; 
        wr     = S;
      end

      default: begin
        sel    = 1'b0;
        rd     = 1'b0;
        ld_ir  = 1'b0;
        inc_pc = 1'b0;
        halt   = 1'b0;
        ld_pc  = 1'b0;
        data_e = 1'b0;
        ld_ac  = 1'b0;
        wr     = 1'b0;
      end
    endcase
  end

endmodule