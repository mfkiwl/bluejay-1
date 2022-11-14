// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Sun Nov 13 21:28:50 2022
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
8zf+3SvX0K53pBb68KsG0z8Ofjv+adSez+0iKih/wJ14O1/O5kB8AMqLMyaGESW2mo+bVgRI+mJh
R+a+jlf7FXm9UlInd3iUEu+DfW5Ucz0rS9X1mjvtC/fjN0mwFTOYj4U9XLZLXKFocTPNWsj03DPF
XrhK+tjyLYhGe0V0Zzura+JWqJhA+SwUb34fgQedJ7WknNfRSu8XowcaCiLI5wlRRMM+nDBMo36R
f99dwTYcww7Nos6hLm46xg66bQWt7P0I4GYibHNQbYzI2moHkKQMrkhLOZWk0y5flInEgoyO2TCR
tdsT2HNRJ8tbyaJtqhyTuCB50iAVf4YInyDnEQRT4Hv0NRuKoa9WRp0pEDqyLTLyYa3SjhG68fxg
C91njV2GPQ0lgL9YCuCk7leROzoX68ElfNVkzS8sPQa6TNCqHemm/nCPplHt6cZ+Ex6NRKaJb/5C
DjZ8Q7i1xdN9x6rJgaM5o2Pd1rqn0UHwblbH4dDrAVt/aSF0vPJY/QqywAenlXuVYqeY3Dh5AUhO
/xewoThvVNtkNXt1CQcQA2l8WuowVDWvAX+XjALVt9X1hbJA4v35KPIaeCvXz65fzIFhMwekn0th
5qPb2YbCAsIBuypC2q01webNHGXTZpLISW5sPq5v+jP0G0QdiFb0VtIrBQqKANAU1ocMX3EBWzp7
9+Aol0mYE+8dFQeJ+w2g2A3AncCHYsRnWzqbLWKi/SMkIC6C0OO5UeInmw1jnuxQ2XuQH6DLw2pj
4JDd8MKqObtlRiG3gv4hpr01762mBVCv24/EwFvoFpuFuUn7EGetq9c0FcA4DMwa8aymbt8kLnCD
I59ORN536TnrEEKIvJt+dDswWSOwuDWZdDoVZJukN4pHpopp2kEzsYOj8yFkAGI11rSUDWi3E101
inL6a69OHBK3zJSrCwyW7ZkXn2M0AGVLUBEkn7ahgACYrZ2DV3hYrbqdh719Y+l4RZBtcXTjlOZq
6aSsVx11pFrzF7flzC7aWSjRvi8BMJ+iPEAm8hchKRRwKpPeDWmbuQl4bKOdzofkABJ7t/1BQ2iF
R8UJ7p1Gepbz+PUZxFURY7MzfzMYn8FORhJRDG0Va8C666iOjj3Ikwd8uEDl/GTEG9VIpU8pIz4w
RjfrF0HMyClz+9bfix6YCiVXvT9sT2bWnYhKNH2sFDKXGCpHAC+yd9evERf6d4j219B5WC2FBGXW
v1DptDGez3qggtSw8pjMzVG15GkGvfxLh/v2zeSVy6QuVhdw9tVTAzRVzxFv3iFhRalvw1oZTCQL
43e23pqw8x5GeeGUS0YUejgnepLFQtJg0EeIwcwPRh5CtBF/70TSgVDQJWeQaMUtaOU9+jjXiG6T
ad/fTBxeE+5h3biL1FLekM7T5JREfTo2xG2JUHUs8+FCAayimgFfwnbUVhf8MPfT5BHR0ukL/oWc
xyb1TBiLGJxaRMfpdf/F0v/HNrRRw1OJLbSAupWQyfiMIFCCOvIT8Iy+gY4QAIry25mxjvBTg/jB
aV63t2j7zAm2n1eksCZH/nnCY2pnEyeF1+IY9SvK6zURHZjIDBDiS9gZgq3Wjh+X9p1ehdYgrxzp
qhO11BZG4+mhTZchpAFy4ePsBQhXSuOUe3rcRAo9Ra27WX7RoTPmRpB6Q1sIT+8spKZVIcS0eaD8
h/HQza+rdmB7KaSnaJDHx7dVdv04+JEI1QkfC8qk4FhrFDWFfDFdTlRHtH8n6HHbb1St+oSS8ZY4
dXA7KA5EsXQmbItV/qSOXht3DVGa4CZAdL7HWhP7N3yRl9eqku6JubnOjwZ38/I+HgfIs4/zhBcV
5jn/AtcT8KlZAQOnNPxJ8Pmf6vrnLxj7zYXctA//7ASSpEIkDoEM+yyTVsCRR0LPlCIZJiYAeM3i
YEygQc4w+4uRd9FxgGqDE0RI9iTAD/5tyr8xpD5D9dbN77sL3Gq8QANB7Kppxi04oXW7SudI6nJf
eNuls2ru2k4PIkpRWX3n5cLtrqFn0TbN03HuNyQ8HGImol2VkJ81IDUa26Co+t4ETSpAaQxUVLkl
mCZQzTG5QWTbWI+5VYDcCLNZTdngUMerzzKiuD3RAc/vCSzfpM6MyyeLsIgJkQmf3xBnua3zRvl2
PceWGENuLE/NiyJ0nzMaSCbX+GvSoVj50OL30YnGBsTyrRrAkVG7ZMbYsrfvtHzW2JJRF86aYegv
rCmJNJAaUY1rT69R6VUdhhsO2VGKNuDJEZ+Rgala9+WL+pERrWIvUe2H4bqkoaSfiQjXqyjcUgUk
NuG0oSU0d3X5cn68giygADSiXTpp7hzgCR+OFnrEALBgjImBwy67GHcj2DUN2OaoCwlVXwCEPMiZ
Sc/UjTcdUNWEuT6yZqVZl3lwG78zd1EsdpCp+Oy84T/Q0Whp9rPm3j7zdNSL2/UIGNSQqlZ2lY0Y
QOzp166XuTzRGQdlnzZqJX9NzPRXhLkHV3gXJ9UMieqetrJL6rESXUlDDzlar9uo/mExkeTUd058
l2eXiciXk9CveuZbHiKO3D+GYnb8ZOCJGf2hNknPM+OKgjgUZWylwq4g/fxtYqGrZblJFk8qEexR
gGZDIBPjJM9ryAdptXKh9L25s08Zh4AA3806TbIN2Y3qsD5cu5L8P3X8ehCFPE2vowPNKI36fjm8
wu1rTgx+d5RdgX/xr/ge8MV7Ia/PEG0skaAC92Lo0Bq0Dfe4SbM1HAIOSAmSPF6mv8r6/tZpREDV
DYdSVtBEF06MlAsEPRIabGOe4ZUj7kJBtb6nWdOwdg0J+q6S8PLxmK29nUjkwkuYLljxkKZhQI7/
DreOq5YlBhUR6+PG6i+oRdcaqt7Qd22fw9MCXIIPhiTToQYGH2fHNn8E1pgiSpgUfriyO89HSJCK
TmP4kSKklp7K8I8QuX4nh01UZMJ+VMndKFhX4cE1nIic5SJu9rsHJ2012PK2v8MRXfLBYyUiDyFQ
58rqw9tnwtUl94Q65TZOFIACwp41QqapLtYmD3qAof1S0N5UZm+5CaeCBEgWO67ytSLpbLsEmSff
8U6VDY7dZljKY5VIDPKB9/0OufRTtdlPg+I1rddl5/yG16oeCPgeprHBHmhRuCYyNurC4mZZecJ4
QVvO8SXDQq8dXxTaH5ZpeCVkZrbDj61Y3tnrKRw8098zxGB8sTFqavcpPEMwEDyAq4mOI8klwmho
eDO45yrSpEeg3DPVslRnG542yEj0dzohKahQaqnhEZKt110kHC3btfjiCJc4GbE1cwK3CMHxs9U1
Cq4HlcmPEYHpLTwlBOrVrwXVtVc7Ap4oueI7js3lMa/UYET69Y5HnjeY1n9JF38Ac8hR1KSSFAxy
tDLmXtihNDZNoARZOwUS6za3M5V8xh1Ui3Az3znHv3NA7xiZvJFmzoSkk/CX7Tu3dvCu/Hg/bvCp
rIwTtIdo+1akIY3brzRW8+rHMLQOZZZKnM42ZVRj2xQNWd8rHb9ldcBvK79u1/9zoVslRzNT+St+
Wji+XB6G9W2Ym8UbjxA3yLfTReBjxSQ/6drkBjrHLaWngpxeK3EhTE1UEcu+D3OZQ88EL204Yc+B
edOL9RntpMu+zRnkn8L/oyPI6fxTpgxxZd9PkUcDWm/uqKs2Mzw8R119ZvRd8DMgstPNlztNyohS
Oj4XqSC/wu6ut+Xv8PC59tx3H8EgmATBPmqgwxckQoFfMxww6zBmlyeCoauONsf9kCRdtQs71VLx
Ut5RDDdpZG5IgeSuczhyxChzx6bsGVTUL9I7QkMHC7oNukeITnCB//uA+8B3Q4vCm9ghLXVLzMjY
LxrH72g8s0S/l1DJ1kgmyrHdIu0EbhtISdCu2G/ioCbjlJaTyRe4lRqKjpOLVxZpis2qRODTh+/o
XbbTlUU/YZbzvFqLYe1+zUyTuuafY00wASFcLLGXVHdOww2S4L8qsOg+4db8YvP1zPdhBIEX3ly1
uK/vPaft41ApqOyPTnlzHLdbdvoR2SXqKbWIGza49l9WWRvifQBjttr9/UeOxb8kWAl/uwPkpJGm
9micg/zE8o7J9w5QC5nQao5g/J3IECwfFakdDbc3GTmVb8cC8pXVIatAQggii8Vr44scQa3ixIYm
dKLLQ7XdgTEKc7e+6Z0/d0yhGTGcS8rv9Lh1gBTiHUpLwqj/fyWhea/oiAENj9rfyJ/gDUATZeEg
6zKA29qOlNIC5CyGTXfP3705PF6siJQWtlskzHoADJ0C+jqzkn6ZYLx3rP9ghCkTSKXOPDz7ZyOW
VKnj/wsnIREj9vJY2TbpesDRYmGlCC5Hxyc56sl1iTWt5MxrBlYpRZYx8ojEm92PDOZptks5ef4B
0blpUn2ittkE9eNjYu2ojEdzEdskZ43Svxs53K98XQVsLUWGvnc8Zo2HQ55haMm2kEGK2CU4i762
4uFjsKMuaplEyv858ZzqVmfa+U2879Byy3F/q9IKGrc6/a5DgX+BskU51bBmPEm4exHBPQ1ab02V
zIs80X0E5WRVp+8Nj0x6AXu99T1dQQAOfvUEhsSMqyGJyjwD7mSRXUCtzSsn5c/vvDfgrybKTMeV
2SAzCn09G15nTUAQ6WH1gOT/5zdbDkbe7W9zEs5aBYyHzy8XXTC3V67YR1oGM88beCBs9fgeu4Cd
bQzn2zeO3xKWW1JPpA6/wL9Er0T+IqHBCyZhSKcLbE1f1gJESGdEswiymQ7dF0/08j9pYm9y0Swv
BB9GTMmWtAVkFU49CvK6U1rmNN0/oBukOL/AMPGT0V7OTCIy/DkKkE88blczrRe/OuFwKEpvamr4
KF1xHIEm+ILWstj8GOQ3pDDax2jDcsJabpIgOHvx14bJnBlx0kcYL5DNWabB/TbLDJ7NhWswSLSL
eP8w0W5FB3W389VtVdkx6/ZcJCckoTCbqEUvlOF794y8Y/Iztrb5al7iiM8d7QtYS7yTa/6Ql3R0
i+TyiaktK44bO1KJLuR15YufH6Dnu+I8kxWVfCznnYbzk2AFgE4SdR0lAn4MZzll8CUBR/v8eJVO
oUr1mdbAPDepn9XdDHhyOlGH75lZkjcJq9BG+m0M2/wk+hhk7WnY1/ouVtvTc2sAUzCmD33kYIBk
2zlVHnusrLIinx5qLn5XN8wF8ldx4kkUBosM6nyfs3QioFqXguhEl9dmGaNK9YV2Cgy1p1a8t6AC
TVHH96oRDvdVBypeli+Sq/y1DG/wKwNw0VNJtkafL4rdX57eqLbZsvahnlnuwKqlxaLr9AWQnzr9
VL9OYOGd8LXcNBEOaUVaKRx6+ZSfPlADSPVWRR0iOZNDM7srK3Rr1FuU3MIrsYpMLXhATasHpxoZ
FdztiN59PGEJVjFkjE3YzKCcJ9d7wVgJvJNO2+0o48SaQGZGOEsWDiBPOgo/O4AqejXLvO+jjiYC
9whS4ztCxwwLr0J43okYKzeF1xl8SDnTPN56vpyF/ALdZoUNse+tsFtuegGcXPqYrwDLuCg7KllP
1i/Rh33YUvJKqsPC8IStI1MhNHCPGsoIbEPsgCHjGj+rh/kDke7oYS/jlV9r3zYYKgWsGuqe3VBp
iijUFukcQzkOBLfYclp1b4s7EJ8ruqEremBP3buvotXj0uFSwYDIeOg12msESIgiJAfahUljivBk
LbLpCtSVOhUn7hWmI+gDkiFEgEdKACK08coPAp6Anifc1s3xyI+3xbX6va+Pt5zI0ESj7LN/RvaC
h20jGcSQJhki9h+slnYUDFKGDc9ncVw03oIU2NlqJvqdMGHg5yjaRoPpcH7Q2XqF4mu/ijs6Oyaz
hp+1LmE3id6kHC3ZoByrlFL5T2lZjDg017W/BweLJAV7jsVjXuMk6rZyetdnbG1Rzw2J2cRa7lEc
DZnW+gFrosLWZWN+EjYFhx32EQdY5R/ZE2Ql343h007wUTVzKNTO5hsORVlJsDViJXoMRJvwCRYG
RTPVe+tItw28hFdjAguJThvzAPWE/fOWB03/2NFKgTwCEdBLxu7bOZ/N3511tksCUq6qJVL/6FrQ
kUii9A05h9QPi7UWx1uMAKLd8Z9Ut/9g/oSxt4A7E7eFUXLsoXzoPveccZ2fUMl+FDySIpaptLoF
gQ7bxxD3cinN9xG1pz9XQclQhZFQMGMGC5LHgdOJJ3yIFRwku9vJBkm6H/BF1FOSaRTQJHVe4HaM
7ZcSWWTGtieIzQH0RK8NCkWOOIt1+yk17XifT2n4p1g+Epjl5N9nLE9AhVdPy/584RUIzEx0jp6r
XmrwTguuAdGVxxl2pNN/f5KMyP1ZP+NzsHEi+V/5p4gEVAER5F8mNk7z2SMGIjQtohwB7aOWXLYm
uFfwezobGHhKlQUTslbnbvwOGQUTguebJht2HjdkGRXi+IdfT1MjuMJpEXbO4NPhF0GhXUaudPd6
FKHFXqt2moPSaYca2KWT7ABhPNIJaVRVq0l52tUVNCMVpLrCQTVtoZF5/ujCS3QuEeJ4tTra5XBp
eFscJkupgJVsdpbHnbcuxGG65iUjvqJL+bWOpRSUqSwWbDiKkY7iOK4pNDxJ7K3rJdo9dZhYtXGX
ruY8dKB651Ww1MXSL6ia+bN1SHzG3nbImAS2tcgBG5EgqG0iQMe45ySmeepqbIj8MEYMiU/SDdUA
Rw518o72aAYtMw7fnH13meoLjyu0z/c4Sv9kxgQige/kYOvA/Ecrz9AB38b7uqYE6CDQzkKGLTSK
E5sjqeFOYbP+URz70/cFnnoMzUYi95th+mp4kJdtUbTbmNH1ATJaJY/MUze6emaH5RyeYQrRoPwI
ysLq6nosCx4DX4uuekNkhZjpt97g9lMjOuP2HEA98F+P0KRPfkZp3mo7luGb5L3hMA9AfYSHeiUS
D2EffP3qYsLK4DW9mM/TRN5gH/LTg98Yt8RKfoMYEGDYs5L/q1zKePsnIgj/X4DQzaq0//WDQz1x
SZi1eKDZcSjCR1B+Jto87o2vNZqcGLTRr8YVWDOOQPzzB5lhchuSjAmctsrhcLciHbLflOwQI6pl
U8MiB5OUvexWl7tIDHkN21vcdfEmvZBRK7yik2iX7sIG3JwMlK0peik3+uEW6OTEd7l0LQxplMxZ
VWt6rdIiEpcXgipA6MvesteZAiGXMrIH5AR1cWqMbT8ibwmX0yc+Tx2yiLRtJuh1hoCpDsVcqMRv
6qvAIhpiT0mtrhv0YTov5+fRsi9ercUV18y3b63Lz5lR0ey394o1lo2cDBKdF5FGkmqa21ynqHCD
M5jKi5sUXMfglbiWkaPSXbwkUMJv/Uq6YJAXNiMZ/co/UaRv7WLQkNM/3FrYdGFj5kskGLaQ+mYJ
51MHSR8ILU6T0lGjLVV+DTmTAWH7iSkkLjO/Pxhnf+sddG3IR41fD9zYLioatblw1lphUwBsDNIX
erCSlkLUtKG98rjngp1+cO1MczOsgpCVTWvZABjLULyQw0Gqr4puY9TiJ5caBijur0gRMPvMJ/9t
bN/sTn8XDb+RaWkkO9q3t1seagrZRTeiw/eTeT67zWwgSLkqh/wCA7fL2YGUAghJRnlYft2NTPpt
VS5ZI0qn9sGMrmUhJHvqbYzU4o0eVv3SCe7HhEEjdICMoYGpVOvG8EqkOY3AKSbVHP0aopUij7WX
W+Z2JovmsVBsLraO5VQ13aXXo2U62KzLMbnfSGfvgZ1KdSha83XYNDmAK7Pb6Yk3sGbAM92wGEUt
rUN1Fk72IEWRN8VXVGRABGvKF8TNqs8tcMABpQNr3eB9UhS6xMxFRiWfI8FAa47FerDkZwZEPDxx
2v4ZHEkNdInO95/mT6+awIOwZ/u5JCX9ZgpNHK3XtMVwnUSHlGxBHvg/rq/EHlc6OfAhHDNo2JbL
N7gx0u6d2VxPIQ+FqYh5A051Vem2kZJBgdtRVVDocLtfMm/zR61YZuQ7Q44bG7f9XkRpYByNvETy
svo85j/g24NJzSid5VHVzk5EsQuUfWmlNl3yv9J1KJ97yc5C/8SPwgRDtjNxGPJM0C6KaTHExR9z
cW8ffZKqf+aPrcLa4h4Gzt5nmMUJFVYLDl9tDhstmKDIjBedMm4slxLDbbXnUr+MvlXhNy5xj6Im
JLDIkU0+3SXMlRNk5ri3P6HCmyMWFYD1jKuTUMNrhkNqg1+akwSnL7ZRjC6e/UmPQJxiJxD5Zzjq
00bJ8Hx3WJa11CVrRyYvcXiLbWzX0BJ69UZ/SZ5g8doiCcznTy+cD4tFFR+SDRduyre5Ra1QGjWV
3GiqXNuVx9n/ML9ZzBYuwQFmysfrM0TZt+ZA/s137TI3t9XoRChGqiY9ECdgR3lJv8T1gf42c0A5
0x7Rg9hdcCGtpFf85dKCrF/1h1zq2s/YsRgtH2cZNVbnSOdtG3X4CkqNhplAFbLbqZ3HGJMhygdD
WeFE0ELh1i0AVBtSL/6fHyNM7q8syy2X50eoI6yzXQb0PDGVn3qBW3VPyCuWR7pTzTodxh549dg2
V3inn9xGKH2X34on/wgO2mA8UmoT/1KOqDH4Sxuk5TvspcL4+VtgRzbvAGQoG72Jjz1bqunc3+Y3
6OFJanjJ/Fv/wn+wR7HVbO+mpxE3DemPrjPICY31lgLKnXsPrNi0bYDZL1PTQlQKmV+Vw7V4yzCE
/pfFtrk3Yi6yWTc7/XHZYgzn2CrOPaGWxCeHngHkTmVbTxohtj+T0byVVAavwcCyMpTeXIOJCKnv
HAiujBUwZrAskuwQLJwZqSrwbTKnKCT9Hnrx4hLwFBX9ygGqbCofl8Bgi6a6Fzaw79htnxvafr9Y
kbs0uXt3UPM34Q3wyoWEmY+i6O9yVGp7wfduj29F1JGV+H3JMzH1/WRMePT92OWOoUiWMHk51JUX
y1KezUEHbgAyX0g7W2MZ+bzXXhb6uqHCXlbHQUOhnf6fLzUinQ7TMmceefgid+f37uXe/wfa9GX+
pv9mNTS4u669rKTKC52yshkL0zWO2LPeLApK6wAb+GcTGsa30/XZ1UMDfGuOEmJX8Q+gj8AyIMUb
Al+V73QpNHk1hr5YeZF+Rua/GVbofE6txsVf7jSE5qRlnljzcuk69tNeeJ1Zb5krBhZQNf7ssNSb
91asegIsK+Yjq1zL7cCgBXjzaiMPlOPhcbX3ad7d9c8QrJSpHb/ngcct0uImHa16SnXYfPKsEx1Q
ld3dtmUbkf6yFAJhAwtlgYQrX1CI7mkleyq5jAKv0iaNd6WY/ZMyi9aa5DZ3oT24ozFHYYlLIyia
qpTMUk6y4j5fI1xO0Y0GSEz4jo5cCeM+l8nySHsEezcSgcJ7Z5cyzMX1jj9ctAmu160hk6DFfiEl
4EtswQo5zg3BebIydmsNQB9e95Ji2lyRmy2EhC9aj5pgSfKIhjjg5O4h5Vo9nhNLhzHML7k58GbE
aOzmBlTsJl3Rr/zThRPBWI0emX+1Ucc4XMhSHw2jaZn1TBvR8sKyJCi6i4F3eLyv3Cvm1f0/2WFv
n0Ml89/mw/TZdXjp8KJNphth49POqJRua58MdWDwbdd/Ew551b01+gab9rnLTxXNsdC8z32N9uvZ
hcB2G31A9dy7wXF28m5NtdocxxoTHtQ2mWfDHIOJGhwpUqXW8d9kRGXJSgSrbBp5QtC/H4tp9rOn
99JRvsjq714pH3i0tO4ulmz9S+70B8/IbVNeBG9mI18NKUf/XgJkb/TuBf9ZxTMb2S+6t0BuTXpb
r78SdoAB4uS+eLI1Ij6WjLAjoQyWig+uEfooKeITMpIQm/k/Dj6CHyg7/mDO7jRbcRQD2es7lrTB
vQCuJDCESEePGpjPZAzNGrMFRs2rGLimgsaXLOn+JHJQa4gvvm+Kax8fc5C6MC7bjVePfEgxH43/
nu/P283w4wjBbJHNAiYiBkFkLjKW3QAt+Ogz9hGeajF+04YHs+isgUj3FKLvyFiHbI1PvToePLOu
jdlN0xiuJT+4tmx8N/he0uI7syhajZyXK/OXKyUBvDlokWJKSCclFQ8XtXKoG30+w6RGEJ8Z2q+P
9z4V8SlSDGxljOlTnEYMeop4CotbD9YwFIIWDsY89bLNNDjUG81YbglJLEsjSizD4RhKo2iKMg2E
baRFZZkQKoigQdhS4qvQh/1u2oxnNy2OrdoNgUdxTvTWr1yw/POI8PAbPHx8usM/FRc6uT22QbrC
zFO1j9sYYz8lHPBvHE8mDrTNX8jmSIOTfl4FtxxdyuD+1y2izcc5/oxWpmstwUtT71mZyqI4UDQp
ErvHXcA/LZSap9u3ZpG3p5eRg3giAOG3npFNrUbzHs9ZtBKz8qRq72/0X5b5a/AuJrl7OObnopBW
m13ofNxBzLVxdi0j+hp9IW6azjd+z8eejU9pg2N27c1pXdsuo6c0vjQClGtfabwIU2OToBgRubPH
I2JkazLT7SQfaOjAWm7BOTcez81RolYp8crljhfcP4n3AvG89n6a/EV1QcsnPOTrf9tk+uNUnwXJ
uQr7bszKZwj/M/T2PyfwxVRZ2CbEcGvze3mZoxUuPRv8Yq/ztW7OQaUjEipUpArrLACkp245SrYc
QIViYIkg4S3uFDRRKbmAz2Y9lDe/nZxn69vVc3eB85pRaiIwMOPrEO7OzlHoA5ruVLB8ERoTpPi+
O1IiMyEoGYz/d0442YUbymy4e8qZWPqspOEc8eDKkXVYAIGm13WQykrcDKj1rosR0Vd6s8iGMNKE
4c40+I0WfEimd0RQOYS3avYdZmdwQsNZpMDl+f5h/o4v2ySx5ADpm7dpnw26UKKb4ArpB0huBqT1
ivrmcTeigYICMMeCiOW2QojK98o/gMcpXuuWeG5r/47epp9cPVyGO8+X/gLp9uXryasxnVL2DHnp
f2P4hCDlcSEcwQVCNue+YJWakNNKEIG+hlgYZNiEjCT3OSc6dV6rPRyh7rtAB+D5aAxfUI4wZdi1
BLdbMmDuPKtbLV8deB2ri7ZDgO0xeHSsugE2sN0jdhgVpfIKfdz3jJG+j1H2cjd0UjGgcSeQ07UE
Tun2s6iUxp6YjTPOIjIZ65mdNXZqSsN14Y1TowDaDTykw84/QWI7Wrkvz5+Wuks/bRkPN/6Kt5Qb
7Grm1oVj4ooRFQCgHGENwK3qC8KYg3JThbGfliJ9GkgLncCmujmmYAZOOtt9Zi36FvL2OVHDvgA/
UKo0I9hR2cHEJBj7qwlchuP3e9z2ARgCOeaU9m5e7yTiLoDZCbRg+DZjkFxOSSsEyLkTlIFXXsjl
c4IW08KEQuOSC2lUmfbMEJw0OlFnypt6wHtJrcgA8K8JOCjrD8Wgl+/iKYVVKihsta7+N5+aY6P1
1jMUsqWrU7kFUxHT/KONxvScFW44e/h6Cnm706cLt50Rl2K1JuOEaUUpcp+a6GXuwtB7QTphiQvq
U8JKCIzaVkaUSXU7cXn4D/7oy3/uWNF5DJ3eqka2lIG4713epEe8kV+TTvKDYl35uapDmy4det7I
6bNgClQYpGCabgUffYVmrqWdeLvGO9eafj7FMSRGmo1ipGKvRxfJj3589yqKZ2VlBY/YhIwUPHYf
FzZeHDv7VAIHf5eqAmqMb55BZk8rw8HtLFb0MrMVxHrqKTxe1gpvqyelZR/HUPzNG8qLAXJCCoyL
0Z+5/fsS/bJvbF8MOdNUg2ExPVj/UrZ/ZjfQsC4izdHyz2obAe+sui1OcWywvO7CTXeW6BFlrpJN
joSXX28t0utvJjr1XJBprYZEgcl5+Gw9sRRlINP6WsCmNpqih3NI3O68DPnXfdJeS3HbBmE7X1/W
+9zrdZFNBn0n3EvrQRsAyv7yqbBr34yiqrmMRPiuAI22rDhVaOFqkm3SV9rxcT77S8D96oTCtaIz
v1hb+DticnmTIY8XXBXqefBp0aSJel1MoDiJG09Mv+lV2rmdUqzERdZOzcX68xEmNpTwTTluFHYW
ecV5TJkxEWW/FMjv9T72sdcuAaERcBiA5LbwEV70sEDJH4tRwFeOVVY6WZ3urgjy5xZmUQFhtNfW
Hj/30QHY+ZE5wjZt/2qduluIaZC1XyQ/t0Fg9j9rw14fdZicM90BHiGInUlk5JwO0gOJAkaPz+uL
oWtUCbEkI+XaaWtz1eCvdQY4X2L398K8fH0BgTKUJ7Yxj81ritdbmP4Re33l8X3wPAeNhKJzyt2R
rK8qxQmU/6txADexX+KmVY7mqavtSTH2+mNTesFALneP51KT9TvgbYld1ppo69Z3byRZ8FtlJeWA
n6/Jts4nUIlnNkpTwS68Hj7KndqlSlrU/ersIqAVK8HOAGoD8U9oUzMbv0Zr0BnN2c4RGYySEu/F
MXKd2a/jvBIx6KIx1/v5wkGOTvIugZslERx43X49Q/Ktxhub1wYjqNoaZkCnseLsrpkTmt4xuIF8
upO6KF1w63hCMgWe4x2AxUh3xZ/5I6Z44R9965q+vM9lXMroScRUzAalVaJWhmVErmMm9l3HH4+C
DMFEcmEJYW3X1LWLy+JZUfHWUdE+ps4r+6xi53FnNnY4dQqiG/wDSTpFdoWDHbUBC2041rR0jMd+
gR4152S4AuPizbzY7Oy7chUcAiB7WjdZvmC1ojQ/3S39/W3DKMYkZrhG5nx9m82C76mwTY/hr6nA
NDptpWqxLZfdVcKEbaYBb+QNA+Z7xT4rrOYXKR8MLhUYY/E9voh+PoUmaI2TpoRaaWiPaQrcWrRy
6ifKwaAfay8etDyOrl+7rvvn7wr9QZUyJQ0FR9LK4sB3zEXXo6S/JsUkcMjGz2c1uJMx0EEQNm4d
w02C/hkdyUuY5FI4Q+rzIBqcbg0HAJoEViDll2BCw0J3deKOx/Ohso1pIOvO3fyExUQbFQXLubke
L79smi12Msh+xbwn+iysMiJa0/FmWU93N+D4zu/2i1TUESJyuSWov3FcjwTQxYENTM1SjkFD19Ja
Ru4fIWbOy5/PmkjIWmAlp3L+N37tcY5h3OtgOHLttpKwdiZWO1VAdeMvEGZvMmRrlR85yFcu9GN3
cx+8ia1wcJr+jsJtZmZ5i7MvXCFHqvVYxhqsm+3W/BY5L3b6Jcis/Ml6D8hDkfCdUFcULjY+LFaC
yEn2GqPEZI1Mx+oC7HNNNZkK5QHC2BAZxlxsFqJyJpfUjZGqY4IhW+SlmsAEdx12WW5djX2wf74+
FrXeom48t+96T3JHYef/GQGKX3TGijaZgp6PFX2y0ur9iQfrwgaNibfvwAayvaVjB2eAZxoSfgya
aRJFh2iIvUb54G/jV6OfKcJc+CyL7Cxy6y4Ja0MVZfWn0jgTrh18d3H0xhucsM9iDt8AZC9bWyN9
gR/hy8EYLhuyDEiD9rDpMdLktMdmd6IF2MlB09YgDo8E6kdS56jg8l/r6BE8xnBFx4CnaScLjcIF
iCMOvxBgyisUekv6zqokEysp0RGU7Iu8R/Z9vSMECAcWPG7HwPVCopSzz91t6rSRGQXIRIf7REx1
E2cgxUCBzL56Z4nWXG9qxromYSf6mo+TCwRp1/zKOX4OSy09DdnpkusULhFFNe8kO0aNISnSyZls
07n0Pd8Qs8qex3Qi/e+mEFUyBf7XCX5Nmk7HueGMGUmMO1C7jFelaGJs6WI58CaNU2+vyEZ+xhT8
xqnWh4B529cSBEIiZaBdU4M1IN5zLB8IFLfF3s3VygSuKjDA/rSycgSJi0rOhE0kHPcGveh4nau9
z+fxlIFTJ9Pjt8LKaNMrHOrDofIbjVfAOjm+a4gz2BSK5ZO6ELzQhOolVjLZS5kHAd1iq+sdDKlA
Daxms+9lR9V9t8M9u/6oDWvntMzCmSwptPdqtjX/0BS8bmpZOcYAVrdeAGNquPXl3oOyA2XZKRDs
E5SDyswlYVbtKNczxplsBjJopA3X0C/8u4fe538snFUWOYAc8UnishYtQzf2pWu38XZatGJQ6RTc
WODr1wGBhAZDZ9Iv2PXvPbTlSy27JA0yhFlzVMRGDo5f309HnBzRCJMh2WXo9ElEisXgNn3Mn8/V
toGNNlfVTAd/ZLknTqjTnv6uxXTzAq58nbGxjRmPhIIAFzs/3Tb6IqK0DAUbn2MLqodMUMFzI71f
Zj4KHmWrXH5sScS7VoWIBy1c/eYCsX1jDqwoY+4ZzGE0dT4JwP7gYDSKfxdOiacGaLpER5JSn3F0
r9MsXtcJgrycMmk5ifFjYfbTwBQoQWfVAkYs1RqBmp5qaLyqNMox4IkCHHk1+7JUPhIhJ7Hl9pMd
5hYuy28yXQTLvBpGgU1cO45LpYy0uqXcgyLWupVgDp/Im33y0HFYkbE5LsHL+KtTD9y013E4FT9Z
iBfUCk2n5DYQw8IvgwoypNmd83aE+oZiErUZN0csapV9alSM2iDGo60U0+wI44/rq2aVyMLB5Pas
IXAaremobA621MXurE5QeK0JoZd7Wg6V5Dy5GfpFlEDqFlM7nJnBooh9to0XEg9+qIbSSIcrMg9m
VsfvYJcSkuNXj8QV2yTYnWh39AU/C/ZSZpw8yrFtH/BVyjJhi9l5jF8qY945MzNU7fH15EXZv6wc
qgrMK2MRWwXprPSEjOFfl+OFPKJ02srN1epwXLxjLWWQXr1y+sYVbiN50hdLxd4Y/XztLYgcYUW1
Pebl+xqjKY7RbA3cionrneF/YwZhWbefxy4qHoO8kL/IztTe2t9Cxq6Q7+k32FuKdaEYIERClWXc
pEqQpErKPbLYjwKdiZLmD818AjD/GNR8RNoXgEmA0wR4k0PF3FIN8thg2pcyydvVcpN6sZVhuwzR
en7DB+LtBEIlLH+MUKcokX60ue6jBn3KLw2FJb+Kp9fmvmqNVY+W3laTrWVe9OyX39JA4Og3His4
oFl87o1cKcDHbpgmeVcrwslKUSC3ZgDmZId9dV2MVk8bnIiaw6Qs6cplA/RgL+TZmPvzFnD9JjzF
L6IMZprY1eD8AdtukuhEp48oM5P5ifDwYLisd2xXCZCTy1+IJMGvpTUNUYqdOnwFdoIgSpbQQioo
AcNTHK/NIzlSnyMZ4OycXeEkwGjVEQQOBUF7tiPXid+4+p9DHCbcyWyMpU449nmKvKy/+Lqe7Hph
pijq8BFqbJqZ7akAfHnG5rnC5skE76v13nlYHoReHFFAZUtrizyBvLbKbEiR2YpM/Ekh5j8B7yGD
X0x1wbN2NXMR0oVIY4eaSQnu/C+szsGxC35jbmToL2BHeIVsiVm+RJgvdsJhtbkmuw+t4gXp/goX
uAgMFvmU/RX6ylNRORpFDuGguPuz4johA/x7EWGZcpSqTJqdNDeDtv8OREY3VBtNp9qiuvlPfQXP
eE+hxAxlRbIqJSluv/1XaXqxr9Q95Ek9JN1NGD5pE1AuJWTl9adEAopwQGi3U8DQ92WU7LPjj9oS
PkJWgAhI41TT0fN48NGO1FzVqhHiah6VJ0qgbos5meekoE+bFW0zsITc+OlZYxy4xSojDei6sr+O
GWEd3/IZDfhrVtO/YBZdVmz5j8AKiB2DUWF0ddXP31nYIi+8q+C5WuSXwqAw/iD67A7t/t7f00yE
tpRJd2pQnd327BTmqsEgzxZr6KSFrj7hax4FdUaCpNKm7F/bjTUdefoFjHIF67dyAMbvF9EqnJDK
FQFXHa6ct3jDRtzIgOevVZg6ynj1UOwogV2OZdfB+tc68czZ8sf67Ra+mZvFnRMv1JpZNIbzaUwe
pVwGun13fnBtc4YduUBh0luHQQo4mc8m75uEpIlv0TPtSOAfdoROZkJM/ai8nTdlPi518Bt3to3O
3kBmsqLgqA6jQ4qQoCuKK6D1vQJiOZi2oHUUI5bNn1nrA5Pf80F5gYlJqniMuk341B4HyvO0yoXQ
Nw+jxF+9dB1dPIXk5+svFh/yJarsda9T9NxgMGaMcipUwzNKJmXLUq7q7u6DbXWwKG/e8ezSk3H/
wwKdJo8hpA0ezhU8IpLD34fxqbuToPaJXIG39DhWrYArDTPPlBzHs+fWU2jSbwGUAGTBoC9MNPH0
tLs2cfqkpFvr2tw0yUwwj6NFmY+qTCc9rDm2DGb2pjM7dA5aqhqyzCbQOfbaBTC4g26B64l0l9Ah
KvrF4LjVsJ0NIRTc0y0ohCPXWQDUm+e7vxerbLF9w+EJhYP0gc8+vzOPNB4wol0xKF/R6Gn/jiN/
esRgxU1xlNj37fqd7r7o0Vq1bc9vNJfxl8ihiNjjeNPzizAX00NLYp5lkBtF5Z+EOYr4ILclS91Q
gM4oPlQt0nOCIas6MzVkpChv9ps29T6vex7TFaxWZ/jkwCCeaNsVjFLANebhI+TQPw2GuAfYP95J
MC2xnx7U6k+gRZQVma9ASrwCqZWS2uzxvGZvBXBMJmqF8nz6XsdkK5BO/BbOBLeJ+yg6W4lF7bQ8
lk6z4wsW8k/KkJ1GnZdxWnOWXN/8DzJwRfYT7NHgyufCik/nMqLhxW0/pFeOaF7bSXzHl0eV8Qlg
hF3GlpKJNw4pLn5bbVl4d6sUVWLFzkeiRZnJEbj8tJAmvDNjD0UdaT6tMCfsKTAbaFne3E7UB5V7
+9tTy9qVf7sq/1i/iYQFTDen8YIbJfpXFn4ZHuhFeHzTlo8ULzLXBPaYjnvr4l6UCWHBOixGbHS+
30IJYWZJhoygmGU1nq3m+cjiloFSDh99qvbp1SQ5WQ0Mode4vyqJTSKDrpqqFdMMJHbbsTXKgys0
DbboyK+2nL6SCWzrLKcwpR3/BX8dQwVcMpJjMZzsFhoaFcyCFRU3zzP0nHaAsO2JJpBI6KwKEzFz
GYaXQzeU8q4LrcoUuBKkBaozqXaKaknsDwsUVNf1x/V98SJAcu9/98gvGapf7TR8ax4+Nia0uNcw
RaapAk3m84n0fAuF2cdWF0jmPWbp8GpTsxxNoIuO72C+Nq7dpzWsL2W8fKRYWSJiWsag9L3RejIh
i5OVCLKhkNDU00/WNGSd5AM8Ifyj2vO6iGxONkISWld69tGEDc5/vI+MIhDcjh7q4eODoq2AcAal
jraTl9z2xQdqqSbNutrOmhomD7gL9cqpmCbN7KSCVuTcABpMGunphY7Ftrebh6ehmv9chAeYv7Jk
OICjgg2M56aQ6q7z6q3pvOmMGTI0wDcl/8noT/bZAM7UXN6ZuLdQobfXsXBbkdmYJmnEBiNHiGJB
z409lm0BErdqMtxcPAYPyEwbo6fTfc2b6/dx7mKCRDFlKy+Utl5OpNPzfCsUFxqngnRfgmwJ/jzs
DHguGZGhFOkC9vri8MxII73rd8OD5dVzhZzSw/CXxhMaUrrEezfg910rcsfuVi8TT98rHvz+eeB7
o5UJKVzW9ORSQmssbS92y95FxmjiwWeEafFrqxFDgxCh+A1Tbq98BlTaPA99R//tInMtbRO4ceOt
3ZpB8ujFLDoGjb1mRMr7DWq5SFiUW42ZZe1OF3uXQYVMT9C9+/5xjf5jq3mTg1mjpFGCqfkh/3qY
fi/65DRNPf/dxWkCfnWOqCU9hBHNuFLg4dRX7+1ZKNpvgftZP7gX2bEUHpVA/QM1geWG7YoStRTT
C5wdpos1yr1qWXHo+p5H3xEoCHDnlkNqI+AhHus5DltwZEErCBiNZ5OWSQBkILpp8/MqDaKNT0kK
/0qOtjpgBLxoHBpO7AKl3xzQZGZgfLRJNly9IsQjkj2vn5iIigTZa0UncgPNIfxJwLh7bLHlIZu6
LB5tkuyZGRr2dG6JOoWVBDfZu60++b7jyrI1CcBt8iLIdiw+x7gM7fwEYClVeRYFnNnaBZNAJvxP
P2oze8YncTn43KEuAEXs8ZdNDeECH1U0JL2gj7Bg2LD8NDcYeCwkLP1f5Qj+Z/jDbsppixxt+B31
DVG86VQXW3ffRx6XYkcEXuCvnMRAcBpbZQ2CxeK3JiDC5zVXdxEQHz3HNpfNJdrwnN48VPQigWiJ
eA7/1qN+eqyl08rKvhko9QZkX1KqoO228W3hJk8/QJsjPPHmSKq9IEtTZon9e6kmSxqeBBfyhfXs
j2K24sl7iGnJBcVG/LxnzY17v/0jknuAd1WvwS7S9djzziiQz+KA9N8DWVumelxapI8KcpZuztSF
iqWcVXBhwYMmBwGgzstAcsVN810wGQ/5MxvK2wUHtX69aU9kapyZFP7q0r8cnCIPUcYCHDlbvNSY
w6VpJFKQOk4XRBXQiT1vcjoh+K3c4HD4Ky7V8VMUUDUD3yEmouXBu/J5nEtWe3pIOWJR+smVv8DK
9BYifXP//HQzxWYHXILo/PKcRoULUxtuU7ZUvQ11qbBI8wtzOT1F8Q/WwTk/CHuYrHUZMAf/V1tk
mt5ujnhWKMZ9UKKFO0SC2EIAPEbysnNZ27yBc5lpLt+e/yOlT4cJBpsK2YtGVQFHGX/BC5/5Regp
6Dq+qXx34t2HAjHCP0yLKY9I9N2vBO3XDjT0th032wHpqkJhzCUTi1uczxrP5mzQTKP21PB1LZzf
9Y9QQUk8TwZzdqEtjUh9JCExWiAhEJmjEOCtrjChyiuXCAll2yecjuvLiPybAs3DwR5KVdiHWHDt
5jUUg1K58Gm8UT5096me0Tmrda3naoj4yzvYDbfZdyg/pG4V36UUZySYeF0EFRw2IpiAD8s2KBpY
674uOl8EWtjbAFVZ8jE1d8Vr7WbbdWTHisA0u1PV0/1Iw7YX7AE7VALAzocHLfrllgaiefqnrjV/
55VNCXShaNTGv6pVOX121lDmBMM3AkAaYymKSic7NRfD/n+fh4k6lCAaUHsMBoPkrLne7EdTA+cx
UJ2+32zIkuZnFN6SRiCguqtmuUVZ/DANGSajDugN4x+qjjmilDp5VzQ7kOrAWp+b8uEkp1LSb46H
sUzJTuI5JEPFySrnbIqu5z3k7M6ZmIb/tWcitPt0wcg02svl9aXZSc9HPxRf6RXV3VZjDhbnKen4
uAqe4N/EaN1YlElRTvKInFVW6S7EgZnDbKcE59UsJyrpEnhGOaBZlSrx1Sk1tVGETZoNsnjIoX0E
cX9Vq3EBLBeB9QusgY9bwR9vh4WbsooCNVWCwdC2btPWS7oXinBYArDliUgB+2vAUhMq8FZJ+wFk
maBSGS8o6q2aoXGpwkh7gLJW84S8lLO7b7avRNxu06WqENb8HLA6zYm731EaDO8Cem7g865Ob5D2
LNdmhf3krsJd66KrBTnvTUuVpYn0Z7bLuNg+AKsB19Yi8r5ScjPcZ728B270gR9juRla1tGoOTr2
xHowr61a7ne+TcrCVVkn68ogMXcdQphmlF75ld6vcpzdKlBVq3QCAPpz87FLgj5sHUu+z0X9nNcZ
4+eHOEJSiGdlxLq16wZ0kRKJiZ1xKsD8JfBJFdT4fYi1ibqDcuxKvElva0QxCqFw3d/bbcpGv6fi
nP8udyDCvURIS9NHie36tVwO8DaQx6Y2+QIgTbhsCRszzAE0o+ZU2z8ZxsSQIPlOcEWIrJk1//0r
tpkyUuSpXBC+CD79pA2kxMMeqp/DjgM+/qCVjXQFuiQzZPNPXvl8GGO7/5M0BNFGuKhxFux+WtiB
+gjMSBUlUbYyYo1ZbPInBfciyPvFGVmRLi6arI/vRtYTr7X75ZAQatTeSXXUfLpCq0eMwCyyxCGB
fVe8orExP55q1EvuFwAJkizybV9qqBZMZm3kMl10h7rIaHRGMP1VY7QyT9+V7WtNMD/mPx0QxxbZ
8+A0JU9Rk/8raaDXZPCr3TG8oP+ibcIO/CfqnsQhAefgruE1C3ThQ+LlNUxxYzi13bIcmj4GSTTO
z2hQ9xQYYWqiSn7CG/1MsG04Bmlr67wlq9WXSQ5nkgHpw6JtiZeIDLMPGFZcTIY6LkXMnN7jWQQg
LW/8CJlgPNlNaXTdvWrxmgR5Ofz1ay/zCHDxj0g37G44cAsqEv8q2de7M63M4udfeuT4Hb7NC8vQ
dCck/tvd6gtYpFu1VHor5TsTJxbMew09pM3kksdcRHFvPp6mz+LZKlVhy+PN9fUhVdmsCgGpiLu7
E0VOoMOZZjDjubave3yd6ogU4f+PtBns+3eCoojTIovq/ZmTSTJAjMFVjknftav0h5Df3SA4DAs4
Ksv+I4Zn07rnzb3DEMUzErYB2jv3dihJqGWNxFPGZxJg5HEM9/W8w/2fc4VmXm4TYcoY3Y8BcHSk
nIcPPQ92n1U6C8C8j9iExZ0lANu+PgAsVQ2wpiWAEIyAuyueJfnR4mINjPobLvvn51o4YonBpSoR
qB6hOeiykIIhl6U0sjGZDFur/5fFpWlQd49Fz6Bn/3uec8Up6sXksF3DKgovcp7NKTyt/3xubPPQ
dC/NDdmltudMxhD5oLOMDumulh90rjvtK7lAd3LdhC5A+6gH+iU1J8MDWKqltxVCf7AByveB/Ky6
721Y/KTfMJogslFhAh4BcJ5M3XrOTLeOxw93LhZwma9PrzfG4Skdqi0HlZMXoVSWE0wrDEymVVZg
rJX7PQJhXpPP0ElkNCV0jqPrWUFRA7JkAGz0OGhj5TfpXVJI6Ke195kNo7zvgFUYltHdIcmznEve
92yqqewSZCLT2tAHvXa9YMhZEcXQbG5HZ6TR8c8Zc4QbZ5RoIlSJEYQU2kpMgFygBecIKEkBxdIw
2mub2BgTkgKu5QMk4gZKzzjW5VoiLtrjcGqtsx9hgrtU/yH+1wcuz/PQFWpDpqGIdHCt7gsrGA/g
bQEGmyROaz/0rxirCueiMW8aVSwWRoV1/HUQh1X8Ou7H+cOv1ZTxh93GP5XyweMBB/f1nDz8YiqG
XlH18vcmhppPDS+VeNA2I/YK1ySFHirt7leoOTwQQhZtB3farBTnazawcauXdVlCbf9BhpsokEyq
GtrgkSBlED7+BArWYtvCgk1dyzHx0vhme/EzZ0UE7u6Egh90MV5uOfDo58fRF43OqfLaaKy54MPN
TDTWQxyVWX6BGOEkkYHqwwzyqNnudgDEGqw0HwqXvvAm66yzgQjR0BeLwInSkjyHC3DgFJX45iwU
zfzw8ofzXYhrDWCJQkwQUjZ7RMtTk84u3Sb1mouZRG4ez/CM0dQhowLkpMIdU8d3oN2wYhay9ukZ
taU2i7y/FTEUjqw5tRPuozY+yr5LfHuINgs/AC/zlFkH7hVqD8O2sGgNV1sIScZi26alACwwwN3E
4AdILiesOxrmf1+/eq25u/Z2OnKN8PrssdUwY2Sylf9q6ivwDUvpRVSS92+ss39fC+noHsLJRNAz
xI2TatAQIiQlhlWtUlRmmAJhP13wEKClxVqiyd7hP0NA0t6lYUaoQLtzY82jw98NAhRczvm8pAPt
aORbcoFCY18hEF2No71jeGElbuTLLLsemeBU5J741QGxyZ+yf/RdMwzpEHiMCcUSHHDa94zrhrSS
uZcKuUibaSNYLrj6y61jLfwxsvWrTzmFPpZCMCA3QwQGPr3oBLpY2CnLhWjwdVNRfuJuRbvA0Wuf
uJcXnW2I+W5U4mv/rum+W7dJqBimGHjkqWM7qvMSjdis65APL7eSdT8ejIfaUhi1hfhpWrUWjf0Y
yfQtXsIRJj+aSLvdSA06tEjd2HMnQ2W53PF5XwNUxKJqETTqSgW1I4XjirBdapXIWevcd8dXXJFV
FE+0c8TV7Mm1IVFPf0vZ6fQ0o2DdNK8VF/B1ucO76uoBC+I6aaI3ZsQ8WIw7oEVNsd4LMLPZ3jic
XmXu+t3fqrjHpCJg/UvLPQdNvpNEnaSzsB4xw7UO2RWAQttzJrg8cpFHfbRFFVP7UqILoHOoxTOd
svsaDOdU70UOHx/4495jB6Qll+we9vV7fqLevUgn5qxRol5yxlXR/egnKC5HJ96BlpFHwG8osOYD
8fyTjpi6D+z9h4Wg2cSK3rA9idp7Rnnt7KbhGNVc6A4ilNIJ1MRrwHGz1a/HiC4r6xGErQDwOlP8
aVqtPzTmy9UNeU/l//a3NIzt80zIyhGVFdEEHTpxO3laFbCP+6iE7kZytlT0cSbHG1GwNNgRJ8FR
VkI6pG1W62QmxSfLjkv32jr8/H01qvCROFpHm9VR6wCncNk1HHO/WGKN27sfzEwhue5ntGC8wXxz
hpmgZIXMFaLY8kF90gysscc68axV/ouEJrQfJTMfHbpvbE996AINxL7yNqnp5Rj8oSz8viLF1Uhb
jmcDZJd9TKUkAPfeK9D9lKAEbpz6EN5TsUJHRjTvOIJLPCwG0JyAJXWqcib42PU9iS1A1OGDHLlF
UdQSdbiHGbaINiDdtvTIVeiDIc88VwQ5IH4rDQUIAON+WL1+KzM8n273MKR+UMDyc2NlubJzzu3q
r5zLvb6uhAEP1Ok5ZggZy5Bjnp347JW6sLMxLC23MeHxJliONg4j9Wo4HUar87qCEHkwNvDATAZ3
m5aPC1yFTsXn9uLODF0zJ0y/yJhE0kp5ReXhWbjVtKtT6DpHgD6yTWlv0TxeC//P+jp/m8Ep6D9W
Zvgq5Enct1YWz9ZUAYi9cyPiz1k32k2GvaDaRHFcBEz2WV2SAJPrwEQhtPGdJc1eZmYoYhs2NU8n
tgrRBFMYc38hNlT5PKzMm39I6+FJUJfGq/AAG5L86Y7rcoeN1ljbTRK38QArQ7cd6Q3Zb2gtIEyx
lby2lx5Ar5DJDL/ISXuIc2rq8JwDb03xq55TvnMgteagc5U/ds3SwqmfRdBf3lrl0vZUANcmkSHe
hwfjaKN1PsIur3GAutndhSDU41G5qfqBlLOJsurN+Jg3eBMzdO+a68dGLfegMwGgDspPZ0Af7nKi
F9pMdZFvkHIE6+lS43oXnY8/yZVgGH5i8iTh4vrXuiJMxNeqpOW9D28gkwDG+wI0mY+tCQ4K3i93
jBsuNMqMKUN2/9PjdMuhnpXfYxxNpYc/ZLCvsc6jap/G3Wf7PX+SxhLt/SGuKW2NT70SYfOEPUW5
iyiWKsMFXV3O496l3qsGX87ruz/Duc817KTRXEfv13vGq8ZZjpkYBt068hzvjpESvSIyJ6WArCQR
q8FwZFpXLftDoBKziwfXHX2Bagam1YxcBdOj4su+cybMK3GcgnkQ4VbbBKC3yQ03UofsTXQlPqxi
OxXD2klFQ99tnUw4WrtnlpYhp6I3X8gZWbVfkDhWaNmDx+Jg56O2kuwtKqRNTuqT9wZjrskJ+lE7
SGRAhy19VrGnek3I6d5DXeG6l8CLfBm1TEQYm5yVpxjYpziyF5j3zNRr5V1y2jIRT+kyQ/YO07Yc
5Uq4yqbRsxLA+wEuriYLtzlmqR39YpTL48fDcov/21gay+GpDPhMk5+xEnL0IIfrqqUSbXE+CUNR
0TWFjzIBwfjp4xu1kmNKOzRoe/5I0B5dmrKRQ1OtR5SIyRp9ZMe1ahJa8t0W/PC7RUjbUh1BTCnf
OQjE70YR4RJ1rFAFGeV24IWlj7CFVmoujZhATxu1DTQ1KOJloXGY9fZyI2QILRIkAl3OFJv33aiD
Esc6oJc1cjkuqOh9y5ZHdSr6TEQdAlkl5BRAEvldAXE5lKNJobFg5sMraQ4eJOt3ATXawF4XXGKy
S1pRN3X9SEd+KcyNjPhUO8HqAwSHu5TFFCOYa0zvTPU08V20zVAPps9lYoZxa+lTkb2nhrTt9/Cp
S/BkWmbtsYozS7m2yFsYQ+JA/BWf2ryRpk5bhNx8LCHGlcOuwfMzbhHhuSVDd37fccXMRBxmMs7J
vgIU7u+05iyypa/v1AarOR6qHiuIhVD0f5XvkVuEaiYKjkbUVG4DwVcTCZjbGPWOuXmdoGgAamTY
HnC20WI5L/19xJvNFnYI8x5gj90QCRYFlFT+XRzW2KXJ6HERuNDvd/YNeZ9PwmDN5A4Fi+FqDZqv
RGRCzf28NEIXIAUMO3FPkkbASe/kI6lY+IgIVT7d6MOfKPQtyUHeT9uaf2iBBunoJQDWYv3fb97v
uuUVj7jo4QFSVQ5bMBs85nDT6mDU3tfbWGuV2hmcfPuMD1wr3AKh/8Q5mz9FsFDgkZt5ldMSF7in
k93L6JdEf3zH/5HhA6XtfhZ5qN473clATSPXV4SCQkvzoOp4x/sWr+X/U3UmtCTfFZ31oPekfHRR
HC6K9WHO5s3Bid8Yez6aVs0oePWCtVpZtsgNC4YSRXw7clXZaZ/LsnF7ikm70OLFxgjH282L7ZXX
fepXw9Jxe1PqpTg5GNpmNTPUSB0pQkz1KIuSbkR5eBZcJf2fZcR0k+N7sVKrqdRo6QUejiaX/e6S
reh22ivbDwm43X/+SQHRSPj8j4jzpux8RCdPGtP5chy51/YbqU36/eyLgE+jgmvpMClb1sNWphkv
rRnCgMrUH+xDSgzGuKkctfI+k39apGiu7ziTj6OzcKiDh9A6aNNMISFPFVUf0Gc+ndUsL79Q2Unw
LrTNNEcMUhlSx6OlnsfFkFBJtzotfVbUEvB4JdjrP/ebTpQgI0yHAZkmFyq6gci9FNoR5gs27CMh
2CrigWKGKgqvkMsFgP9mC9/7Je3Spjo2KrdgI88i7hldIIat8WAUhqcoLhcD4LP/ycNoCbPYlVV6
e0sOhUYmMIiA9CcYnfMNcitRl15uWiCmu9t4kuxyeNUDiD9ezLZoexKztD1k8S+xdqimjJ/BCGLH
ELKSR9QtZGrG43KwqTPbkfky9dSTbTUxEFPf3Lit8BYfP7OTKU/WjdW7Zakrir34nigduGovF9ct
ZSZGuxd0fC2WpErSyvmSOzTAqWJAo3WDr6YrvpoEkyAeU/risgY2KKBetTUwm5NFQcAmEbi5SbZe
dSRni0c2XLx2JchrdTVnXLKV00rbM1KbUbXsaNZcS+qh/ZmLec1/R2VaNpxnbvvDNjYfh2nx4gJA
vwa2y3Tj8kRAvorPu6SB2kX31g6LsaqlePVbm7Od1lsOfGrKveYqq9mUdlFLjiXloz3aiqpSGjlo
piNFUPcydsxlY6EJxL6mBTwWzj4YfcgoW50RDJuW+iuMrOyqGCzTiUM/jJpOMTKGUUpufiAFcHM3
kVQ8UpKNt3pLthcoSu4lLqrF+vXgXPDkctOfnPzgueCBnBOB1THbDgcaanMXhx9yI+cMC2Xw8seA
CDRpf5j0JdBQGwqHDZ3Ck9fi4lKIxot8SzKpG6Wy5xzKlE9gEevaY0TUIMNI2JfraDqwXFeSPhLK
VAVW6fAHbqXL9l42iyeZK8hpNNpJknE9KuBF6dje8MP5oxBVUc+J5UrT4rWWnrEnB+hhRi0FzCe9
0BR0wUCwR8Yn/2Gnh8rWOA37Q6jnQPCKpEtzZA9UfVg5adrYww8RFrC6u1qCdDJajNbmL61bSuMA
NottKwEhCmrMuWSBAnRw9DSZUyUSIXZOBNoAlxdSK7V61nLcsZ0ogEPi/zFk36tWMf2fsmqQqj5m
08eFmBGRZPQtsRL06sZk1KSd/zpf/cXhLI4FTCbYc7Th7jagXLDZoMkPpzSR1sHYmV499Y0hAhWT
S2oYz6oaNQc1x3tqSMtNw8Ol0fWQQ6qVjWAUiDmBkcWmoNp/NaE4T3/rr0P0F/3HAWDS/GFldxNG
Qu5WoxkZUXWkO7xhHeqsm0u7kEJQTvb5rvpHhykQK+xU5+TAzsOUIDN7zfMWI289+MiakycqHyCQ
Yu3p73WVCuZFrrWxfe0awWbnr7mlBP7HiyBNnuy918X7WQFrxRlYBalYKBu8k38IZyLV3mlr5WT3
bg0B7r7dewZxNXkbjcrOT8yFO/9Y1EuDTshoKfyzP57YETOrK0cRgbJZmbzJgSSYjA3svK8T0XcB
LTKNgI56cqvpU1PrE13VlLIzPfj/D7kLW97VCJz2MpzjnKuquUPRvPDGEKn2ud9CM+MlCa/kSntE
H2dgFmqSHCgasLOYkyXW0/+M8hAbcYQCbSwmOYW9XYWghXsj4W3Fkpk+WLYDrFv1VniPnU3a9no3
CH8M2pjh79eBSBlwZgInjgUkBwZTBmusAMs9MN7WZTHATvUc/Kja8/izv/LDOYdKJbRHqAKD3EgT
ndzq/kx47rQuoHc4LhqeEog4R91O0toEIPEfux2Xz72Ko8PWCt0qiuVLvMV8396q0sVgk5ZfWlNK
rxJqIbPo84jjN+6JB1rDRxRBtj5i6OF9o7oFsPTX3J9/LZ9hsAOv5kDTxdCteQiFVEh4lei7cFQX
LXhXxpOKDdrSdNI7Kv09sMNp/ZH8hZWZ/RW6UM1KZ4HXRmSLnYwsCTPzdPPH0ND0f/s54X4A3IB9
K9EiaX+85TiTdk6iEl5VfST188cLQAEYvjIJxU9cAed1pDl+p0Mwmaq5SjPHUJZIwhVHF/nTgnST
n5Z/wQfh1zTUg+3EK+70gFd9GG/Cm7xtRs0JrnlZ2HqSnSoMr/8FIU64j5eKWxYOih7lLnvt0T8P
0naPcOQ8II6FQhhoSV2+0fWkP5bF3oYu2sRng0GkS4p2wz41kAnnorF8f2mwYA/QN4F66QAku18u
lh+FtsuZknc/VhahPIsMRZ8+mnDhPnuYhZEwUUtRBNWPxnOehfi8+xe+bPC1h/t8ObQ+lMchmMGe
Tp5+gH6qPqsXHq3/aGQyYBlgRcJOW5Rtwtz+I3g+oQjK6uh9twnY4AuKpmwHaAfQ+wueNOTGJi0B
9V+SgMgiOQMma4pQ/DxpGeZvrMcWH88NimtVQzaIQ856sZKTXPeOzLsoUYCLrAT55kLnbGbTc/2J
yHyIqRJKsFSG2A1/TeA3krnNk86w8lrzpIjpVKEAAj0sKWUFu4s+dZoaI1WJaLH+E2dOmjLwvWvh
DbEK0dtiRGs9mRuXxREJVzWxsy3o+zV61j4Q7AzLkg4j+gwUit8k+Qh72L/OQV8PFcCvlNWeGG7X
36+uSC5QFOrHwswYJLT8XRfTBBytYtmGVSvL/wcxrfb7sK8NRJg21QEkZHszqV7yyK8QH110Yg8k
9nhFGnVMPCm0TNVJh6jFm9c7yHo7ubK4CbKYQeE+c132KwA1z1l4xrm4/QUkIGJqlOyA2ndKz7hm
csB+kLSkt+cm9RmNogS2iQ2sAbl5kp/Fl2Sw0Qv974rHlZO7U0MLkcqBoyE5GU9mNrXTi2BZ0nIN
u+wQg1AobUqOzF8Vg0FB9kw44fW6D/IEQ8qnYY0BbqvVk9+cWrObqlctsk4q297bQjWYhM8XK7qB
3hT9Whp73a1NXzxYHea199s7bH/IqwpmR74NUUbnWwfTRbJLP9QcRtPPgi75Rk8FRtLuN8oVfOro
qE38Uw+4eX/WEJ2wH8GyelDmQZg73ZF8xbAHg7z9H+n0wHE9J96ikJgLyr8GBzcuVxzGH9Vatn51
SvT2pBPneGqRA3imdzVC+yPC0yBed1cLpr9IQPgPvy4M03sQhr1l2/TiAKJiiKSddc2hTo5iOf1F
GNne8Os7zajFp+5eK52nlDuxi22Xps69h5fmIKavdDy3Ml4jI1OcMloSiaElO957jni00eb5+hqK
Z29Mkv9umnAA7gpPb3g4wEalkw1OhjowMExu5DrG0oYLmSG0+T/KJCzu59c8FU/69U7imQAJm6zR
O4IGpiO16NGUnFwEB+0EJoP6YKl9jOU1rruGeq6FU/wd5fLpIwEoCW1ViZwRkUrmxLTHeWcww54H
i4eSsLNcI+Q+OLJg4ntJCewIAah0SmawMKiSOWzniY3mQDY2RN4sYBUAK6XoHrfF9B84jPj5OPFU
U/YsKO8JshYyV8pXHxOP3OkgVulIrpxjvBUCwJPy6sT4ZNBuw71/4Ds2CI3d6fAY7v2gOMO4DP8Q
y3qm40lIiLzie928Zb/DUt2XQpKtG37HznqxY/hDSkiSIsEiyV6srCkLlxsRsH52R3IDRBaxBcfz
iaAmQK9QJ3Fsb4ZUwQ1vYOTo67CY3itOIX+UeepHx9YJzERC9U3QEauL0YE2aj39BPpGhJ153Zky
wQX5Ih0jYtRTRS2MyDX9lzgspeFycxUrQGds8tP/8zCZuQsiJmPu+ggwtTfriKaJ3W6N4cSWxcg9
kDOequ9A4GGMUrEEjW1cx7/2/Cd5AV2dFHKOR7Eu2hffHS4w2ZqhST3KYZYBb71W7VNO3py8rn2O
37jweVNGfo94OEAqe6WpaRrLOMVbON1Z6d0SoUrY0UVxHZeo/9y8PBej7gGCToKwvXLobysrCvuF
sdc0CpSq+7ZVcQJft60hCIhh7dZRdntD2gm5HomZJwAazQvEXKFdalE7e1pWcbsXGHxuyc/RwDGW
XJxhGOlAP/gDYm6ZQpUIA7+k0BZu+EYIPMOXhWWKJ6PkOyr9drtUSqsNDKswk/cTW0XYLijP1yC+
oEHCARXv3AgvvOK4Hp6KkcHQXSIls3a7edz5XHBjQQ40PfOALZN/bmI4fWwCUbFwNjJmtQu+T2pB
LP5Z5WeNPlnRhr+6l8rY7T+DqIHZZ3VSbJ4uMt5q7IfG5Qv8l2/auU4/AwFATW27PQAspc54F6eq
F7N3q5mwHrccN9ShZQOxg3DEdADDaMR9RAIE8QB32y8/zCc7U3TiduB3X4YIulMX43lCYqY2sEEo
7g5pQhJ+x/12dbEYMfoWe6bsZ7bw+FpKFLZhVglfQLlooPym/8RJA6cL0U03TOZYLD5zv3aMcePf
30k05MCXTMfHE2n0sabb95NrF9qE3JNNq/Opn6cOu1jVvj9HratUo1Z3k82j7pS8UiowWLB+r9rj
C5kbVAq+EUPvyL2mnHcmypHi2XNsxZrOUoCkeksRiGQKvw95IPNUMouJ0tOHsYlxdWjBsQKM/El1
2z91E3u0SIpRAU7sX7ObgTTuNI2FOlb/xVYzfNZxZn3U7GNA5SeMauu3+4pJa7uMyRPodMzDlyqA
wueiuRQyJslbVINXURaH7GqiOeTfwzQYHOCFeix+XlaLLGWd63DqXVkz0eoqrN+eojM/tFyv8QKl
LJiaePPi3UpJrtn23fX+2L6WjwOEDSd//sug+VSf+Zg0539T89+Cyc2lwSmA9kRC2piFCoywPu4S
tF4NeWixcy8CBArcH0szVtIjQqDUGT5h1zaDKyS6FsKfbZfO0vO+L79MKaP8fQuwTmXTHKYyiApd
ZRgq0XvRf956p6oGKh8sxKggK3ECwJnOVw78bmIQYB54ZNL38s6UT5VGx3P+anVuWj+tCf99JA3I
/k0pFzoH9lmQ1T3UOkk0ELMdydZDNMqoz4LsK+QUBY1xq1Z4j2Qlq73kGul6/e1Q+Xz4Ky/faTZv
Yg8xAm4EG21aAlr9jEdWPNnANICcNWauqgVcE/YwgmYhQPMRH+WxKZ9CHVv2w0aaowh/t/90qZng
vzNXgI12GqcBkGyxQAZkTyYlZt7YP+97uWNyPWmzTMYktgtOv/xo4ndOMK6SWnNia+dNJAAY071Y
TvewWGVLdbjyu/IMi1ANKCtYkEhr/fgFvOFEBMOgOhSbXz+asCovh6qlNvJHzkUrX9L9BvZyZlqc
HHNRIXy7QV7cxDYE5+Khefp4vA0Q5fa3icgHoF8lyrtgaPj62yHMM0iRGDDyCl2TajoCmJTcjgUJ
X7wdzM1H3KcAwNOTOgH+M/baOSypKJCAnGwustCb1U+I59oSoayfPt9RagwQRrNBecAcx9Z46Qpo
uiPeY5C5smJ7e2JkexiVspQKlA36AhHC5yvy0g/nqt0jlAXKdbrND8DgUoWp35VDSuuxtgrWQ4Bh
4idCbdN5/F54pP2rSUCsumtKDSgbkgSbjtpcEpvpOy7MRVVOFgCDHsrE2+6c9Mv5SaKbJgrxaXf/
bUXYS+V3eJt56+fQjxZKsEp6Rz1co1cvqsJpMfsdbIiVincLfBrLgjVHHImKXTvKp184ifOwFrb7
jVrfxV/QdOs5z2bstNp69o9MjF3AeQGFUACeZvEX20KOOYEhf4rcKfKzgcS67KolZ5voCeG1EZT2
HLKh/vIwXehJoK2pIhJlIDx1p73zbOnYEgnmzAgVUTSVQvpeh9ICS2QhqYUBzOY9eIHBtBUsNvIJ
v6V7D8ztLypqOu/cuTt2rVn1TLLddGYN5sEhpV7vbfcJYdhlPaKB05Acat27ghVop3UJ3qhaimQf
XreX8kIBXFfWkr4r8CtKhhhy/koU/5oxb/lAMCm0yRTXJr9GZD4jm+Mw3EwGx2eZ6hIeeVXPovGr
+AGJC89on87b64mljM2fYtZH/ceYHOAlFfggmjRxIbx6A8WO8RvZTStFph6pWzb+QmqOs7W/Z4Z2
yGvcsS4KqxEa0izhkpWD7ykiXGpJb8bLD+3TOwEm8X+KgSCCYK9pZLkXFbxLwOIBlSYhgimIRW3b
CvPt/rS+Q96DKdpbL0eIAYBGYVcqfvCl2UYLnzD91z2mv3kg/lX4YcKVfJ1P4G4c17yMJLWfcGhQ
lN1RPvtW4fBLAjta/eThLsyyhdYo6FYWFVIcfqExXsobOPOJIbWj7zKYN8Vc2fQRjxKBrSghp7Sc
yMjHEGvxiX0n+fZOQJwqLgW0dzbipto1xgcgncWQayicHxKbDnGaFvkTTyKe+QPAPS/eN7blrBuz
E6rCHVkohhRLxiYp44LCeg2tfpILJV0fXG4Ev6iZtBUypPO+pyJ7V1xt03Een+s1Ybs2xA4ZPC/u
YyR7jve7krkZcSjdnj8dY47LnjJ/PKOv2cjzGdFAV3yZXARvFbEJqY4OUu4IljTKdQ1OfSpPtvxu
B2Rt+VYmwU0lUdHGKyBD+mWR2StXdo9Zb9Ifoeu9l4gtiRvywlHClPxo28Lz7VcMZlY1Dq9G3leQ
3dAEI508o7Mz8L6OlZByylGEjM2j+mrcDAstG1uB4u07nT1rD8oDfByE4QqNC7O87jR+z/nJ8q40
CBVnF/s2zsNAzhT7IIXBb4qSj45uYZDpVjLolTeHVU4XUheR6CVMURxTE4wTgn0HYq/XDStEzbA1
JNRk02MdwjiCHgG0DOj9qC/oapd3YUYWErWiDunPzXJNoJgCijrn+4/OdWmNUMiiy7dv60HMBUo7
FPalPWQA/eWQJsOmORbWa9vpVHs8NbPWp9IXjZDh7ykcsQElF6fjbAsViz2UgxqN4yIkn0OitdGG
yyy0bQR61vRxsTdjiGSfAfy3TqsObuuNH0smgwSKnj8W6BGb2otLd1deUP6hjKitVLVRwWc9F+5p
oWB8FJuklwKZkFYoH/YJQINoxp/iBxLZaO+exJ/M0HAcwPwuu0RJcJgjPei3ArFd7avIjbVrxLte
wVa+VwSrdNPLENlFsC7A7FpUzFe5yYZtPZF8dLUPpScD33FNTFm8gef44Es64Gw/Zkt3SaPGX5+l
jjd9s/RH5/t+LvtNQvPFflLZ77krxQJiljzpydohIDqktYm5GT1rEMzln+KvImMnjtqvfx6SebaH
74eZgGj8qWHsIksbK/UUudYgqUmXh1695Gbfk7GVDHHhYvH+ZMFlQ0nfE9TKxHh19VSxaI050tnf
8bO6nog6538XbhIWJwcGvGbaZu2am4RklU7vS9UnBfpH/u1UP/agYpH9dA05xgDLshOQ6RznW/rS
ztI+rUA/FsYLdmGytdKRWKVgjPl+m6v+HNT3/kVJ3IuT3C/85qsfN9oOgNjL/d8jw3Y3cyHizRkT
6py8pp83cUPq+W3XYqCII+wDk/GEQZK7weyRlFiWEiyRqAoiMwlyqoaKcZnjLmULHt+QjfKITpC3
rwyPjm7NptbIn7hB3H7yoRwz+hBI30denoluATgsz4si6triJ51GYoedM8X95U3gBnD7OESjim42
vnv/BrJLnL4NAbuIDvvLdmfYo1WEbLnh0paMa7/NvXR0U5Aunq1fZGBK0i/7UG+i2S9PbPQpuafL
es3N3xQGMfMcHKtV3WPG1zoZroh/tAeMJp+3rO2aAnL36LFEkDvVwrShINayxmP9gBCJLY+zDZ/p
hFq672y5jS/Cg/U8G6hVnE02+QFltAdgPF2VpO2B07vpd67Lclxil/BDB9h+Rf+/aLCh/K0o7tzc
4WH/WvG5VdyuNv3lNM27Yy5l+XCTfhqAaOMBe3kImlspXFRFYN3psGLO3nnYXuY5jdh0WpsN0cin
piBgGWSJsIrNpCRqeHlTa6lRGoOigimdXxPAf8enHFKOa3NIFTie3rjydudldVx+YXVe4AY4ChYc
0Xg2V4XtTnFBMtvLspuyKmw9G60clK4LO9dC1JGo7SmlN5xzYLdFhmUoEXt0rG8N9IaWmASFcFp7
PO5WmIPZrm7TbdYUmHaeNjaJVlx5oeb0oxENFch+Z+RWO0r/+GLeCjRWEe9UwtYfeoq+G1uRMOJi
5HlvWkkdRJQwAYYxJxA0RaLXfoRv7lKWYOWxPm9/BhqwvHr7MwWTGYxirkLwJTroT7RAiQ26U/Ys
kLhjqIqBmtVhxGDTGBp5YQ7HREtlDePj2tUMzwBJQR0zr/0cnM5jIUrsfnt379eWsKGvAHa4yWDY
JJLOyWQmfgyfVeP07Xu6fZTj0TKZ5Pe0dz8PLLqMbDMeZYTTCu80jgxjs+hbs2V5cKELSowktR7X
ZBHIkAugicLtm3vBdgFtxPtAGtJmwl9Nwa8SsBZ0a8B5j29tXDMwI/xUFwjQrixsflpVde5DApwI
tt9nc6V9r7D4B3w5z4AEUd9b6hT5o3H6R2MuZNdjOO/jJK63wG8kehegKLBzRMQGakHt2eEWQgQ8
ARBVYirMuzqnj6RWtu6OOVfRuJQAIf26DVUZ8KRWZWO3UvjwHWu/21FVqeY7F6augGwOOhRKti9e
SwpceHZCrh8xhzAFlOb0741PM/5qfXuMo5zN+T7u7rQD/IZpTIE0wSUCbaiG8KCLCxlFwTfP05Jf
efa5VezrYzzJ82CzdOOq/hyPua4X44E13ml5HtbrDC3L63+z9EXKNE6yQWiuNDzkQ+bHXNi7vXkl
CWmGl0ftqUYj7+1a4kc2qIicNK4AeTFG1VnH6jn+lXEcPC1lABIuPg8GCp2ar0gKglt8Cm1XeI5Y
aW8KDj5TMPhNyLgVjnor4V6aNoYRZxeMezVtU8na0skuJbHWFiTBToEV0qvWHfDuXfgN9lLw6kFU
M9ZcYlNA1r+KtdDAcguQ6X6VJ24zfT1rvKGWDY7WUQTX/GLMiX85Xs8JTjc43jZUpmKZYsa+EYVq
07jpUPMvbOrEkck1yJjwphpDGJgN+KF4wbdmNlof4i/WrP6xEEmkI+7mA265hWpqMBTTlTRgXdlO
eNyhAv+BctJ2/Kyf2X2wHVQyamWlWFCGVr/lRB7ZQMmg7+7M5Ttg6Oga1wVjowhADonj76/Uaedt
99hQ3BPbPX/oj46DVh9rM2D3XXjcFvjnjTZCYBKV393YS03V3joZkYb56cL7BrRo5h8Igg73Fy0u
4fmRzKW+nTAbToLAtIeqfRxuyyI/wFvUqWViz7ApWYZ9ig/yUx+fauTrREJJVTUuXArFyYmL3rTc
X4S6CDz1MKsNrzLQKq1fwN5g+8KSShBUtz/CwA1ucOb6sgW2tqH6NGegkGqb56WBca8svPzA1wP9
qo7/z5KKc+W2b7L9Lr+qzIRNVfESdiaZkILYIikQQCTDNiV4Wizbd9yBCPoXgWqQFrY97h3Qso0L
L4qcDilnqCds+J9UOpxwTS3xbeOBLL05rrf15MblAecXg/MfRdJmh9PcoMSpka1I9w/jUrzlYfwm
qcyK5/FxbT2MuhFKyTdyMN34z1KyXWSFw1gYzDgBQvgM8meTU/+RprfTiu43ze71AIJgI/lsQCWl
Wi+cWWI8RIJoGWYEsbiPnaV0zXLtrnjJEtqM3mdUwFxMo0/84il5A3toxbmpGULUia4MDOPg2Iu/
2osyk+/mCq1PofvJDlyg2XFia6iSv+xLoSnl4U1xqwyd2r0cdug8+O5H1zRdJCkTFZ1yu6JIqQ+f
9X4ZOZYKyyfYgu18IQw15D+V9gQvCZ1F87qSWuv3DkwVq4wJEw7E8R6jCnW6v7nT+gFi60ePIRQ/
fkAjvU4xUhyEqypLKak7gYcjmv2EUN5UJnZyLDCdWgJsqaWv8J9lAltv5ePqVAOMFedZ4xlvxQ1U
LKxFhmnIfpC5pkmyzGESROfvdFZNePSKzPchj/gSqSpkqAC5QIMZqERGKpx/sO6rSnhMw1CnIth9
gpW0jRfTOBI6xxno7XXIrAeNZ/csuHNcYeGtQonmUMVjxnryaCRcmXuPJ3EYhHeW0VfreSISbHB1
LXlK6OHNmg/nB0mBAvcyt51Y81RsNxsKFXlOM5LFHLSl9WYNKmX1jt90A1qZmot+tyscgeMBMDis
vg/3nn5udMvSn4UgqnuWZShbuZBxCnK2i2G3KC3LQAGRkkbf3Wu1F4Zd2QWoskGRT37sQ3ox39DB
xfr3/VbtPVe/FCeKR/kmFV3LprRspODZmk/pvqPidtVMUhHAC+Dp8e7NyWIXp5s6JnUWGHfPxRn+
JzDvvGqTrAPjcA96g/0smgPlVYjso/bdw+FXy71qQ5npiVW3PQ2o+W3KjFHFW77Lr1742N2uId3P
URHjhCEAtkN44T/qz8j/x1r3J1xclQv1tk6UcYT2YRgsa3ncMohurHPWJLUENyWVDokccjq47AUL
7KxjkqRsOaYU8pelmG+Wdu2VQ5g4SMp6WN8F1KkIXVZANP3BkkJxMx2xyPuYatP4eCbZqRJu5yg9
bgPsr5Czblbcre47mU0L6j9rR6cPdinUX1WqKJQ0GDnvo8cS+fgliWJWpwmmFrQUAHpU+JmL6uW7
8koHZ4v5gMcGMTvX0nDZXxbDHLG0LOqoQ/3JV2a83hctXE07k79U1Xaf5F2DPjsTHqfKaGYKBfEa
XXeTwm8OtNkB3kKU26fwG9peFXAqBiyK9AhXl+jJBAdFc22nVSQCZgWe87EAaiy613ZV9RMySKkp
kl9YXa8J3z1xyeoRSWjSmCImDPGC6aAU7YK0OwEYJDo7GswgDl3zGXsKF6Oi3WkPuUkpCgtygYsO
EqThss91/f8GOwwJ9JIBYg3pHRYIxHQ/z1Cn0gF6xOv86s2MgBxJsnzELRYLoQgLqOKI3NInH7hj
lpu41NeHiOd78VSx3g16s1AS856bW3VHEZa8MViG8nPP3Cn1bEmwYEbNTD7V5GKH9KCbHrvNFmwd
FURjKtZWs7Se+mlVmniL7sdX8G6R2qmyp4WZTClLfUtjeDnY8hPlFdRC9cEo553fiMCcva1zDeKP
/xzzu2cyScXCHk4ajEQyO3gbhqfebLlZfR6KZRn7bgLTDb/T0zGbQVHp4LJg1wsYh4mvfUdMygVE
KHfNCm+3wxF3mq99STCMzg0gJi4+ZkVu5nzwgz8TW6pxbHZau0Af17w58rDBakkJOSpIJU+RkdXZ
FlRxOUwXaTcjCeiZ4q+h8qEREnwJ1/Pe1XEReLmvQw7vGCi5p7aoOMm4Sx6uq9O4A5r2X0xvp+E1
67q7IeRtwmEThHvT1EDqedUA7JngQRz3EDS7kgtfiBQO3DJA6TTNn4Nk7JQ/jdzNWiKcSFqginKG
pAHLeaM9uxJVd4/N7lQf4fpm6FFVirTgR5K0dyqm3MoPpaPnzqj9oOB/mUhcGgMa9Kn4vYRX2KN/
FrZmrQkPA6EY2osOfoxf17Lp2QGwLZF3nkhN92g5yJthEXURDNyWKcN6soI4+7SJGqDb783iR8Na
+4dZletVfF4Bb/48DlCU8ZmR5Pimfn9gXGpq09x3OlOPwDpQ5UwJjR7biJfpzXdZtfW8+FEDsxlT
B2bHXxroKYtUH39nzBqt466MvrFCsuHOTT6dyXyawazqEkgSGx4qGCHRNDhnXgU0mnCL4guFzXn0
WUL6F7gIxr/IEtwfzOCu+xhEAra+6wxODHd2zITmzSoF+nTvXntBhe9v2pIRoHYZ/IrSQt9jxf/R
ux20AQ+jlnvI11F/LcMeL1EBq1dY8rUaJgbqtsEf0YegyaFG8ISFPApd5RS4n4DZNIu0M+jrumyO
VmKjluvV1EX8FTKJttm+QiUh68UtyH6a9pC1f7bDm/tNolCQlKhmXjrTcfzkSpnQrqxFvOCvoBy3
lLm1g5v4bvdey2OlciXbQ7uss8i/c/dSQOtuP6RfuGL6FtcLHicsvlYR0X4jLKoqsCUITrR17/jM
vHITQFazGD0ZzJgU8IZho74+hOAcnt7F5MozE+eBJIUu1Erppn46IEhqANl3iZUdVMFwkpdZZy38
wlmUUYhQ2j48ODxPqlVRpNCXZjFGd98sPRfbDLSHo7g1VX80YCRNE4LjI+za9SLyqhz34qHydijx
tvQatsU46rzFvZuRGfEKMDvk5pCdWAZg7K1WDhg2zf44R4SulaEtAKhd7j2aTku+Mcu3rzVZ48J/
17uLSdMztW3EgFTlasRS7K6igT43ge59nfQ52a10VlIDdSQjc2BvAQhd6LDpuj3SnLfebZVI6Q9S
VPhPMlh657Y0MFpliraG7vnOvdfat+lfY1Oij1hASrcy/9/JTmpCpxFR0H5WzNvJzbVWukI4vNkb
QzVG/KOhOEU0zfM0kCbUs0E5KEfTbK9469myV9o4xMV9kZH9utjrBAQGdNj5RzP7Ux+ZY/i08k7m
0nZzgDJE+siFVjj8VeEdbppGhfjCuWn5AdmIwOV/KF4vhgzVRgjbzClU8qZ15y/XuKWEx9Ub4Mu7
diFvDwiHnmndX62/7+Fmiy06tlGrfHtypEY0luZeQ9t16mqd9WEiDmegZboZOGLSB84jXe/e82r6
Bpxn5Wa32ySjoqgDYHrOS7H7pecmXI2Ol/iZRrFiQaKJHowT9r9FKlYwZoxy5HF5xZ2oqdtkNPEK
gq62nXVLvAYipnjsbl2RbKXQHVGBa2TJ8Tv7D0UewqeoB1EyWCo9oTYzlFq04TQ81zFTmZ+qA8la
lXWrZnCTiR7ofunzHqoG5N4/CWeYtJZy0ATbJ/VFT8PFutPALc3+1iUp/uq7FN932glsljhEHA9+
tLEYJk4v44zyZaPNTa8nNj9DE1WkDyWUeRfyuhGn3MxgVx3f92UOs09nPEJcgf+PKkMwU2iphqpI
SGJ0lSHUIYubEXS0nAw2oAXi2NmvDnI0XTWclmj3HemGWM0QCksb12Khp1dfCcff1AJEsoDJvCuu
gmnWdopyJBT5cPyRB9NhhuFms1WZIszydtUb4SRYQHPbl0MeSpQ81u4xboIcuSYuDy71Arc50FHd
4SxP/mLRfgd95DQiiU5d0swWvv3s4+RdAjuQzBbx0ZXeXzFlDz2UaE6W3ijde4Mf2TMZ41zcXctS
zsNPtjhKNU5bAla8OWcn9jm3JPPv1aOYGyCO4hzdyL0mRGGldo3gL7G1h2i2lJa6eY6Yyh3+0qDr
UZIIXifHExn5xzRtiw+t0nY/2zX0dnhdvboUD9VII1ghlPz51VnlY4VBTbsuQAcjZOtHC6jmlWJk
hUAcoCmE8I8qNKlEF9Q5tBi5byyOm93F84DBlc4rcuApX6HDkt6klibQuiXh3I6t04Dn6KQ3HIFU
25iBEK3+Q9l9ihE51CIedjg9WBE0DFh2USMcnx/dR3POR1tF2EIpy8Qzf8GDDAF8bGoHuVTwf0X/
fWZC29+GbVUQ1+hEEwp1zXFZhlqOVAxyHNdbEodvE+0zQM+6+hHHdgYrm3vCc+ftDA4kt7yTIY6u
botobzqGjo5bkPBU+QSU9CguZv4OCax6PhfksbsOyPcYHHJBCmCiipYEj7qO00usNu9isuuOuOkg
cusnD3A0zTFoPG7U08Jw/ERuTOpUO4yVoGjGcLSWGX3Td5KAt/u2Qoe48Sry4QWI2FQyvu7EBgG5
4Ev3uig4pxOsWT4bGaqvYM9tWywe9nyxrNs8PDtYW65SdEaz6luDxJHssInTPDbwembCtASl66rW
b0UBiidRKuFi5TMJMiwjg+foxQu/HMftINlf8pETn5O8C6xcVYuQ1FQrQrl5lF+hhgAE3IFhhPJ1
gwt7Rfu2sFLihnxc7S1Csn4seNDpzqIFfxnL9C8aKD8Y/u4kA31apxbHWO7KrnvP29Kng2J9/L+a
jKkCKcaZl0mBEJPTkbmFHAHOhoMbROF6NrJQoyqZeRZqX4gCNKK32gN0fujnCAj6uiY4KjfCgYaJ
nq6gyIslx3SaL3ye4ilyccZ6hSF3rfjs8gzvCiZGiHmoOl+K5TbamvFF78TSdnNl6Y/F4JaVQDUc
/eOA9v1lX5Nj++Cga9aj2OULg2ioBK0ZzF3w8B+vrKcJtx0FumaXouoz9WssXFyZNHYGozKFDeac
BYnGNrJMCzz4purUv0nWVwRz3xYB9xIhQ19LWFpA3FKAjIKUwQDt7lK3tj62cq6V3/Ec0PHIBl+D
6aSAgCNbJsm3ZjAYBkQc6QZnHej4MAynpZ1/2GYDBvLXgD0ZQKAlIhcgSZGUF9kBvix8eR5Ogf7A
BOxA/qd1GTEbwVbqAURGGsR9UFZn78WB20VaDTmAlucUHXUEfeq4psC66XtrbEqfg0mleVN4pU2r
PyirZAMfrNa2oi61Dq8NXDXXWdhTrkNkUfhhnn5ZN+PtxQZUWeCKUn9nyUJS2Q1jyHGmK9UELYSH
kBbhyOjSUEQVglUKe0hIdFGopOtfwmANaxKQFgfbj6Ew10KJsfBQIxWm6Ko8NYDgYe6bO0BqCy5G
c6eAhpTkGYhOwSBeR7qtCAFqCTdAHpdV/6aHUiliRQSFK5/MDDQ5XIDRrpgVnEGu+ffITrWbOboT
gtYfvoO3YG0lcJANiG8qqE9Hkd8Bb6wibLT2umHoQNYGYM75r/NvoY/hoAM9slFwtSMRIGkJxhn7
nEHgftCrVsrbWh7WKzvKunYIAKN2zflZ+naVgevibfYc1seZyXcxMGv53taw4uPBr5A0QIWhpwLe
HnSa4oeoScvy0X5QHueS80PHsbZrNIc/ZVuwOFFBCor3fUwHCfrEMVHd+Bv+c2jcY7isd2rgCLV+
CjtghNeD3u43SEiYBcS6zUAlxHw5VkL2CzXe3uPP+ze6Kczz1p3gr6aqxaqnCiUwCslC/m4PgmGB
lTzaLQPjf7D1JHO5pkXQkVRROW80oHRs9wDOpgq0yJ36WOg4RM2iSKwSDmJ6ksJsRgZ72MHuTx2B
yu6KNA//SVJsG0SvyRzlTIwZuGoKPJjfHZodZyEuEShYhbLmi+hqLhKu/uPG3gYADKJKIJRMXtVx
Uu8pKynN1IwNdceJ+nBZxoeaKT/WHMLHWvNwcYjbS2R5Kfqm9ZSbvuwV0qgwbRw/2jpw7Tm7eqvw
N5NHtwgLzg1wUrUtbQlLYSX8ZGM9aFAZu+NoINt+zYYoj3UnjX4LDlvl7ckgJYzm1VG1qi1hVqc9
/CiQUa2Ax+rBlWFNNUgCOopcMW1lvmZ5CcSPjSuGfmeqL6iykZrrIdvHos7JkHNLnCPVwTjBHtnb
2BUpDrQ4YxYAW3h5L5phTgKTVhAzji7XRShURWGNUIJMe0WIaXw6aHgwr9JpvixiW7g7tBTgzm8e
iziQuzTTCFwVgA0m5BF3Az6HkF1hg0ijYsgIIQ9GIuq17KDFRNpPKsNOUHagbQCTnR0d1azV8/Ma
HTOfWh4kWvThEk1Jgd//XsoXNw2MLO7mWivttA+4eND36FI7QITA3cER4ddhPoNPCPyB9srpOVFv
K3u0nYd1ZPqItiu4bhNVG3PiWYrD4c6OnRNHOGUze2qNmopjiNP66X51HLeg529v1GJPEbkyxCRv
By87iZaRM6oHHkQlcMx6GK6tdelAjWL1c5RkfjDKrHum0PYcvxVBPuluBSVwgHaD+lqIMeJTz+tX
Y+r5U/ZDZH+wvm/clmPcQ4dTRD6jFSfHzAQ7VkQbOw4Ht1ucKBNz6D25MFhrJMuH0ThAi4ueNqOq
epR5zUyQRrWOu0dc3NABJ4O1T9ZMpdztMY9/xpffkp857qImKJf4bNtDU3JgTbJuDjmFtdmMoqxF
SaiHmksF5BM81BYeDlO7z1bCCmoqC3EOYa4dIeDTKOCS35z2BeA4EwwKykK+gaQsqC8w4v2a9SF3
CIoBSNhkG4m8Vv7Dh8ln9WoEu6WBqi0HvmOKjyBsbZK1nF0vgApc/H6MzEpPZD3+dppklPC+QOwu
4+5Zap3AWvL54IRbBpcyH1CluMkwn6f+dmL7G0oo6IR9TYtLGej6lofN0n5LZxqGx8MAVMbbkAZL
Jr6GaKek9drM9DKMcGSKlpGb5Xk=
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
