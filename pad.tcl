# Constants for I/O placement
set IO_LENGTH 180
set IO_WIDTH 80
set BONDPAD_SIZE 70
set SEALRING_OFFSET 70
set IO_OFFSET [expr {$BONDPAD_SIZE + $SEALRING_OFFSET}]



if {![info exists ::env(DIE_AREA)]} {
  puts "ERROR: DIE_AREA is not defined!"
  exit 1
}

set die_area [split $::env(DIE_AREA)]
if {[llength $die_area] != 4} {
  puts "ERROR: DIE_AREA must contain 4 space-separated values"
  exit 1
}

set die_llx [expr {double([lindex $die_area 0])}]
set die_lly [expr {double([lindex $die_area 1])}]
set die_urx [expr {double([lindex $die_area 2])}]
set die_ury [expr {double([lindex $die_area 3])}]

set spacing [expr {($die_urx - 2*$IO_OFFSET) / 33.0}]
if {$spacing <= 0} {
  puts "ERROR: spacing computed as $spacing — check DIE_AREA or IO_OFFSET"
  exit 1
}




# ... rest of the script remains unchanged ...

# Define fake IO sites
make_fake_io_site -name IOLibSite -width 1 -height $IO_LENGTH
make_fake_io_site -name IOLibCSite -width $IO_LENGTH -height $IO_LENGTH

# Create IO site rows
make_io_sites \
  -horizontal_site IOLibSite \
  -vertical_site IOLibSite \
  -corner_site IOLibCSite \
  -offset $IO_OFFSET

# Calculate spacing between pads (32 pads per side)
set spacing [expr {($die_urx - 2*$IO_OFFSET) / 33.0}]

# =============================================
# PAD PLACEMENT
# =============================================

# === SOUTH SIDE (32 pads) ===
set south_x $IO_OFFSET

# Input pads (11)
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_clk} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_resetn} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_irq_5} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_irq_6} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_irq_7} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_ser_rx} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_flash_io0_di} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_flash_io1_di} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_flash_io2_di} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_flash_io3_di} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_ready} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]

# iomem_rdata pads (21)
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_0} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_1} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_2} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_3} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_4} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_5} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_6} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_7} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_8} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_9} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_10} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_11} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_12} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_13} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_14} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_15} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_16} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_17} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_18} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_19} -master sg13g2_IOPadIn
set south_x [expr {$south_x + $spacing}]
place_pad -row IO_SOUTH -location [list $south_x $IO_OFFSET] {sg13g2_IOPadIn_iomem_rdata_20} -master sg13g2_IOPadIn

# === WEST SIDE (32 pads) ===
set west_y [expr {$die_ury - $IO_OFFSET}]

# iomem_rdata pads (11)
place_pad -row IO_WEST -location [list $IO_OFFSET $west_y] {sg13g2_IOPadIn_iomem_rdata_21} -master sg13g2_IOPadIn
set west_y [expr {$west_y - $spacing}]
place_pad -row IO_WEST -location [list $IO_OFFSET $west_y] {sg13g2_IOPadIn_iomem_rdata_22} -master sg13g2_IOPadIn
set west_y [expr {$west_y - $spacing}]
place_pad -row IO_WEST -location [list $IO_OFFSET $west_y] {sg13g2_IOPadIn_iomem_rdata_23} -master sg13g2_IOPadIn
set west_y [expr {$west_y - $spacing}]
place_pad -row IO_WEST -location [list $IO_OFFSET $west_y] {sg13g2_IOPadIn_iomem_rdata_24} -master sg13g2_IOPadIn
set west_y [expr {$west_y - $spacing}]
place_pad -row IO_WEST -location [list $IO_OFFSET $west_y] {sg13g2_IOPadIn_iomem_rdata_25} -master sg13g2_IOPadIn
set west_y [expr {$west_y - $spacing}]
place_pad -row IO_WEST -location [list $IO_OFFSET $west_y] {sg13g2_IOPadIn_iomem_rdata_26} -master sg13g2_IOPadIn
set west_y [expr {$west_y - $spacing}]
place_pad -row IO_WEST -location [list $IO_OFFSET $west_y] {sg13g2_IOPadIn_iomem_rdata_27} -master sg13g2_IOPadIn
set west_y [expr {$west_y - $spacing}]
place_pad -row IO_WEST -location [list $IO_OFFSET $west_y] {sg13g2_IOPadIn_iomem_rdata_28} -master sg13g2_IOPadIn
set west_y [expr {$west_y - $spacing}]
place_pad -row IO_WEST -location [list $IO_OFFSET $west_y] {sg13g2_IOPadIn_iomem_rdata_29} -master sg13g2_IOPadIn
set west_y [expr {$west_y - $spacing}]
place_pad -row IO_WEST -location [list $IO_OFFSET $west_y] {sg13g2_IOPadIn_iomem_rdata_30} -master sg13g2_IOPadIn
set west_y [expr {$west_y - $spacing}]
place_pad -row IO_WEST -location [list $IO_OFFSET $west_y] {sg13g2_IOPadIn_iomem_rdata_31} -master sg13g2_IOPadIn
set west_y [expr {$west_y - $spacing}]

