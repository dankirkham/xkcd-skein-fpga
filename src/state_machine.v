module state_machine (
	input clk_i,
	input [6:0] round_counter_i,
	input [3:0] word_counter_i,
	input hash_mode_i,
	
	// Mealy Outputs
	output reg word_counter_reset_o,
	output reg word_counter_plus_1_o,
	output reg word_counter_plus_2_o,	
	output reg round_counter_increment_o,
	output reg round_counter_reset_o,
	output reg hash_register_write_o,
	
	// Moore Outputs
	output reg input_register_write_o,
	output reg output_register_write_o,
	output reg key_register_write_o,
	output reg subkey_register_write_o,
	output reg x0_key_select_o,
	output reg [1:0] x1_tweak_subkey_select_o,
	output reg output_register_plaintext_select_o,
	output reg hash_mode_toggle_o,
	output reg y0_add_select_o
);

reg [2:0] state, nextstate;

localparam	STATE_SUBKEY_GENERATE		= 0,
			STATE_INIT_PLAINTEXT		= 1,
			STATE_SUBKEY_ADD			= 2,
			STATE_SUBKEY_ADD_IR_WRITE	= 3,
			STATE_THREEFISH				= 4,
			STATE_THREEFISH_IR_WRITE	= 5,
			STATE_FINALIZE_HASH			= 6,
			STATE_INVALID				= 7;
			
always @(posedge clk_i)
	state <= nextstate;
	
always @(*) begin // Mealy Outputs and nextstate
	word_counter_reset_o = 1'b0;
	word_counter_plus_1_o = 1'b0;
	word_counter_plus_2_o = 1'b0;
	round_counter_reset_o = 1'b0;
	round_counter_increment_o = 1'b0;
	hash_register_write_o = 1'b0;
	
	case(state)
		STATE_SUBKEY_GENERATE:
			if (word_counter_i == 4'd15) begin
				word_counter_reset_o = 1'b1;
				nextstate = STATE_INIT_PLAINTEXT;
			end else begin
				word_counter_plus_1_o = 1'b1;
				nextstate = STATE_SUBKEY_GENERATE;
			end
			
		STATE_INIT_PLAINTEXT:
			nextstate = STATE_SUBKEY_ADD;
			
		STATE_SUBKEY_ADD:
			if (word_counter_i == 4'd15) begin
				word_counter_reset_o = 1'b1;
				nextstate = STATE_SUBKEY_ADD_IR_WRITE;
			end else begin
				word_counter_plus_1_o = 1'b1;
				nextstate = STATE_SUBKEY_ADD;
			end
			
		STATE_SUBKEY_ADD_IR_WRITE:
			if (round_counter_i >= 7'd80) begin
				round_counter_reset_o = 1'b1;
				nextstate = STATE_FINALIZE_HASH;
			end else begin
				nextstate = STATE_THREEFISH;
			end
			
		STATE_THREEFISH:
			if (word_counter_i == 4'd14) begin
				round_counter_increment_o = 1'b1;
				word_counter_reset_o = 1'b0;
				nextstate = STATE_THREEFISH_IR_WRITE;
			end else begin
				word_counter_plus_2_o = 1'b1;
				nextstate = STATE_THREEFISH;
			end
				
		STATE_THREEFISH_IR_WRITE:
			if ((round_counter_i % 4) == 7'd0)
				nextstate = STATE_SUBKEY_GENERATE;
			else
				nextstate = STATE_THREEFISH;
			
		STATE_FINALIZE_HASH:
			if (hash_mode_i == 1'b1) begin // 1 = Output Mode
				hash_register_write_o = 1'b1;
				nextstate = STATE_SUBKEY_GENERATE;
			end else
				nextstate = STATE_SUBKEY_GENERATE;
			
		STATE_INVALID:
			nextstate = STATE_SUBKEY_GENERATE;
	endcase
end

always @(*) begin // Moore Outputs
	input_register_write_o = 1'b0;
	output_register_write_o = 1'b0;
	key_register_write_o = 1'b0;
	subkey_register_write_o = 1'b0;
	x0_key_select_o = 1'bx;
	x1_tweak_subkey_select_o = 2'bxx;
	output_register_plaintext_select_o = 1'bx;
	hash_mode_toggle_o = 1'b0;
	y0_add_select_o = 1'bx;

	case (state)
		STATE_SUBKEY_GENERATE:
		begin
			x0_key_select_o = 1'b1; // Key
			x1_tweak_subkey_select_o = 2'b01; // Tweak
			subkey_register_write_o = 1'b1;
		end
			
		STATE_INIT_PLAINTEXT:
		begin
			output_register_plaintext_select_o = 1'b1; // Plaintext
			input_register_write_o = 1'b1;
		end
			
		STATE_SUBKEY_ADD:
		begin
			x0_key_select_o = 1'b0; // X0
			x1_tweak_subkey_select_o = 2'b10; // Subkey
			y0_add_select_o = 1'b0; // Add Mode
			output_register_write_o = 1'b1;
		end
			
		STATE_SUBKEY_ADD_IR_WRITE:
		begin
			output_register_plaintext_select_o = 1'b0; // Output Register
			input_register_write_o = 1'b1;
		end
			
		STATE_THREEFISH:
		begin
			x0_key_select_o = 1'b0; // X0
			x1_tweak_subkey_select_o = 2'b00; // X1
			y0_add_select_o = 1'b1; // Y0 Mode
			output_register_write_o = 1'b1;
		end
			
		STATE_THREEFISH_IR_WRITE:
		begin
			output_register_plaintext_select_o = 1'b0; // Output Register
			input_register_write_o = 1'b1;
		end
		
		STATE_FINALIZE_HASH:
		begin
			key_register_write_o = 1'b1;
			hash_mode_toggle_o = 1'b1;
		end
	endcase
end

endmodule