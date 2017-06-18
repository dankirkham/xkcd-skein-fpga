run: obj_dir/Vcomparator
	obj_dir/Vcomparator

obj_dir/Vcomparator: comparator.v comparator_test.cpp
	verilator -Wall --cc comparator.v --exe comparator_test.cpp
	make -C obj_dir -j -f Vcomparator.mk Vcomparator
