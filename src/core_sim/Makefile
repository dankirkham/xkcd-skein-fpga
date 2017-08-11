run: obj_dir/Vcore_sim test/build/add_test.ml test/build/bits_off_compare_test.ml test/build/rotate_left_test.ml
	obj_dir/Vcore_sim test/build/*.ml

obj_dir/Vcore_sim: core_sim.v core_sim.cpp
	verilator -Wall --cc core_sim.v --exe core_sim.cpp -I../alu  -I../alu/comparator -I../core_id_module -I../core -I../block_ram
	make -C obj_dir -j -f Vcore_sim.mk Vcore_sim

test/build/add_test.ml: test/add_test.asm
	xsf_asm -o test/build/add_test.ml test/add_test.asm

test/build/bits_off_compare_test.ml: test/bits_off_compare_test.asm
	xsf_asm -o test/build/bits_off_compare_test.ml test/bits_off_compare_test.asm

test/build/rotate_left_test.ml: test/build/rotate_left_test.asm
	xsf_asm -o test/build/rotate_left_test.ml test/build/rotate_left_test.asm

test/build/rotate_left_test.asm: test/rotate_left_test.py
	python3 test/rotate_left_test.py
