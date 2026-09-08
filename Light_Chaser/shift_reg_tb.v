module shift_reg_tb #(
    parameter WIDTH = 10
);
    reg                      clk_tb;
    reg                      rst_tb;
    reg                      hold_tb;
    wire     [WIDTH-1:0]     shift_out_tb;

shift_reg #(
    .WIDTH(WIDTH)
) DUT (
    .clk(clk_tb),
    .rst(rst_tb),
    .hold(hold_tb),
    .shift_out(shift_out_tb)
);

always #5 clk_tb = ~clk_tb;

initial
    begin
clk_tb  = 1'b0;
        rst_tb  = 1'b1;
        hold_tb = 1'b0;
        #10;

        rst_tb = 1'b0;
        #10;
        rst_tb = 1'b1;
        #10;
        $display("shift_out   %b", shift_out_tb);

        hold_tb = 1'b1;
        #90;
        $display("shift_out   %b", shift_out_tb);

        #10;
        $display("shift_out   %b", shift_out_tb);

        hold_tb = 1'b0;
        #40;
        $display("shift_out   %b", shift_out_tb);

        hold_tb = 1'b1;
        #10;
        hold_tb = 1'b0;
        #20;
        $display("shift_out   %b", shift_out_tb);

        hold_tb = 1'b1;
        #10;
        hold_tb = 1'b0;
        #20;
        $display("shift_out   %b", shift_out_tb);

        hold_tb = 1'b1;
        #20;
        $display("shift_out   %b", shift_out_tb);

        rst_tb = 1'b0;
        #5;
        $display("shift_out   %b", shift_out_tb);

        rst_tb = 1'b1;
        #20;

        $stop;
    end

endmodule