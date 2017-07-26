run: obj_dir/Vblock_ram_test
	obj_dir/Vblock_ram_test

obj_dir/Vblock_ram_test: block_ram_test.v block_ram_test_test.cpp
	verilator -Wall --cc block_ram_test.v --exe block_ram_test_test.cpp
	make -C obj_dir -j -f Vblock_ram_test.mk Vblock_ram_test
