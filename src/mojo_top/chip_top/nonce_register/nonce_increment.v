module nonce_increment (
	input [255:0] nonce_i,
	output [255:0] incremented_nonce_o
);

wire carry_0 = 1'b1;
wire carry_1;
wire carry_2;
wire carry_3;
wire carry_4;
wire carry_5;
wire carry_6;
wire carry_7;
wire carry_8;
wire carry_9;
wire carry_10;
wire carry_11;
wire carry_12;
wire carry_13;
wire carry_14;
wire carry_15;
wire carry_16;
wire carry_17;
wire carry_18;
wire carry_19;
wire carry_20;
wire carry_21;
wire carry_22;
wire carry_23;
wire carry_24;
wire carry_25;
wire carry_26;
wire carry_27;
wire carry_28;
wire carry_29;
wire carry_30;
wire carry_31;

nonce_increment_element nonce_increment_element0 (
	.byte_i(nonce_i[7:0]),
	.carry_i(carry_0),
	.byte_o(incremented_nonce_o[7:0]),
	.carry_o(carry_1)
);

nonce_increment_element nonce_increment_element1 (
	.byte_i(nonce_i[15:8]),
	.carry_i(carry_1),
	.byte_o(incremented_nonce_o[15:8]),
	.carry_o(carry_2)
);

nonce_increment_element nonce_increment_element2 (
	.byte_i(nonce_i[23:16]),
	.carry_i(carry_2),
	.byte_o(incremented_nonce_o[23:16]),
	.carry_o(carry_3)
);

nonce_increment_element nonce_increment_element3 (
	.byte_i(nonce_i[31:24]),
	.carry_i(carry_3),
	.byte_o(incremented_nonce_o[31:24]),
	.carry_o(carry_4)
);

nonce_increment_element nonce_increment_element4 (
	.byte_i(nonce_i[39:32]),
	.carry_i(carry_4),
	.byte_o(incremented_nonce_o[39:32]),
	.carry_o(carry_5)
);

nonce_increment_element nonce_increment_element5 (
	.byte_i(nonce_i[47:40]),
	.carry_i(carry_5),
	.byte_o(incremented_nonce_o[47:40]),
	.carry_o(carry_6)
);

nonce_increment_element nonce_increment_element6 (
	.byte_i(nonce_i[55:48]),
	.carry_i(carry_6),
	.byte_o(incremented_nonce_o[55:48]),
	.carry_o(carry_7)
);

nonce_increment_element nonce_increment_element7 (
	.byte_i(nonce_i[63:56]),
	.carry_i(carry_7),
	.byte_o(incremented_nonce_o[63:56]),
	.carry_o(carry_8)
);

nonce_increment_element nonce_increment_element8 (
	.byte_i(nonce_i[71:64]),
	.carry_i(carry_8),
	.byte_o(incremented_nonce_o[71:64]),
	.carry_o(carry_9)
);

nonce_increment_element nonce_increment_element9 (
	.byte_i(nonce_i[79:72]),
	.carry_i(carry_9),
	.byte_o(incremented_nonce_o[79:72]),
	.carry_o(carry_10)
);

nonce_increment_element nonce_increment_element10 (
	.byte_i(nonce_i[87:80]),
	.carry_i(carry_10),
	.byte_o(incremented_nonce_o[87:80]),
	.carry_o(carry_11)
);

nonce_increment_element nonce_increment_element11 (
	.byte_i(nonce_i[95:88]),
	.carry_i(carry_11),
	.byte_o(incremented_nonce_o[95:88]),
	.carry_o(carry_12)
);

nonce_increment_element nonce_increment_element12 (
	.byte_i(nonce_i[103:96]),
	.carry_i(carry_12),
	.byte_o(incremented_nonce_o[103:96]),
	.carry_o(carry_13)
);

nonce_increment_element nonce_increment_element13 (
	.byte_i(nonce_i[111:104]),
	.carry_i(carry_13),
	.byte_o(incremented_nonce_o[111:104]),
	.carry_o(carry_14)
);

