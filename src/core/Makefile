run: obj_dir/Vcore
	obj_dir/Vcore

obj_dir/Vcore: core.v core_test.cpp
	verilator -Wall --cc core.v --exe core_test.cpp -GCORE_ID=42 -I../alu  -I../alu/comparator -I../core_id_module
	make -C obj_dir -j -f Vcore.mk Vcore
