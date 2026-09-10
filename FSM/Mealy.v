module Mealy (
    input   wire    clk,
    input   wire    rst,
    input   wire    level,
    output  reg     tick
);

localparam              zero = 1'b0,
                        one  = 1'b1;

reg                     current_state,
                        next_state;

always@(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                current_state <= zero;
            end
        else
            current_state <= next_state;
    end

always@(*)
    begin
    current_state = next_state;

    case(current_state)
    zero:   begin
            if(level)
                next_state = one;
            else
                next_state = current_state;
    end

    one:    begin
            if(!level)
                next_state = zero;
            else
                next_state = current_state;
            end

    default:    next_state = zero;
    endcase
end

always@(*)
    begin
    tick = 1'b0;
    
    case(current_state)
    zero:   begin
            if(level)
                tick = 1'b1;
    end

    one:    begin
            if(!level)
                tick = 1'b0;
    end
    endcase
end

endmodule