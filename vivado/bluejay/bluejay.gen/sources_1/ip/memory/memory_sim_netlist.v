// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Sun Nov 13 22:03:37 2022
// Host        : seankent running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/seankent/bluejay/vivado/bluejay/bluejay.gen/sources_1/ip/memory/memory_sim_netlist.v
// Design      : memory
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "memory,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module memory
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
  memory_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29792)
`pragma protect data_block
ARCeyYo1nROS3GY0pWneap4DPwONGiMT54zj/ocP9EZXHQkmN4gRmXzPxgmbTv/q7DqZqdkfZ/Bu
y/qrO8xtQhN5mSQIE03NLqXCU6wNnbITwgO65AiGhLZQSswwXfZslvCGSBu7OEhs3mg+lwTBfmvY
HTsyLsUQtOUmE8aufX/Xl6BJ3CasgpPNuHiUo7mxEHm4c4X7dB+vkWRL2oVDKhLpcDp/l+Fhtm2U
//uQ7D1A+msyvsuF8Lydvv6xPDmXjY1gFFke/mgBUtJfheHOT7oy8uaGyIStAlj3rwvtyrponFX8
hwRiWilQ1QXivUqrBVoHZQEFdOnZRXhsplnRhqvrhBdDsSKWnc8b59JMCMAqdk705NA6V76lfw1F
ZGr8OVrnDT3aPXhT8fLewi6RT0aowpknI6x3LZ3B/H5W2qFo841YOPekBAvGoArXt51SEZqC8Do1
oyAWSYBRIaazYWhk4UFpCGrPsv20732DKUGyhkYBrA5GXZ3BNq1/ScKt/odIfWiwHexZ48DmfJx6
adqHmRcuXHTgXVvgPMwUSUcPkmRuusichkW3zOL11/MsQsKcgXJmzQUtqyl8ePT99LQCq7q2YV95
x64+Ro0EjAPwOLYyM0eYNLPm/EtIryQVo0COOmts61H5GxDeUMKKfBCo7XsXJrAN2Rthf0zstk7m
LECoYdUvRKGQCSUrmWub7wkiOf7WMaPqQ/3/0eAPKLr6g35HKkUFDPrplc0Tza4xXkvYp3pXxX6e
sT7z9Z5FFigAzietiT2prSXQ9Hdvhxq8/pAKj9Q7tY1Ni+3YhiZ2gX8tScHkJKFZLEaRTQnSawgc
nb9Wx394MXlzUVM4wHq7ULA5H6jpSd1PnV8D2W4PpMIUbh/Ya26CFFEFgtwOaxY2R1sfr5EjDdKL
ASn3siFKjzLw/lYH2EbRqbcesS02ulAGP7DaojT65AYoqJH9ulHpZA786r1C8KijbUwb90u/pUSK
C/1SD8LKfPyQhmYJyaCe5rsJksMHmVlzSVDboxGVlKJufDXzA3Pw79zJgl8Nz4DYirYnZOLK5fiQ
q83p7LCuM0H+MAI4i9wb6XYNFCHcrmTse9bxOx0OKSFhhHrfJMMMp++0YBw6mafvffO4P8RcznO1
dwiHaKC1qR1b2fulWj/W2ZgYgqbawL90HgQ864ont2xcRnJQXVLXWMXYE4v9dKGoqd2bdH/dzZtT
YKDuHKMEHs/5UvEpLanuu6HxeZa2rF+aYfPmF+eaEl44kZr7pGVEkf7w51qrJYLZjzVL/as/S25O
OLTkg+K2rTObRHS+ZpZ7g1A6+FuinV4t0qeZBbBbSpEhdtqNoGhucIy7DnRhRzlt8zgcb5gwFtMI
k69WzvwzA816WFkzPNIQJd7wys5YrvQMhfJfTjlaGT8ghKtW2PjeXdwLA8a0oVWVtGlZzTYJ33Kj
211zEl6aABB9cuekxjeo4r81rdHq1lqBfDuYGHLonCpSmF7acSKtyt4r6QBUxF0Rf271q7Zmldw1
L5dfgtl0h9kAajqhrDA1zWc14pFWzbzQjV5sw+5l77OIM92beyTBSbF8xZ1xoYdo8As9YBVmxG2j
Z9d6suNDaI/q/H02rQvZntwP4eOxBKRN963oGFwj98AfKQRQXX7IZI8IgspJobcGWeACVzXLnVpP
B4phHzDfX2OFSIEZUieT0ftmhKyziBQWu4f+QlGn1hBDIzDvazMte8J1FpBDBjvNb8Epg8zgOHEs
KD1FGbSJMeZODh0HrUSkwwrAYkplBgEuVCTvD9LqUF5JMqCu3l8pUO1pcMEkykdTuqdIWEGn3iQE
TwVgSQD3/yfibx3M9MgAt7lAS7W1eDUG+WbO15oBlJuTYOlMm3KJYlHzQJf0qUCdEMfUKuG9XgVz
VgWU6QuxZ7m7BlDBWhUZ/ri1B4ThpiMW9tPejNk2VofDLJwL7aR/v8XHfdQ35E9guKRqg1LY9dwY
0/SrWVeQTl5hkl55wYVVt69q25TAqAkbiaOK695xYkr/6nXFkIPV7p5sNUDL3Qdd2jXGYs+dtSol
1+RWdQ154RU4j6GUYFjbZqut/WWPc5tXVXWK7ofzxF0ZBtmHEf41oLr9gohCT0FxewbNszY3gaZQ
bIrBAegLJLhdqEEefiK2mQD4DRg+Zi5da1GKnqSoif7jznTumKNXLBgjzepePapcjwLDKLPKDu43
x150rQg2bQAQqhX7VGj2SxGS+mRz4J5zmeVYl4zd/ZLXJER8M0ibub7WeJ8UJeZ3v1aVQtkKFlBE
uvyE/vm8jwF5k2GWsXJykl4T9K6/ot37JI1ma3KAMNlvY9U2cyereVxSHYJahZncms0ytEIVrK72
Ndjl6T9kqzlQ5z1hYtBDEyPILrJatHejpXQhDa/S1/ZhZ5Vnn+/QQ99Syq97Dt7zyo4YonaBxeej
sZ/fbDHK4OJFdeSML4WNEjPOCDoD9v7LrWZFFyBCkIjQD1705jg6ffrvYbvXciDFaeRcKmS4/68e
sQGojuW96rF9mH0ITUyXKhpuq397kkOvf6Ym1rBYL8Zu/wP3cL52j2+bwhWHzx1bu6gOSXiw5uQ/
0YphDtGcXKvyTsWrz2PPjHLFZgXCHl3A0GX2nYDzpxuTALkC1MJ3RzDwnoTJajLV+ERUqLK98R3g
4GNQmuFcn+o0+DkdJqsMSUE4sX/YoA0gCMDDP8P+V9AAcXJnHPiTAOoXe2VG+1K777un5sPEHbZl
KFIRbhOIUuXJMEf03N5a1XCUWoo5ywKrc1Y0zyehN7h73qfENkRUiNtmAuiS9mpChrpo0ZBJqGiF
1upDC/Ue22azzvgRih9kJElhc8F+RkbdCSw8mV/EN0DfozxELO62/c4S89xOxWsUUUzDaJoD8AZG
Nvr+E3CeOpyQNx30PTyR7vDkDctj0wM48tAV9bxlp9sbo5gfzwEygsEyWqFDvqHrCkNqYUox7MUN
anzvFNBr8H+p8+jULBTKjCVq/OpQKIqoKvTRHYTJ6xpVd3DUUylXOAmjAQ4T39yFlzbvn4t2CJ8e
36/o2V6MsZkqaknhQKFHJ3LzLVNMAEL2y08yixzP4ulQVNe3CVFoz2wB7VQ8NMs2V1qtwaECT5y/
T1RNw9E6lC9VNfflIZf0fW/wtYtmQf9cB6a2cHToNO/Ft7WmvVo+FVycaso2A+xXdfCecC16gRj1
35u6DU9D4sPxH5n3rZDp9X3R9RXVNeE34HpVkN/u4jpgzQyEo9O9P7TEVP7bLRqXz4GJNs1vzjle
BzqEAtjMgdRCajqRY2asxGMXrGlZQ6E8BfHK8w7j50nyhUVrlosymYhKte935NxOQSluSdALcP4w
bV1JOlan7ga2fnGD3XYbAEDnXu0wGZ4KAsalWoE4oTg3gw6OpIe9UJ/GLdXEdw0JVg2y1XxtrXvS
PmhPoQp0xpDmeud4ffazBolL3AC0yWR4uoUkrriaNm7bb7/odzL94YYyyEl4Y+GnWMli3EzyQsxQ
vx1gx7ZarA8EzyVbBS/gXhZkVyvQi6M3owFkjuLZYOhWvntZT+F5pWHvddAPBVyYi+q1dblG+iEH
49amNCF6jk0MfDs9ktXzwUMG0EFo4VJlxB3OQzng9o8w65F2veTPN4C3BL1vI/fjuz0OSA1xQxUW
XbKpNyPsNboztP0G8B9hfDGoK7ncYUZbEex88FMoz+vVfcZTDK433HrZAPJwgIh3FWy4QNN6hD6/
joaIUZLrGD0sPV/oLy/UShbryHMhfbWJ8yJDemKzS4+0C9SSLD3YLptv1cz1tWWEPBkmH5Awyyqe
SIIjumAxcYjUaWEEjsM4mS/KRy7tHhnBsWm4btugM+vnyh0cQCjBuAVsBOgYTWG6Cq7ZBxDQUULc
KW9Bc7abEydZVXia7fyb8DgeJJ18y4jyYg7OMpouicdoZ7zFbm3LTgOB/jSQFQiUKzp8D5DO8ekA
F/iPBlQuiLiCNfeybD2CyKna9FdXDgjqBOmhz/cfmwtPnbzlreqvXLliNbgJb5YMWbQPH8s7pQXy
co6nIWRanp1+tf7MYtABW8QsVV9QyEqCWr4OTADs/Qnzm8GIqxVPLBtBp9f5NLR3svPU3OxITCN8
QLnAU6Q5wGGvScuKyKC8Dsxxcz9teYF58Xr8qoX1dBUQj04S2vdrB0iFQKjrSrJEUFHveYUnOKkE
npOrNaJnjcMJ5+mOUX3HD/tzh5VUxFYpugIYIuxEke6SBwjb3h5KVLRMuekwrTont+sR/5+3t11W
zc90WEjdJk/aPLm05KHGwq+7zN8uSY5WBi20UUuAdeujd1+Jx4un/1J7hOe3ieIWuh1VgJZCexLl
Xjk5DodNn2AEBmVrZOYU32aauvKb1P33t+JCqAOam4gp5lVCoSV4KmF5h0t9PFOTzHEP3uP5G7Vj
BUZWVZi3kvq200G/y6zm69DW60s05OxBSJ8Ztt/DyF8pcJUy/ZUAPzlj+yg9w2opkLgz5ne2ueab
136AFV8FiqodyZR9tDXs7J+to4stH1YcaK7SNz1e4S7LPr0f1UXfXaSng6ox1qoiN444hoNEhLbQ
cIlU9RbdqUdjBjeaXjIpHlDk+uCB7Mmhbs3zq0JNU3Ykmc9ZNtfkUJtIpqwwluQFih4HMrN5uhEW
W/ACtheX6tKdkJKQICa8Al8H2GAo9rdiZnu2tg/QkAqZ1Z6h6/ytnoXskdhFJUs4Ruozg2enk3W1
JUUlVV6APA48IQS1L5MTks/VqWkMGX8CeRJRap0gDo6go7hEsysg2XmaM1f/z8L1O/aWXh6Pr+tW
90qMBb5y36T9el7OjXulTES+gIi10IqQkfeYFQTxXZ6uByr0bjsoJA6eBZVGlkplFrTocfTO8vFe
ZEuWSOc8j7Vmqn5kj2voiDJDZMA9sSJMSBldpMfn8NDOjdWgpGq38RcblIsr8VVkZaFY9qsCOygw
8XtWeHMeOHuCSYLa/tr/InNS8RfDR9z/RS9x+d8KSZDC6WqhRiiYbbRuqJ743SSEqUsPJJP0lYf0
ZQpPUU0s68wr9CpSHcHlw2nDY3KnSXXPsKzw0Jwu3qOYtZSU6H1tgr9LnAPIs86qa/U14R+yrj8b
/YjAAuK5CD05xjnTWK7T1jpR4y7id+4Kah+BfGCRVatwvhdy14ueCPexKIz1OzczrCkOnXWO4s9P
F8iZxwY/dSHV1OK0+s2r0WuPYb8OpkVTlboFn5c6q9RL+JmSNob1xPRWiUlAGCvOBB1mYJAzsO4Q
5NDuVeNh8nbTQhpSjkJMb3JpHvuGK9LTgMB/ZjsoDGuKfhRmTf73QWWYZjcyFei6Ra8GaoUIuHa+
seZSusiyIekX63STdD3kYpjb9vUjfc2ZN8zayGXB+16fCvYmYTRzIZaoyGolLhAlU8WGtzasJgxI
ua2rknj47GJiz4cakbCDIzzV2MvZcIH2npLpiAhvLU9JEAq55/tuMvU8zhJk7qRcXNtErmWdshX7
r6rk9LlU94Tb273Ojg2QlXedXBpe3MD2qFokx8ijqrZcz9VgDoLUtAbaVmmrJuu6n/AvlT/mGG9s
kDeWbiSGnH7qYPuML8Af4sUkMHiOoM0pe1mES1KcqlSttyYGPgYTEgM8Jn/oIbEhpe6uOdVnn0B1
0Y9S227ahVu0Vob/KWfeF7tZbuMaKbtVBzdjq8pEpTCsUoS7TS6QvXmDkLPudCut81fMetkG1YFw
VsxOj5ewba8bI1TWM9ZHi3zJcnH1Z3pcZc58gvERSOjTzQO7RKpaMzqPulGtfIWC+HKUvNPOh//0
E6Nln7nSJHVppVU53GV6bWPbYz7j1n5lX7O8BZFtEYEEfdmJbxWDhwXJAVI1hShbC5AsDbguYsaZ
BQOAnHKrgIOttmX87xf/3KRs3tc0VAq7y57blmnfI/yeqZqyeFcnQcEnlOcMfKIVojyy3gCHk7md
n4p09rPchUZtIi57Gi0nlV9wNr939nS3ByccdER6jJaRvYKAPsS+X+64kJC8/KVaXDm4pA7gNhk/
x7jyajavrIe2SssPeK/EpPYLurzBkAdAyrWeXzkevGo+nv69zHUydhh2NxGIQ9hW4ZM/qNXHcCvz
DpeyQbCmE/mFHVp9bEtDvX5mQtTxuTx+Yn0tguW9SsR9qWmGVYrEVmAhGRdEWBWVjCLalalD+KHj
fD/hxmrFln1IjU992slIftaT2fkJvZ7G6K7qH5FeSGUdil43m3uP02Jdg3rkKDcIlbJWfHzGUmD+
hKSQzRU4JAKThYCKOvXcNX7m1YNU8rfLypwg//S3lX7hPoNGMXpoVurRzKMRWpXAcykrPRy9WqFm
V2Ib7vGvi3JEQkwKZLUIvzppJKtL8jXtLQ7wO7NRTcbUFSAbK2doBkQE1Orz0aa2zYjiYtrYdEY8
yuf14L8U461fdamenZma+6/32QjV4VdZL9danNnGBMYbA50wkhdTYBgHOGjsa3X6YDlcFhT28squ
3T8VTluWBEgC2wLEtW1eXnlIJd0nWtb11SAic+JphlYxyu1kHKJCbyo50TDM9PG2TDwzKGkmd2OZ
+d0k/h50U3RVm5tNBTxG8wkqTPitWiM4tHIdE7NnokV/wsgMNhH9mz+qCvFW6ijRFDqjpOoUQH6f
jxhFH1sEKRUzR2zo+Jb2tQmDq0GShSIf+LCWvEukPZgd7G5BWfSHJ3DflUw92zdWj5xsBcqb8xO1
PA0GdovcGVKjB+4+aIgIibQRZKGxrsPDTlc19aE2ECTyIBSNq/MTlcLzcb8MslfFz+RLThvEqzcJ
U4h8C8z7LAF3m1Y5+s5Xs+5tMFbLzQMfg/own8eXGdBeA3T1v2BfeFnKS2oLItZB+PJG5XPEu0+P
FJs8DaGa5EFs9kB49U+tLa7tthhlymUn1W/EOrYjllXVyFSx3g1LSZvijcHPV1Q0huKnYZYU3a02
oetviey8lZ0vQxDjIdB+C4C8cxCKKAJyzukHscmJZcyjubxBj7y3w9Jm/xVqyxkr7/Zg1YkSq6tk
/5ozHQAZXE7JV7GtpkBwKMqhn5Uk41Our49EUrOutmg45wDOfcXq9BlSGRV2ESDZJ5ubcVrrDXPu
pwpmCKxBJitIAEam8J/4uzSXa9aOlYo2Ksnm1o/COeAKSY6KQ1RRP9lZnvE+Etbc85dj7DcjKPcF
+S2tCDAIbA6/RJZ3jyU0tacIPNBHoiklaAaSPEj050WF+B3oNLd3ayAifnIPwXS/UK5kRQ3Yp24C
N7PG6Mk+OLyOzcKPHb1wAvtAfSf9X2P7KW+MdkZCVg781TakY03PIebbe2uEQ6HFg5Z0A0awe1JN
0m7EiWOGhycHAjF5ezylM7FviS7HAyzyRMcdO5uEOkF2HywjSCX1P+5ELzRZ85l3Xpqrbxj7cxrS
3k7QZvP5fbWgSEPTBBvhW6fGDZO718cOsvTtdqxAVVCXhajhxs5WDujMChJ9h4intTRAq75rJS27
xhgLG/FeR4dhhB30aZ7XyMcJWqzifUURhgKJafW32W8+uA3PQ9PrBJa8D3aSfx8IN/B1kb/ApZwy
S16WuChN0+D1EOxjT7SGGNP7HtOvyzXALYS8g2LBwQiicic+21QHKXkfkft87p75JeCvcpvk5cOu
3CgyBU8gyKS5tOTGcwW0otDt0S431C84UyJnyRZnivDEjcFUONVWuLhvQsjIU3lnbzqPfo+evBbS
ZEcOy5tL5mIhr/TIfyPyjqJfE8FgDGmLHvkE1U/Fd7ri1mkSlJAgT0d+JX/VKKGLCxk3u4rQd3yi
u/y0dNFF//leBdyhc/AGUxcii+VIpgP+owIs8FA6l/6h6lAAK9IJhYips8paB2tO8z+XxhcRoMB1
1CBU7Ioi+M5EJnr2IunSH55TcalTHqr4YyMSSKSMgftv6ZuAbe8Ot/83YfOam2nXwWeo3VyVRPdk
HcpXQ3rp0Np2iRETciIZ9iWvRLIftRGVe95m0rh+bxMx/DkQbZhKsrLxPnUItMcieTjmuLb9ENHB
ai9qWUQSFv9BphGYN9DZMe4F0vLtYnVEYcDNQ4/Y6NstfU9plqTuGAO+Y0QufJhU53OQafmP6Mxo
atTtwfSTLSRoQ9PF8LYZlL5oNOhIGeHP3gIcOerqBITgzYEm5tnNq4IEl5FYiatgL46difOwfoY2
JRmlp00xigBEYUeUYeaph8H5ehjGsp8gPKmNjCiP3fivRdRmZ6Jj0b5dM7qKFNWROhXmil2NIwXz
EqnX8kfoOzSC4qvXzcidfK4yQbAoHE0oGPVZxxz1FCmkbhJf8uKJ/NeENqPRISYFWMBc/DZItdiL
3enLPu0N+nYi2kBZcIcy9mQCAKmww25rX9fcYYCQ8GS1/IsUlZm1GGZiJjXObPBBePt37Mji21e4
ZM3qjWv6YU6HN/Fy0DNrq+mPNSA/w6WKxYm4PyeTenpAViLqOJcffpEGGXnSJq7Dc7DcpAMwdMw5
ML7PJ6vIGcMkfUcRwSVatiHgRr/kVFKS2U8n7pvbwNQblwwORDozhlDk9tex7IbUDbIy1h2KhTT3
9mXSCbQZCw3eINCVvcP5C6wDSf5Wh+kOSt1dldXWLLRMWqaNuWLjotInHsf6n1CJOnoZj4A8HVFk
Epn2IWTxBltyn1icLaSl36B9KlqVnTngeRHViHXHNDaDG+vw+LHyJM7+ur4+C0gNRt2E+xyJVO7c
OOJHzJJgKyZiHRMJYQyR6P8UpxpzCg7TIl0vvmSLfhj8yPmuRzR8J7hshtTyWFqJ6Cx20iBhbv4Y
yl57y78DRIEblRSu+whHD80Dlmbra/zZm90KKGqPsWA+jlZBnzINpufOYA2bSPesNxQ17OoWtj9T
hWbc/+M9n/fQumJsiEBmStmq+jek3+36BRP/3mHFp/dyFje1gwMWm7mBmTlHkSBJ8Et8AbFSUY3G
Yyua4HRQSwL0Gkk7NP8uNEvGkHdVO4YbWb5cqGemPz3wSQ7BjPvGgkp4FG0nbOuxXFw4PKIR25PR
Y8O3/T4e79w+9y5KMzQQdHEfZGqP+lEeOPbvP8fV7BGGk4VHv72ckD3JJbC6N97q8CkIWfpcCIFN
TNNIgUvnw/w/djIqj/f1y/D7dEtTgof0FpleKhSzCV4Lw4vLK0KZRaSxOtDtpIJ2pz1vTM4p2MCo
HTrumbcCm3vk8zm56vfLN9QBeHDGPbzUIegEWKuLPIbpG5rNaCwLC/d3w9jtn2nHHCH09LqEF+pL
lHh4awVHJQWuIQiEL0UUvfD8uI0yb3ivlIGbsNv/Ryj/XaXphGv3c20SYQOtZkVhtN82NLV5xPts
NVKQzVS7uLpF9WhEEHZaopdJIQQgXhm8YXziJrZHsAzKoau6qiH4qCLP6+fx+5L07mRCd8rwz057
z87tDOdezpn24LWEANTNdC8VGAHcRTCGzSTcoGcPqbxJClAuna28Ij1QNFH37FIiJoHfkDEs7163
GO0d8OPYa29HF3iCOweA36I8J54lFmF9TEtDmGxoqDfzN3AkBgxn8DsXdMUR6UdhtXqnrlJnDtcV
B6v/w8YT+tPkXSN5zcHQiMrnFYRcE46y7UtcGDiMWXG6mbP/YkzxexmEN6PVlrxd5U7Kc8FqddgK
mg9cF/pNsBuUqJ0wsNTjtikILDN9ycnAvxDLtV4ZK2UIWlNb+2mRM8gSAjx/asS3aj/ndXRj2mmW
JP2HsK6zNuz6pzB9N40BSVPWH0ds16yTVFJPSWl8C12YXm97xSGsvrIfTWzB2AP1tzPGHToLrOm/
ZbjINo4ggKiun4gCslAEyfto/PvIriML8tnp78VaAV03+jsILscA6GS7MPx9Wfz+s7TgLRGH6HJ2
GLvHlJSPpaNaNSqwpwkjvUP9cH2wby++VrNkz6e3riPl9n4UZ9lDO+9myIlGEkMJiu7Is9t3pjTH
vSpyL/JetA7UR8jJ9y3ZrhMHJt/GSXWnQIQksNog5s39EEaRyRP3Rm2mMGpT/wWs4FcoqUIJSMlh
BiD8e7WjWFPUwdWrB26uL6ONSxqwaU49EQc5TnW8ym2EPr+QGJjKNXjHMo57jgtDXd3kkb9n9AeD
FJ9emWuy0yTEyJAue3TE5qNw2sxlDSjvYtJ0RSVPR/puChhSJKg1Ac6uF+bATLSjd0G0Gxw0rAVc
KTlBBjIVOSO+hyGcSU68PJGR6qhDUpbvP8RN5AcA3hiT/bKlpP412qPqoL58Zb8d2IDTBqfjChbu
+gt4+Zd7Z+sURbA5TqY5dxvDL6zWLpMfckFCtlEjWpSxrSxWazMTSROgqwZmnSw2zlmIAY6PdUZY
21n6WyvDRSiLUpKJp1EjZfdQrdIoPbB30+uD01/jMU2c2DcWBlEA8abEr/iFkhLDJI+gbLdbiPSw
YZFePlKTEytXvAEkawSnkqrqdSMwvnRMSKPgpfxDisVXbbAqgCuLsLyqSnEJvHgBQiIe1AHeDtnA
JPpHMBmPtEc1QsORzh/AtTeNxcWhKD5FG5X8BAMrehX6E+ZucaPjeq3J/9awyGkQ0ByOesCeUb6L
C/Bo4P/xDGJYocKkQnPtiZNKIJmd2URfLlmcy4ot+f+cwTo2/W6+uG6+C4v2p8cK2wFxDUfIzgTt
Y9ANVyKfaQxLAas56ETgnOGoAUYGDehM8OTYzVsRTLCA52br8CEUQoFO8xZwkMB0GGJl6xuO4Dli
xkQYf9HfoBhR5LJGrLlCReYe5jR5vMJptOITipU8+L4aTbslylm2sF8wR5h+ABkftvOw4bdxBTG9
0+3IRAiHEXgb5EQ8uIOD74dL56pRvHb2392ER1nOCO7nWGPR7KuZ+8mbsBBcJd40VTGdKDZNAuJU
50ZPcPcUzg52lCpe0ucfPcmcvHjbPgFoyJgYQNlxrQBUA9yh+u/8l5qMXQicCggiVbYDP0rlK5nZ
epmTz/WRQbeH9N805so6jN9nV4zQrtLvkwsdTdmN3E6QLHu3w9EhsJ1zXzNj5VleEK00WsP1avOs
YYWsS7QhrDYv0a82ZfdN6VO1msFTeBu0ntJcE4UmgCltk/rTG5EFqFNp35CPBMf+B0Ptx4mbmUD/
z/RKXhb8Tg5y0RYoU8W1s5QCf1qFcDLpwG2qKBtPnbO0rcGN1iIWSG8nusFu+WcwMXr2I7JfTpxs
HHKHL++jqLG1lvxNkqGppHEXvIPEDQlPHZgOPqdcQrDXyLtn3rin2189mRE7NjifAu/OXI+vZZno
7B5zkh/FUAv4ab0ANFKf0QvwC0bGcln+MH06P1zAxEtyMk/ITZQj3axcLN3KuVUVXiNguTh9B71p
4i4Dh/9sCyHd0ilrNu4z6B5tj1T1V8Qp0VFx6mntobWLMqc4mcz2eW/H7fYNzgBlBs4CJhx4Hz2C
gOx9JiT3OD4lMwMKf6eFUgh1q7kYrImc2zJgvXYpBxMQOgV2RfklqF4PPStsJSGG7eBiYidjtAvn
GBEc5+IOWnR8Vpe/RQ5uHNl8K8oLfaDqxJs5+mppGBRgXAQ7nEm5QTlwkTxhTJBpcBRfn7dxhUwG
lWx4W5q5zIUOhC9UMCKUhqG8U3NM8emtKRI6Yed2xL2Ljp0lHlptCZzjUeqc3hCmrd9NADMMwSa/
IpgvPmApmTZm0n3tt59pwrSo1X3K2gcGk5ZsHlcIgJeQ6rJj7J1SnvFKFtIzi81+jbolB3J/iX5N
v/IMDj6LAsYIhu42rK5tfKt5FG0NfKJEksux/FZOqvfd3bUfIIaPanQmCOHCHo3xYcR8y2JKbR0G
VBr2DHRxMkj3BuWxOsSj/hGd5HwPr2ouW4aRE2GPD75mV5s6pfTFdnFIBBtoDxNGHTWMIiKLqKuY
76uYaaD4mE1NuBzUSavZ8Hgao4Y1ncw8d1Pm2bCTlU1ThA15cdy5pJ0t9M2X6SNBcigCMABgz6ZF
wfzI/NOL+9LOBL5+Y/vRS/LYwL4bmEXHPlk4VAZfayi20bu2OKvUrPJO/56XVurs+0w6ysy86Mqd
wgSsqHvBuJ/mD7jWi2iIYe1uVT7MzKyPPUHXneduz5waIyLRuTdKV8sv3hCQ+FH4gY1bg7Ai35nv
BxZiVr6xqUtiXZJs5ZwCvF/mbz12+vHrWtNdSvYXN+OQtWPWeq2RnVNW7JA9YIuMlGqp3U42hCNh
PFBHDcVER6ny5RY1Mgu4+O0o+InDOJFo3bfi6YDOiehCKOA+zUNToaG4drWPi9Tz+A10xFhuqat0
bb9g34n3LtV4y8WLSalm2JRtNYtW7CfsUiNSYnGlVADZKOd1I5+mzT1wCNLFvfRAporpLRuAO+Di
Gqpcvh3JJ2fU4JwFzJg0v6FDxNQ0BZzpqN8rkWFTCTKcI+6TTirlZ0toAM/jMm4GOkV0uJGraktR
CImtSkjBn4H3zwQzHwIWH1p+y5jsSraat+yOwRUIPHtcg8B5es0knqeB2+8QaXwfD8nPxwNFVuc9
R0aKmhkkWdVpuX/Tddbz498m94+bTaVZR6PKtw2eNrwf2PTTu5nteWGCMNzy2EqbhLHXTqOYAA17
NqWcwJGTUTsoEjf6uZ4ggUllt/w50OdBbJmN7JctpC+lsUtN/hbRUZw7qwIxim6i+4GUJl+mFuBE
68QZO4VPTMc3zWPpiVBBTsGuIQI6PZZTuHg1PjjNBzT3tI7Xuh3XyrfrWsuhSL+yunFn6DLsyjof
H6G3kxF8FavFJUB9WcNGO+WlCIEk0bPC/JRq0TqaFFyOPmyGjkDMsa2un5Me+VeYk2h1GGtCCoBa
U/EzMkmmRxBYatQ/snGUo4vgTHosomaou4/tQRj/Ld4Ky2Me8q6R+YPWY2W8nl+ygXFdUMcMAqMk
fDthrvKXjduErrSWWhss/qn3CWSQfO536l2UU5l4y4szMLvx+Q24kn7pYn1ccmQjXB1AOyGsqFue
m7ei+YcKrN8RQdRZpPqc6nlPFIUEq9zFZQuUqIAT2dzagO4oJAvmJeWIazbQ91PiGj6E+1rkZVf6
2nJ7WiM1jUeQxYMfuzTEaCXiU130hWKd1lu3v76TLLEGSFrYiZ2l9iCdOPU0nKMqb1tTlhL1Z47S
LzMpgq8ksLHWwt0fK+Dvg0CpE98TDVttkhCakICpb1A/aUK0utj4+qs2V/9D63Sk+OaJo70XpLUQ
NTUM+RfcwApFBsSyu09nkypO/ayTv7g3/EipplisgUIgXIy7yXrRnyHWWsDswL6OkGIOV+306QfC
ljL1T5x7JIS+iMbnxhIjsaaAUpFnnA6W3rBKeABfiOgZhknSCh20ARxiysjpXbMV/r+x2cct6nLp
a+15wZ++WDdbl/V1wGSUvysxPUA+MEUKITVnK2UxsQNxah8ls0edB9zFuZuBVBKiZ09gOOwRaLSS
4lB4dvHCvndmYIjtQn49WYPGsrKRXfWzlcvDbgf+/JTZaZ1ca72KlkOm/xt+selh4AmYxPtzxAxH
845DXm6INA+jMl/aM0s+ZhAXVYZaBkCwhgT2iRHG1IypKLDlPupAEKe/PckmYSQyTy/qGOeiGRwS
m6akAcSTQ0H8ZJ3jnNOmJFuTyc3TakJQ3PNuNUC6w7hVSQzLLiGthseAoD6E9NCCUk8j5dx5OgVy
Q4xw4g9hlBVNi/6stS4eqU5vB1BUn4dv+DrhThfdqFA+EqbdrfsHI/YgPNJtFfx/cqQrtDznNbTP
03q95Wj8+OpgiLRxKc17Ees/xVoTWXdJoQ43crOiBXcrx7RD9cyKpX+920Uutr6nt/CqAvkEtScz
oXFW3y6jGAWiT2gME8GZDB1uTYN6ZtsfB12HIcDvzutCirWUxhcnE8ptVX2WIdWOH8ke+4migOFp
GjlUh44WGW9uoFYFBhHg4ABxye9PnuC5ny+g942ZiwPkJQY2Z8ozSUI++3dMJLrRYoftYwlQaSud
sQbEDbHVBZQkke+twKQ0IJk7qtOHnVCVkhZEIwEEa1ySSgJVtE019eYBzDmlVA6I4aLmiemevJml
rys5ePM3D4mS/Fzk2NsZ2tUotDn8118SGNxPra22m9xF8L0Tkx2PHND7IVKq5Kq7bf8UZxHnJ74H
W+jjQ+iCvbwDw86/r9ATp3Arv2SomYFmgSAYJ8Jb5dIHEY4gvrQXUhoaXdUhyRRcFCjhBXI+MTtc
FUAWG9jzeY6pPwN8/QYhBWzG/kTous96ZUMV28UlTDeOf2pNJwzN6wjchSqGh1LL2cpNzvcMLxVI
RS1L4YDytK8hq0Wg/i8nEmEmHRo2grQqniMVZ+wwO57JNbUI4fdtMbbOEGSFOnIT2booqP98MzIy
AeTluQ3atTNVftwBSAlc8rh2g0OBHJ92wMmnSf+VLHedUP493xAiXp35Hci8vPr60+maxs8Jaunz
1MTxf4tZCWVAVvrbaC/jMrCK5mUo8LTmF+PEgnqDy6vImAIwntrnQjItp6+8pKo6M2DTZqrTzxq0
AeXE/sUhZUBNBCYgDNNBbJ54JRS6A6y5n7xdL3MjI21/iTSbaLYi+YjjPsePApHQwscd0uaZ2M0F
7wjLMTBt2ko24eJfumkSERpR1Cb+CIaQrnkhl06/hhVpuWBRsXyHPSHRP/t0sABSiBbujMFTViIe
Mtdv87ePC7vaY9a6XVY+0cSqMC/9Hc8cE05LrpGP1xX8cQuAnhxsEY7joNy4xyHU4Hc9cIE/d4yt
ymr5ZLerpMeX+y8l35B+yU7tVGKLIBfYw2sal394W+1dKPzXUL2XMc+8/3yQuE5ukQDRbA+UChJj
Rjrj/bxkqvYgdqAjeMbPl+ZbNwwatOfsKooNr0tw/Jp8vsfus0WGt3FOJLrZlGXBEjK0W0SYAcvD
sic2fBIISgNWvb5CWyVUyMAYykl9t9EEhWVOcJpJRK76kBEl9ktrv+bejf+5Ou9c0L7dlGYkKg3c
AJ0Ep7lauh9jNaZpbpmDQMa9dSZJlVHEMbnZ8UTbbg89PgT4HFWx+rTOlOxgr6Z1kRE/NrpfXo6n
aNoRy4qH20LldRue7P3k3Cd5dsMF2IlEyDVWBVFEAlIJZ8UlQZ7z7bqtHlK76Ltuw9+ZZAV5yqxr
QSo5AV2ABMjZHyRR81XAxzxHsdBOdVBzNKTyxUnw4uOiiW5LQf/Rl3GZTp/57urdzgkhZiQ4ghMz
AEIhVMblqWbmo3TW04uyw3HopYGeeOf17wQ7AzEbYsp7yeKeN2zFKRfYZrqKtNscRLmREgNbYhIm
+IQ0kgWnkqzIuGIE6kp9JmrqCubfUQjreO9gj8cJ/njubVv2U6eAnH6AP4jDbB7Zbjr3sbFsuEGQ
HBYZyJE7XmsBXnALr1gKKsyM4TblHwH+lHWoLG38eVSvDO02aUEulvNUkOHsKtVP5V1odRMzDjlZ
tVteP3EujqK+gcJYNItt7Sz7iihV5W8YN0gOgV7XAxvNuETC9cAxGYxo7FiFZ1a7XfL2AJZyRVNK
LYXismslfi0jOx8r8q5HQTBejfVPhODU9KkGLLtYsLGQX+RXQ8VudM7jf7CPNXMeGD0/KhK16ca9
hHPXDyF7Jm8xJ4/obx4FNv9bXoFJlCHxci8UyHn/7o7qkpECZtYVWkNd6FxFlQi2xYDqr3hROqhm
NQi1bZ28JDmZoVEiXqM2PZd0wua9Xn2Xwx2+WELMup/0rjsnWScxA/tahQyVT9VZPG2hyidaL6+q
AGwD6JvHWcppz+pBSgW8g1LFY3rqfMBDha+CI4f2N/P7XPHtfP4JDCrfj3IG2MWppZY4zDn1gnTK
BgAWUYfEL9FXZunuSlnXk95eLgH6sn6NklP/N0kcyVcQgVVwn579NbdnbZYycP8pGVVg6c6/3uCg
ialOKJC8tteKTzh6AlY9jBRHv2W0k0jVzfKjLP4qnFr2LiCZWF2lTScfQgBjUIfpmc8bQS0rJdXz
IUPtviGLqLvF0KwhDLAeDiMQN75x0pzARHvq35iL+OzHF+314R/6JCag2FhOhpKtC6RZpIPb6suo
84cwNQQ4q6xzT2nE0UzNOznRwbnKBLsSLcpNjokKQxopuCrv1jsK42mqM+Y5/8btAAEkgzlU+MwK
3rDCDVT3CIl06YiClHEhf+Cp5Cn1XAkf4AUJd58aWCEkr6SOv4Rmn7c0psQkhSy3yd2c2mLWKqkE
HtvE3Lcj8b8WomARA7X9UzTBZeKoE8NiLD3SmiNeNrDww1vxMRLG3Oy5H4qFvncGyRWnoWq7iQFg
h70x6dRtmINmfYa0E0VeY3V6oCnQk/T4oshoCuWd9eTkcpeKJaGDxwWfQFvVuncuyRFL018FIBKS
ABgvTaeMW4uKicBbuMD4PGGDYpLIdPexV+jiqgxqSpiOtuWpRtpDHIeYIgBuuH0i9yJsaPZTZbps
vtD8tvch6TUx6uyBPPdVv4Ts7jnG7tHe8wOejD4EBQfrvqQ6tAwqOqrhhosCYKb1W+lQUGto24tQ
ED4dNdid+bqN4q+M2Uif2lzHJtxbHZp1UZaxNQisQv03d2hFiG+jIHM5R1icGNZhxxsmXI/XgDH3
/WX0BIXFwYnuIflguU1Ju5Ehuu8VTr4BH0ywI2nTAbgiFSqbAWipAhwhA/y+kBwdAA/mZcWB+gus
zmA+RjM3XTV8/1kIvL1q4LVOGOPIdKLgZ7cpHtj5RGk+SXWVHfH7/aXn83hsSMgfgEDgMMifrDor
DC24G7Hr8AYVZIcwxaSLcfWlg59UCv2TIcx5I51bQeIA8Y7fs5Yklbuxn0myIWMz2ME0QV3/3aTs
c/qO7p1qViPLaLWnjAxAuBXiOnbWrOWCyRp/6rjc5jqu/DpH09Q3x0cNaWRhOP0LNku58QjTa37d
CqwC9w40W6C0at6WXn9jIT1eXoFaWRD6l5s2l156+P70jM3pkVhDnPLbxo9SdrE0hiHW5GIFVipI
5NHqttnnSgljBFlBL819M173C1A2iHePkmRU39otobely9eRVxC5LjKI2a8RXEBdpIVqTujw7jUG
/+xZNCOLktSkOqep6UETaHEER9ZyJoi7O35zdv/EcsPP+LHVsJFPSsnAZ5xVpv/vOmRGeGGFmlyX
Fw79zSmXaqHEg9fe6r9kl8Ga3tswM8Ih3dYSbSS7SrlihzLJhrLXxb8WcOgeRx6CnPzA46y29gyA
8r2YApN2YyfdqGLAdx/6bUczFWSAMDuPTl+9p9t4+Kq24GP7RjX89DzuRssL8RBJk9gjpkZ+HVis
26cXGo13dtVBd2vIEUBw0KOCVcJU2mPjG9qurLBistJ1+eaCquotWVrmcMSce02bpIS/VHkm/M/B
G/lg3Nox/QE1pUeNgjKjdV+ieqA4rIhB4lPdPRSicobXzGSQg9lCk3VuStroiJLykwut1z/JM72E
CS+x0aE029rvDRJcDwRBnlaAegNlchxT/Jey4K1ja/DvVL/HglKeJKDfOh9/ZP+iLo8aSYUpYKpc
CLv7pCzvvG7DyPL1PyPk1fEfmjcLOVhxbbZsAkH3MXOftJEnAVSgcSlIujnSXuj0Iwsr3eyVkoWS
vKqunzCRCUci8YF5AJplCIxXskTvw4Iwfz+eh4A6klzu7wi3OYcCMVxMUO/B9nYdE4REGIK4qlwC
zubNq35nJ5jNjqCfX1rlL4lK8KdijJGSCCFJk/tMTfv2J63iptwL6X1t/xHFM7sfI2zSlKc/26pB
MR2oIf5EuAIF+16NrXYibcFi1uCdGNqhxTOq2fTDkTWj6llSjvPX7A6F0kOxe/ymEogW7t+aRkrF
CzPelPweTOacboWTYs7X5AWzFweDAFo78q4mp1uBzIn79FZXJBQL+4zcNWQVOg99aNJ/WnMjDPkq
ncw7DzRgL4men0N/Y6+hDXSHGtUaIwAZtaE9rWUWi+jeEiePerMfFQZOTnpB28M6Bv6l4CuzW8Uj
0ht0IQunuUS7g97vge3WD+5YHMhBXLG3wy3SMgs08wb9CwmA5ao5BCtf++gMob/9i8SdieBZgXQT
yIDlD3rj43OE+Ucq8KNqvnrI4SKSqfm2lJkUlHym1CLNuGQF+VAcHRL3Yj18wWEHodx6PUJ1n2MF
EG6ZNKvBAbLUBC9LECoRZy1+E+sm2zZPhfYmB7GPf5VTT5AYzaql+mDdr6bsZS0sbMPDSqfmHf+h
7K3x3rlbWZZWz2F/550w5LuHeu/SCknld8sx5U6YIkvb0qyTbxjnqnXE0UF4HoEU+MEfm21M4IRO
hxFOYZgjFiWxZSUdFJt3OkXP4uEQKnA0wRQ8HJ1jtl29VK9yXrJWDD4ZXYBaMKzaJovpPv+1j7Xp
x1VlAJdkTgQX2aYJAUddn9elijyiomJW4VAN4txw3pgbZoOGb3A9Oc+0h2X90Nj4dw+Qmw/Xa7tu
TgnyH2jZx7hLT87Rcw1jlJTfLMwBXDUguBtb3qY0eSgldSc7infLx2SLa+ORrc7uBh6ikXCu5+DP
O/y85nEg4K3xEoqSEmIcL7elju/q+9HOzFk4pZUKv6vNLgSeISJGniTsjBPgn3jxAGKCv6wrw5yI
GmgMp0TXeMUZgNd4d4b+jQLbMtZEVTBz7k7ADYWDbDtPtNO6nFjhITJlg8CbGvStmZ55ZZwROY7Z
hFEfCDdZHjhEvrT1L1xa1W22lohivbDVtTMbC3oEKGPCZGIJ2SD71ca+o2d1Bre0soUVYiHxTvsQ
Ad4u2DMFy12CzQhZHTewZ+5rYxYhUnV+DMkPEW/xDlG5xcN1et4bWF5JhklFAyVTCBClDTQ8pPGE
39jZhHBKKXB0pF5Z+q1Y77ffR/s2k/yea0g7VJxjtP1BsNXdeP6Ra08XQ2NPz0uqDhCABOyes86E
ca6/hGHBilstVR01Dk9M64KpfnIM/40Eh5otRwrVgjrzbPkhZdYfdsFDywUL57CmA5Pj7oh1mPyX
lhytrIswHe9bl7279qvfe6cvPoD9VOgKgcKnkNfh41xY6zAVRnGCe0HDLuXgr7MN1Dn5GzjgbeMg
7isNvZe0tH7Kk1gZqdThGYM4AfOhTE7BYH3G5zRDP+Q27XzaX0LbSIenfoOl/EKZtkAAW18ZWyEM
ZwKjZw5CXCMdB314vXifcFP+/AGJ9C7Kl7ta2QtlGdu4hU6qkFCav16rFq0K3KTJn9jgC0kcMSWU
l/QDw5DaibWRoleMIBoZtjBVA6DXhLCtfy51XKYxkpXgir5n9/YIX9mv4zDIk0oTfrmqrXK3tzWa
tsprB5Sv0nA6cpz4rtpJSrLT2uX+Vb9AW4JuAo0ew3GkKMOO8MNNGXvY73QBWYCZZOqaytjVRLXl
BtOSVK0qGrmByThgHzCmuDLNXXDEavU3xNKNyvkkGHZcBvJxljZ5wglPsNaKjo9jTdWqE+Fl5vaz
Ri+ZbtUF6B8QONfLO7rJ12j2Vdn3ZrDHJ6EGinxJMp/PvXajD+yJbkiFwoR8wZlYS5/EQYu7XCKg
CKB9G2bxKRD90tok9+XYLGNgcxD5njcFbf9nTbVaUf6bEUNXO9V5eC5QApsewr2FqsLtaDi6VG2c
CUz8Ol86r9ZaA4DZFyv/InKc+WXRTtC9MXnDgQoS/M2B6K/V4UbkjbzA+kk+3Ajy5O8u3eBepN8T
DQJhoTKp4o7SRZqefI/IlVftzRbeQJUOtJQd0zP1x9tj9CECYHCoHKuNX3Iqh5NLhpBzlAxQ49gd
5HppHP7lHI1z9JyG6IVGZauVBYQ7HTPa2pvvn4Tu/TTolWe72Sl8RNcVGKgZLNgFyidtcXdMgp3c
q/L5YBgtIttfRjLW0FyG1OefZbFgFhuttY97h7C/JOAT+djJl6LQeFPBnfvMlIOB139BKCFw7JCg
Zq1Zhx+BAagla9xXV3doxhiSbkCuUgbeBvn15kQjB73zTLtGlXTTqBC3w2F/I756Ev2e6SzKlTqJ
g370ajQeoFuRrAuIAh9noj1Fii3Mv3iynViqn0zgDadC59CeSMs2fak4pZp63NjL8OnQ+5WAUVZ2
pSobGURlcqWI+GbvXluqWPB2GYokw8lkM/mY0s5HRDBgTFX3Iw7tC8hhEt4TVCMt2SFaV7kZmwwB
DF3K6vKKvqvnFOByODleEI6Mcgeo3JOuGdXu5LTPwu6WPlk9CNbx0BDK/anNW0hJfKOK43GbWDmh
Yl3dSayyhFR41UsGnwollO5M25kbxqELj1GtpbQkJhBO9fSw/VwTZKpNmlQWFdPwxIXMEO2HLqzG
rk0lBT/CeHU1FtHCpcmXd7L3rxCRisR6LIOW6caffIcwHdcOSI8ePBxgCZNgMdKxjBXvxXkF1jBD
1WGyOuLyx0K+EVrJt52UOkmUqiLOjKOrlyuLFSFIvDdxQeUbOAdhWpDQEZZjG3YTzpvnQUKlXsPr
xr6H5zxvQ/8FoK7NWY3BUL7exY80o2dIkQSillopGVHNz/hyl+j8r2Mc2TXL8zlmyZyjLRM9PH75
8bRHUgWS/EVddXVpRYndB/jG+FdQ+6o3Il5PKOIlGT+OiIdGyhgXGJ1Q7JWCXEk5KmdUAwKD1MWG
XzNaAy61PBtLwLjAefHl/xkQhqXnmRtgKYDwx8d1ohHioGbUQwU5f5LgkYiV0jAOLXcIKDKjmmTT
DunzB3tbP2L/VAOCppd+DM/A170aHMWaFtbqxNE95xc1g2Z6wWDDUitl/gusc93hBxQKof1Qnb/a
eqKIY6zoYawj9AOTXeaImvrfmWElyjvhNYTcX58Kn61B72WaBrU1+GmNB8HeEqSfbRLW+8K6APZn
qpLNR0Zm1ERDl3cuSZYvn0m6WpCRuW2BhPGnOV/IlKHbcCYoNrIDNBiQIzo+DNhHoGb5josPe2QE
C/W3oSvZkJTENk4FPP6dpY+Tcn7R/ehynxPCikQ6LMFNrU8Cv0aC6Ui6EzvoReWjxFU5J/p6fiaq
03TYBAHQ9H6I1szP18oU7ydqRq9hlT6+NcuOaxAmXCC3e0nwmYyybqX7Dxg/N1lA0QEcIjJk8Ofz
xMDpajOAx7bRB5kO3PZIJZutBmjv6uIDVdus4f0grcfkZgAl1+hbeue1FxUssZMbTPhgQWhj3k4L
e7B0VGEstZDjCb5Wpm98LJhFgw5jjL9Sdyc4Zc7pKZbrceD6TU+HrnSfAZqOY/lAOXecgOQD1SWu
xGvNuXLWW9IBLR7wEjRqqkyV5aD6LBPntewhZf2dVskKLw6CQxV3qkiSmSOaRKyL0A5smZFY7mZ0
mqPmOeKD1wYy0ZtMKQrMEImsxpYa1gYn1tmpOlKN02AD7w1YATntn2fKarD7beDijTbJuUPYeFIN
JIzzy95dLdu2MECCxxKAltMg3ovQ7uO5LcJ9bGs69mYeMH6/DCiGrznfD3eUe2Wo0+kofEhLVwYK
PIo4oM7KV8jCkhHloWi8YLwonMaIZSVlTI8yCu0fSN3NXczCnIKMO/jhw5f/I4KBb2SckguPrMol
jZtayhtbDdwqXGMTavOQiIs1ZkCusXTXsECzskOzbCyfsrEkHcheRh5NS/iUQPImOidlj/rLGEqO
358LZHzOu0zMNL3xBkO/OqkAmknEQ/V8w0NKm4tBnAHaNzPrqG07vqLgi4awngVJpCNPHOOfacJ6
q7h7sXNOkwtFZvylxW0eKMkrYNVQe59OVvdKEAS+LgjtRlek7ZU55M7YTFDPqettyB2stHWImnPv
49jwWK5CM3bQz5lY2sden1aY/qm6Hd3om/8orpSuITrV+WpnOsGjpRoWwlv5RYcohTjrcYTno/0J
9QNSNhODzyDx5n7cMgQfg5TRSfb1GP1gxT+tSdeW+4WvXZSagJH3OY6wHiPIoWtKb9OXvBFiX4CH
OeGm1/j1JjBs0N3krOuFTkudaNUk44J2xcKXSscJKOCYAKqmG0sN0oMkWQeex8K+csKzJDb6UmqZ
gEI4DHbZMI5g+LbjQ0SCrSDd7FzWa1tIX06oJmREH7zP2Rm+4Rz0c7KNuAj43HjQZYKHenZHP7id
NiScmiSbcYKUWA/jQYgVXn1OafuOnqd75n6qd1mqRFBwIkOJUxsmGHqbK5X+RKi7/nLqrHCiRmc6
mM+5q3HqELcoNZWxZPROqGglHpWb/JVN22vgxp5bFvZY3XtwNQoO8nthDOmWskeC6O5wELzV23NC
vxI93F/rCBTWZZkqt/EUux2nrXAxV9xkoJHp9CUDEl6xqeS0DEeTG9YtPrgbKaQfrbjgMNybmoi5
1OMBCNlu+7b87yM+rBusci/Lh+qz+JEWX2J/n4n7bwj/JHpNrMrfQx+Xt2wRJkPh2WW7tey2Eh8T
H9q7PWIb6Jzpz4u4h8JX5dvmzWX8OE7J4poNPmEGH+6kYUXjbvkM3FNQYCJOuepmJA5DGjMVP7Ua
La/g2JXWlHja8IBZ1Vo0C71GusYJTYJB8g8KpLSabN3ynO6/4Iqvise9Y7XClE+zic8pzJoBS7us
FaQvuwmad8kcGQiJxCT5Uf9ycAfVu5cp8zR5bZsi0qcFw89dr8Vg/yorjyMyVGnM2NgPLKAwqvrH
cJMygM4CtSI+3lR+FzzEoxvYVDAcGhN5XRVrt7jw1IL5F2MEEX7F824OIswJg/oWRJCswWks2svt
Ie/NAbNIRb4v1TjZjimS4YwDfSabpe1oEZ3Ch5JUVzQUTA86ra5Q5YzTOSV4el1gQgNnTBva2/NC
0FQ7xH6jLv263bMFcxceRBP1O3Ns4NO1FephvkHMuVLg1JyR8g6b8LvCPOc044i8scxZyLrseH6F
l7StiLpEq0kz8MY9iaGTfR2uv43rJst2YuETGZhfHXej3on5+sz/golqei4eLLY2bbqo69j8LhRQ
6BRXjd1cPRUDs4M6S31TkLpnfVJ0RZtapG18QeigLnmNfONlGg448XrR5ESi18DsFxsCu0utmQM3
MYi6EuDL9CPTnswpBb+OwzsimlZLOJ+mRZ9nkJgSoLc1woN/FUwSgZZbXRjO+BfG3IRWhUqXDsbY
4qetxO302JZb1byjPKYn8YuzvwMg2lePrYwWOclQZdAfe8bFfFuyTTDEdUuqQtv0tVk/dxP/OR43
snNC2GDjoy7sS3cYA79ezkEWg1ZF1NwAkE88Y/LF6ovmvbLNnhSW4BNbdX/L/YHx4wy+hkhw/xwh
XrhNf/s2sjkYqdW7CfHEUEislyLUZDExhcAK1X2wX5WVC+2HX4Ke7NuxdtyrgjnxqR8R95cuQ9i6
A9xNDGJythRgrdbLr81VPye8c4jg5Fp3zMg8p+nqZMpOpO9+Qu/kQC1OTQPIQ1NRe0FQzrI4MQiE
gyYvwEj7GVSssT4FruF28LlnfxiOGYu/Kvg2+ECEdLmarNTjXE3WvVtRRbSPGx4xBjiCY4FqgoAc
+102smbRE54lonGrZN63XmkXDalGA+e+/ZNVl5a80Z1zB0rjN2S16IN2L3AQwKs6KxI/+tJ54w/c
wp/OFKbxwbNIk7CAKgA0XuT2wkLjmx3BHQRcQN11jyOAyUH1vugLTIeV4VcxSUDFAiqoIAGmF7Qg
kcXVa0KHcxurKL30zW2dAh478+2ZOj+bIixrkKrb4LSA6Z9G5vjK6jl/SUIS+spRpDDhTYh1akf9
RCpeX5f2ZqMTAzXsZ24JGkLZOJMsDl0S5ICSgiKqKqirP2RhkXY6cyMjBgEsqvlpRnb3jW2iZp82
2xnImYV9spFeZpzocOWeg4psHcae3ErLFEUM6/sbViOy0biW6gCSNS8lrxNpPcGQccwcluS2MplK
1wo4mRSs9XM+5jZx3VnjB5Pys/0iIsHBb8Te4XrwAkUClOwyODPggHpivihcSLox7fxPW7qy1qD0
Cp9qckcSDzV5k2hVn7Ta13Dip+Dhx0LIrZ1ZSawRyeznfP0rwzr+/4eje4m3ztrgc1AQnye1bF9E
BGFbWoYsmaDzDeIH3qL+aBoewzwO7mAf/2ufvY57OczDgnFnTe7ajXdz+C/0p2B1jvFBU84PV/bd
6U97Upl/8sM2k6StWf95KXdYejGIiq1XpbQhmwyp/twFgl/HOpNpmN8qvcwt1NiMiglCARIHs3i6
qG1rcMBlcbJsBRjHSrdwDktULRY30m3wQOZYNMiL4L4PRC3bHANAB//LE8hUeYdyoGWvdsI4UYmO
SG0j/xfOkLc8JAQSiUS/saaysHbY34Jjg5qDNafvGhFKoFyXk6TzvHG9zSRJdHDNGp5l1hO6Qfei
PF7ert7ExAC8ieMsTKWhltDfdgK6V3h+iybZnDSUKxCazj2iw/ZQ9igad2s95kdh0Ibcz4+hnk9T
Fj8GBytUGakzs/uJtCGtvfGd5x5Z9bKv519DQIJledq703IQWm3oUADRvENUCVvJ1k2ii5PBvqKB
rM+s3GZTdG3swOd4BPUrX1ZaslyAz8PnMTbJcuXU1kjge2SmPbbLwYxu0HCbQ0kiw+31smvVCl/H
7qwYNRqyrGgoTSsshipDwUrlVeMosoTUoNMljvpyEWrBh2faOqBwaNj/tuTDaUKeoS80Z4A5S6ge
4le2XXELzrihxRgjTMXsr3V5pq5ojjAZjsi13D0GLk0M0tEXxZ6bDYylECbtqPT9a7jVoyhVaeYr
Z2muEzneb0ofSR/KCddGIf8qtmrCTdHEIR1VjH+O5nVAlGuscqrQn/nKZzFGZffFx/FEgnIj4JLa
b4e9MmrNg+sTP7TcQWogy/Kuhab4STicrrV5Q9rnZgk5+S4ctse36PnaMytbHO+MRuRwMOWcem79
cFkbUAbYSGEGa+TyOdyicwja4MbK9BPW1g/7tHovVsnKFCJwsD4KbQPcwkhd4TMcM635EprA+p56
DfQ2XQZ//qW7dPX+f8y24E2VH0Z/sW+URQEMYPEac6QjCKGFB1pG9PsCReBHc2kfjpsYYmk/teqV
JXo3BcBvNm4Zht50vyfsoUN8imfIGEP9BaMMEwj6oDzOHDhNl0H3XgGIMgADXicb3iiwzESE9nKH
0QmKyfgo6dQJeWpdnFZXJ5YBghgUe/qp1MzvdqP9Wg10n7E1Dqov54dzFztNVTpMmohUYwRv0A9d
qPXszur014zBoGRKFPeFn7bdOGHcmEpKZ4aoIAVwRQCbb59VsiwJiJ4d8F0cnAaxO3FwnATneveA
ZxkkV9o/CofdKe05Xjtye2Ng7akj2CZcIV8ViJBRrS9pszayoU5NQMMxhcgE/Hok8jF1WFPye9nG
yqJ05QFBlzIu+lEwniIBFAKgKT6sqhat4ffrH9FXklt11tcizWFJKMmWZxP3j2QwTJKP1ZKp1zI7
7RZvAwZEKUCEaYQ3uhNWnro3TIlaIKj/8AuhVQwN+9fD52xLS2Qt1j/w2nf/rycPEPZAotOVI5xf
w+sR3CAvttETTZJOn1n/cL+GFYw/P3MmQubLint5FVvXoimNdr7XMu7/AVDCZmM/zGqzuH0fvU8M
n7mO/A+J/F7eFW8kqSv7ESZnDF/IbuBP51rjNzH+zaykDBWiCd86ugDz6Ordjh8YThJxXmqfEtpR
G/w7RJz8GI5gCH2/O+eUsse4w9BmxY3AAiPnlehGw7MJsIkC/kMFmP+h6nJhp3mzA5etpwiuD/Di
gMAZv9He1brLP67kdgNfRwLQnLFg8phnI9SNRC23171xghU546+2tH1y3bLVZ9J6ZHasAR47N4Ut
/u7sg2GxEvl1WQibDFh58A09KXAT0zoyl4F8C/ZYgD6ePgIn92kR9fQ+wAOENK25ACA+SuawPiI5
xgzQeL9ZS406SFSTOJh/C0JNuGS+jazFv3BiKYb5ZNqDGNGmtQ/yzE4ydYz6KQ+KSUniAv1d2gF0
qihIpElpe9j3UMlcWzvlYL6Suh/8baYObCCbcUHjgDbvjSh5IlpTd35kAcsuZOAoP2rVjhDqxeiD
BBd5rQHCOJ6iklj3skUGC6Vq5nw2vUwfi4y4BcY6k76xN2bB6cSQQTCsELXDTjnBiDHhLD8qRhXA
zSfiugKmAxEcvg9N25DnuCzTZUxwSubEF6L6k9caoMJS5w/FaLTYYAnlrpu8Yw2ZmRS7N05lbSQN
H07SpEGdiFGaNNpXdjyGGjEqOjGYyHZEc3KQSDkltcHBTZ9eGOpkyvNQGfSjhAW0WMrt1IFMqFpA
xrPGbzcBYqQ/xruhKPYjaAkzKo8htXPW0syRLeP4qXws6uDeo99XLP8k3OxdIL4jK/VpMzPGpCpe
JhisEec8+iKQNg57fLogpvE7nV7wOrtch7mrFVfPKhYPrpa6hVb+ZJZLYTdxzbGf8Da18GQWPTR6
1bQtao8X4I9F+UyQivw5/UCiehcFDszeQCy/g1thCeV9YzsEFf4YVsQ84gMT8GhmaoU+2CqXC4P7
q0kPFnlhRT6Lx+4PiQB7Oqj5auU4tk4ID4rmGPM8CzPo75QBBNZgfhYto+6CzURIVlRANoSPFG96
yXNmZcae89U+OmDUvlSEr/B7s9ck50Tre8gLhqwESkPvZR2psC/roNSbylCnE9xHIrGCiY3w0ED6
Rk51U5pTD8g9ii+fWR2BD1IFEw6tZuvPScUCR+PZmqr318YQe3WXMYkwSeTcumAVuW81oE9/9fSP
8Y4zn95PoXG5EEfNPCaThyHvlptotIL5wqtS/x2REt6y/tUt0Enb+SGX6qkuvv9ZL/8Y7BEYoLpU
XlFQWxvxNG6hHaqp5f6Cq9Hmnux4KYToP4oXKr2xW9YoTGRmzvArFrb8KSHbraS9IqRog0zqDWQ8
lrIyOQq64oIms93AJVTySW1B4x/qfpFVDMRTuM51133kH3tlT9N5B8fnPFeKT+/xx0cF4vO2JBx1
MPvLAF/w0tdvfGbNZhVt6P9Y5h/+tBrXZukdsx5r5Ww/bY5EYcBzcfH6VZ+BbJgk9vQEKK48EY49
fQRzXfr+2QHdV/bY485G/HhtiX9qCsDM/EtzCy25Re2MuSMjqLc3jBQ+FHxf2/bjEkBEaq85P8zK
mNMgeYVepCkLhCz80B97YJAl0N1D2ksr/iBDRnQxfPvPqp1mIRDYDrM16zUoh+Mwdpy1QU35Jpxb
QhauMR/nzTH7/uQIl2Y5Xb+u1rudJG2swSetkyDMLB4PYVbVZ0EFbDW6QTHgP1JUbXpMgxwegCd9
Mo7t0JD4DsTW7jHoW5Zgg7dI1geVmfZjuNMHXwep+M0gkJSXHrzbsRBk1NSHEPFE9Cr1slhUsGZf
v7v2I0lMEmwsd/ZecaWmhw3DDxvSmwGGFHK1vqV8o3jGwvLeqB1MYR9kFkibsBWSsSBYNrjciq3n
LFsaj9s3GF+3zhtxv6LvEuyz9abxvPQSF3MLBbesVjYG4wI8HD5V2ImTc9R8MLaJtth1ADz9cilJ
4xbzy5MMKe/6mpM6mGiKQ8coa3oihKRhWgNKTYqA2uLV+fIVbUYttnQnImLE41rYbGlmRZaEmeD2
UvFhSnv/C/KPF5zhdcwBjM4UKaIHPhxrfFKOvMV02HX3EmUHqNR1/QBz0UAyeLe1ZA54EygLhtEd
4TenDZt2nCnpMIpfbMo+XYHK63bYLNI73esP0w/9MMVoF5IR1prbOwGe6qB4He9Jupt5GReljAAz
PRT004qlLhuTt26UQq1AIUCB3fgI3UwWqtf/3JBADSUzXDfR4PNTqU9eYw3rlAwsGIynUe+1F5E4
3oRAImZjMhXc9FhC8iPZILixTTagqY4imALPmefxA9mKaqLOcJComu+gM6WLNZPAxSWvhhrDTL8z
mUp/DYWfXlToxTkk4v0/ZGsimqZIF6q1E5KYQgyA6/hgTUxkMXR3p97bvMU3ST7ruvUsPYAo2+5x
BA1wNZ99wU334q0vFWNFf+dgrG78EM0xzzK0pJ2OU+KRd8qacCYspZEylXh9jm1wTmTyx/YDESu0
z9jAAxWRlBiy/BDE0N/2g+bEs/u/zVNcnJLvgXWnDprxs8uVVcRheVv4aJRo4D133KJFzxax0XQj
6xiQYyOu30f2dNnRG2ZL25AkatHZ34HMkB2Nj/Q5I9EPWlgct99VmpuGu65vOsYqo3vNPbmHR9SQ
8Rz/ZfUR1l7D92fxQeler5aWtlFHU0J7kYh4AmW6UGbxlnZHCF1aAPhS7hjlj5gOrtMpa8Cm8lo5
vhQ3DlEtHWn+b/Le6QFG9Thwam3PES4VksVcs3IqfSeOHVDgEpXjLJ+ulWoSzl6g0zeJW05+8r8C
OxbNN13Ub56c1Xn87tlYTVakVMIDNBx0t4t116gfLMgHjaVEBeqGUZB5bXzEXkb+egqzjSCHRvwX
tDnOCNiogJSPnHFjMsL54LX1jfRmokxy9SDTbiCMPf/cQfOLV6M+oCtankcTVwRiclHm4QWW4Sk5
WFXo12lCCigHlYknDfDXA29g92iSmCYYPRxyy6RKa5mF3eiX/KYcTKoaDWpECSnZd6hr4Of9sBBT
fpuNCyTf1hn4hRt/rNOZ0u4XaGk+LukFNPXfkenvZmgTLY9dPpx0u/LLLnjbzueCnrad8+6BOmKh
dqxtNi9lOhIMkB9bH1CZAct5Br/6Y+RoPx+QaQJ+XsU9kKFOoN9DjWZqmBzAsmqnk/T7x4gBWxCa
62l0YCZUcvu//0XPLathMWQ9Baq3SsDgg0Efd3lY7lM8+ljk8DGHC0Jtdi8mvaXFn2MvMxAMj5L4
qW4TH5iNpb6Sbbjpc5kUNFRWf4ssMzCCMdQDDc+EsnQZ3KEU/zh3eK9qyI+YMEOslcTEpxMaeadh
9k2kR1m5d2Na8BpMfgPk6/wLaZFpK8r6I4fiAdiB5dM5A0HeVB0YrTunBx0Llli5cEQbfIAlDRVt
VxMzB0Z4w+wiSSZ5W8Z0jiqzKHQG7M8E0Mv7015fOCHQIcRhqEctIGdkkfnQA6kWZRTfz1L0EpX6
iWHRzKs8+4du6hRWx9DA/UN3YKrLqzdw/F14pGl1jxdVLJUN8X69+1eAZXqLn8VimqznOhlk5Ml6
qVe73KxGb7DD9FNurex4Ax6NORVt9eL5sFsYeqrQzTPK6Mikk/czkYqmBmEsfz+xgnRZGAzPkH4z
Zk3ChFhWEPBKdSj9/HAbYRRw1dM71tUEer73Nif8Ng2IXqXDic3avF8TquDzUONdXBlmawZ6ouZj
zDB5k5o9JDcMSR8Aqw5s4EXVUAnTrSuSr74IzWAZc84nepdAyXol361KgAwsz64o7jTXgZ6WsD5L
g2Qv0xGjSWFLoBcWmF0w6PGtZpt3r00JsJw0remYr/7oXD8tM7aMznSNfvEPRohBkGls+3tQfC7L
1BiygUGM5NSBmmwUEVE2LQLWqCmHjywiPvVEakfBHye4EqNuzfiLpaDTc8UtNDPY4Y5Gt9lGSSSG
9qNmxeejvT+V7tztnpy+P65TljwOcZ4pE47ni1k4dgf/zjzjMNKFvhRuOTM59LcKcRCkJze07V5e
xV87xODM7KbGse7UQzcy57YRxneI/w1zPWDyTI6Dvm8O+SeHmg+B7lRxl0vNiRZRkx0acEOqA+9O
muXXw2ku71F7xgQ9cBBp+uPULc6CXJWqD1cHXEC7CkQGTbpPwcpz2aU9ZNuv/qCQaxYfrVYsGc21
1HHXCq5ObeLZNb8EPA15WPtk9zJjFCoCDFEmG0D8tIdG901U9fA0WJ+G1VthkhSybEMMjb3xTpUH
s1HJd5bJx4RKTAIWp4D1rbt6PQgLWcmXywth0yhT03r17hQtCB/8/eU6HJYdQk31TrRNSIZPvm2x
8aBMaLpj71Jx69CIY/kSrmPD1VtfC/lbKxapHgTZiTZUb3O+phe2l3qEvCvfpHqt6vGZRievXy0W
zCM6noRwgsQm3PDyrge+mTwkxRuT5jbGvp78tL9yt1p+kyBRxviuLcWTw7yIz9hVrREiEhzHzpjy
lngBE7fVZ93fI+FsjmjlcGPFDUWrEzmpskpJXjPNRMWSk0eLpNO1zYZLfh2wnL1viKr8lwfFCu9d
2JrTGRV5Kh/ykBByo/V8DRtcvsZVG+mpjXe4tmiGCpErq0C0nr4z1j4Cs/8MZStnPjNMMysYToJH
PVELn3nDdhg9TdcaZRqrWDSeOozrFicn0Dn8eVFNcZzPNQPTiwxnQPdraszgcBuVVksOdvHERkbm
1l4TTQCk/pQT7isF7Ds9yNGH/mlVjIdrAay2UJojIXUBaIx9CxmK2iSd/YLtxigLnD5FSjNYC5cV
1HomcGhBl+WSsnBIu0ISfcHkWow/uOEyOIV5i3l0gUS8clpvS/wX4iVyqd7a6dQ9fazOAto/Scck
ZOFnzl7OAY/I/hwEfHnwgB8KC1PN6thGyygQk+a5D1jiQ/pXfnQqlWUxgxSY4Ev6e9yv8n6W3cKq
W1l4rV/gb0mQPhN9jKLWUMWDgagBC+KO1rCsKCeU3QVtPms7qB6ByWozUcvBiWMHNIYLmtLzPUfl
+0QNuYKWboY/GAWYJ/tP4Okt3zV4JRDCxWYXZ5go8AERL8vsknlEc8XnPtVcF51OqhhOFLGmxviM
BbyeM1c+dlbVlg42HrFWPghth34xS0lgdbwY3zIOVjWjgJUwHXooICPNUSdblbmp7VnGotTEsO0j
XEWOawGlvUAn4hXzn5UlRCNXRV16yEXq6uGoKrrtzwjJmtIO3tsVXxJ7kHsOW97GITnB0MYH3iNs
xEx4vtjNX/k3WZc3jB/nr0PVAH+c+oxR8MCT8cT/denR8NPRTZwpHz65NES/eYVlXGsjJJXlv7gE
etPTh88lanvPDbW3r9+Ss6Wope6y/1IUTrUlnT1aphpj6NXnniLXqlMp/0kiYNgpaxQjUMP6XR7M
bJsq966UhTcv3SQTlmtmbprrvZt3hWj+ZEV4P6Rc7vUkM3n8GvK+0sVPlearLHrE8X41Lkp5pOVj
qp+jjw9CPQk5tC+uJobSy8G9HchI2yA4tqz46jQ32Z1AzFnNGm42CZiPBqWT83DetSWJjWCx8t5k
1BIdpPVmQRTecz/FZC67g7SB8xuo0rfhA1Ky8rv8p2PGkT2M/mUDWIU83TJnaj+oU4E9kwZ8lL0V
C2VbX3J2l9R/BK8WNLs7iXYSKAQmY6UnYBm0x5Od6jlPwIZbpkRCV3EYhm8uY/W7XFtvwGv9DWWZ
sl0alYnLFl//1Llkxws0I9sN2mo6ocQsUyngy7wWpKgR80aiJpoalw1zsNqsWXfAiMDB9nHTGLZC
9IIR6XTlCvEMr8Q0/vUeDS+AjSFf0PO9300ezUPrUeImmxDla3SUafCv5l2ewbbIRNAPvEVt3FVe
E50+QpR4MpuaaTenkx7sLVTPVeYfXY8sk9nw6Y8f+txL3fDSnK7cmozG8A4uupHpqrj5Chi4IQBA
wwU58v8dhL1BAQQuWxJfN90GfLBIVFiwcfiBau3fpTXKCVaRxDWJLuoUzLhOTEh/e8Y2f2WRSBLZ
ke7tq+UH30AFV1pGxvd+LM+z9X1rkoTyYHKfzCE0DoudplbjMPhWFZhfA9Q4YNRVaoD76J0rpfCK
5POiv0Mp0a/BHK1pNIXb+spLkTq0P9PXXF5x79ECXrPNelNb6p7OUdAvqdro9uAr3vMzvpn/hgMQ
jCnJ6B3Wx1QcBWEiaBPQ+BCfncxYIKbS3X7WoUQQv3qVXZnK+2Of/ftpe6pO32IAGRskL8QiSYAj
fXAYL9JP0/xcWFZXQ8Wm3YYpjbov/cIRYnAzafhJzO/DD4HrA0i+MrDzaI7lwbau/p/GqArSsQSS
rcPcLglwPdcIf+DhZ4jiApHSFf2KyxBMZ7+xCyEdgGz2QuIvLetypqALeN9HZEgFG4yENrcuHjyx
PAQpOJEZ9JxQE1qyg6kzV+tgMG6mhBS/iQnyu7GtgvWXEwwQSkVFyClW3u3X5eV5DEdEd6I8n24d
cHn/oPKCmciGuxJneqbqbKygaFAaxfLzyNxrjO32CzDwBUv/T9Nf+MvQsoLwZm84xtF4QMLopvSH
CFC8GxvMAf0mdkJTkujuDIrdQO1uNH7Nlatfr6zeT+ZOqCc1h7t7bBZ5u9OkdRgj/Z8+hnKabW4h
XP1zGJ5XPXkbkKWk1C25uaDr5ui8Rt0v+GLDOgcsZqEBYj0/BHJ6jrhgapYtxrvjg5hKs2Ms8msL
PO7ZqWb1G/BKuntxXhTgLSlafHCOLKkqs8z52Odl22S7C0TH3UD21bMqvVtftW1kOJp9Oaz+XqUt
Nh4jUXvlbFjDGV7j26ExCM7ovaZj8/sl+zAjFuufJIkBV9K5fK1eK2MXS4+DMEIN09r172PC1N6J
fHBWkRnhDVSU9HUjDKtfUuQh21kQaJB1tnPWeja9/RgFCothW+8YfdOsKFGgIczUpkjinvItvFLP
1caY5T5OIZxtbcMP/RIk4ipaUCDaKUorUG9KgvLBLixvm7QuhxtRtDLxbwlawDSW4l9i6UByhwV5
wDaqJ7+TvqpWZ2VT6v/bvvwR8Owm4W+n6Meteek88fnpz8gRW/2wpzSqixwZaP2GI3n57YOfzSiV
PXplIOdcMtOEKLkwFKTiXd/NKMzbpwz7X8BFG8Mjs5Uc4cLJK9Pjg25T58NwJfXDlWufLjqWjDL9
2D4c3j5Om8GMgkVz67hz73Yg0EnUU9PBC4TdRZEB/DwbKtADLN8Gp5euUgAhwlgDnuvHSFiaKgfy
oLbvzYXDTGHEAcABPDVZ6DYpIj41pSGNbOeaYQ0cwEBFyDm5yNu+ZjVpVObO5URDkNBgvM417/GG
Oa+SSyB0Uoka/s3Bc41CqqQFOyjatomDPGTsxf7v8hooD9vBeTJEIlszB7fk0amxyeh9SCMkZevc
gvUIdPV94ObyjK0tJ8wZ8BlPRZZ81L1ZyhdXurGDJwGsr0sRkrNMWFGyw302C9+nxFJYoR3dbnUV
Tturpbk+bYv6TAb3rL/C5GFFoCER+Bq33+Q1WPzMxZMLBKIPW3fVbQOvOJf8sNdmvJAd70bO58xa
cHqqhkxTMiK1tP5VmxjcYkE9T475hoq4pcrnaIgodsgsigPXCyJNtJWKEk7tICSo/IVq3meQJvPv
P3CQ5cxJTGBRYok0XG7XQ7wwj4ZCGH7VMFLPPqERcrFhDtd2KXt8j+taqeNZc9AegO+VpVqezKHn
nCws8b8Y3HBwwnPzBWc1tKfD9DSAIyPDXNnX11HM2FLmt3lQWbYaFn3ecHK3IJTfiAd+Z5AwQL57
PwpNPrGs2xK6KdaoqEQU0ujOg3MfZh0G5UKJGv18+ygDHFnwwAFdvjJ9qscKdTgztDx4SJN1ilk/
oh3wnrAQ6n67KiNZmAmVTvfLdOogfl6QHTE4oQ53vu42s0BdRWdRb8HZB9/tQZ4kkqP7D9QRQL/t
3gJaF2+7HR6ZxdGouKENnFU3I3EpSxoHQQylsjTiAhjNX93kaTrbT4efjUhqJGNrHDzYkBROFDqB
HRw7rsxjoI/9oZeV9/EjNNmWVk2FYbJqiXrPogVEzW4+qP8FbxzOTF1Gh8Rsaj1wpe54/EB1HmR0
KTeguqf4B2/JCSDMj0CLizB3Lzhuenoh7qys/tSdSCWC/XbbjwMJSs6DwFqp8f1ISJFVza69fxz7
ft16WZbQAB6nDMr2AYpLJMzq+/PrZ8NDEezte1IkJc4DGb4B97mUYhAz+jy1BMxGv7P/l+JQFxXP
FH11HceQyCmjwOp2mQnFycL8mq3npIsmd13ZmA0cZJJZYQAZduIZ0XFAOUm9kGnBxsN3OdZltW1H
BNdr28y0pGw+pJcJYwUSzA9HamLByXLUlq26yB1deMEr5pkmALbwArWzUgAQKmZivE3TrAq0jj+m
dv6WiZqK2o4BnZOli7u7dQolUDIGy5NuQs76XDzjx271X0yDDQWl9LjNa/k+jFLqbtEPtaN/uotf
Kb/whlTF2Teo3S1P4oCM1l4O4x5qpBEJXFd8VAhDavlGIP9FJg7copmy7SCEXgl90LFxw4BOoQ/t
ehj8Y+czYPB4ioSK3IQoZnWf9JZhjJkz8BhYxmKMfR0A1cekqpbjhYR9ONg08yS+f3re8MnU6URM
SGYl/ZFbaiFFdLb0k/ElNNd7+85pCmegvnFkzQutmYenfqRFvVEGOO8U/7d6xXgH5DYU+kPWrtoe
p0tQf92zUMESUaGSA1HPNB4vkvUozhU39wJ/rOEbIXPUuyqfti4ek0Jr5vgbsuOXB5jDx/A3jKtm
iSfoZbccrMo+Qmd5yyls9IBTmjWudEpnx3yMLNzBzBtHGiCNmZ/gf0YUfBZYy7FPX2y5TlUkB9ea
r/zfSCmWVnk9ZZUN3AwSr+C/YlALVpo1QnjYpNhckjzW9eYn8mikY2xwUEHl5ukQuwqciVyZqPVu
/oW4+uI4WGJU1WoWeC7znswdNwTR7SKXI5fT3ZS5b0PhEA0RGVlsX3nJMWC40hXLxGpmt2puND4C
T5Mln/4q/B5SAIKbv69C/+fBze/7B5fMCOTGIfJacEpt2szEOBE/4MJzvNeTWC8nnuthfvpsBQUJ
2FJ+/B5ay/FsiZ7vGlgTpn1AbBjKj1tqAqByXN06wwrV8312QkDKRjxY6/YgzvtL7QJlK8iT4AK6
M1+qYtCP4Y5nSJqyLd6T3uQ9zPRYkzVccZt2dQ+78HfAXIVX+dJco5pF0hBwRojQBgKYOrP1FtF5
n7kZRZM8zJJHzTMhqUFCyeTzAlbQIfVgmfo+SeCwMky/+uVZYbny/Xr/emNmtx1eGbbzVqtmUO+4
TsalCkKPXp4I3jxR1P8Mt0xHVZImNRIGbSb3PHJX4FXyzRg+R+1vEv7ZI7q8gZ3s2p1XwtL9G8QC
TN31Jb1Ywiw0I3eE/pjc+UOp+mZg49eJvuW5Us5d2xnlY8J4U7ci7HCJFUFsonv5em4ll17pU3bq
3B3fk1EBzeURMcNapawqSH8gu8yxuSc17VHRhBUJSVxKei+XkCiZx+tyeXk28dzn5rm1m16pX/C7
THVvpLnaIG+xntJ49O3InrLSGBm6TTrFhVctUCn2EcYjo1zENST3+XXRFuHHE6EWkGjvGdRQvA+8
RXVBytyHUoFaCa0rZboi+EV28+1/Bs13AllES+oOHA8G8YKdNvyBnUIPefdUrMPmUHX1v346mv5O
qbgjQEiroDjbpkrKVol+IqPgFbpdR+apZlmd1/CrUvSR+UivKN8nmOMPCo/arfo8YqOTV0vsyt0t
R5sN/Uu4ofYK7KdRmU5Hnms3BJEbsVpMap/DUmqT/Nqz8qmhOcV9kMN6r3jDBsKAqdKLNVolzj0C
JeSdT46opyNPpBA5U2S5LBInuyFMuNVuVWyuwWv43uHuF9av/zYoZvfqqh/3Y8qKKgOjm8zG+XJ5
ASVksiYG/+UrV/jd4+hHqBLpHbsEPRKwekdj8T/EU17B803kd0bRpp3J7uDvpefdTjLtqtVuSFUs
PSRF1Hcu9aIA7WLDHhdcUmmytKuvLGgW4rAmdkLgS13Y4FLGwBYv16mlvXZg8DCsr7L5CQVsZmza
Kw/Tif0V7S2e6iGqhB+Oio3XhHWrgnZOgAEZks6kYbO6eilnd62eGVPAaEtvTuWYDbUtNJ+HsRf7
H5cgEOl/JuBFU8HKadlQ7s2jx2tM9QVr9zce0ACdjPMqbqFSjXqu9gk5ET1RYVwjiRl4d8spiclj
6FbNDTTxL2xz62DxzbNmsj/MS9nEzIlnkwVcrlQpUcsVLe0OB/Qj1Xrp/bIxhdInwvpzoqIqFEp9
I5G9BY3V5LSwghcZwe/7T1w7b+BrwWOYewstc48CfRqWQzi5lLQMEAavYYjWgZJYsbnYNsrkrrEU
Q3oj18RnXWMJ3Y0Bvq2nuKdjaIU4e+yXoboqH0SzFZCiUMjQVPycur0X/TwwRdqVp6aXmQb+z1bJ
YwDsEG3Id1LB46w3BS9RM63Oc7YVK5ncBCwKxVlJw2rQVPzjgwyHhhdW2jA14bqDVDKlKLw9Z+4d
ce9ldfOcxbfAz8DNw4YvaPl7OvsHqB9bKUlT/ZgGzWlKRT0yFqUwsyjDIIVpxf3zEAyyk4R7wwoB
aY1gsgurPeattG2eDecs0Jt6H3qzzzblVK6nf0auomNmhNpKmx6gve0X/U7ZXhndHBNe+kHZ3Y7t
MLgfcBnE3wnlIvx3ztJxHvdiPIJ7F2XxFkdT3GxIHMnZtGez1wt3azzxHjgNG49r0BDN79TzpHfI
ihYb0ZFgiYTK3izpKMv2znuqGJGlf42YIiivmRCZNyr005chBzYhC7ci1m1c/2FpIO9iSJkYs7yC
mSK2qfvHLyiOcG013MxIaTOssE58Knql3ablSQLrlORc2dBKSzQa6pNVhkOJgdGzWYw2pjZSYISz
Ms0WtcaEcNgpORClky1t9k7PjsU++ky028tFh8crGdQMSE9BVXt0bUL7fK0sRC4oGkl0nOTthD78
G9vcGCn++YZExFWPZk55HJG5qfWG4EIL932/WAxxQo6iIp5bvsq+RI1EqfmwmjH8awkJuqSF44eK
oqcboNLr9bqiU0QsZTfH+lM2kK0kJZJMzNrBYSVWsllw9uSrS+9s8e6k00NtJA3SSu7TI2MhzaQO
9Jdr+e/gs5E3HrWct+qr2m5kgiAY3mLzv4ah3H808AvC8FtRq5eETmFbgNRgJIoEUMB/dPRZnA9w
SIGOZbjctZb5egrGMwKR7aZOoTe6RJ8kL+oHWLuzEdWMagSWF+in0fuOzIMygnx8OOTtgc2deEHY
WTWlGeAJ7S/XF29NEeCi+9/cJBJe5GxlWT+DFkJJ76nJ2swkR3WJt0he8oeSBBFlo53Yeh4J/DUd
02PADHC4easR01mRHCE4+IAxf0n4VCGD+1tU0G4NbIedev6ahon/3DH5Fbznbcp4vadE3NwZ3OQV
dssYZhtdkVHoCn5ohSx6ula9w0zgY0oxqxFiP6BPeefwYCO/wGgRBMfHG71fCNSBt4AdSdxgkjhN
DK3xJlIkqpVZ0AS8N27skkG2ksyo9IR9ocz7k4e2pzqMGue8iddIkA6G08To+jesxKuWV78sQObS
3PgSHeNJ6RXYpKZobNAlMHxSB4AmYFkQXzVxaEOA0k2iOINQCNBlV2UdB5chdfTgehxYDwZxOJcy
tbypGAtFmlf5Yqvgco7hjHez95AfHVNA2VGAzOjWm/Zc+gwt7ZGT8C+5TgzyVIo3T9VpV8f1wrLK
otHrUE7fgQ8g6MZAvhoTF8IKObN3VJDs7KKHJBZ3lTDq/en8JYEhhtMwga4a2Ag1hh4imvwrxpkd
624Zmg2dNpLgKrt+9heLxz0VpeWhHMIOvGwy6Y+0UFsz/VbiwNkg04L1KMbaa9fzQqVp5KDt1Q9E
Bba41nnqVo42tFBfHulmQPlz4dFyFYNPmGMsStCsDnzFYz6BZsmG832xPFmhf4xy0mGCchBL6Zxx
Jiuz73IbqTbh+RvC/kw/a7MMa8tEoHVE4SUt1Et1ZqQWW9BtRra2kY8DHo/lETkfRaxix8fjDY6V
czt0M0uhrzzu6AzwFhz6GLX0xn1Xl9SSqmhi2D/ZrLnZq9DECjC5wjHayJ1Sjl8sLnavzNYgM/er
dM2HqCpJe6mYAHLH94Xyj5o2lkgau+cZm2Fmck2iZ9pALGqcS4jdosY8pVhD1O7tMAEBizLIexBi
B1BMHEcaB4SqdwGZvO5dNic3KgjZEgQOBCI3NXKQ2hFb/4V9RuY4BaP++u1GuJWsILr3ETAX268b
m71D3EWTmO/LzUraHGMOgo2xRac6t8uh2c3ZcLtzTkA+Zm/CVGFHj5tXdgRuQzdLG5/DwtGmVVqA
KdaKaflRJsAhJkZwCO87DYZyvOQRwB+HsM8Q/nMnzFoNfEzfDKTN2kCBLLz0ihCnXWrDeFnBf4WR
ExgREFmyUnWkEhPwN465G593dc8ipYVwo+pYubCjlkd2F9aDpiRR8OX+2fcP3rLNNBUQnX7lCDwD
R8kDadjbMZS+BpVhwndDcrwA1ef9a7xfmvhZHlsilzw3UkEvOY34BEonzeWRj4UH+XaewHsjWc0h
qz2FjCxjQsR8iJvhL9BnO+qy11fo6vmkQezdlWg8HlADwN+aVXDZsaMm8DeIVrr+8qwYIIGbDbGI
v30U7bLsfWyEMEneqypxqvZS1KH+lPaqnLQJqVEfcUzgf+nWmhiMOpBkdTeX+yKiHfmzIIsw+sBE
dxzUEAox24b9Fn8UDywNH+HYuRY3xrxghtGYGb4R0KPr3kNXqc6kRdcT1OYHA6qZXtKTzG5LlPiP
IUsESS4TpfnQg/S5xUl3zO1DDIF+gg7Zvcuhufd6C7PzuqsVEX1MY83ZNfwzrSF+kttfL2UgTQbJ
44ufLHzWtexxPWhsKDnyHmjRzF2QVlJ8xiwb72HVcExCvmeJb3mGUE5+8uvUF9gjFCY33mCSE8jv
5YR2iVnq6OpmSHq0iYvZko4HaCEsX/VKAN1pen5yQlJo+gQpYaTxStGHOAClaKyHb2BV2wRNruM6
7dA1kCb7pzvsa8UlTBPUaPXKg6UMl+tPwL4snSiLiRjEn016HVsYtAU9SmAjnkFNol9O/uwwpvdQ
bnlXTatJLBUBfeKdTO3kdXYB0Y9f143AkdBxDKhYqe6joezPnxQGNqoG01szFtnA65WA69WMaD5e
EQbtRWagcCGM34b0zzsKZS9VoFSc9R97LujpPd9dchBJmJ8dyM/l2YbOYu3J/vvpnzwdycN0TPol
2xx/tQIDSyJ0nKtv+QlS7Q/5bB0HHFAVWhLcm80llO0uDtU0Zkzk/+VDQl12hvqthGDF2gCdikAq
WP3iN2EgUbj22zXkYjuwdJISM5U/H5OTM+8NkO7Twrjq5dZvD0dThbDq020zd9E5qdcpKrlJedaJ
VY9lHu+i7W5net/mXilYpGduw49xhuGaX0jaToNXatRE+wXYt+UshbskCHhbzNgXYGsqtqIYFze6
2HNWrcoZhMZ7KsKI79YM+QJbRoxsgzexa8TEFIICzBF3t55qDiPbcQjO02Zu2iCleHs122kLkisi
cu6+o23JBil1n4ugP7R34+ucXp6ttxyZgHp/wFkb1pCIaCEpVPc53vm3IsewxNPQBKcC3Cz1CRD0
gM2jZ0EP6X0jySO66uVakrpmEIfWtv2scniQj/3E+4c6y5D4uKLIa5anjk36PKINojhEY2nPueRs
6WQFAEpxCZ3Zlt7+RyCy7enVszel0tmb/zxuFM3N3Mt08g9zRRa9UHHgpnEg4SM9X/eEJStS2mK/
lmbzqmpl8auE95xquv9P9dHr59K+cRG/MC4v26w/HPJw0+GZHFXY/QY5iShsRMI6GrN5HK0srFGP
B86eKLzshyRr4GA1mv86z45nFR8mLGEfob4UbdPddt8H3Q+x7fqjUybsiMRQ+TToD9ZEc1uNTOgz
kQrlTxyXNaLKnGKv1XUukMff8nBRqkBFp2TJ4CvNM1QJcFKr7yLrTTZoasIa7P+2FnS6/KAgd0C8
AEmEE5RRt5/Gwm74vB+GQCjiuCLTrg4rmphDu/9rLAN7Rei+WABdoDX1XwVNgh8qy+pCPinrGxDI
rU8MXAzoS3bn05bybkil1CB0hGTUIKgD2K0lq8TblvQaIsmkmH2Kgjcd0oQrqFqLxM4kaSgKF0/K
EK4gT9eMtMEV2Q8kcEhl0/b21PSWFJoxdk35hJ+qoD2up1FyfjYjdJwEKQlCDG2ZpHamB/nVVmxk
x90FuyHlt4+BX/pb3gK1pYkNz7eyTsfRyHyS04zRqqkFST5XEW8tzc42lNGxZmLJ0ligXWbpQfpv
IFAC8PiF/dvaYOpUO1tJSoDbs/sTzsGos7tHVdyX4Cmz5qQuhWuuYVOaGI1M+CqpDU+o2o5G7+sM
vHxsFIIl9rMcOTS/NlIc8boLaUJQ/bpwCdooUMYaPoGYr/LR900r8/hd+1Ddt+aslD5JoBszmON8
bk+jXnd9yaJ8Xc/OJ43NjfSOiJJFGce8M09VaKnc5i4rnqmwepTw1/Oz7VYWaKV0tv0mnN+wxYDz
kDuGwex6ZFVppy6dd1L35hB5RCkrUmddqyhzvw8ek5IR5b2CEbA=
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
