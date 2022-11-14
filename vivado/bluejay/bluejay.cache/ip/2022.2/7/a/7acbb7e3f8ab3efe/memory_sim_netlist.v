// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Sun Nov 13 21:38:28 2022
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [6:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [63:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [63:0]douta;

  wire [6:0]addra;
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
  wire [6:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [6:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "7" *) 
  (* C_ADDRB_WIDTH = "7" *) 
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
  (* C_READ_DEPTH_A = "128" *) 
  (* C_READ_DEPTH_B = "128" *) 
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
  (* C_WRITE_DEPTH_A = "128" *) 
  (* C_WRITE_DEPTH_B = "128" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "64" *) 
  (* C_WRITE_WIDTH_B = "64" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[6:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[6:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29968)
`pragma protect data_block
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
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
