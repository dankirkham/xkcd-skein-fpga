module core_id_comparator (
    input [23:0] core_id_i,
    input [23:0] core_selection_i,
    output equals_o
);

assign equals_o = core_id_i == core_selection_i;

endmodule
