LIB_DIR=$(SRC_DIR)/test

run: obj_dir/V$(MODULE)
	obj_dir/V$(MODULE)

obj_dir/V$(MODULE): $(MODULE).v $(MODULE)_test.cpp $(LIB_DIR)/test.cpp
	mkdir -p obj_dir
	g++ -c $(LIB_DIR)/test.cpp -I$(LIB_DIR) -o obj_dir/test.o
	verilator -Wall --cc $(MODULE).v --exe test.o $(MODULE)_test.cpp $(addprefix -I$(SRC_DIR)/,$(DEPENDENCIES)) $(VERILATOR_FLAGS) -CFLAGS -I../$(LIB_DIR)
	make -C obj_dir -j -f V$(MODULE).mk V$(MODULE)

.PHONY: clean
clean:
	rm -rf obj_dir
