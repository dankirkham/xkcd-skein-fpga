module mojo_top(
		input 	     clk,
		input 	     rst_n,
		input 	     cclk,
		output [7:0] led,
		output 	     spi_miso,
		input 	     spi_ss,
		input 	     spi_mosi,
		input 	     spi_sck,
		output [3:0] spi_channel,
		input 	     avr_tx,
		output 	     avr_rx,
		input 	     avr_rx_busy
		);
   
   wire 		     rst = ~rst_n;
   wire 		     led1;
   wire [7:0] 		     tx_data;
   wire 		     new_tx_data;
   wire 		     tx_busy;
   wire [7:0]		     rx_data;
   wire 		     new_rx_data;
   wire [1023:0] 	     pt;
   wire [1023:0] 	     ct;
          
   assign led = { 7'b0, led1 };
   assign pt = 1024'd42;
   
   avr_interface (
		  .clk(clk),
		  .rst(rst),
		  .cclk(cclk),
		  .spi_miso(spi_miso),
		  .spi_mosi(spi_mosi),
		  .spi_sck(spi_sck),
		  .spi_ss(spi_ss),
		  .spi_channel(spi_channel),
		  .tx(avr_rx),
		  .rx(avr_tx),
		  .channel(4'd15), // Invalid channel disables ADC
		  .new_sample(),
		  .sample(),
		  .sample_channel(),
		  .tx_data(tx_data),
		  .new_tx_data(new_tx_data),
		  .tx_busy(tx_busy),
		  .tx_block(avr_tx_busy),
		  .rx_data(rx_data),
		  .new_rx_data(new_rx_data)
		  );
   

   tf_round (
	     .clk(clk),
	     .plaintext(pt),
	     .cyphertext(ct)
	     );

   always @(*) begin
   end
   
endmodule