# === NORTH SIDE (32 pads) ===
set north_x $IO_OFFSET

# Output pads (10)
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_ser_tx} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_flash_io0_oe} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_flash_io1_oe} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_flash_io2_oe} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_flash_io3_oe} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_flash_io0_do} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_flash_io1_do} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_flash_io2_do} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_flash_io3_do} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_flash_csb} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_flash_clk} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]

# iomem_wdata pads (21)
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_0} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_1} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_2} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_3} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_4} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_5} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_6} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_7} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_8} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_9} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_10} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_11} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_12} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_13} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_14} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_15} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_16} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_17} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_18} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_19} -master sg13g2_IOPadOut16mA
set north_x [expr {$north_x + $spacing}]
place_pad -row IO_NORTH -location [list $north_x [expr {$die_ury - $IO_OFFSET}]] {sg13g2_IOPadOut16mA_iomem_wdata_20} -master sg13g2_IOPadOut16mA

# === EAST SIDE (32 pads) ===
set east_y [expr {$die_ury - $IO_OFFSET}]

# Memory interface control (5)
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_valid} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_wstrb_0} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_wstrb_1} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_wstrb_2} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_wstrb_3} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]

# iomem_addr pads (27)
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_0} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_1} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_2} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_3} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_4} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_5} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_6} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_7} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_8} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_9} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_10} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_11} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_12} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_13} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_14} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_15} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_16} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_17} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_18} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_19} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_20} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_21} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_22} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_23} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_24} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_25} -master sg13g2_IOPadOut16mA
set east_y [expr {$east_y - $spacing}]
place_pad -row IO_EAST -location [list [expr {$die_urx - $IO_OFFSET}] $east_y] {sg13g2_IOPadOut16mA_iomem_addr_26} -master sg13g2_IOPadOut16mA

# =============================================
# BONDPAD PLACEMENT
# =============================================

# === SOUTH SIDE BONDPADS ===
set south_x $IO_OFFSET

