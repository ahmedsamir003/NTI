module Moore (
    input   wire    clk,
    input   wire    rst,
    input   wire    level,
    output  reg     rise_tick,
    output  reg     fall_tick,
    output  reg     edge_tick
);

localparam [1:0] zero = 2'b00,
                 rise = 2'b01,
                 one  = 2'b10,
                 fall = 2'b11;

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
                next_state = rise;
        end

        rise: begin
            if (level)
                next_state = one;
            else
                next_state = fall;
        end

        one: begin
            if (!level)
                next_state = fall;
        end

        fall: begin
            if(!level)
                next_state = zero;
            else
                next_state = rise;
        end

        default: next_state = zero;
    endcase
end

always @(*)
    begin
        rise_tick = (current_state == rise);
        fall_tick = (current_state == fall);
        edge_tick = rise_tick | fall_tick;
    end

endmodule