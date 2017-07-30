run: obj_dir/Vbase64encoder_x6
	obj_dir/Vbase64encoder_x6

obj_dir/Vbase64encoder_x6: base64encoder_x6.v base64encoder_x6_test.cpp
	verilator -Wall --cc base64encoder_x6.v --exe base64encoder_x6_test.cpp -I ../single/base64encoder.v
	make -C obj_dir -j -f Vbase64encoder_x6.mk Vbase64encoder_x6
