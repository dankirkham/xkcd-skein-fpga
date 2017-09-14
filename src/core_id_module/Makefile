run: obj_dir/Vcore_id_module
	obj_dir/Vcore_id_module

obj_dir/Vcore_id_module: core_id_module.v core_id_module_test.cpp
	verilator -Wall --cc core_id_module.v --exe core_id_module_test.cpp -GCORE_ID=42
	make -C obj_dir -j -f Vcore_id_module.mk Vcore_id_module

.PHONY: clean
clean:
	rm -rf obj_dir
