SRC_DIR=../..
LIB_DIR=$(SRC_DIR)/test

run: obj_dir/Vblock_ram_tdp
	obj_dir/Vblock_ram_tdp

obj_dir/Vblock_ram_tdp: block_ram_tdp.v block_ram_tdp_test.cpp $(LIB_DIR)/test.cpp
	mkdir -p obj_dir
	g++ -c $(LIB_DIR)/test.cpp -I$(LIB_DIR) -o obj_dir/test.o
	verilator -Wall --cc block_ram_tdp.v --exe test.o block_ram_tdp_test.cpp -CFLAGS -I../$(LIB_DIR)
	make -C obj_dir -j -f Vblock_ram_tdp.mk Vblock_ram_tdp

.PHONY: clean
clean:
	rm -rf obj_dir
