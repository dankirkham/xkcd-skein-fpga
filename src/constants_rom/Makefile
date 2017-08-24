run: obj_dir/Vconstants_rom
	obj_dir/Vconstants_rom

obj_dir/Vconstants_rom: constants_rom.v constants_rom_test.cpp
	verilator -Wall --cc constants_rom.v --exe constants_rom_test.cpp
	make -C obj_dir -j -f Vconstants_rom.mk Vconstants_rom
