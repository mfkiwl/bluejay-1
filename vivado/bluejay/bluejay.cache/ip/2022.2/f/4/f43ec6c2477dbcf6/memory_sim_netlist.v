// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Sun Nov 13 22:03:36 2022
// Host        : seankent running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ memory_sim_netlist.v
// Design      : memory
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "memory,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [5:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [63:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [63:0]douta;

  wire [5:0]addra;
  wire clka;
  wire [63:0]dina;
  wire [63:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [63:0]NLW_U0_doutb_UNCONNECTED;
  wire [5:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [5:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "6" *) 
  (* C_ADDRB_WIDTH = "6" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     6.700549 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "memory.mem" *) 
  (* C_INIT_FILE_NAME = "memory.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "64" *) 
  (* C_READ_DEPTH_B = "64" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "64" *) 
  (* C_READ_WIDTH_B = "64" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "64" *) 
  (* C_WRITE_DEPTH_B = "64" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "64" *) 
  (* C_WRITE_WIDTH_B = "64" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[63:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[5:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[5:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29888)
`pragma protect data_block
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
VDU6jzU8XSIBT/U0ZtLEFObXg8Y=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
