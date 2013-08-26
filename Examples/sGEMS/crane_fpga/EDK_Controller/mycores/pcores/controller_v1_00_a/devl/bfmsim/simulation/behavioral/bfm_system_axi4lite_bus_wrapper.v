//-----------------------------------------------------------------------------
// bfm_system_axi4lite_bus_wrapper.v
//-----------------------------------------------------------------------------

`timescale 1 ps / 100 fs

`uselib lib=unisims_ver lib=axi_interconnect_v1_06_a

module bfm_system_axi4lite_bus_wrapper
  (
    INTERCONNECT_ACLK,
    INTERCONNECT_ARESETN,
    S_AXI_ARESET_OUT_N,
    M_AXI_ARESET_OUT_N,
    IRQ,
    S_AXI_ACLK,
    S_AXI_AWID,
    S_AXI_AWADDR,
    S_AXI_AWLEN,
    S_AXI_AWSIZE,
    S_AXI_AWBURST,
    S_AXI_AWLOCK,
    S_AXI_AWCACHE,
    S_AXI_AWPROT,
    S_AXI_AWQOS,
    S_AXI_AWUSER,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WID,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WLAST,
    S_AXI_WUSER,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BID,
    S_AXI_BRESP,
    S_AXI_BUSER,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARID,
    S_AXI_ARADDR,
    S_AXI_ARLEN,
    S_AXI_ARSIZE,
    S_AXI_ARBURST,
    S_AXI_ARLOCK,
    S_AXI_ARCACHE,
    S_AXI_ARPROT,
    S_AXI_ARQOS,
    S_AXI_ARUSER,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RID,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RLAST,
    S_AXI_RUSER,
    S_AXI_RVALID,
    S_AXI_RREADY,
    M_AXI_ACLK,
    M_AXI_AWID,
    M_AXI_AWADDR,
    M_AXI_AWLEN,
    M_AXI_AWSIZE,
    M_AXI_AWBURST,
    M_AXI_AWLOCK,
    M_AXI_AWCACHE,
    M_AXI_AWPROT,
    M_AXI_AWREGION,
    M_AXI_AWQOS,
    M_AXI_AWUSER,
    M_AXI_AWVALID,
    M_AXI_AWREADY,
    M_AXI_WID,
    M_AXI_WDATA,
    M_AXI_WSTRB,
    M_AXI_WLAST,
    M_AXI_WUSER,
    M_AXI_WVALID,
    M_AXI_WREADY,
    M_AXI_BID,
    M_AXI_BRESP,
    M_AXI_BUSER,
    M_AXI_BVALID,
    M_AXI_BREADY,
    M_AXI_ARID,
    M_AXI_ARADDR,
    M_AXI_ARLEN,
    M_AXI_ARSIZE,
    M_AXI_ARBURST,
    M_AXI_ARLOCK,
    M_AXI_ARCACHE,
    M_AXI_ARPROT,
    M_AXI_ARREGION,
    M_AXI_ARQOS,
    M_AXI_ARUSER,
    M_AXI_ARVALID,
    M_AXI_ARREADY,
    M_AXI_RID,
    M_AXI_RDATA,
    M_AXI_RRESP,
    M_AXI_RLAST,
    M_AXI_RUSER,
    M_AXI_RVALID,
    M_AXI_RREADY,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY,
    INTERCONNECT_ARESET_OUT_N,
    DEBUG_AW_TRANS_SEQ,
    DEBUG_AW_ARB_GRANT,
    DEBUG_AR_TRANS_SEQ,
    DEBUG_AR_ARB_GRANT,
    DEBUG_AW_TRANS_QUAL,
    DEBUG_AW_ACCEPT_CNT,
    DEBUG_AW_ACTIVE_THREAD,
    DEBUG_AW_ACTIVE_TARGET,
    DEBUG_AW_ACTIVE_REGION,
    DEBUG_AW_ERROR,
    DEBUG_AW_TARGET,
    DEBUG_AR_TRANS_QUAL,
    DEBUG_AR_ACCEPT_CNT,
    DEBUG_AR_ACTIVE_THREAD,
    DEBUG_AR_ACTIVE_TARGET,
    DEBUG_AR_ACTIVE_REGION,
    DEBUG_AR_ERROR,
    DEBUG_AR_TARGET,
    DEBUG_B_TRANS_SEQ,
    DEBUG_R_BEAT_CNT,
    DEBUG_R_TRANS_SEQ,
    DEBUG_AW_ISSUING_CNT,
    DEBUG_AR_ISSUING_CNT,
    DEBUG_W_BEAT_CNT,
    DEBUG_W_TRANS_SEQ,
    DEBUG_BID_TARGET,
    DEBUG_BID_ERROR,
    DEBUG_RID_TARGET,
    DEBUG_RID_ERROR,
    DEBUG_SR_SC_ARADDR,
    DEBUG_SR_SC_ARADDRCONTROL,
    DEBUG_SR_SC_AWADDR,
    DEBUG_SR_SC_AWADDRCONTROL,
    DEBUG_SR_SC_BRESP,
    DEBUG_SR_SC_RDATA,
    DEBUG_SR_SC_RDATACONTROL,
    DEBUG_SR_SC_WDATA,
    DEBUG_SR_SC_WDATACONTROL,
    DEBUG_SC_SF_ARADDR,
    DEBUG_SC_SF_ARADDRCONTROL,
    DEBUG_SC_SF_AWADDR,
    DEBUG_SC_SF_AWADDRCONTROL,
    DEBUG_SC_SF_BRESP,
    DEBUG_SC_SF_RDATA,
    DEBUG_SC_SF_RDATACONTROL,
    DEBUG_SC_SF_WDATA,
    DEBUG_SC_SF_WDATACONTROL,
    DEBUG_SF_CB_ARADDR,
    DEBUG_SF_CB_ARADDRCONTROL,
    DEBUG_SF_CB_AWADDR,
    DEBUG_SF_CB_AWADDRCONTROL,
    DEBUG_SF_CB_BRESP,
    DEBUG_SF_CB_RDATA,
    DEBUG_SF_CB_RDATACONTROL,
    DEBUG_SF_CB_WDATA,
    DEBUG_SF_CB_WDATACONTROL,
    DEBUG_CB_MF_ARADDR,
    DEBUG_CB_MF_ARADDRCONTROL,
    DEBUG_CB_MF_AWADDR,
    DEBUG_CB_MF_AWADDRCONTROL,
    DEBUG_CB_MF_BRESP,
    DEBUG_CB_MF_RDATA,
    DEBUG_CB_MF_RDATACONTROL,
    DEBUG_CB_MF_WDATA,
    DEBUG_CB_MF_WDATACONTROL,
    DEBUG_MF_MC_ARADDR,
    DEBUG_MF_MC_ARADDRCONTROL,
    DEBUG_MF_MC_AWADDR,
    DEBUG_MF_MC_AWADDRCONTROL,
    DEBUG_MF_MC_BRESP,
    DEBUG_MF_MC_RDATA,
    DEBUG_MF_MC_RDATACONTROL,
    DEBUG_MF_MC_WDATA,
    DEBUG_MF_MC_WDATACONTROL,
    DEBUG_MC_MP_ARADDR,
    DEBUG_MC_MP_ARADDRCONTROL,
    DEBUG_MC_MP_AWADDR,
    DEBUG_MC_MP_AWADDRCONTROL,
    DEBUG_MC_MP_BRESP,
    DEBUG_MC_MP_RDATA,
    DEBUG_MC_MP_RDATACONTROL,
    DEBUG_MC_MP_WDATA,
    DEBUG_MC_MP_WDATACONTROL,
    DEBUG_MP_MR_ARADDR,
    DEBUG_MP_MR_ARADDRCONTROL,
    DEBUG_MP_MR_AWADDR,
    DEBUG_MP_MR_AWADDRCONTROL,
    DEBUG_MP_MR_BRESP,
    DEBUG_MP_MR_RDATA,
    DEBUG_MP_MR_RDATACONTROL,
    DEBUG_MP_MR_WDATA,
    DEBUG_MP_MR_WDATACONTROL
  );
  input INTERCONNECT_ACLK;
  input INTERCONNECT_ARESETN;
  output [0:0] S_AXI_ARESET_OUT_N;
  output [0:0] M_AXI_ARESET_OUT_N;
  output IRQ;
  input [0:0] S_AXI_ACLK;
  input [0:0] S_AXI_AWID;
  input [31:0] S_AXI_AWADDR;
  input [7:0] S_AXI_AWLEN;
  input [2:0] S_AXI_AWSIZE;
  input [1:0] S_AXI_AWBURST;
  input [1:0] S_AXI_AWLOCK;
  input [3:0] S_AXI_AWCACHE;
  input [2:0] S_AXI_AWPROT;
  input [3:0] S_AXI_AWQOS;
  input [0:0] S_AXI_AWUSER;
  input [0:0] S_AXI_AWVALID;
  output [0:0] S_AXI_AWREADY;
  input [0:0] S_AXI_WID;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input [0:0] S_AXI_WLAST;
  input [0:0] S_AXI_WUSER;
  input [0:0] S_AXI_WVALID;
  output [0:0] S_AXI_WREADY;
  output [0:0] S_AXI_BID;
  output [1:0] S_AXI_BRESP;
  output [0:0] S_AXI_BUSER;
  output [0:0] S_AXI_BVALID;
  input [0:0] S_AXI_BREADY;
  input [0:0] S_AXI_ARID;
  input [31:0] S_AXI_ARADDR;
  input [7:0] S_AXI_ARLEN;
  input [2:0] S_AXI_ARSIZE;
  input [1:0] S_AXI_ARBURST;
  input [1:0] S_AXI_ARLOCK;
  input [3:0] S_AXI_ARCACHE;
  input [2:0] S_AXI_ARPROT;
  input [3:0] S_AXI_ARQOS;
  input [0:0] S_AXI_ARUSER;
  input [0:0] S_AXI_ARVALID;
  output [0:0] S_AXI_ARREADY;
  output [0:0] S_AXI_RID;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output [0:0] S_AXI_RLAST;
  output [0:0] S_AXI_RUSER;
  output [0:0] S_AXI_RVALID;
  input [0:0] S_AXI_RREADY;
  input [0:0] M_AXI_ACLK;
  output [0:0] M_AXI_AWID;
  output [31:0] M_AXI_AWADDR;
  output [7:0] M_AXI_AWLEN;
  output [2:0] M_AXI_AWSIZE;
  output [1:0] M_AXI_AWBURST;
  output [1:0] M_AXI_AWLOCK;
  output [3:0] M_AXI_AWCACHE;
  output [2:0] M_AXI_AWPROT;
  output [3:0] M_AXI_AWREGION;
  output [3:0] M_AXI_AWQOS;
  output [0:0] M_AXI_AWUSER;
  output [0:0] M_AXI_AWVALID;
  input [0:0] M_AXI_AWREADY;
  output [0:0] M_AXI_WID;
  output [31:0] M_AXI_WDATA;
  output [3:0] M_AXI_WSTRB;
  output [0:0] M_AXI_WLAST;
  output [0:0] M_AXI_WUSER;
  output [0:0] M_AXI_WVALID;
  input [0:0] M_AXI_WREADY;
  input [0:0] M_AXI_BID;
  input [1:0] M_AXI_BRESP;
  input [0:0] M_AXI_BUSER;
  input [0:0] M_AXI_BVALID;
  output [0:0] M_AXI_BREADY;
  output [0:0] M_AXI_ARID;
  output [31:0] M_AXI_ARADDR;
  output [7:0] M_AXI_ARLEN;
  output [2:0] M_AXI_ARSIZE;
  output [1:0] M_AXI_ARBURST;
  output [1:0] M_AXI_ARLOCK;
  output [3:0] M_AXI_ARCACHE;
  output [2:0] M_AXI_ARPROT;
  output [3:0] M_AXI_ARREGION;
  output [3:0] M_AXI_ARQOS;
  output [0:0] M_AXI_ARUSER;
  output [0:0] M_AXI_ARVALID;
  input [0:0] M_AXI_ARREADY;
  input [0:0] M_AXI_RID;
  input [31:0] M_AXI_RDATA;
  input [1:0] M_AXI_RRESP;
  input [0:0] M_AXI_RLAST;
  input [0:0] M_AXI_RUSER;
  input [0:0] M_AXI_RVALID;
  output [0:0] M_AXI_RREADY;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
  output INTERCONNECT_ARESET_OUT_N;
  output [7:0] DEBUG_AW_TRANS_SEQ;
  output [7:0] DEBUG_AW_ARB_GRANT;
  output [7:0] DEBUG_AR_TRANS_SEQ;
  output [7:0] DEBUG_AR_ARB_GRANT;
  output [0:0] DEBUG_AW_TRANS_QUAL;
  output [7:0] DEBUG_AW_ACCEPT_CNT;
  output [15:0] DEBUG_AW_ACTIVE_THREAD;
  output [7:0] DEBUG_AW_ACTIVE_TARGET;
  output [7:0] DEBUG_AW_ACTIVE_REGION;
  output [7:0] DEBUG_AW_ERROR;
  output [7:0] DEBUG_AW_TARGET;
  output [0:0] DEBUG_AR_TRANS_QUAL;
  output [7:0] DEBUG_AR_ACCEPT_CNT;
  output [15:0] DEBUG_AR_ACTIVE_THREAD;
  output [7:0] DEBUG_AR_ACTIVE_TARGET;
  output [7:0] DEBUG_AR_ACTIVE_REGION;
  output [7:0] DEBUG_AR_ERROR;
  output [7:0] DEBUG_AR_TARGET;
  output [7:0] DEBUG_B_TRANS_SEQ;
  output [7:0] DEBUG_R_BEAT_CNT;
  output [7:0] DEBUG_R_TRANS_SEQ;
  output [7:0] DEBUG_AW_ISSUING_CNT;
  output [7:0] DEBUG_AR_ISSUING_CNT;
  output [7:0] DEBUG_W_BEAT_CNT;
  output [7:0] DEBUG_W_TRANS_SEQ;
  output [7:0] DEBUG_BID_TARGET;
  output DEBUG_BID_ERROR;
  output [7:0] DEBUG_RID_TARGET;
  output DEBUG_RID_ERROR;
  output [31:0] DEBUG_SR_SC_ARADDR;
  output [23:0] DEBUG_SR_SC_ARADDRCONTROL;
  output [31:0] DEBUG_SR_SC_AWADDR;
  output [23:0] DEBUG_SR_SC_AWADDRCONTROL;
  output [4:0] DEBUG_SR_SC_BRESP;
  output [31:0] DEBUG_SR_SC_RDATA;
  output [5:0] DEBUG_SR_SC_RDATACONTROL;
  output [31:0] DEBUG_SR_SC_WDATA;
  output [6:0] DEBUG_SR_SC_WDATACONTROL;
  output [31:0] DEBUG_SC_SF_ARADDR;
  output [23:0] DEBUG_SC_SF_ARADDRCONTROL;
  output [31:0] DEBUG_SC_SF_AWADDR;
  output [23:0] DEBUG_SC_SF_AWADDRCONTROL;
  output [4:0] DEBUG_SC_SF_BRESP;
  output [31:0] DEBUG_SC_SF_RDATA;
  output [5:0] DEBUG_SC_SF_RDATACONTROL;
  output [31:0] DEBUG_SC_SF_WDATA;
  output [6:0] DEBUG_SC_SF_WDATACONTROL;
  output [31:0] DEBUG_SF_CB_ARADDR;
  output [23:0] DEBUG_SF_CB_ARADDRCONTROL;
  output [31:0] DEBUG_SF_CB_AWADDR;
  output [23:0] DEBUG_SF_CB_AWADDRCONTROL;
  output [4:0] DEBUG_SF_CB_BRESP;
  output [31:0] DEBUG_SF_CB_RDATA;
  output [5:0] DEBUG_SF_CB_RDATACONTROL;
  output [31:0] DEBUG_SF_CB_WDATA;
  output [6:0] DEBUG_SF_CB_WDATACONTROL;
  output [31:0] DEBUG_CB_MF_ARADDR;
  output [23:0] DEBUG_CB_MF_ARADDRCONTROL;
  output [31:0] DEBUG_CB_MF_AWADDR;
  output [23:0] DEBUG_CB_MF_AWADDRCONTROL;
  output [4:0] DEBUG_CB_MF_BRESP;
  output [31:0] DEBUG_CB_MF_RDATA;
  output [5:0] DEBUG_CB_MF_RDATACONTROL;
  output [31:0] DEBUG_CB_MF_WDATA;
  output [6:0] DEBUG_CB_MF_WDATACONTROL;
  output [31:0] DEBUG_MF_MC_ARADDR;
  output [23:0] DEBUG_MF_MC_ARADDRCONTROL;
  output [31:0] DEBUG_MF_MC_AWADDR;
  output [23:0] DEBUG_MF_MC_AWADDRCONTROL;
  output [4:0] DEBUG_MF_MC_BRESP;
  output [31:0] DEBUG_MF_MC_RDATA;
  output [5:0] DEBUG_MF_MC_RDATACONTROL;
  output [31:0] DEBUG_MF_MC_WDATA;
  output [6:0] DEBUG_MF_MC_WDATACONTROL;
  output [31:0] DEBUG_MC_MP_ARADDR;
  output [23:0] DEBUG_MC_MP_ARADDRCONTROL;
  output [31:0] DEBUG_MC_MP_AWADDR;
  output [23:0] DEBUG_MC_MP_AWADDRCONTROL;
  output [4:0] DEBUG_MC_MP_BRESP;
  output [31:0] DEBUG_MC_MP_RDATA;
  output [5:0] DEBUG_MC_MP_RDATACONTROL;
  output [31:0] DEBUG_MC_MP_WDATA;
  output [6:0] DEBUG_MC_MP_WDATACONTROL;
  output [31:0] DEBUG_MP_MR_ARADDR;
  output [23:0] DEBUG_MP_MR_ARADDRCONTROL;
  output [31:0] DEBUG_MP_MR_AWADDR;
  output [23:0] DEBUG_MP_MR_AWADDRCONTROL;
  output [4:0] DEBUG_MP_MR_BRESP;
  output [31:0] DEBUG_MP_MR_RDATA;
  output [5:0] DEBUG_MP_MR_RDATACONTROL;
  output [31:0] DEBUG_MP_MR_WDATA;
  output [6:0] DEBUG_MP_MR_WDATACONTROL;

  axi_interconnect
    #(
      .C_BASEFAMILY ( "virtex6" ),
      .C_NUM_SLAVE_SLOTS ( 1 ),
      .C_NUM_MASTER_SLOTS ( 1 ),
      .C_AXI_ID_WIDTH ( 1 ),
      .C_AXI_ADDR_WIDTH ( 32 ),
      .C_AXI_DATA_MAX_WIDTH ( 32 ),
      .C_S_AXI_DATA_WIDTH ( 512'h00000020000000200000002000000020000000200000002000000020000000200000002000000020000000200000002000000020000000200000002000000020 ),
      .C_M_AXI_DATA_WIDTH ( 512'h00000020000000200000002000000020000000200000002000000020000000200000002000000020000000200000002000000020000000200000002000000020 ),
      .C_INTERCONNECT_DATA_WIDTH ( 32 ),
      .C_S_AXI_PROTOCOL ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 ),
      .C_M_AXI_PROTOCOL ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 ),
      .C_M_AXI_BASE_ADDR ( 16384'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000030000000 ),
      .C_M_AXI_HIGH_ADDR ( 16384'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000ffff ),
      .C_S_AXI_BASE_ID ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ),
      .C_S_AXI_THREAD_ID_WIDTH ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ),
      .C_S_AXI_IS_INTERCONNECT ( 16'b0000000000000000 ),
      .C_S_AXI_ACLK_RATIO ( 512'h00000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000105f5e100 ),
      .C_S_AXI_IS_ACLK_ASYNC ( 16'b0000000000000000 ),
      .C_M_AXI_ACLK_RATIO ( 512'h00000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000105f5e100 ),
      .C_M_AXI_IS_ACLK_ASYNC ( 16'b0000000000000000 ),
      .C_INTERCONNECT_ACLK_RATIO ( 100000000 ),
      .C_S_AXI_SUPPORTS_WRITE ( 16'b1111111111111111 ),
      .C_S_AXI_SUPPORTS_READ ( 16'b1111111111111111 ),
      .C_M_AXI_SUPPORTS_WRITE ( 16'b1111111111111111 ),
      .C_M_AXI_SUPPORTS_READ ( 16'b1111111111111111 ),
      .C_AXI_SUPPORTS_USER_SIGNALS ( 0 ),
      .C_AXI_AWUSER_WIDTH ( 1 ),
      .C_AXI_ARUSER_WIDTH ( 1 ),
      .C_AXI_WUSER_WIDTH ( 1 ),
      .C_AXI_RUSER_WIDTH ( 1 ),
      .C_AXI_BUSER_WIDTH ( 1 ),
      .C_AXI_CONNECTIVITY ( 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ),
      .C_S_AXI_SINGLE_THREAD ( 16'b0000000000000000 ),
      .C_M_AXI_SUPPORTS_REORDERING ( 16'b1111111111111111 ),
      .C_S_AXI_SUPPORTS_NARROW_BURST ( 16'b1111111111111111 ),
      .C_M_AXI_SUPPORTS_NARROW_BURST ( 16'b1111111111111111 ),
      .C_S_AXI_WRITE_ACCEPTANCE ( 512'h00000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000008 ),
      .C_S_AXI_READ_ACCEPTANCE ( 512'h00000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000008 ),
      .C_M_AXI_WRITE_ISSUING ( 512'h00000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001 ),
      .C_M_AXI_READ_ISSUING ( 512'h00000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001 ),
      .C_S_AXI_ARB_PRIORITY ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ),
      .C_M_AXI_SECURE ( 16'b0000000000000000 ),
      .C_S_AXI_WRITE_FIFO_DEPTH ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ),
      .C_S_AXI_WRITE_FIFO_TYPE ( 16'b1111111111111111 ),
      .C_S_AXI_WRITE_FIFO_DELAY ( 16'b0000000000000000 ),
      .C_S_AXI_READ_FIFO_DEPTH ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ),
      .C_S_AXI_READ_FIFO_TYPE ( 16'b1111111111111111 ),
      .C_S_AXI_READ_FIFO_DELAY ( 16'b0000000000000000 ),
      .C_M_AXI_WRITE_FIFO_DEPTH ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ),
      .C_M_AXI_WRITE_FIFO_TYPE ( 16'b1111111111111111 ),
      .C_M_AXI_WRITE_FIFO_DELAY ( 16'b0000000000000000 ),
      .C_M_AXI_READ_FIFO_DEPTH ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ),
      .C_M_AXI_READ_FIFO_TYPE ( 16'b1111111111111111 ),
      .C_M_AXI_READ_FIFO_DELAY ( 16'b0000000000000000 ),
      .C_S_AXI_AW_REGISTER ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ),
      .C_S_AXI_AR_REGISTER ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ),
      .C_S_AXI_W_REGISTER ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ),
      .C_S_AXI_R_REGISTER ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ),
      .C_S_AXI_B_REGISTER ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ),
      .C_M_AXI_AW_REGISTER ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ),
      .C_M_AXI_AR_REGISTER ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ),
      .C_M_AXI_W_REGISTER ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ),
      .C_M_AXI_R_REGISTER ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ),
      .C_M_AXI_B_REGISTER ( 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ),
      .C_INTERCONNECT_R_REGISTER ( 0 ),
      .C_INTERCONNECT_CONNECTIVITY_MODE ( 0 ),
      .C_USE_CTRL_PORT ( 0 ),
      .C_USE_INTERRUPT ( 1 ),
      .C_RANGE_CHECK ( 0 ),
      .C_S_AXI_CTRL_ADDR_WIDTH ( 32 ),
      .C_S_AXI_CTRL_DATA_WIDTH ( 32 ),
      .C_DEBUG ( 0 ),
      .C_S_AXI_DEBUG_SLOT ( 0 ),
      .C_M_AXI_DEBUG_SLOT ( 0 ),
      .C_MAX_DEBUG_THREADS ( 1 )
    )
    axi4lite_bus (
      .INTERCONNECT_ACLK ( INTERCONNECT_ACLK ),
      .INTERCONNECT_ARESETN ( INTERCONNECT_ARESETN ),
      .S_AXI_ARESET_OUT_N ( S_AXI_ARESET_OUT_N ),
      .M_AXI_ARESET_OUT_N ( M_AXI_ARESET_OUT_N ),
      .IRQ ( IRQ ),
      .S_AXI_ACLK ( S_AXI_ACLK ),
      .S_AXI_AWID ( S_AXI_AWID ),
      .S_AXI_AWADDR ( S_AXI_AWADDR ),
      .S_AXI_AWLEN ( S_AXI_AWLEN ),
      .S_AXI_AWSIZE ( S_AXI_AWSIZE ),
      .S_AXI_AWBURST ( S_AXI_AWBURST ),
      .S_AXI_AWLOCK ( S_AXI_AWLOCK ),
      .S_AXI_AWCACHE ( S_AXI_AWCACHE ),
      .S_AXI_AWPROT ( S_AXI_AWPROT ),
      .S_AXI_AWQOS ( S_AXI_AWQOS ),
      .S_AXI_AWUSER ( S_AXI_AWUSER ),
      .S_AXI_AWVALID ( S_AXI_AWVALID ),
      .S_AXI_AWREADY ( S_AXI_AWREADY ),
      .S_AXI_WID ( S_AXI_WID ),
      .S_AXI_WDATA ( S_AXI_WDATA ),
      .S_AXI_WSTRB ( S_AXI_WSTRB ),
      .S_AXI_WLAST ( S_AXI_WLAST ),
      .S_AXI_WUSER ( S_AXI_WUSER ),
      .S_AXI_WVALID ( S_AXI_WVALID ),
      .S_AXI_WREADY ( S_AXI_WREADY ),
      .S_AXI_BID ( S_AXI_BID ),
      .S_AXI_BRESP ( S_AXI_BRESP ),
      .S_AXI_BUSER ( S_AXI_BUSER ),
      .S_AXI_BVALID ( S_AXI_BVALID ),
      .S_AXI_BREADY ( S_AXI_BREADY ),
      .S_AXI_ARID ( S_AXI_ARID ),
      .S_AXI_ARADDR ( S_AXI_ARADDR ),
      .S_AXI_ARLEN ( S_AXI_ARLEN ),
      .S_AXI_ARSIZE ( S_AXI_ARSIZE ),
      .S_AXI_ARBURST ( S_AXI_ARBURST ),
      .S_AXI_ARLOCK ( S_AXI_ARLOCK ),
      .S_AXI_ARCACHE ( S_AXI_ARCACHE ),
      .S_AXI_ARPROT ( S_AXI_ARPROT ),
      .S_AXI_ARQOS ( S_AXI_ARQOS ),
      .S_AXI_ARUSER ( S_AXI_ARUSER ),
      .S_AXI_ARVALID ( S_AXI_ARVALID ),
      .S_AXI_ARREADY ( S_AXI_ARREADY ),
      .S_AXI_RID ( S_AXI_RID ),
      .S_AXI_RDATA ( S_AXI_RDATA ),
      .S_AXI_RRESP ( S_AXI_RRESP ),
      .S_AXI_RLAST ( S_AXI_RLAST ),
      .S_AXI_RUSER ( S_AXI_RUSER ),
      .S_AXI_RVALID ( S_AXI_RVALID ),
      .S_AXI_RREADY ( S_AXI_RREADY ),
      .M_AXI_ACLK ( M_AXI_ACLK ),
      .M_AXI_AWID ( M_AXI_AWID ),
      .M_AXI_AWADDR ( M_AXI_AWADDR ),
      .M_AXI_AWLEN ( M_AXI_AWLEN ),
      .M_AXI_AWSIZE ( M_AXI_AWSIZE ),
      .M_AXI_AWBURST ( M_AXI_AWBURST ),
      .M_AXI_AWLOCK ( M_AXI_AWLOCK ),
      .M_AXI_AWCACHE ( M_AXI_AWCACHE ),
      .M_AXI_AWPROT ( M_AXI_AWPROT ),
      .M_AXI_AWREGION ( M_AXI_AWREGION ),
      .M_AXI_AWQOS ( M_AXI_AWQOS ),
      .M_AXI_AWUSER ( M_AXI_AWUSER ),
      .M_AXI_AWVALID ( M_AXI_AWVALID ),
      .M_AXI_AWREADY ( M_AXI_AWREADY ),
      .M_AXI_WID ( M_AXI_WID ),
      .M_AXI_WDATA ( M_AXI_WDATA ),
      .M_AXI_WSTRB ( M_AXI_WSTRB ),
      .M_AXI_WLAST ( M_AXI_WLAST ),
      .M_AXI_WUSER ( M_AXI_WUSER ),
      .M_AXI_WVALID ( M_AXI_WVALID ),
      .M_AXI_WREADY ( M_AXI_WREADY ),
      .M_AXI_BID ( M_AXI_BID ),
      .M_AXI_BRESP ( M_AXI_BRESP ),
      .M_AXI_BUSER ( M_AXI_BUSER ),
      .M_AXI_BVALID ( M_AXI_BVALID ),
      .M_AXI_BREADY ( M_AXI_BREADY ),
      .M_AXI_ARID ( M_AXI_ARID ),
      .M_AXI_ARADDR ( M_AXI_ARADDR ),
      .M_AXI_ARLEN ( M_AXI_ARLEN ),
      .M_AXI_ARSIZE ( M_AXI_ARSIZE ),
      .M_AXI_ARBURST ( M_AXI_ARBURST ),
      .M_AXI_ARLOCK ( M_AXI_ARLOCK ),
      .M_AXI_ARCACHE ( M_AXI_ARCACHE ),
      .M_AXI_ARPROT ( M_AXI_ARPROT ),
      .M_AXI_ARREGION ( M_AXI_ARREGION ),
      .M_AXI_ARQOS ( M_AXI_ARQOS ),
      .M_AXI_ARUSER ( M_AXI_ARUSER ),
      .M_AXI_ARVALID ( M_AXI_ARVALID ),
      .M_AXI_ARREADY ( M_AXI_ARREADY ),
      .M_AXI_RID ( M_AXI_RID ),
      .M_AXI_RDATA ( M_AXI_RDATA ),
      .M_AXI_RRESP ( M_AXI_RRESP ),
      .M_AXI_RLAST ( M_AXI_RLAST ),
      .M_AXI_RUSER ( M_AXI_RUSER ),
      .M_AXI_RVALID ( M_AXI_RVALID ),
      .M_AXI_RREADY ( M_AXI_RREADY ),
      .S_AXI_CTRL_AWADDR ( S_AXI_CTRL_AWADDR ),
      .S_AXI_CTRL_AWVALID ( S_AXI_CTRL_AWVALID ),
      .S_AXI_CTRL_AWREADY ( S_AXI_CTRL_AWREADY ),
      .S_AXI_CTRL_WDATA ( S_AXI_CTRL_WDATA ),
      .S_AXI_CTRL_WVALID ( S_AXI_CTRL_WVALID ),
      .S_AXI_CTRL_WREADY ( S_AXI_CTRL_WREADY ),
      .S_AXI_CTRL_BRESP ( S_AXI_CTRL_BRESP ),
      .S_AXI_CTRL_BVALID ( S_AXI_CTRL_BVALID ),
      .S_AXI_CTRL_BREADY ( S_AXI_CTRL_BREADY ),
      .S_AXI_CTRL_ARADDR ( S_AXI_CTRL_ARADDR ),
      .S_AXI_CTRL_ARVALID ( S_AXI_CTRL_ARVALID ),
      .S_AXI_CTRL_ARREADY ( S_AXI_CTRL_ARREADY ),
      .S_AXI_CTRL_RDATA ( S_AXI_CTRL_RDATA ),
      .S_AXI_CTRL_RRESP ( S_AXI_CTRL_RRESP ),
      .S_AXI_CTRL_RVALID ( S_AXI_CTRL_RVALID ),
      .S_AXI_CTRL_RREADY ( S_AXI_CTRL_RREADY ),
      .INTERCONNECT_ARESET_OUT_N ( INTERCONNECT_ARESET_OUT_N ),
      .DEBUG_AW_TRANS_SEQ ( DEBUG_AW_TRANS_SEQ ),
      .DEBUG_AW_ARB_GRANT ( DEBUG_AW_ARB_GRANT ),
      .DEBUG_AR_TRANS_SEQ ( DEBUG_AR_TRANS_SEQ ),
      .DEBUG_AR_ARB_GRANT ( DEBUG_AR_ARB_GRANT ),
      .DEBUG_AW_TRANS_QUAL ( DEBUG_AW_TRANS_QUAL ),
      .DEBUG_AW_ACCEPT_CNT ( DEBUG_AW_ACCEPT_CNT ),
      .DEBUG_AW_ACTIVE_THREAD ( DEBUG_AW_ACTIVE_THREAD ),
      .DEBUG_AW_ACTIVE_TARGET ( DEBUG_AW_ACTIVE_TARGET ),
      .DEBUG_AW_ACTIVE_REGION ( DEBUG_AW_ACTIVE_REGION ),
      .DEBUG_AW_ERROR ( DEBUG_AW_ERROR ),
      .DEBUG_AW_TARGET ( DEBUG_AW_TARGET ),
      .DEBUG_AR_TRANS_QUAL ( DEBUG_AR_TRANS_QUAL ),
      .DEBUG_AR_ACCEPT_CNT ( DEBUG_AR_ACCEPT_CNT ),
      .DEBUG_AR_ACTIVE_THREAD ( DEBUG_AR_ACTIVE_THREAD ),
      .DEBUG_AR_ACTIVE_TARGET ( DEBUG_AR_ACTIVE_TARGET ),
      .DEBUG_AR_ACTIVE_REGION ( DEBUG_AR_ACTIVE_REGION ),
      .DEBUG_AR_ERROR ( DEBUG_AR_ERROR ),
      .DEBUG_AR_TARGET ( DEBUG_AR_TARGET ),
      .DEBUG_B_TRANS_SEQ ( DEBUG_B_TRANS_SEQ ),
      .DEBUG_R_BEAT_CNT ( DEBUG_R_BEAT_CNT ),
      .DEBUG_R_TRANS_SEQ ( DEBUG_R_TRANS_SEQ ),
      .DEBUG_AW_ISSUING_CNT ( DEBUG_AW_ISSUING_CNT ),
      .DEBUG_AR_ISSUING_CNT ( DEBUG_AR_ISSUING_CNT ),
      .DEBUG_W_BEAT_CNT ( DEBUG_W_BEAT_CNT ),
      .DEBUG_W_TRANS_SEQ ( DEBUG_W_TRANS_SEQ ),
      .DEBUG_BID_TARGET ( DEBUG_BID_TARGET ),
      .DEBUG_BID_ERROR ( DEBUG_BID_ERROR ),
      .DEBUG_RID_TARGET ( DEBUG_RID_TARGET ),
      .DEBUG_RID_ERROR ( DEBUG_RID_ERROR ),
      .DEBUG_SR_SC_ARADDR ( DEBUG_SR_SC_ARADDR ),
      .DEBUG_SR_SC_ARADDRCONTROL ( DEBUG_SR_SC_ARADDRCONTROL ),
      .DEBUG_SR_SC_AWADDR ( DEBUG_SR_SC_AWADDR ),
      .DEBUG_SR_SC_AWADDRCONTROL ( DEBUG_SR_SC_AWADDRCONTROL ),
      .DEBUG_SR_SC_BRESP ( DEBUG_SR_SC_BRESP ),
      .DEBUG_SR_SC_RDATA ( DEBUG_SR_SC_RDATA ),
      .DEBUG_SR_SC_RDATACONTROL ( DEBUG_SR_SC_RDATACONTROL ),
      .DEBUG_SR_SC_WDATA ( DEBUG_SR_SC_WDATA ),
      .DEBUG_SR_SC_WDATACONTROL ( DEBUG_SR_SC_WDATACONTROL ),
      .DEBUG_SC_SF_ARADDR ( DEBUG_SC_SF_ARADDR ),
      .DEBUG_SC_SF_ARADDRCONTROL ( DEBUG_SC_SF_ARADDRCONTROL ),
      .DEBUG_SC_SF_AWADDR ( DEBUG_SC_SF_AWADDR ),
      .DEBUG_SC_SF_AWADDRCONTROL ( DEBUG_SC_SF_AWADDRCONTROL ),
      .DEBUG_SC_SF_BRESP ( DEBUG_SC_SF_BRESP ),
      .DEBUG_SC_SF_RDATA ( DEBUG_SC_SF_RDATA ),
      .DEBUG_SC_SF_RDATACONTROL ( DEBUG_SC_SF_RDATACONTROL ),
      .DEBUG_SC_SF_WDATA ( DEBUG_SC_SF_WDATA ),
      .DEBUG_SC_SF_WDATACONTROL ( DEBUG_SC_SF_WDATACONTROL ),
      .DEBUG_SF_CB_ARADDR ( DEBUG_SF_CB_ARADDR ),
      .DEBUG_SF_CB_ARADDRCONTROL ( DEBUG_SF_CB_ARADDRCONTROL ),
      .DEBUG_SF_CB_AWADDR ( DEBUG_SF_CB_AWADDR ),
      .DEBUG_SF_CB_AWADDRCONTROL ( DEBUG_SF_CB_AWADDRCONTROL ),
      .DEBUG_SF_CB_BRESP ( DEBUG_SF_CB_BRESP ),
      .DEBUG_SF_CB_RDATA ( DEBUG_SF_CB_RDATA ),
      .DEBUG_SF_CB_RDATACONTROL ( DEBUG_SF_CB_RDATACONTROL ),
      .DEBUG_SF_CB_WDATA ( DEBUG_SF_CB_WDATA ),
      .DEBUG_SF_CB_WDATACONTROL ( DEBUG_SF_CB_WDATACONTROL ),
      .DEBUG_CB_MF_ARADDR ( DEBUG_CB_MF_ARADDR ),
      .DEBUG_CB_MF_ARADDRCONTROL ( DEBUG_CB_MF_ARADDRCONTROL ),
      .DEBUG_CB_MF_AWADDR ( DEBUG_CB_MF_AWADDR ),
      .DEBUG_CB_MF_AWADDRCONTROL ( DEBUG_CB_MF_AWADDRCONTROL ),
      .DEBUG_CB_MF_BRESP ( DEBUG_CB_MF_BRESP ),
      .DEBUG_CB_MF_RDATA ( DEBUG_CB_MF_RDATA ),
      .DEBUG_CB_MF_RDATACONTROL ( DEBUG_CB_MF_RDATACONTROL ),
      .DEBUG_CB_MF_WDATA ( DEBUG_CB_MF_WDATA ),
      .DEBUG_CB_MF_WDATACONTROL ( DEBUG_CB_MF_WDATACONTROL ),
      .DEBUG_MF_MC_ARADDR ( DEBUG_MF_MC_ARADDR ),
      .DEBUG_MF_MC_ARADDRCONTROL ( DEBUG_MF_MC_ARADDRCONTROL ),
      .DEBUG_MF_MC_AWADDR ( DEBUG_MF_MC_AWADDR ),
      .DEBUG_MF_MC_AWADDRCONTROL ( DEBUG_MF_MC_AWADDRCONTROL ),
      .DEBUG_MF_MC_BRESP ( DEBUG_MF_MC_BRESP ),
      .DEBUG_MF_MC_RDATA ( DEBUG_MF_MC_RDATA ),
      .DEBUG_MF_MC_RDATACONTROL ( DEBUG_MF_MC_RDATACONTROL ),
      .DEBUG_MF_MC_WDATA ( DEBUG_MF_MC_WDATA ),
      .DEBUG_MF_MC_WDATACONTROL ( DEBUG_MF_MC_WDATACONTROL ),
      .DEBUG_MC_MP_ARADDR ( DEBUG_MC_MP_ARADDR ),
      .DEBUG_MC_MP_ARADDRCONTROL ( DEBUG_MC_MP_ARADDRCONTROL ),
      .DEBUG_MC_MP_AWADDR ( DEBUG_MC_MP_AWADDR ),
      .DEBUG_MC_MP_AWADDRCONTROL ( DEBUG_MC_MP_AWADDRCONTROL ),
      .DEBUG_MC_MP_BRESP ( DEBUG_MC_MP_BRESP ),
      .DEBUG_MC_MP_RDATA ( DEBUG_MC_MP_RDATA ),
      .DEBUG_MC_MP_RDATACONTROL ( DEBUG_MC_MP_RDATACONTROL ),
      .DEBUG_MC_MP_WDATA ( DEBUG_MC_MP_WDATA ),
      .DEBUG_MC_MP_WDATACONTROL ( DEBUG_MC_MP_WDATACONTROL ),
      .DEBUG_MP_MR_ARADDR ( DEBUG_MP_MR_ARADDR ),
      .DEBUG_MP_MR_ARADDRCONTROL ( DEBUG_MP_MR_ARADDRCONTROL ),
      .DEBUG_MP_MR_AWADDR ( DEBUG_MP_MR_AWADDR ),
      .DEBUG_MP_MR_AWADDRCONTROL ( DEBUG_MP_MR_AWADDRCONTROL ),
      .DEBUG_MP_MR_BRESP ( DEBUG_MP_MR_BRESP ),
      .DEBUG_MP_MR_RDATA ( DEBUG_MP_MR_RDATA ),
      .DEBUG_MP_MR_RDATACONTROL ( DEBUG_MP_MR_RDATACONTROL ),
      .DEBUG_MP_MR_WDATA ( DEBUG_MP_MR_WDATA ),
      .DEBUG_MP_MR_WDATACONTROL ( DEBUG_MP_MR_WDATACONTROL )
    );

endmodule

