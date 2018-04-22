run: obj_dir/Vblock_ram
	obj_dir/Vblock_ram

obj_dir/Vblock_ram: block_ram.v block_ram_test.cpp
	verilator -Wall --cc block_ram.v --exe block_ram_test.cpp
	make -C obj_dir -j -f Vblock_ram.mk Vblock_ram

.PHONY: clean
clean:
	rm -rf obj_dir
