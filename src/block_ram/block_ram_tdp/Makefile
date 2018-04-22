run: obj_dir/Vblock_ram_tdp
	obj_dir/Vblock_ram_tdp

obj_dir/Vblock_ram_tdp: block_ram_tdp.v block_ram_tdp_test.cpp
	verilator -Wall --cc block_ram_tdp.v --exe block_ram_tdp_test.cpp
	make -C obj_dir -j -f Vblock_ram_tdp.mk Vblock_ram_tdp

.PHONY: clean
clean:
	rm -rf obj_dir
