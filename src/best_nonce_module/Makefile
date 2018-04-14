run: obj_dir/Vbest_nonce_module
	obj_dir/Vbest_nonce_module

obj_dir/Vbest_nonce_module: best_nonce_module.v best_nonce_module_test.cpp
	verilator -Wall --cc best_nonce_module.v --exe best_nonce_module_test.cpp
	make -C obj_dir -j -f Vbest_nonce_module.mk Vbest_nonce_module

.PHONY: clean
clean:
	rm -rf obj_dir
