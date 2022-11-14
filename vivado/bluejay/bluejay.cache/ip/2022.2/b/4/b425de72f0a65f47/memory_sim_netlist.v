// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Sun Nov 13 21:34:36 2022
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
N7RIicnah7pOQs82U0i+z6Yn87c=
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
