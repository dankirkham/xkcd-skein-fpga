MODULES= \
	alu \
	alu/comparator \
	base64encoder/base64encoder \
	base64encoder/base64encoder_x6 \
	block_ram/block_ram \
	block_ram/block_ram_tdp \
	block_ram/block_ram_test \
	constants_rom \
	core \
	core_id_module \
	core_sim \
	nonce_module \
	serial_module/serial_receiver \
	serial_module/serial_transmitter \
	state_machine/instruction_state_machine/add_state_machine \
	state_machine/instruction_state_machine/constant_state_machine \
	state_machine/instruction_state_machine/core_id_state_machine \
	state_machine/instruction_state_machine/count_state_machine \
	state_machine/instruction_state_machine/increment_nonce_state_machine \
	state_machine/instruction_state_machine/load_state_machine \
	state_machine/instruction_state_machine/nonce_state_machine \
	state_machine/instruction_state_machine/read_state_machine \
	state_machine/instruction_state_machine/rotate_left_state_machine \
	# xkcd_skein_processor

EXECUTABLES=$(join $(MODULES),$(addprefix /obj_dir/V,$(notdir $(MODULES))))
REPORTS=$(join $(MODULES),$(addprefix /obj_dir/V,$(notdir $(addsuffix .txt,$(MODULES)))))
BUILD_DIR=build
REPORT=report.txt

test: $(EXECUTABLES)
	$(foreach f,$(subst obj_dir/,,$(dir $^)),make -C $f run;)
	mkdir -pv $(BUILD_DIR)
	cat $(REPORTS) > $(BUILD_DIR)/$(REPORT)
	./report.py $(BUILD_DIR)/$(REPORT)

$(EXECUTABLES):
	make -C $(subst obj_dir/,,$(dir $@)) $(addprefix obj_dir/,$(notdir $@))

.PHONY: clean
clean:
	$(foreach f,$(MODULES),make -C $f clean;)
	rm -rf $(BUILD_DIR)