nonce_increment_element nonce_increment_element14 (
	.byte_i(nonce_i[119:112]),
	.carry_i(carry_14),
	.byte_o(incremented_nonce_o[119:112]),
	.carry_o(carry_15)
);

nonce_increment_element nonce_increment_element15 (
	.byte_i(nonce_i[127:120]),
	.carry_i(carry_15),
	.byte_o(incremented_nonce_o[127:120]),
	.carry_o(carry_16)
);

nonce_increment_element nonce_increment_element16 (
	.byte_i(nonce_i[135:128]),
	.carry_i(carry_16),
	.byte_o(incremented_nonce_o[135:128]),
	.carry_o(carry_17)
);

nonce_increment_element nonce_increment_element17 (
	.byte_i(nonce_i[143:136]),
	.carry_i(carry_17),
	.byte_o(incremented_nonce_o[143:136]),
	.carry_o(carry_18)
);

nonce_increment_element nonce_increment_element18 (
	.byte_i(nonce_i[151:144]),
	.carry_i(carry_18),
	.byte_o(incremented_nonce_o[151:144]),
	.carry_o(carry_19)
);

nonce_increment_element nonce_increment_element19 (
	.byte_i(nonce_i[159:152]),
	.carry_i(carry_19),
	.byte_o(incremented_nonce_o[159:152]),
	.carry_o(carry_20)
);

nonce_increment_element nonce_increment_element20 (
	.byte_i(nonce_i[167:160]),
	.carry_i(carry_20),
	.byte_o(incremented_nonce_o[167:160]),
	.carry_o(carry_21)
);

nonce_increment_element nonce_increment_element21 (
	.byte_i(nonce_i[175:168]),
	.carry_i(carry_21),
	.byte_o(incremented_nonce_o[175:168]),
	.carry_o(carry_22)
);

nonce_increment_element nonce_increment_element22 (
	.byte_i(nonce_i[183:176]),
	.carry_i(carry_22),
	.byte_o(incremented_nonce_o[183:176]),
	.carry_o(carry_23)
);

nonce_increment_element nonce_increment_element23 (
	.byte_i(nonce_i[191:184]),
	.carry_i(carry_23),
	.byte_o(incremented_nonce_o[191:184]),
	.carry_o(carry_24)
);

nonce_increment_element nonce_increment_element24 (
	.byte_i(nonce_i[199:192]),
	.carry_i(carry_24),
	.byte_o(incremented_nonce_o[199:192]),
	.carry_o(carry_25)
);

nonce_increment_element nonce_increment_element25 (
	.byte_i(nonce_i[207:200]),
	.carry_i(carry_25),
	.byte_o(incremented_nonce_o[207:200]),
	.carry_o(carry_26)
);

nonce_increment_element nonce_increment_element26 (
	.byte_i(nonce_i[215:208]),
	.carry_i(carry_26),
	.byte_o(incremented_nonce_o[215:208]),
	.carry_o(carry_27)
);

nonce_increment_element nonce_increment_element27 (
	.byte_i(nonce_i[223:216]),
	.carry_i(carry_27),
	.byte_o(incremented_nonce_o[223:216]),
	.carry_o(carry_28)
);

nonce_increment_element nonce_increment_element28 (
	.byte_i(nonce_i[231:224]),
	.carry_i(carry_28),
	.byte_o(incremented_nonce_o[231:224]),
	.carry_o(carry_29)
);

nonce_increment_element nonce_increment_element29 (
	.byte_i(nonce_i[239:232]),
	.carry_i(carry_29),
	.byte_o(incremented_nonce_o[239:232]),
	.carry_o(carry_30)
);

nonce_increment_element nonce_increment_element30 (
	.byte_i(nonce_i[247:240]),
	.carry_i(carry_30),
	.byte_o(incremented_nonce_o[247:240]),
	.carry_o(carry_31)
);

nonce_increment_element nonce_increment_element31 (
	.byte_i(nonce_i[255:248]),
	.carry_i(carry_31),
	.byte_o(incremented_nonce_o[255:248]),
	.carry_o()
);

endmodule