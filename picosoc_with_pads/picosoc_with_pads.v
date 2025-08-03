// picosoc_with_pads.v - Full top-level wrapper with all IO pad instantiations

`timescale 1ns / 1ps

module picosoc_with_pads (
    input clk,
    input resetn,

    output        iomem_valid,
    input         iomem_ready,
    output [3:0]  iomem_wstrb,
    output [31:0] iomem_addr,
    output [31:0] iomem_wdata,
    input  [31:0] iomem_rdata,

    input  irq_5,
    input  irq_6,
    input  irq_7,

    input  ser_rx,
    output ser_tx,

    input  flash_io0_di,
    input  flash_io1_di,
    input  flash_io2_di,
    input  flash_io3_di,
    output flash_io0_oe,
    output flash_io1_oe,
    output flash_io2_oe,
    output flash_io3_oe,
    output flash_io0_do,
    output flash_io1_do,
    output flash_io2_do,
    output flash_io3_do,
    output flash_csb,
    output flash_clk
);

  // Internal nets
  wire clk_p, resetn_p;
  wire iomem_valid_p, iomem_ready_p;
  wire [3:0]  iomem_wstrb_p;
  wire [31:0] iomem_addr_p, iomem_wdata_p, iomem_rdata_p;
  wire irq_5_p, irq_6_p, irq_7_p;
  wire ser_rx_p, ser_tx_p;
  wire flash_io0_di_p, flash_io1_di_p, flash_io2_di_p, flash_io3_di_p;
  wire flash_io0_oe_p, flash_io1_oe_p, flash_io2_oe_p, flash_io3_oe_p;
  wire flash_io0_do_p, flash_io1_do_p, flash_io2_do_p, flash_io3_do_p;
  wire flash_csb_p, flash_clk_p;

  // Pad instantiations
  sg13g2_IOPadIn clk_pad (.pad(clk), .p2c(clk_p));
  sg13g2_IOPadIn resetn_pad (.pad(resetn), .p2c(resetn_p));
  sg13g2_IOPadIn irq_5_pad (.pad(irq_5), .p2c(irq_5_p));
  sg13g2_IOPadIn irq_6_pad (.pad(irq_6), .p2c(irq_6_p));
  sg13g2_IOPadIn irq_7_pad (.pad(irq_7), .p2c(irq_7_p));

  sg13g2_IOPadIn ser_rx_pad (.pad(ser_rx), .p2c(ser_rx_p));
  sg13g2_IOPadOut16mA ser_tx_pad (.pad(ser_tx), .c2p(ser_tx_p));

  sg13g2_IOPadIn flash_io0_di_pad (.pad(flash_io0_di), .p2c(flash_io0_di_p));
  sg13g2_IOPadIn flash_io1_di_pad (.pad(flash_io1_di), .p2c(flash_io1_di_p));
  sg13g2_IOPadIn flash_io2_di_pad (.pad(flash_io2_di), .p2c(flash_io2_di_p));
  sg13g2_IOPadIn flash_io3_di_pad (.pad(flash_io3_di), .p2c(flash_io3_di_p));

  sg13g2_IOPadOut16mA flash_io0_oe_pad (.pad(flash_io0_oe), .c2p(flash_io0_oe_p));
  sg13g2_IOPadOut16mA flash_io1_oe_pad (.pad(flash_io1_oe), .c2p(flash_io1_oe_p));
  sg13g2_IOPadOut16mA flash_io2_oe_pad (.pad(flash_io2_oe), .c2p(flash_io2_oe_p));
  sg13g2_IOPadOut16mA flash_io3_oe_pad (.pad(flash_io3_oe), .c2p(flash_io3_oe_p));

  sg13g2_IOPadOut16mA flash_io0_do_pad (.pad(flash_io0_do), .c2p(flash_io0_do_p));
  sg13g2_IOPadOut16mA flash_io1_do_pad (.pad(flash_io1_do), .c2p(flash_io1_do_p));
  sg13g2_IOPadOut16mA flash_io2_do_pad (.pad(flash_io2_do), .c2p(flash_io2_do_p));
  sg13g2_IOPadOut16mA flash_io3_do_pad (.pad(flash_io3_do), .c2p(flash_io3_do_p));

  sg13g2_IOPadOut16mA flash_csb_pad (.pad(flash_csb), .c2p(flash_csb_p));
  sg13g2_IOPadOut16mA flash_clk_pad (.pad(flash_clk), .c2p(flash_clk_p));

  sg13g2_IOPadOut16mA iomem_valid_pad (.pad(iomem_valid), .c2p(iomem_valid_p));
  sg13g2_IOPadIn iomem_ready_pad (.pad(iomem_ready), .p2c(iomem_ready_p));

  genvar i;
  generate
    for (i = 0; i < 4; i = i + 1) begin
      sg13g2_IOPadOut16mA iomem_wstrb_pad (.pad(iomem_wstrb[i]), .c2p(iomem_wstrb_p[i]));
    end
    for (i = 0; i < 32; i = i + 1) begin
      sg13g2_IOPadOut16mA iomem_addr_pad (.pad(iomem_addr[i]), .c2p(iomem_addr_p[i]));
      sg13g2_IOPadOut16mA iomem_wdata_pad (.pad(iomem_wdata[i]), .c2p(iomem_wdata_p[i]));
      sg13g2_IOPadIn      iomem_rdata_pad (.pad(iomem_rdata[i]), .p2c(iomem_rdata_p[i]));
    end
  endgenerate

  // Core instantiation
  picosoc uut (
    .clk(clk_p),
    .resetn(resetn_p),
    .iomem_valid(iomem_valid_p),
    .iomem_ready(iomem_ready_p),
    .iomem_wstrb(iomem_wstrb_p),
    .iomem_addr(iomem_addr_p),
    .iomem_wdata(iomem_wdata_p),
    .iomem_rdata(iomem_rdata_p),
    .irq_5(irq_5_p),
    .irq_6(irq_6_p),
    .irq_7(irq_7_p),
    .ser_rx(ser_rx_p),
    .ser_tx(ser_tx_p),
    .flash_io0_di(flash_io0_di_p),
    .flash_io1_di(flash_io1_di_p),
    .flash_io2_di(flash_io2_di_p),
    .flash_io3_di(flash_io3_di_p),
    .flash_io0_oe(flash_io0_oe_p),
    .flash_io1_oe(flash_io1_oe_p),
    .flash_io2_oe(flash_io2_oe_p),
    .flash_io3_oe(flash_io3_oe_p),
    .flash_io0_do(flash_io0_do_p),
    .flash_io1_do(flash_io1_do_p),
    .flash_io2_do(flash_io2_do_p),
    .flash_io3_do(flash_io3_do_p),
    .flash_csb(flash_csb_p),
    .flash_clk(flash_clk_p)
  );

endmodule

