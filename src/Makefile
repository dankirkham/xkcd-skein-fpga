MODULES= \
	alu \
	alu/comparator \
	base64encoder/base64encoder \
	base64encoder/base64encoder_x6 \
	block_ram/block_ram \
	block_ram/block_ram_tdp \
	constants_rom \
	core \
	core_id_module \
	core_sim \
	nonce_module \
	serial_module/serial_receiver \
	serial_module/serial_transmitter \
	xkcd_skein_processor

EXECUTABLES=$(join $(MODULES),$(addprefix /obj_dir/V,$(notdir $(MODULES))))
REPORTS=$(join $(MODULES),$(addprefix /obj_dir/V,$(notdir $(addsuffix .txt,$(MODULES)))))
BUILD_DIR=build
REPORT=report.txt

test: $(EXECUTABLES)
	$(foreach f,$(subst obj_dir/,,$(dir $^)),make -C $f run;)
	mkdir -pv $(BUILD_DIR)
	cat $(REPORTS) > $(BUILD_DIR)/$(REPORT)
	./report.py $(BUILD_DIR)/$(REPORT)
	@echo -------------------- TEST RESULTS --------------------
	@cat $(BUILD_DIR)/$(REPORT)

$(EXECUTABLES):
	make -C $(subst obj_dir/,,$(dir $@)) $(addprefix obj_dir/,$(notdir $@))

.PHONY: clean
clean:
	$(foreach f,$(MODULES),make -C $f clean;)
	rm -rf $(BUILD_DIR)
