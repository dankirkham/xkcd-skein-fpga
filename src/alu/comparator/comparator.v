module comparator (
	input [9:0] bit_counter_register_i,
  input [9:0] comparator_register_i,

	output select_o // Output is bit_counter_register_i < comparator_register_i
);

// https://en.wikipedia.org/wiki/Digital_comparator#Implementation
// 9 is MSB and 0 is LSB
wire x9;
wire x8;
wire x7;
wire x6;
wire x5;
wire x4;
wire x3;
wire x2;
wire x1;

assign x9 = bit_counter_register_i[9] ~^ comparator_register_i[9];
assign x8 = bit_counter_register_i[8] ~^ comparator_register_i[8];
assign x7 = bit_counter_register_i[7] ~^ comparator_register_i[7];
assign x6 = bit_counter_register_i[6] ~^ comparator_register_i[6];
assign x5 = bit_counter_register_i[5] ~^ comparator_register_i[5];
assign x4 = bit_counter_register_i[4] ~^ comparator_register_i[4];
assign x3 = bit_counter_register_i[3] ~^ comparator_register_i[3];
assign x2 = bit_counter_register_i[2] ~^ comparator_register_i[2];
assign x1 = bit_counter_register_i[1] ~^ comparator_register_i[1];

assign select_o = ~bit_counter_register_i[9] & comparator_register_i[9] |
                  ~bit_counter_register_i[8] & comparator_register_i[8] & x9 |
                  ~bit_counter_register_i[7] & comparator_register_i[7] & x9 & x8 |
                  ~bit_counter_register_i[6] & comparator_register_i[6] & x9 & x8 & x7 |
                  ~bit_counter_register_i[5] & comparator_register_i[5] & x9 & x8 & x7 & x6 |
                  ~bit_counter_register_i[4] & comparator_register_i[4] & x9 & x8 & x7 & x6 & x5 |
                  ~bit_counter_register_i[3] & comparator_register_i[3] & x9 & x8 & x7 & x6 & x5 & x4 |
                  ~bit_counter_register_i[2] & comparator_register_i[2] & x9 & x8 & x7 & x6 & x5 & x4 & x3 |
                  ~bit_counter_register_i[1] & comparator_register_i[1] & x9 & x8 & x7 & x6 & x5 & x4 & x3 & x2 |
                  ~bit_counter_register_i[0] & comparator_register_i[0] & x9 & x8 & x7 & x6 & x5 & x4 & x3 & x2 & x1;

endmodule
