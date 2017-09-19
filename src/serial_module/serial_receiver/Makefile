run: obj_dir/Vserial_receiver
	obj_dir/Vserial_receiver

obj_dir/Vserial_receiver: serial_receiver.v serial_receiver_test.cpp
	verilator -Wall --cc serial_receiver.v --exe serial_receiver_test.cpp
	make -C obj_dir -j -f Vserial_receiver.mk Vserial_receiver

.PHONY: clean
clean:
	rm -rf obj_dir
