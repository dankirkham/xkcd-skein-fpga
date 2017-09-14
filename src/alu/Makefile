run: obj_dir/Valu
	obj_dir/Valu

obj_dir/Valu: alu.v alu_test.cpp
	verilator -Wall --cc alu.v --exe alu_test.cpp -I comparator/comparator.v
	make -C obj_dir -j -f Valu.mk Valu

.PHONY: clean
clean:
	rm -rf obj_dir
