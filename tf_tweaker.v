module tf_tweaker (
		   input  mode,
		   output tweak[191:0]
		   );

   localparam MODE_MSG = 0;
   localparam MODE_OUT = 1;
   
   always @(*) begin
      if (mode == MODE_MSG) begin
	 tweak = 192'hF000000000000014F0000000000000000000000000000014;
	 // 20 alphabetic (A-Z, a-z) ascii characters = 115-bit space
      end else begin
	 tweak = 192'hFF00000000000008FF000000000000000000000000000008;
      end
	 
   end
endmodule
