module bin_to_7seg_tb #(
    parameter IN_WIDTH  = 4,
    parameter OUT_WIDTH = 7
);

    reg      [IN_WIDTH-1:0]  seg_in_tb;
    wire     [OUT_WIDTH-1:0] seg_out_tb;

////////////////module_instance////////////////
bin_to_7seg #(
    .IN_WIDTH(IN_WIDTH),
    .OUT_WIDTH(OUT_WIDTH)
) DUT (
    .seg_in(seg_in_tb),
    .seg_out(seg_out_tb)
);

integer i;
///////////////////initial block///////////////////
initial
    begin
        initialize();
        
        for(i = 0 ; i < 16 ; i = i + 1)
            begin
                numb_in(i);
            end

        $stop;
    end



///////////////////////TASKS////////////////////////

//////////initialize////////
task initialize();
    begin
        seg_in_tb = {IN_WIDTH{1'b0}};
        #10;
    end
endtask

///////////////////////NUMBER_IN///////////////////
task numb_in (
    input   [IN_WIDTH-1:0]  number
);
    begin
        seg_in_tb = number;
        #10;
        $display("Binary_in     %b  |   Hexa_out    %h",
                seg_in_tb, seg_out_tb);
    end
endtask

endmodule