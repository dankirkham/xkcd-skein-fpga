module add64 (
	      input [63:0] a,
	      input [63:0] b,
	      output [63:0] c
	      );
			
	reg [63:0] cRegister;
	wire c = cRegister;
	
   always @(*) begin
      cRegister = a + b;
   end
endmodule
