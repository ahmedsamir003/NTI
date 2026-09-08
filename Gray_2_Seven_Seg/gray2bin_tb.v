module gray2bin_tb #(
    parameter WIDTH = 4
)();

   reg   [WIDTH-1:0]     in_gray_tb;
   wire  [WIDTH-1:0]     out_bin_behav;
   wire  [WIDTH-1:0]     out_bin_gatelevel;

///////////////behav_instance/////////////
    gray2bin #(
        .WIDTH(WIDTH)
    ) U0 (
        .in_gray(in_gray_tb),
        .out_bin(out_bin_behav)
    );

///////////////gatelevel_instance/////////////
    gray2bin_gate_level #(
        .WIDTH(WIDTH)
    ) U1 (
        .in_gray(in_gray_tb),
        .out_bin(out_bin_gatelevel)
    );


/////////////////initial_block//////////////////
initial
    begin
    initialize();

    send_nibble(4'b0000);
    send_nibble(4'b0001);
    send_nibble(4'b0011);
    send_nibble(4'b0010);
    send_nibble(4'b0110);
    send_nibble(4'b0111);
    send_nibble(4'b0101);
    send_nibble(4'b0100);
    send_nibble(4'b1100);
    send_nibble(4'b1101);
    send_nibble(4'b1111);
    send_nibble(4'b1110);
    send_nibble(4'b1010);
    send_nibble(4'b1011);
    send_nibble(4'b1001);
    send_nibble(4'b1000);

    $stop;
    end



/////////////////////////TASKS///////////////////

//////////initialize////////////
task initialize();
    begin
        in_gray_tb = {WIDTH{1'b0}};
        #10;
    end
endtask

//////////send_nibble////////////
task send_nibble(
    input   [WIDTH-1:0] data_in
);
    begin
        in_gray_tb = data_in;
        #10;
        $display("in_gray   %b  |   out_bin_behav   %b  |   out_bin_gatelevel   %b",
                in_gray_tb, out_bin_behav, out_bin_gatelevel);
    end
endtask

endmodule