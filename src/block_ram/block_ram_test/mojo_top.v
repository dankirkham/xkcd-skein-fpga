module mojo_top(
    // 50MHz clock input
    input clk,
    // Input from reset button (active low)
    input rst_n,
    // cclk input from AVR, high when AVR is ready
    input cclk,
    // Outputs to the 8 onboard LEDs
    output[7:0]led,
    // AVR SPI connections
    output spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    // AVR ADC channel select
    output [3:0] spi_channel,
    // Serial connections
    input avr_tx, // AVR Tx => FPGA Rx
    output avr_rx, // AVR Rx => FPGA Tx
    input avr_rx_busy // AVR Rx buffer full
    );

wire rst = ~rst_n; // make reset active high

// UART Wires
wire [7:0] tx_data_w;
wire new_tx_data_w;
wire tx_busy_w;
wire new_rx_data_w;
wire [7:0] rx_data_w;

// RAM Wires
wire [15:0] data_to_ram_w;
wire [15:0] data_from_ram_w;
wire [7:0] address_w;
wire write_w;

// these signals should be high-z when not used
assign spi_miso = 1'bz;
assign spi_channel = 4'bzzzz;
assign led = address_w;

avr_interface avr_interface1 (
    .clk(clk),
    .rst(rst),
    .cclk(cclk),

	 // Serial AVR Interface
    .tx(avr_rx),
    .rx(avr_tx),

    // Serial TX User Interface
    .tx_data(tx_data_w),
    .new_tx_data(new_tx_data_w),
    .tx_busy(tx_busy_w),
    .tx_block(avr_rx_busy),

    // Serial RX User Interface
    .rx_data(rx_data_w),
    .new_rx_data(new_rx_data_w)
);

block_ram_test block_ram_test0 (
  .clk_i(clk),

  // UART Module
  .rx_byte_i(rx_data_w),
  .tx_byte_o(tx_data_w),
  .new_rx_data_i(new_rx_data_w),
  .new_tx_data_o(new_tx_data_w),
  .tx_busy_i(tx_busy_w),

  // RAM
  .address_o(address_w),
  .data_i(data_from_ram_w),
  .data_o(data_to_ram_w),
  .write_o(write_w)
);

block_ram block_ram0 (
  .clk_i(clk),
  .write_i(write_w),
  .data_i(data_to_ram_w),
  .address_i(address_w),
  .data_o(data_from_ram_w)
);

endmodule
