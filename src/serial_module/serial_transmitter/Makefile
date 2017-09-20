run: obj_dir/Vserial_transmitter
	obj_dir/Vserial_transmitter

obj_dir/Vserial_transmitter: serial_transmitter.v serial_transmitter_test.cpp
	verilator -Wall --cc serial_transmitter.v --exe serial_transmitter_test.cpp
	make -C obj_dir -j -f Vserial_transmitter.mk Vserial_transmitter

.PHONY: clean
clean:
	rm -rf obj_dir
