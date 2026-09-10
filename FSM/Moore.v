module Moore (
    input   wire    clk,
    input   wire    rst,
    input   wire    level,
    output  reg     tick
);

localparam [1:0] zero = 2'b00,
                 edg  = 2'b01,
                 one  = 2'b10;

reg [1:0]       current_state,
                next_state;

always @(posedge clk or negedge rst) begin
    if (!rst)
        current_state <= zero;
    else
        current_state <= next_state;
end

always @(*) 
    begin
        next_state = current_state;

    case (current_state)
        zero: begin
            if (level)
                next_state = edg;
        end

        edg: begin
            if (level)
                next_state = one;
            else
                next_state = zero;
        end

        one: begin
            if (!level)
                next_state = zero;
        end

        default: next_state = zero;
    endcase
end

always @(*)
    begin
        tick = (current_state == edg);
    end

endmodule