module core_id #(
    parameter CORE_ID = 0
    )(
    output [23:0] core_id_o
);

/* verilator lint_off WIDTH */
assign core_id_o = CORE_ID;
/* lint_on */

endmodule
