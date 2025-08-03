export DESIGN_NICKNAME = picosoc
export DESIGN_NAME = picosoc
export PLATFORM    = ihp-sg13g2

export SRAM_DIRECTORY = /mnt/d/IHP-Open-PDK/ihp-sg13g2/libs.ref/sg13g2_sram
#export IO_PAD_DIRECTORY = /home/khalid/IHP-Open-PDK/ihp-sg13g2/libs.ref/sg13g2_io

# ---- RTL source list (explicit order) -------------------------------
export VERILOG_FILES = \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/picosoc.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/picorv32.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/simpleuart.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/spimemio.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/sp_ram.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/RM_IHPSG13_1P_256x64_c2_bm_bist.v
    
export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

# SRAM

export ADDITIONAL_LEFS += $(SRAM_DIRECTORY)/lef/RM_IHPSG13_1P_256x64_c2_bm_bist.lef
export GDS_FILES       += $(SRAM_DIRECTORY)/gds/RM_IHPSG13_1P_256x64_c2_bm_bist.gds

# IO Pad
#export FOOTPRINT_TCL = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/pad.tcl

export USE_FILL 1

#export DIE_AREA = 0.0 0.0 2000.0 2000.0
#export CORE_AREA = 425.28 427.16 1631.2 1630.24

export CORE_UTILIZATION = 20
export CORNERS = slow fast
export PLACE_DENSITY_LB_ADDON = 0.2
export TNS_END_PERCENT = 100
export CTS_BUF_DISTANCE = 60
export SYNTH_MEMORY_MAX_BITS = 16384


# Standard Cell GDS and LEF
export GDS_FILES += $(PLATFORM_DIR)/lib/gds/sg13g2_stdcell.gds
export ADDITIONAL_LEFS += $(PLATFORM_DIR)/lib/lef/sg13g2_stdcell.lef

# IO Pad GDS and LEF
export GDS_FILES += $(PLATFORM_DIR)/lib/gds/sg13g2_io.gds
export ADDITIONAL_LEFS += $(PLATFORM_DIR)/lib/lef/sg13g2_io.lef
