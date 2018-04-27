PYTHON=python
XSF_ASM=xsf_asm

DEPENDENCIES= \
	alu \
	alu/comparator \
	block_ram/block_ram \
	core \
	core_id_module  \

PY_FILES= \
	bit_counter_test.py \
	bits_off_count_test.py \
	encrypt_test.py \
	full_test.py \
	hash_test.py \
	mix_test.py \
	multi_test.py \
	permute_test.py \
	rotate_left_test.py \
	subkey_test.py \

ASM_FILES= \
	add_test.asm \
	bits_off_compare_test.asm \
	core_id_test.asm \
	nonce_test.asm \
	unselected_core_test.asm \
	xor_test.asm \

TEST_DIR=test
TEST_BUILD_DIR=$(TEST_DIR)/build

run: obj_dir/Vcore_sim $(addprefix $(TEST_BUILD_DIR)/,$(PY_FILES:.py=.ml)) $(addprefix $(TEST_BUILD_DIR)/,$(ASM_FILES:.asm=.ml))
	obj_dir/Vcore_sim $(addprefix $(TEST_BUILD_DIR)/,$(PY_FILES:.py=.ml)) $(addprefix $(TEST_BUILD_DIR)/,$(ASM_FILES:.asm=.ml))

obj_dir/Vcore_sim: core_sim.v core_sim.cpp $(addsuffix /*.v,$(addprefix ../,$(DEPENDENCIES)))
	verilator -Wall --cc core_sim.v --exe core_sim.cpp $(addprefix -I../,$(DEPENDENCIES)) -GCORE_ID=4342338
	make -C obj_dir -j -f Vcore_sim.mk Vcore_sim

$(addprefix $(TEST_BUILD_DIR)/,$(PY_FILES:.py=.ml)):
	$(PYTHON) $(TEST_DIR)/$(subst .ml,.py,$(notdir $@))
	$(XSF_ASM) -o $@ $(subst .ml,.asm,$@)

$(addprefix $(TEST_BUILD_DIR)/,$(ASM_FILES:.asm=.ml)):
	$(XSF_ASM) -o $@ $(TEST_DIR)/$(subst .ml,.asm,$(notdir $@))

.PHONY: clean
clean:	clean-test clean-verilator

.PHONY: clean-test
clean-test:
	rm -f test/build/*

.PHONY: clean-verilator
clean-verilator:
	rm -f obj_dir/*
