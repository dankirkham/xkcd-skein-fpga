run: obj_dir/Vcore_sim test/build/add_test.ml test/build/bit_counter_test.ml test/build/bits_off_compare_test.ml test/build/core_id_test.ml test/build/nonce_test.ml test/build/permute_test.ml test/build/rotate_left_test.ml test/build/subkey_test.ml test/build/unselected_core_test.ml test/build/xor_test.ml
# run: obj_dir/Vcore_sim test/build/permute_test.ml
	obj_dir/Vcore_sim test/build/*.ml

obj_dir/Vcore_sim: core_sim.v core_sim.cpp
	verilator -Wall --cc core_sim.v --exe core_sim.cpp -I../alu  -I../alu/comparator -I../core_id_module -I../core -I../block_ram -GCORE_ID=4645649
	make -C obj_dir -j -f Vcore_sim.mk Vcore_sim

test/build/add_test.ml: test/add_test.asm
	xsf_asm -o test/build/add_test.ml test/add_test.asm

test/build/bit_counter_test.asm: test/bit_counter_test.py
	python3 test/bit_counter_test.py

test/build/bit_counter_test.ml: test/build/bit_counter_test.asm
	xsf_asm -o test/build/bit_counter_test.ml test/build/bit_counter_test.asm

test/build/bits_off_compare_test.ml: test/bits_off_compare_test.asm
	xsf_asm -o test/build/bits_off_compare_test.ml test/bits_off_compare_test.asm

test/build/core_id_test.ml: test/core_id_test.asm
	xsf_asm -o test/build/core_id_test.ml test/core_id_test.asm

test/build/mix_test.asm: test/mix_test.py
	python3 test/mix_test.py

test/build/mix_test.ml: test/build/mix_test.asm
	xsf_asm -o test/build/mix_test.ml test/build/mix_test.asm

test/build/nonce_test.ml: test/nonce_test.asm
	xsf_asm -o test/build/nonce_test.ml test/nonce_test.asm

test/build/permute_test.asm: test/permute_test.py
	python3 test/permute_test.py

test/build/permute_test.ml: test/build/permute_test.asm
	xsf_asm -o test/build/permute_test.ml test/build/permute_test.asm

test/build/rotate_left_test.asm: test/rotate_left_test.py
	python3 test/rotate_left_test.py

test/build/rotate_left_test.ml: test/build/rotate_left_test.asm
	xsf_asm -o test/build/rotate_left_test.ml test/build/rotate_left_test.asm

test/build/subkey_test.asm: test/subkey_test.py
	python3 test/subkey_test.py

test/build/subkey_test.ml: test/build/subkey_test.asm
	xsf_asm -o test/build/subkey_test.ml test/build/subkey_test.asm

test/build/unselected_core_test.ml: test/unselected_core_test.asm
	xsf_asm -o test/build/unselected_core_test.ml test/unselected_core_test.asm

test/build/xor_test.ml: test/xor_test.asm
	xsf_asm -o test/build/xor_test.ml test/xor_test.asm

.PHONY: clean
clean:
	rm -f test/build/*
	rm -f obj_dir/*
