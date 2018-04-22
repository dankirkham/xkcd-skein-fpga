run: obj_dir/Vxkcd_skein_processor
	obj_dir/Vxkcd_skein_processor

obj_dir/Vxkcd_skein_processor: xkcd_skein_processor.v xkcd_skein_processor_test.cpp
	verilator -Wall --cc xkcd_skein_processor.v --exe xkcd_skein_processor_test.cpp -I../alu  -I../alu/comparator -I../core_id_module -I../core -I../block_ram/block_ram -I../block_ram/block_ram_tdp -I../constants_rom -I../best_nonce_module -I../serial_module -I../serial_module/serial_transmitter -I../serial_module/serial_receiver -I../nonce_module -I../base64encoder/base64encoder -I../base64encoder/base64encoder_x6
	make -C obj_dir -j -f Vxkcd_skein_processor.mk Vxkcd_skein_processor

.PHONY: clean
clean:
	rm -rf obj_dir
