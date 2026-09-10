module ClkDiv (
    input   wire        i_ref_clk,
    input   wire        i_rst_n,
    input   wire        i_clk_en,
    input   wire [7:0]  i_div_ratio,
    output  wire        o_div_clk
);

    reg [7:0] counter;
    reg       div_clk;

    wire CLK_DIV_EN = i_clk_en && (i_div_ratio > 8'd1);

    assign o_div_clk = CLK_DIV_EN ? div_clk : i_ref_clk;

    always @(posedge i_ref_clk or negedge i_rst_n)
        begin
            if (!i_rst_n)
                begin
                    counter <= 8'd0;
                    div_clk <= 1'b0;
                end
            else if (CLK_DIV_EN)
                begin
                    if (counter >= (i_div_ratio - 8'd1))
                        begin
                            counter <= 8'd0;
                            div_clk <= ~div_clk;
                        end
                    else
                        begin
                            counter <= counter + 8'd1;
                        end
                end
            else
                begin
                    counter <= 8'd0;
                    div_clk <= 1'b0;
                end
        end
endmodule