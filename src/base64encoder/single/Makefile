run: obj_dir/Vbase64encoder
	obj_dir/Vbase64encoder

obj_dir/Vbase64encoder: base64encoder.v base64encoder_test.cpp
	verilator -Wall --cc base64encoder.v --exe base64encoder_test.cpp
	make -C obj_dir -j -f Vbase64encoder.mk Vbase64encoder
