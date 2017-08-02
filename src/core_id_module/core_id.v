module core_id #(
    parameter CORE_ID = 0
    )(
    output [23:0] core_id_o
);

assign core_id_o = CORE_ID;

endmodule
