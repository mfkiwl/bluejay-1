// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Sun Nov 13 21:41:58 2022
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
+Dm/mFJ0uovo+ZZbguxYA5TiqEA=
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
