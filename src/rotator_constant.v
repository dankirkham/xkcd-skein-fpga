module rotator_constant (
	input [2:0] d_i,
	input [2:0] j_i,
	
	output [7:0] rotate_bits_o
    );

reg [7:0] rotate_bits;

assign rotate_bits_o = rotate_bits;

always @(*) begin
	if (d_i == 3'd0)
	begin
			  if (j_i == 3'd0)
			  begin
						 rotate_bits = 8'd24;
			  end
			  else if (j_i == 3'd1)
			  begin
						 rotate_bits = 8'd13;
			  end
			  else if (j_i == 3'd2)
			  begin
						 rotate_bits = 8'd8;
			  end
			  else if (j_i == 3'd3)
			  begin
						 rotate_bits = 8'd47;
			  end
			  else if (j_i == 3'd4)
			  begin
						 rotate_bits = 8'd8;
			  end
			  else if (j_i == 3'd5)
			  begin
						 rotate_bits = 8'd17;
			  end
			  else if (j_i == 3'd6)
			  begin
						 rotate_bits = 8'd22;
			  end
			  else if (j_i == 3'd7)
			  begin
						 rotate_bits = 8'd37;
			  end
	end
	else if (d_i == 3'd1)
	begin
			  if (j_i == 3'd0)
			  begin
						 rotate_bits = 8'd38;
			  end
			  else if (j_i == 3'd1)
			  begin
						 rotate_bits = 8'd19;
			  end
			  else if (j_i == 3'd2)
			  begin
						 rotate_bits = 8'd10;
			  end
			  else if (j_i == 3'd3)
			  begin
						 rotate_bits = 8'd55;
			  end
			  else if (j_i == 3'd4)
			  begin
						 rotate_bits = 8'd49;
			  end
			  else if (j_i == 3'd5)
			  begin
						 rotate_bits = 8'd18;
			  end
			  else if (j_i == 3'd6)
			  begin
						 rotate_bits = 8'd23;
			  end
			  else if (j_i == 3'd7)
			  begin
						 rotate_bits = 8'd52;
			  end
	end
	else if (d_i == 3'd2)
	begin
			  if (j_i == 3'd0)
			  begin
						 rotate_bits = 8'd33;
			  end
			  else if (j_i == 3'd1)
			  begin
						 rotate_bits = 8'd4;
			  end
			  else if (j_i == 3'd2)
			  begin
						 rotate_bits = 8'd51;
			  end
			  else if (j_i == 3'd3)
			  begin
						 rotate_bits = 8'd13;
			  end
			  else if (j_i == 3'd4)
			  begin
						 rotate_bits = 8'd34;
			  end
			  else if (j_i == 3'd5)
			  begin
						 rotate_bits = 8'd41;
			  end
			  else if (j_i == 3'd6)
			  begin
						 rotate_bits = 8'd59;
			  end
			  else if (j_i == 3'd7)
			  begin
						 rotate_bits = 8'd17;
			  end
	end
	else if (d_i == 3'd3)
	begin
			  if (j_i == 3'd0)
			  begin
						 rotate_bits = 8'd5;
			  end
			  else if (j_i == 3'd1)
			  begin
						 rotate_bits = 8'd20;
			  end
			  else if (j_i == 3'd2)
			  begin
						 rotate_bits = 8'd48;
			  end
			  else if (j_i == 3'd3)
			  begin
						 rotate_bits = 8'd41;
			  end
			  else if (j_i == 3'd4)
			  begin
						 rotate_bits = 8'd47;
			  end
			  else if (j_i == 3'd5)
			  begin
						 rotate_bits = 8'd28;
			  end
			  else if (j_i == 3'd6)
			  begin
						 rotate_bits = 8'd16;
			  end
			  else if (j_i == 3'd7)
			  begin
						 rotate_bits = 8'd25;
			  end
	end
	else if (d_i == 3'd4)
	begin
			  if (j_i == 3'd0)
			  begin
						 rotate_bits = 8'd41;
			  end
			  else if (j_i == 3'd1)
			  begin
						 rotate_bits = 8'd9;
			  end
			  else if (j_i == 3'd2)
			  begin
						 rotate_bits = 8'd37;
			  end
			  else if (j_i == 3'd3)
			  begin
						 rotate_bits = 8'd31;
			  end
			  else if (j_i == 3'd4)
			  begin
						 rotate_bits = 8'd12;
			  end
			  else if (j_i == 3'd5)
			  begin
						 rotate_bits = 8'd47;
			  end
			  else if (j_i == 3'd6)
			  begin
						 rotate_bits = 8'd44;
			  end
			  else if (j_i == 3'd7)
			  begin
						 rotate_bits = 8'd30;
			  end
	end
	else if (d_i == 3'd5)
	begin
			  if (j_i == 3'd0)
			  begin
						 rotate_bits = 8'd16;
			  end
			  else if (j_i == 3'd1)
			  begin
						 rotate_bits = 8'd34;
			  end
			  else if (j_i == 3'd2)
			  begin
						 rotate_bits = 8'd56;
			  end
			  else if (j_i == 3'd3)
			  begin
						 rotate_bits = 8'd51;
			  end
			  else if (j_i == 3'd4)
			  begin
						 rotate_bits = 8'd4;
			  end
			  else if (j_i == 3'd5)
			  begin
						 rotate_bits = 8'd53;
			  end
			  else if (j_i == 3'd6)
			  begin
						 rotate_bits = 8'd42;
			  end
			  else if (j_i == 3'd7)
			  begin
						 rotate_bits = 8'd41;
			  end
	end
	else if (d_i == 3'd6)
	begin
			  if (j_i == 3'd0)
			  begin
						 rotate_bits = 8'd31;
			  end
			  else if (j_i == 3'd1)
			  begin
						 rotate_bits = 8'd44;
			  end
			  else if (j_i == 3'd2)
			  begin
						 rotate_bits = 8'd47;
			  end
			  else if (j_i == 3'd3)
			  begin
						 rotate_bits = 8'd46;
			  end
			  else if (j_i == 3'd4)
			  begin
						 rotate_bits = 8'd19;
			  end
			  else if (j_i == 3'd5)
			  begin
						 rotate_bits = 8'd42;
			  end
			  else if (j_i == 3'd6)
			  begin
						 rotate_bits = 8'd44;
			  end
			  else if (j_i == 3'd7)
			  begin
						 rotate_bits = 8'd25;
			  end
	end
	else if (d_i == 3'd7)
	begin
			  if (j_i == 3'd0)
			  begin
						 rotate_bits = 8'd9;
			  end
			  else if (j_i == 3'd1)
			  begin
						 rotate_bits = 8'd48;
			  end
			  else if (j_i == 3'd2)
			  begin
						 rotate_bits = 8'd35;
			  end
			  else if (j_i == 3'd3)
			  begin
						 rotate_bits = 8'd52;
			  end
			  else if (j_i == 3'd4)
			  begin
						 rotate_bits = 8'd23;
			  end
			  else if (j_i == 3'd5)
			  begin
						 rotate_bits = 8'd31;
			  end
			  else if (j_i == 3'd6)
			  begin
						 rotate_bits = 8'd37;
			  end
			  else if (j_i == 3'd7)
			  begin
						 rotate_bits = 8'd20;
			  end
	end
end

endmodule
