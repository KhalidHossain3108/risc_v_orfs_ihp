export DESIGN_NICKNAME = picorv32
export DESIGN_NAME = picorv32
export PLATFORM    = ihp-sg13g2

export VERILOG_FILES = $(sort $(wildcard $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/*.v))
export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export USE_FILL 1

export CORE_UTILIZATION = 40
export PLACE_DENSITY_LB_ADDON = 0.2
export TNS_END_PERCENT = 100
export CTS_BUF_DISTANCE = 60
#export KLAYOUT_LVS_FILE = $(PLATFORM_DIR)/lvs/$(PLATFORM).lylvs
export KLAYOUT_LVS_FILE = $(PLATFORM_DIR)/lvs/sg13g2_full.lylvs
