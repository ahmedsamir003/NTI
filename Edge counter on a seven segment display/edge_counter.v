module edge_counter #(
    parameter WIDTH = 4
)(
    input   wire                 clk,
    input   wire                 rst,
    input   wire                 rise_tick,
    input   wire                 fall_tick,
    input   wire                 edge_tick,
    output  reg    [WIDTH-1:0]   rise_count,
    output  reg    [WIDTH-1:0]   fall_count,
    output  reg    [WIDTH-1:0]   total_count
);

always@(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                rise_count  <= {WIDTH{1'b0}};
                fall_count  <= {WIDTH{1'b0}};
                total_count <= {WIDTH{1'b0}};
            end
    else
        begin
            if(rise_tick)
                rise_count  <= rise_count  + 1'b1;
            if(fall_tick)
                fall_count  <= fall_count  + 1'b1;
            if(edge_tick)
                total_count <= total_count + 1'b1;
        end
    end
endmodule