MODULES=alu base64encoder/base64encoder base64encoder/base64encoder_x6 block_ram/block_ram block_ram/block_ram_tdp constants_rom core core_id_module core_sim nonce_module serial_module/serial_receiver serial_module/serial_transmitter xkcd_skein_processor
EXECUTABLES=$(join $(MODULES),$(addprefix /obj_dir/V,$(notdir $(MODULES))))

test: $(EXECUTABLES)
	$(foreach f,$(subst obj_dir/,,$(dir $^)),make -C $f run;)

$(EXECUTABLES):
	make -C $(subst obj_dir/,,$(dir $@)) $(addprefix obj_dir/,$(notdir $@))

.PHONY: clean
clean:
	rm -rf $(addsuffix /obj_dir,$(MODULES))
