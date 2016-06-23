`timescale 1ns / 1ps

module rotator_constant_tb;
    reg [2:0] d;
    reg [2:0] j;
    wire [5:0] rotate_bits;
    
    integer i;
    integer k;

    rotator_constant rotator_constant (
        .d_i(d),
        .j_i(j),
        .rotate_bits_o(rotate_bits)
    );
    
    initial begin
        d = 0;
        j = 0;
    end
    
    initial begin
        for (i = 0; i < 8; i=i+1) begin
            for (k = 0; k < 8; k=k+1) begin
                d = i;
                j = k;
                #10 $display("\t", d, "\t", j, "\t", rotate_bits);
            end
        end
    end

    initial
    #2000 $finish;
endmodule