# Input bondpads (11)
place_bondpad -bond bondpad_70x70 {clk_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {resetn_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {irq_5_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {irq_6_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {irq_7_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {ser_rx_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {flash_io0_di_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {flash_io1_di_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {flash_io2_di_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {flash_io3_di_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_ready_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]

# iomem_rdata bondpads (21)
place_bondpad -bond bondpad_70x70 {iomem_rdata_0_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_1_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_2_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_3_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_4_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_5_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_6_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_7_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_8_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_9_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_10_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_11_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_12_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_13_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_14_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_15_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_16_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_17_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_18_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_19_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]
set south_x [expr {$south_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_20_pad_inst} -offset [list [expr {$south_x - $BONDPAD_SIZE/2}] [expr {-$BONDPAD_SIZE}]]

# === WEST SIDE BONDPADS ===
set west_y [expr {$die_ury - $IO_OFFSET}]

# iomem_rdata bondpads (11)
place_bondpad -bond bondpad_70x70 {iomem_rdata_21_pad_inst} -offset [list [expr {-$BONDPAD_SIZE}] [expr {$west_y - $BONDPAD_SIZE/2}]]
set west_y [expr {$west_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_22_pad_inst} -offset [list [expr {-$BONDPAD_SIZE}] [expr {$west_y - $BONDPAD_SIZE/2}]]
set west_y [expr {$west_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_23_pad_inst} -offset [list [expr {-$BONDPAD_SIZE}] [expr {$west_y - $BONDPAD_SIZE/2}]]
set west_y [expr {$west_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_24_pad_inst} -offset [list [expr {-$BONDPAD_SIZE}] [expr {$west_y - $BONDPAD_SIZE/2}]]
set west_y [expr {$west_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_25_pad_inst} -offset [list [expr {-$BONDPAD_SIZE}] [expr {$west_y - $BONDPAD_SIZE/2}]]
set west_y [expr {$west_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_26_pad_inst} -offset [list [expr {-$BONDPAD_SIZE}] [expr {$west_y - $BONDPAD_SIZE/2}]]
set west_y [expr {$west_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_27_pad_inst} -offset [list [expr {-$BONDPAD_SIZE}] [expr {$west_y - $BONDPAD_SIZE/2}]]
set west_y [expr {$west_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_28_pad_inst} -offset [list [expr {-$BONDPAD_SIZE}] [expr {$west_y - $BONDPAD_SIZE/2}]]
set west_y [expr {$west_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_29_pad_inst} -offset [list [expr {-$BONDPAD_SIZE}] [expr {$west_y - $BONDPAD_SIZE/2}]]
set west_y [expr {$west_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_30_pad_inst} -offset [list [expr {-$BONDPAD_SIZE}] [expr {$west_y - $BONDPAD_SIZE/2}]]
set west_y [expr {$west_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_rdata_31_pad_inst} -offset [list [expr {-$BONDPAD_SIZE}] [expr {$west_y - $BONDPAD_SIZE/2}]]

# === NORTH SIDE BONDPADS ===
set north_x $IO_OFFSET

# Output bondpads (10)
place_bondpad -bond bondpad_70x70 {ser_tx_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {flash_io0_oe_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {flash_io1_oe_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {flash_io2_oe_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {flash_io3_oe_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {flash_io0_do_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {flash_io1_do_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {flash_io2_do_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {flash_io3_do_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {flash_csb_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {flash_clk_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]

# iomem_wdata bondpads (21)
place_bondpad -bond bondpad_70x70 {iomem_wdata_0_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_1_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_2_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_3_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_4_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_5_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_6_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_7_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_8_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_9_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_10_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_11_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_12_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_13_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_14_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_15_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_16_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_17_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_18_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_19_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]
set north_x [expr {$north_x + $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wdata_20_pad_inst} -offset [list [expr {$north_x - $BONDPAD_SIZE/2}] [expr {$die_ury + $BONDPAD_SIZE}]]

# === EAST SIDE BONDPADS ===
set east_y [expr {$die_ury - $IO_OFFSET}]

# Memory interface control bondpads (5)
place_bondpad -bond bondpad_70x70 {iomem_valid_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wstrb_0_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wstrb_1_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wstrb_2_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_wstrb_3_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]

# iomem_addr bondpads (27)
place_bondpad -bond bondpad_70x70 {iomem_addr_0_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_1_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_2_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_3_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_4_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_5_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_6_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_7_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_8_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_9_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_10_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_11_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_12_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_13_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_14_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_15_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_16_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_17_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_18_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_19_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_20_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_21_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_22_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_23_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_24_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_25_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]
set east_y [expr {$east_y - $spacing}]
place_bondpad -bond bondpad_70x70 {iomem_addr_26_pad_inst} -offset [list [expr {$die_urx + $BONDPAD_SIZE}] [expr {$east_y - $BONDPAD_SIZE/2}]]

# === Cleanup ===
remove_io_rows
