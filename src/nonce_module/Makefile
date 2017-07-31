run: obj_dir/Vnonce_module
	obj_dir/Vnonce_module

obj_dir/Vnonce_module: nonce_module.v nonce_module_test.cpp
	verilator -Wall --cc nonce_module.v --exe nonce_module_test.cpp -I../base64encoder/x6 -I../base64encoder/single
	make -C obj_dir -j -f Vnonce_module.mk Vnonce_module
