module shift_reg #(
    parameter WIDTH = 10
)(
    input   wire                    clk,
    input   wire                    rst,
    input   wire                    hold,
    output  reg     [WIDTH-1:0]     shift_out
);

always@(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                shift_out <= {1'b1,{(WIDTH-1){1'b0}}};
            end
        else if(hold)
            begin
                shift_out <= {shift_out[0],shift_out[WIDTH-1:1]};
            end
    end
endmodule