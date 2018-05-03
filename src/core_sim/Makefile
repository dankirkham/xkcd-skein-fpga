MODULE=core_sim
SRC_DIR=..

VERILATOR_FLAGS=-GCORE_ID=4342338

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

LIB_DIR=$(SRC_DIR)/test

PYTHON=python3
XSF_ASM=xsf_asm
TEST_DIR=test
TEST_BUILD_DIR=$(TEST_DIR)/build

run: obj_dir/V$(MODULE) $(addprefix $(TEST_BUILD_DIR)/,$(PY_FILES:.py=.ml)) $(addprefix $(TEST_BUILD_DIR)/,$(ASM_FILES:.asm=.ml))
	obj_dir/V$(MODULE) $(addprefix $(TEST_BUILD_DIR)/,$(PY_FILES:.py=.ml)) $(addprefix $(TEST_BUILD_DIR)/,$(ASM_FILES:.asm=.ml))

obj_dir/V$(MODULE): $(MODULE).v $(MODULE).cpp $(LIB_DIR)/test.cpp
	mkdir -p obj_dir
	clang++ -std=c++11 -c $(LIB_DIR)/test.cpp -I$(LIB_DIR) -o obj_dir/test.o
	verilator -Wall --cc $(MODULE).v --exe test.o $(MODULE).cpp $(addprefix -I$(SRC_DIR)/,$(DEPENDENCIES)) $(VERILATOR_FLAGS) -CFLAGS -I../$(LIB_DIR) -CFLAGS -std=c++11
	make -C obj_dir -j -f V$(MODULE).mk V$(MODULE)

$(addprefix $(TEST_BUILD_DIR)/,$(PY_FILES:.py=.ml)):
	mkdir -p $(TEST_BUILD_DIR)
	$(PYTHON) $(TEST_DIR)/$(subst .ml,.py,$(notdir $@))
	$(XSF_ASM) -o $@ $(subst .ml,.asm,$@)

$(addprefix $(TEST_BUILD_DIR)/,$(ASM_FILES:.asm=.ml)):
	mkdir -p $(TEST_BUILD_DIR)
	$(XSF_ASM) -o $@ $(TEST_DIR)/$(subst .ml,.asm,$(notdir $@))

.PHONY: clean
clean:	clean-test clean-verilator

.PHONY: clean-test
clean-test:
	rm -f $(TEST_BUILD_DIR)/*
	rmdir $(TEST_BUILD_DIR)

.PHONY: clean-verilator
clean-verilator:
	rm -f obj_dir/*
	rmdir obj_dir
