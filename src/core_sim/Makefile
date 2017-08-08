run: obj_dir/Vcore_sim test/add_test.ml test/bits_off_compare_test.ml
	obj_dir/Vcore_sim test/*.ml

obj_dir/Vcore_sim: core_sim.v core_sim.cpp
	verilator -Wall --cc core_sim.v --exe core_sim.cpp -I../alu  -I../alu/comparator -I../core_id_module -I../core -I../block_ram
	make -C obj_dir -j -f Vcore_sim.mk Vcore_sim

test/add_test.ml: test/add_test.asm
	xsf_asm -o test/add_test.ml test/add_test.asm

test/bits_off_compare_test.ml: test/bits_off_compare_test.asm
	xsf_asm -o test/bits_off_compare_test.ml test/bits_off_compare_test.asm
