#VHDL = lns_addsub_hybrid_clk.vhd
#VHDL = lns_add_hybrid_clk.vhd
VHDL = hybrid_bench.vhd

#ENTITY = lns_addsub_hybrid_clk
#ENTITY = lns_add_hybrid_clk
ENTITY = hybrid_bench

#FPGA   = xcv2000e-6-bg560
#FPGA	= xc3s500e-4-fg320
FPGA = xc4vlx25-10-ff668

FPLIB_PATH = "../../.."

#VHDL_FPLIB = $(shell find $(FPLIB_PATH)/vhdl/lns/pkg_lnsadd -name "*.vhd")
VHDL_FPLIB = $(shell find $(FPLIB_PATH) -name "*.vhd")

#VHDL_FPLIB  += ../cotran/compressor_a.vhd \
			../cotran/pkg_cotran.vhd \
			../cotran/my_delay.vhd \
			../cotran/pkg_lnsadd_table.vhd \
			../cotran/f1_tbl.vhd \
			../cotran/f2_tbl.vhd \
			pkg_hybrid.vhd \
			lnsadd_hybrid_swap.vhd \
			lnssub_hybrid_6.vhd \
			lnssub_hybrid_7.vhd \
			lnssub_hybrid_8.vhd \
			lnssub_hybrid_9.vhd \
			lnssub_hybrid_10.vhd \
			lnssub_hybrid_mnmx_10.vhd \
			lnssub_hybrid_11.vhd \
			lnssub_hybrid_mnmx_11.vhd \
			lnssub_hybrid_12.vhd \
			lnssub_hybrid_13.vhd \
			lnssub_hybrid_mnmx_13.vhd \
			../cotran/lnsadd_add.vhd \
			../cotran/lnsadd_add_clk.vhd \
			../cotran/lnssub_ctf_6_3.vhd \
			../cotran/lnssub_ctf_6_4.vhd \
			../cotran/lnssub_ctf_7_4.vhd \
			../cotran/lnssub_ctf_7_5.vhd \
			../cotran/lnssub_ctf_8_3.vhd \
			../cotran/lnssub_ctf_8_4.vhd \
			../cotran/lnssub_ctf_8_5.vhd \
			../cotran/lnssub_ctf_8_6.vhd \
			../cotran/lnssub_ctf_9_5.vhd \
			../cotran/lnssub_ctf_9_6.vhd \
			../cotran/lnssub_ctf_10_5.vhd \
			../cotran/lnssub_ctf_10_6.vhd \
			../cotran/lnssub_ctf_11_6.vhd \
			../cotran/lnssub_ctf_11_7.vhd \
			../cotran/lnssub_ctf_12_6.vhd \
			../cotran/lnssub_ctf_12_7.vhd \
			../cotran/lnssub_ctf_13_7.vhd \
			pkg_hybrid_table.vhd \
			lnssub_hybrid.vhd \
			lnsadd_ctf_clk.vhd \
			lns_add_hybrid_clk.vhd
			
			
BIT  = $(VHDL:%.vhd=%.bit)
TWR = $(VHDL:%.vhd=build/%.twr)


.PHONY = all clean

#all: $(BIT)
#all: build/$(ENTITY)_map.ncd
all: $(TWR)

$(VHDL:%.vhd=build/%.prj): build/%.prj: Makefile
	@if [ ! -d build ]; then mkdir build; fi
	@for f in $(VHDL_FPLIB); do echo "fplib ../$$f"; done > $@
#	@for f in $(VHDL_FPLIB); do echo "fplib $$f"; done > $@
	@for f in $(VHDL_WORK); do echo "work ../$$f"; done >> $@
	@echo "work ../$*.vhd" >> $@

$(VHDL:%.vhd=build/%.xst): build/%.xst: Makefile
	@if [ ! -d build ]; then mkdir build; fi
	@echo -e "$(XST_CONFIG)" > $@

$(VHDL:%.vhd=build/%.ngc): build/%.ngc: build/%.xst build/%.prj %.vhd $(VHDL_WORK) $(VHDL_FPLIB)
	@if [ ! -d build/.tmp ]; then mkdir build/.tmp; fi
	xst -intstyle ise -ifn $< -ofn build/$*.syr

#$(VHDL:%.vhd=build/%.ngd): build/%.ngd: build/%.ngc $(ENTITY).ucf
#	ngdbuild -intstyle ise -p $(FPGA) -dd build/.tmp -aul -uc vhdl/$(ENTITY).ucf $< $@
$(VHDL:%.vhd=build/%.ngd): build/%.ngd: build/%.ngc
	ngdbuild -intstyle ise -p $(FPGA) -dd build/.tmp -aul $< $@

$(VHDL:%.vhd=build/%_map.ncd): build/%_map.ncd: build/%.ngd
	map -intstyle ise -p $(FPGA) -cm area -pr b -k 4 -c 100 -tx off $< -o $@ build/$*.pcf

$(VHDL:%.vhd=build/%.pcf): build/%.pcf: build/%_map.ncd

$(VHDL:%.vhd=build/%.ncd): build/%.ncd: build/%_map.ncd build/%.pcf
	par -intstyle ise -w -ol high -t 1 $< $@ build/$*.pcf

$(VHDL:%.vhd=build/%.twr): build/%.twr: build/%.ncd
	trce -intstyle ise -e 3 -l 3 $< -o $@ build/$*.pcf

#$(BIT): %.bit: build/%.ncd build/%.twr
#	bitgen -intstyle ise -w $< build/$*.bit build/$*.pcf
#	mv build/$*.bit $@



clean:
	rm -rf *~ \#*\# $(BIT) build



# Eeek!
XST_CONFIG  = 
XST_CONFIG += set -tmpdir build/.tmp\n
XST_CONFIG += set -xsthdpdir build/.xst\n
XST_CONFIG += run					\
		-ifn build/$*.prj			\
		-ifmt VHDL				\
		-ofn build/$*				\
		-ofmt NGC				\
		-p $(FPGA)				\
		-top $(ENTITY)				\
		-opt_mode area				\
		-opt_level 1				\
		-iuc NO					\
		-keep_hierarchy NO			\
		-glob_opt AllClockNets			\
		-rtlview Yes				\
		-read_cores YES				\
		-write_timing_constraints NO		\
		-cross_clock_analysis NO		\
		-hierarchy_separator _			\
		-bus_delimiter <>			\
		-case maintain				\
		-slice_utilization_ratio 100		\
		-fsm_extract YES			\
		-fsm_encoding Auto			\
		-fsm_style lut				\
		-ram_extract Yes			\
		-ram_style Auto				\
		-rom_extract Yes			\
		-rom_style Auto				\
		-mux_extract YES			\
		-mux_style Auto				\
		-decoder_extract YES			\
		-priority_extract YES			\
		-shreg_extract YES			\
		-shift_extract YES			\
		-xor_collapse YES			\
		-resource_sharing YES			\
		-mult_style lut				\
		-iobuf YES				\
		-max_fanout 100				\
		-bufg 4					\
		-register_duplication YES		\
		-equivalent_register_removal YES		\
		-register_balancing Yes			\
		-slice_packing YES			\
		-iob TRUE				\
		-slice_utilization_ratio_maxmargin 5 \
		-move_first_stage NO -move_last_stage NO
