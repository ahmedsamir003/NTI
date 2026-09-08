module gray_2_sev_seg_tb #(
    parameter IN_WIDTH  = 4,
    parameter OUT_WIDTH = 7
);
    reg   [IN_WIDTH-1:0]  in_gray_tb;
    wire  [OUT_WIDTH-1:0] seg_out_tb;

top_module #(
    .IN_WIDTH(IN_WIDTH),
    .OUT_WIDTH(OUT_WIDTH)
) DUT (
    .in_gray(in_gray_tb),
    .seg_out(seg_out_tb)
);

initial
    begin
    initialize();

    send_gray_to_sev(4'b0000);
    send_gray_to_sev(4'b0001);
    send_gray_to_sev(4'b0011);
    send_gray_to_sev(4'b0010);
    send_gray_to_sev(4'b0110);
    send_gray_to_sev(4'b0111);
    send_gray_to_sev(4'b0101);
    send_gray_to_sev(4'b0100);
    send_gray_to_sev(4'b1100);
    send_gray_to_sev(4'b1101);
    send_gray_to_sev(4'b1111);
    send_gray_to_sev(4'b1110);
    send_gray_to_sev(4'b1010);
    send_gray_to_sev(4'b1011);
    send_gray_to_sev(4'b1001);
    send_gray_to_sev(4'b1000);

    $stop;
    end


/////////////////////////TASKS//////////////////////

////////////////////initialize////////////////
task initialize();
    begin
        in_gray_tb = {IN_WIDTH{1'b0}};
        #10;
    end
endtask

/////////////////send_gray_to_sev/////////////
task send_gray_to_sev(
    input   [IN_WIDTH-1:0]  data_in
);
    begin
        in_gray_tb  =   data_in;
        #10;
        $display("Gray_in  %b  |   Seg_out  %h",
                    in_gray_tb,seg_out_tb);
    end
endtask

endmodule