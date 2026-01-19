// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Aug 12 18:06:46 2025
// Host        : Suwzw running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Code/Verilog/Radar_Pulse_Compression/Radar_Pulse_Compression.gen/sources_1/ip/sine_cos_rom/sine_cos_rom_sim_netlist.v
// Design      : sine_cos_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "sine_cos_rom,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module sine_cos_rom
   (clka,
    ena,
    addra,
    douta,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [11:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_mode = "slave BRAM_PORTB" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [9:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [11:0]doutb;

  wire [9:0]addra;
  wire [9:0]addrb;
  wire clka;
  wire clkb;
  wire [11:0]douta;
  wire [11:0]doutb;
  wire ena;
  wire enb;
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
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.5432 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
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
  (* C_INIT_FILE = "sine_cos_rom.mem" *) 
  (* C_INIT_FILE_NAME = "sine_cos_rom.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "4" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "12" *) 
  (* C_READ_WIDTH_B = "12" *) 
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
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "12" *) 
  (* C_WRITE_WIDTH_B = "12" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  sine_cos_rom_blk_mem_gen_v8_4_9 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b1),
        .regceb(1'b1),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[11:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
FPXllyX2NFs/RMngGqZy2bLYbZr92CdofeZrJOHklWXExpaPgHNYp2Lzm4MnflbnrfSkCmLwwKT5
zfRgEip7FKQ5Zhb73p0MAIADixBZ/ZRt4hQkJL0T9brm0waLHfanjnov2aCX6jN3LbQc3ujmDga6
Dd73k78u4xjRTDv1/P4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kr7VKKvChFoiyRCReag+OvU3jnmG9pN0cv+BxhNmMKLthg/ksgNZyU3L+fQ7cmIQELtlUjwjkBAP
Jjq5RsCnHbJxj+Ys1GNhriiBsxLqxWCP8onhAVvgZN2xZFOih0UWpqlU8NVP8Eww1ohvkDgxTstC
3kDmYehxIUJjqCC/mgRZmuezqugrFdubYmBoz16tUvD17iA5qqCIMS9xSIXYp2LBNekmWEwrVqzu
R4koEo4UlXl/CEw0XY3QvMoHnlXgu6N/6sc+nxZtKSwjiMVvGnZE9UVvJPAC3Hn3zKFGlK53mmGO
Tj0dWzhwX0ahSYzkyJC/HLdbGZmriL2UNvDyFw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
CaLc9FGt3AdRHfNtGAsGFY/QEvHY1Vv4TvvgCDsdDMqiuDeLizFJDJeskBWjeKDoE2cufK8TxiBq
mySRQNJoeOKnxTiDdf+Rx6m0iR6h/YeswegYwgghpM5KVrl6mSwF3+4yEovPM7a+9ArDQ5vl+WT8
SilNGzyW0KnTwe7+szs=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cEnudSW1X71p0Xuq6jrXOxHnBku87IA0RA3zKqmeZHZM0r+9rEm5MSzX8RecnQ994yiqeyxbIH2l
fGEzUzr0ZzryS3fkf2LnJuB39f2YARW9eVCSiaeWaraZuY1l89T+h3vgdlurS/1LIraYLS1MyOXa
6F1LAcQp3W4OO4ctc3q1FRMZGldRS1biMsKwJ8Lxj8NEOm67UfgFrJNQAxbVXEfbWRWhKtwNxcTB
JbgC8j4EHkIA46mzoHloeBAL6KieplQUBjKXSSTb66rxglbFhWLy+mirROHcocu9J4ZbvTRYZEww
4lso1lqAllVLAoKYqa3WImZuSRoTbGDngBt9Lg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rOyI+x4PlmKcVSFoN3oKgSYpVlmYxc194Ej04il/YmBg10xopy4zmtu5sdCP/uGSNYcNGWeAiw01
mNf98KyNgTUFXruHCA38qjhhEIvl4vfWWn3W3mFRxrIuwmnreT6qTvgMaxIkCdVBDP7Iy7O6WmCf
3Va5X5hnCHhtXgX5UYniBHiLjmupv63B8XMAYDH2n6mQ3H0DF7mtb7psBafd0Z6+IWUbmzwMtKrf
ZrRJBGAhNT0i1KrEjEh/rWjN7Z7N32zQ+Pl1kc5gYCQIX5McfdTdqSaRVXZ/HF90ymS7/8d5LDyj
Er+ORdcjnOn6oAyY4PuUUl4OYUHv5k+RglTe5Q==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bJa7kPSpDipzoJoQu1APEjc8vFLqBfQZK/grZvWijD7/FgMTerFCWLUY6n8DWeGdvjXvTeyrqCHE
2rP/H57wUqPC8tIJlGm6ZYQGjZ3TgYqLrJshDE5zYMTO//q0vuSraWvZP7A7SLuW6y7tFE/nplpx
L8gbYORx6j70okGUwnamCMS9yhFr7Z2QTJne1k4GNFGvy66URk3k5cBPl5j4/1yc4xGV+aWYl6L8
q8RorRU/CltObHKrji/jdiY1WtdGrkpRyCEFc+XNPazL9xSLLu5bz6XlvKwoks+8a5KYT/VFUovM
JbM0bpAXM8Z7rGaPuXjqXtZBg5praTZLu/WNcA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PYKBDinOGc/kIVdFzXrz2wA4/QNFxLDrQfTWfR5TjYE6bm49vrZi0bawcr9HXp4OP1+XxPLB3oCP
oV5e/rYeDln531ebt8yEg27XCoSHEX4FU8oG8aBJ8fqgWayOnAMJt025WodOxuZXbhT1zPo7J3uh
6iO9Mv7RtYE2fZ1W+G8oN//FTOEJYPWlKYnt0cDeZrN3I4rHHptZHuu7l8T+df0PYea3x6U3Mvkl
ojZ+TwQtdu0NuYY5j3QNgx3+W2XYq1M773FAnEz/deW54EjE+jf1jjrBk2pl8SYxeKuutS15oPVF
eHdqXYVcJxoUY5JH8z04lITKEnZ4oq6sYS6dog==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
tl+2vFCWZ583gQGsVC7oopz2NCKBiJ9uOHYBGzJZheOHJMqI/ehNvo25l710eBx00tztXzM30AH6
ZhAJg+kJwE2jO0MV5fmG5dnwXmLqoGEJMBs7xwWxvYK7w/0z9M0AJKD7HnuC+IiLhNU/fIxyuE+I
+vWqp//RcfY0tMMp2I2J1yEW6GUahS1ve/4JchssZ7Xu7VthoSDWXMQWATbvsUsDzeSo2+Ruz8Kq
Dc05HqEU8NgBxDPPEKLCcdKLp4byglwj7iCAtCjsPy8P18qjgb2sycFjNgmaiNMMB51WqeD+hneG
hLOue9bqVdEojkrb3q4WbsGZKz0bAGsryxslOlYHP1b8vey3yI2ixA80wyERe8d3GRIeZiSxGykH
qWxsE6x/iyi8QRb5mXZPMApA+Fln8tYmn7+1rFCm8gF4gJWhr1PsSJqTi658symGrzT0Ghjvf2QL
SvvoaeNdy0pOsWs7jLBFndd4GiFA+9K6Y33sziLToU9EvvFokENIslod

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oYiCujFRj1F3wKsGZlHR9niEtR9MLXEVAVfy+f/3xrmpW6Ye5a+fBCvm4TH+iRQefGHNdMPnzTNW
K/pEPAS9uMJjOdFiu+APT+LYrSRnEg4W0dX5buSDGM6LBWAuMseoTMjbJJoYDGLRckJgW43E30mX
ej4823nkbfwc+Ecbrup825qLyv8RTQLNHafvJA5lSapdqXwnlOIYRmcHn+sfAh5pGv9kW9aokcdh
ObR2XYxX99rYloyvz3x0pmjxD5ILW4SQMB1IUEuuyqX6eb5IQ+kZ41hjvsHIuQH29vzpCfV9Jqha
WC5yxxK1R+cleZSKD1H1gVzbTei8uFs/91Bgeg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
urNc+S8AFPj+GVFdqJE5V7P8O6QI6MA3nkwYb8NKbYbVufnXKg6voJIRYYeYr7EOa8mrqirozWbY
Lln9SLWnkaAy2LvL/N6WahoQdCt++4RH+xe768XvSrVUFPrIwZRixqMLurc/tPov4i5P/ukZKl18
ZPZvXRzUNlvCZnMPcF+5QCQihqPbjcZ0YyGgWgX/ipTGG3sNqmylGN7qLa4Rgqu/mB5a2xVyu5Wc
911+/X3VVFx697WVaP5V0SbOzYN8R8+8B8kdznwixMA+f4lSbBXyRysVOSzYjo8bKEMqyKMVBQn9
xDmEuV0DvVWXdO7VPvWA1LuJFwS07OxeI2GCcQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QcP7fsLZxaDrG29e9HQeXfu2TsKsdyW7Yc1vWct6lbmDEfXkWMU1fFWSPIjPzRc9UOnfEu0bRn+B
D+8MWokqes3WF7txljBmgUPiNGZ8arUU6ENa/IY/Wv7iaB/ZKM5PtdnFAkjDIrYyKFCTz/U6Yzwi
hBGGarK/wYQOLzeeKRewiPTiNUL7tztWuMZ1t1msxD951EeKrwjrjcXIIuf/TzrOGUOlWgjHlnrl
4Q/lfMAnRLBNTSWG+5wWewCE8jK2X/gJ5AV4p3x1WP3+JglbxpP39l3pzedXqciZPbuz2XlFnRPV
KByaUaAShzJ56p8+0HjWebibqQdieGNPiPWW0Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19952)
`pragma protect data_block
gMXEmaGDGHnLblLBpm7bwQJUUfo8HPYmdCUO6fXsuTiAKq+oDLlKLHAuFWmK4IC8QuQzFri5y2vB
4aJpeigGLG5GDYupDp7QM6iKxInwnleCfyVXKyYITibB3jjPNR7o0j2YsYYr+CxiaKBxsEyzb9I6
FuhYVeSLEpJ0BCfjPVYC5/X+ajV3k3aXk4u+wcbdXju9l93zP9vEhn2HkJcwDJAO71MfF/wek/S1
Y9dDlbIeFruZRchcNSBWKDFTp2u+s2A1evNgBbiP1QwXobEYvAj8bPBnIy+6lZg6JEx2kSWGjY5X
i8fgJM1vzK0iyCE28MQ0xAOKLFbGycODzT18lHRq6p7eV5Meg+mhap5YB1irNiB5AraOaZKDzAme
jFDOLMqZeSdzAM6gB2rDDgj+D4EYn/s/sU6ehOSXH0bWo9pVASZRpNxgJSfHCbNy17TEUbrWW/HS
hWGm7JUUvzNtr+pNE0x9e2tee8KqY+lsuWGxIJqeYtn6+ro57kMez17BI0+0C/1NeJThlR7PpXJt
ss+idX7gz7c1PR9uuWIsRsRfsCk2F8ARu4vsApbdvuY3Th1Kc/HauXDw9ZAg7Satjopv1faafJVi
aA84z6fuzX+QHg+1Zwj/OI0Mz/rlrwsmODexNjemdKM/2j5Msk5i1f5+7+ReUrs4CJillgfH8amY
KfVqU0KSWPy5dObMIqFGYgFEZxqHeMW445F1uglUXbgrYbB1BUubUkuJKs/JUEisdLNAwkMATpyH
K63HiCNlYCcHizYnjX1LHbcJQsBYykeHge4+v85VPWO6McaVjeFxdDs0UL9Ut/E+sDBepdtM+/iO
3jzIqXueFFFEYHO05/GL0tvkO4cz6VZSGZP6x0QINT0WtkLl7DHnoQhA/Fm4F5JS1P4LEwEHD1Q5
f4UwnN0xnkmfKTDItsqF4zitcrnrJwF3+hEEH3ISAbwoCIYV2DIAnN6LynDmEo8aQ1KKeg69FHY7
CuTFbd9DMmgcOpkqjNWadgZLAaakDGbYODPcf6exIAAoNVc8MZo8xFm42zFGLRx5crYJjrrLL8cK
pozKX6wBbtKjC+V4BFoYyjpaPZ1u5lvVYqgbq1BkPfPhZ12bfrsnjLMEzJYxPtsw5bDOcuUOayh+
VOgD+qb0m8VqFIqqiaq6UfAreqSyGOsdfcQ+eXaSggMs+0DubWkiwwFSPHnIZNhJBK6O0VPAkRn0
l4oSwbULDfSvs8wpwz5di334OqvO6WqhuGsfhtuMOkX2dYlfFt02XOZhCUtmUYcWsh75xGGlCobN
oys58sNrcVoWMaWWKVddNuSYIoi0UaiGJbjwjjVgHGTFWtzUn0lYOrvrozSIdL7XASgeMv2nTrcD
cqatkozuI/y6o+yoa/Vh/UmWhPrNNBD91z9fxCzPDZbAW3frjhC+c2vpQSrY2wI+l3w7vuTvIBNA
orxeo8ZfgCcE+b4LKO21pBM1DXX7w90JnBxTP0AbRPP8kxc1isB69v3EWxElRf6NffNod4b0im2d
plCcRviBTCDCuQMBlNgiAm+hDpmEYvxAaUWncRxoTiO/9WEuyfMFX2kHXkpeywcIf8zuwNfINF1M
zZXoOe6Y/SyIaBDaIIZNoB+4ZPuWOXqnB6Gnwhli+xw+0M2ppVUKF2mVshcS3Pxijc0cMVKkNIMv
UVXveRLiLdm46DegljJzp7nFhlW4PMNZP4Y6q/K8MUWFihHtbTBprAhzvXwqngBsoH1Q4LzpQAhV
o3tPGpLZqFx3ihFuaeiyWdeC2+mWDriDJqwwuxV+cSiBCpzJDJm4VWogibABomstyaD4bfbo+Wid
xIBIW5cxHWWE8e8YOrSy5iHYmtgjRZ31uAy/DvEyN+fUCpkFibTmLIwKX14pSU6UcEFHyNmfgs/I
eyiRlvfBCnMApbjkzEU31lLDv89fRxdOvCg1Klnam2uojXmFOXWl6bDNhgq6pVW1VsAcNI+hDw94
GAye9DsFUWfmrFB4ojYmCX2aU7X2exLG+KTFQ269uUMin/NvoaVJ5qJ0WKyB9vSV+XQA2rVYeuNn
W9Rxv8FsSX+DWA35ObOEwnDls/TTE9rhHOMTqhe2Cf+9Q9M+c98aFlV9Fi8Q6xvhAQ23WuJZvk/C
xzCzlHTN5FztoK9L0eyKX2fAcUADW45CxzpUs3RXANvsyZsQnJrGg0FOJ4kgV2D+jz8HvO3Hp+x7
Yms9H3pjKHI48g20gXkLf2whHXVOIL7VtRH690BG5adEtWKqP5U01mwIkw58qrzeYLuyaJF7slq0
UhvA9Ka0/ZJoVLaZTl/pzqKMojUOZi8hu6/lAYiEXNCk3Ik/jWQ5ztNYITn46m9lnVcVoc79Uffx
m+G5XtIyITfz7g66tvXWCJlPWRJZHmpMeZYb8cLlyNOb14pggX7KwACt0Cy/9GNttzInTYYxQXNb
NQV+rHE6WUaKwYxHNNKE+VXS6b3Zm/NkZn2AZouttYGZctmC9ZNtPuNeI9G01TbnVRjv/Kd1hHv7
XxpcO1YJlCOaJ4xtNTfITJPnhVqHy+UjORokiGUsXq4AQ01MQ8nILE/Cr8r1ChF9nBU8jTvp6lHs
mf/AqIZqfpAz+E6ZVInxva2EVt98SG4vs3AeXIZ1Kplj3dpmFgyVGadAMMs6cMWgdCg2hV11ScSy
C0O7gijffl129NtRrHYAdVSf2laAlRvft7D3xvSayxcp6AoKz90zLfMXX07hkg2o6ayrxPSlFI3f
u7HZq/GR/y1y9AgfDVoyCIO6uFa4nzp+OLk/ywYVLMWTg5mw90Ib+gkPjZy5suuASo4EO2Lqqw0p
s6Q4d9uujDJ9Wj9BIGCDjlZEXqwsh4+MviyWiTumV2+NymzBuUrp7UV3P75hsDwfTLqT0Gasl45g
xl4F2MvmVad5dxK/pqtS5BfAXBpyEUubWD8UCId9l7P+mGNLOOp9DQ0qTghIgf1LzZ9LPdpPSblK
OGA+ti+xxo3CNaW8/Dg56MCpl/JQGhm7V5HtUeyBNLHuVliQRsNx2DZt9askb7D42JEpWSVSnaar
pRb/3SmOuKcJ9E2R972jljUg+eMpcYZjshhC6muGKkec8ltcryUwMBTq8gd44d5ujIP+saLvDHGE
uA+0OtmnUn+2TbHWEA5qlYHK6zYqiu3HOD4ZCLeIauhW53mRSxcSwf0UBgp7hZ0kfOjW2KpP27Dl
EmnK5XMop5t0z9mXknK848kZN8F0zwVhAI7vsto+cNwSShYMz4dFM9dJ2q8M5y/Ponl1CYTzH1dr
q9o/IgoKA6vFWDy+e9bk8MNuxwRBztUS4OoYPFP9JFcSvczAPCVwkMrgbqoYsGrlL/pu7WOmYzSC
RPsd3hJoPA6gbu2kqHQBtdaZKAkH9FHhXg6c62YSD00oLUcSOFJewdevD+EGMoII5AhJwdZ6sImm
uvZVj2vs7wUjHxZHpx2FAFFlWbtiL44f5W8mKfrhSmHu48Wnr7nVe6DJmBklVqGqscf2dilcyH5A
fs1/ADMmM9hoXMMxEs1lKP9BCsbYHrOiQTMzFPrYYTDnUM6doqmUWAtt21rvIqaePrIuIjtZTS2d
EP3XQgdr7TTFn2rKT/hrukC4V8ja/6GpABczevt7CHjhd6u2WO2tbyYA3JzoTsePDYPVANBeTsJd
daNXL1weTOBMj1odHUAjRymtvTlP3xfP0GIK1IH9ki8vFeslpYSiFRd2FqEHgquCO23nK5vOkyBu
lkM1ytTJp43BGcdgO5hMTX/vubq0BXymAzJ8ecd+R5+ZpuMwYF3QeAbv1HjFtffxN7tElp/MdfrL
WEWtSQFTsTqW77EHNbZ0Mzcc3Et6EN6fpUVtII+9DnsUOFSABveGlkft8kAr5bti2Q2zunJUI1xd
e2WtvsRmswK3VoOK/WEStZWcRjD5syVrR1rQS4BhbAspJRmyFThssOW8qsilEUilIxssEdx6iJ8+
SdS7A2x+iK/XnrxeqLQbew5MnlwVTwkX/X1TiuTCP0XH0onBhmPKEYggG9zOFgTP3gLu6L9y9LL+
js2k7AmI+OLvN9wqBtyZARpyFvsDJG9oohoqMYeiAYXTeejSpgByVfnCJuqV3Vu3ARR5QSWuZaLI
/2iKPmHB/QBN9do3WJDtr9vgU0vl1RsUsTZO5kJOTuw6Ob2OxpJA4Dihgz12R2zoHIpsBdUqhTsP
BCNPDgYCDI+hGQwT7WagqDuVUDYkkK+PZS5AwNhwvOiMSy8c4wrUYXIR2ko/5VmluWez8rLsrb6K
um/ZZZJr46RV4xRaghyQ8Z4XZ7seZaH8Zl8px3W/3nkMh2+TkiFhrfr477U9O/gjAV0LZ/xU5ixI
iW1GnpdTsgngBrPYAdZW4IdYyDb0HeArCUZ4xNyEUNjb+EIri38lL9S3aWb6bNWXPy88TNfEV/Am
eWf4mdkYMDL6cuKTGnDpKukMKj1iE/x1dBbt2wNVkRljZ3Y0EPCvMwvwgz2JjCeHBLDsg4miufDm
cGng/y+iqFWmq9mXMRkFTSDnDa0ry4RSXhP97BsbvINJPZE7j/ppmJmCEjPdVUmpKQlknRrS0l8b
5MMVfh65qM+dBG+1xB9+Rk93a5jLQdGD7dPBgojDu9Ks+nFdU3Qa/gkuE9Ym4Rw/S9ow81c9Oofb
SytO5P9MybinR3A0mEsNTC7bTDTbV7Y/DT3hIrZGW3b98/PTy//mvKAXRS5PHkSCZ1kZtrwpFpfU
RHXttHgFgmfBbbosgm/StyfGMx1+H6lkBChyzp/ofsQD43gKO9pWhfYRPhFPOLXZcwotelEsXxlX
xA5YT7xPvAfO3ejDypNvgOb9UoUQM2BdwAxycaZhQskSIZUYT7WRT2zV7ttCszE1mXKIV+/0ucEV
FY6e2iWmQIoxW8jxZii68KmXsl4njV75jWlZZp/3HRk7dXllWwZullTL20T9w9xoqOKYz63lNqkp
/XZcpQU8dqrCNwo+1J7R5rdmLMuNgWWaMEgyL//i8UKWcIgXKaZ39EBA4NASOATjGJNJ06MTbdAQ
Tc1SOyNH2odno8raN+TOajU91/lnIwSpZBTdvChHYTLMb+aFhGE70MHnVWIWA5wVRCBQIpPJ3lc7
gNwajG1wZZtDSZtFc+SBKhMzBTL9BhAaSI/wNFv6agvcx+M3+qyLaCdwWjgfBTDIc1jc+6nyUT6E
Ba0PBpdG+ivtooAv+cjKHjW6F41GUJm/Jmmx4eGB9/f6pPjUZuQCrYSRwPaffo+pqo8+IM5PGFqA
1ZVcxRJYHVxM2x/m6uwMq3aZ5R8t71kz7mLuUMpbr68nc2Gie3udamN/1tUVDpTFzcLBfbJFrXu9
4OIkKXgBlWaJtSbsctmdg4yVYLXp0Kumk70bhSYGoXSxq6upp+sPu0RwHAH/DHd1TqmklFeXUG4T
tRtIqCWJOjWWFQLMfh8TU1ie5qX5sdk780ldmliTVuwDEb6fHziTrt8sDBjPrF7lMyddo0SXpohl
wFB07HYrcPlq05kQyDYbPJuHXgOdqUp9DrkR+X3Qoq/jFtTMWmtfOEAJiOJzgcfDPpnSBHZO734/
2n8wWhI5a62cOcoGtXvsMoFfAAx/7CNa5PX1kkQxll0RtzgRrRL+WGHJQRtmg/N/yshApqywktiC
Tx7IdgQn8F81Ue0eNTcH4SvAY4RwlghKC1FiCK8sSci45pPjO4A0I+lxRNMhTKNyNr1VLgSNOCKK
LbWK8ApGMUldm/DypMy1564+7SISbuV4w5Mt6uW12OyTNlWfA8ZSQvkaaHqp6SSBMJHjhSaKZ2Ps
mIWerTr7kO3WIA9G0SoJxIiM9E4LlbHf4uR+qV2uL7tnACOvHi3tolvhLK/YDML+Vw4QrvTSyNxJ
sLPOHHjELu6fXd1ayE99ki2JNh354eoJbW4xSDX5HtvfAYrtxZi6ofV67XxSkcAGw886+/Rl55EO
19uNoNrt4Zmj1ajf5vJJRCzw6I9LBFGwNXz4pUVe0IAAqRjYAlrSfrRH8x91Z7KqzxB/1MjpS2oQ
AKqoZMbz0JDlDLLzrg8O3xQphOe0IT2OaqJGJxPTiqOb4SXK7KWVphfcEityDPs7g4om1KIdzVr1
EJSZn4b/6ZzBjUkyQzGPZRlwor/32xvYggPSjLNAv9Tg1a+nLKQZY2Rc9ve/Lm3hI1Mvy24Vgiep
Gp7lTt9aUxIw9HKGbDa+x+7d5umJjWz4aA5Qhm7gnFoQWv9wfRge7ODqQ54cgNuOkFpcavrRa1Nw
9rNN+EnmGHNZ72syUQJPwjFNcldiheAUwyai1hdi2xce433xAbw1Wfux2Zh8g94SiE3LBVSg3uI6
2fYOgp5MLPo8fCkTfuLicabA0Plm9nsC09l1xYYPoS0owRu4BYiN3FiXmvEbfGW40Tt0gkwhwGBm
YiVEb/5ghML5S4YUTG2Cq9ZCccYUTaPP/6HxfpoH0EVM1RkxRLh/z99Kf5TxDCI4gwBKCgJkj2BJ
pgj7O1Kvwo8OqtTTAKmlwv11T0vdNJVDHruF0mlaMKbJJKU2A1chwtQTTACmkxoKM99OuncAP3OH
2jCrGO3oL3c1fSrO6D+aEk5GXCcxNcPyTmlSdrONqH259oXbE5cymNTKePejq0Sp9rs8B0b3ojND
ZKEFYB2hZ9IRBMZlhhZFzQXRB8HRpH+1Q4ngnBNzKtjs4tLlcIc7wgGrbA/LKxg19xisMmcpDb+K
RtEJeuR9+GQYXD1WTDOXssIyZJdy5AMkcG0Ai+R1OwV+X3pCHho9ksmPBdMxEydqvJI0qY5uy3Dg
szZgcTfrICGnbWAMCotaSds68oX3eyIIx2/Seoqf8EZgvxWnxg3X+0y7fX9mSVc/aQUTK8ULmKhA
/S+y/7N85joyxzrA/3UplTs7xIGMkeh4059T+IYlDNGK/JRS/vSorGQOkO2KUmPYCohIDAJhu09T
RW1Yk3CkZ+BGtaf3cw6OsvMZnNem+BP9jIwVLMaTAY8DLuiztUMnpmgfPfaGYeI2/k+8XZNKq9o+
Xz1job52hwAJSmNh0qKGq5N1yUOHtUO1GgrWoMoLucJmB+dBw0ulCMji5UcBpuLw8mnG8UuwMOKD
tHQbhiAX1FnFeBGKP1fzIcT1lnNxhDh2dA+rHkbFV4MwPi3h6SN57JHiULJLI4yXxNSSyqkDe7NZ
8lquSBSG+MoMyfSunIdSCa9WGY9VaTAeZA5moPj7IcPddEzz6yl0DtK0ldJYrApdUVYoQNBVrXO5
1/HTIv1ZQksi3SvGDEn/a2yuBKpcHdLoPExALeE4ntl6VvZ3unGebneHbOkUbR95RQjZ+4LS+R8w
aewxWnf3G94CTFF2CHH3KY1ol5I980JbxXaIjAC+wwumSqo+xLA05l4f/JA9Tsb1H1LQ3IgZdxlD
OI+QyyakcNsEnbalVe05wvMd+oQD0uogAIZGSn9XsPMZHBxPNp5/tZxG3VMN6HzhBFoQRS6x7Cb1
Ic2zO/IdgxV2b/lQ02G69SbDSv69aJxfWQhziIs+S4IX1M8qtxuM49J755obTR2+kgJy0wCVQNvw
5QHfr5aUl335yVeTwVg5s20Y+DK2JH0QV2OMAulm1Yir03ZA1w5lZCYJGN/L7mfADzKOXmMg8qtC
MreElYhELOiSzMI1u1WXSY8Afg3EOCaSjseRh5qQtJcCQfxnw+HmB1cQydlzF90PLsPsLskVxuay
I4AcpjNPBBd8g07koATMECyZ01x5+Xe/fX82d+oeyxRkLRdlL1tEfE6mUE0HybH6JatunRULidDb
Rtm1t1XhuLxId8KW/rv0j5fNq2hY8/pK3+i4PAlxA2UAsE/NhSuBjOdZjPujHhHN8ti7NYQ//cGl
ARWe7Jur8m3/BTRO/JDj6ty24FMYykSfHyIsKpBsHjFIu15b/ZhcIMjbBmwEPmZF34D+n3NHF45R
OOTb2sPB3TXR637kTV9dEF5E8CAZ1sXoTYG5UBYElHC17JgBvwDMXgpbWOSLlKr+KdL3irYbHBsU
oXXdtB52UvpfHSPWbOU8iaIkOIOxfmq8F6CCpcQ4LYUHUxTLrp1UsBm0fLG19xDkBFrJkkdAoe4B
z6OJBoIn9EWDA8/xOO8avfooTKVsKPjPRjozKkdGNGAIbuiCsVTtvTcGMJ6UGZJZRiCuFZbiahp9
mvMx77bhxOrYQV4yay4cs/OKG32IhYaWEmUYXC7dh5+0+fVJGN8yvYdOauHNbBxGv04iTkuoQmqu
e0QDpUEfhEyUWK2luSWjulPBjvFqs6mEhjU8ny9j3JpaJa/Pey5ueuRe0fs+fjG0wgyY4krCMOny
HJinLl7P5wqMTSbaevgEo7rjFPJ0Ux+4qpZT0TeyZBtcH2s4zrVxOxDtWeSOKAcjMsTTJJ6zFRiB
FBiM9JmXUhipnc/mI1HbgJqx6yYNbmJf7l9EUaGjQ2bW4UialOLcMuluXDDFVdKlmjRV0WCZ696F
spNcRIXUPa1sH+asjpvf7ZKueYlnR+0ejYkfVFPliYR/xwlugRVI6dQ5MGJvBxj0uhQ+eWGPdO14
AYQP94O/wS2Td5ruJJTk6OkXrS+uiKrFu5+WId0MohBkUHUJ6NdGwnazhW1NLeL0io+AOEWWF1f2
yaJFFgRBQcjEizkAJZIXGyouTfJfK3zIuZFnXrBeGKEToegPNVMt8R9rFqIugDSMrjSucoRr+QS6
6nPk1F8PH2A4YQbTjzM4GeCHiSfTyMwCNq1PzL7H47B//jvDbXHw1wp1yZwY7jjRWUCg7BtkOdSw
14Z316KBecPs3F3wlvmwhVuME8NDgE8e2bUXnvMrPfU0O/gBhD36jdPEsh5Baoox1kq0CYzUMxqn
eXi0hp9zf0OE96Is2bhFHkMVuvhlBGy8YLmMtPdekntttm4rkyIN8gc5jFSsW3SIfkWLVxJn254s
KNU8+7JiK5HLFuz2Mg+27Rv3bGnkQ3R2yxnvZiu78VXr/fTiwkuJmyvLAmsv0kqJhyFBz123uHdI
cR6uB+l41iLTQQJOe2owuoTjsbrKcoGlJr5v8wCvawdXS63YRLFtU35Kda8Neu1f9Obr0QuTi9iI
p2QHcR9quXc9zKKhSuzQfj7I9+DbBQ8PqN+JeTdoskKNfXa278mWEZZK4TLbv9HsvaTUV3irIlzB
Gxe/67Wl3SRkTv6b8W8ejxoUvmt7v859uCZzFWt7PtDEOj2Ig0lNjffTsWK6BA3IeNhR9KIGxnNE
dfvDnkJNGuyEiq6qEtk/ycxWE/EOcKK7XecHpsMHkAKYv2aK7Aq1X7ASFtht/IwPrb1iYcB0AbFM
2dwAV1aCeY9W2xE0DyAPPYlMPeQfVCVyzW89uenJmV31LC3iv7s7WbZORCDGu28z7SWchvQn6us6
SrXq/ZSR/zO/m8KkrA77Re5GUq8CbxP6cJwx/0+AiqkfBLt2diPjDq85eGLrKXCVAmY+a4foIsj+
+7REVNX3hA9mF6G6m0U/9eXat1PVwG3Kl0D/xtQCj/hMEWun6Zcg/mGOWg08sIq4PGOzzuKzCeiC
6lX1AJzM49O29pSuamHalN6RAhMWj72flrCJnuIoXilEzw1HZ1SZ3lD2GgHm5o3U27q4wFwjEQLW
3kUS8Yflwfn7Zyb9Cu0z2iofcjppcjgpoMQBX7ExskYhw0JG3WsUvOL50S4jW81p7yaX4Md7ceOd
KJwaTb8nuCJf6dYXCFXBAiEhBjFRANF80FP2E9ThQ8zakZHZvjy4g870RWjjlJMiO1/J/RRWZjvC
17e8RSocL/ZKg0jxsOiOI7yGOiGRLKth+oY8Anw9HB33tHV3MIOrhMQKl1rPaUSSThQanpifrhwV
UP9VTHYqzdxQG71pisFk8YLHPc0gwBy5rtMMMYPGwsHbo8a7EFm0bMNK6I7msOxUg00/rYJxjqN2
zTbMu4sxCmScJj2VqZKcxpTtFTNa5VR+QDynAA13uLGwi2EgKneB6tPt1nOJw3a73cQo0LpVes51
X7yIivvp2t538R5ElFFEj2f1/kK+8Gv6sGK2xlxbc868y3lKhlnxZQ2zjO95E+PvVO6gLIS2EUxr
gGEGbyKrNtAtHa0eN5eZ7tZpGnGvThr174hBPmxHrbCpk0CnBm8DlASxlXQE5tDFoe9sDtpPate8
bAHdxroRpNzlSp38sT9E+XQKeG/JWzsMkkzhEPSDMzBVHfLuJaNFZRD2pq1XSFN/Wwo0YspPiqPm
aLB6kZe2Yd40no8d5K9SBAXE14mTaSNDwjZ7D6H3+0O8YX6DdxKEzQv/rny2QklbyAk0oJEpg+oY
UphS+IZp9RK6CjTOZJhgTHyQ8wxfFw3kEMYFF2UUC6dnQ14h83TVZqCvj9Tfqt7Y2fqLsjCF9JT/
+MRyacFYWcRciwFuB44ICYoIdimoPpjdZh7xBZv8nxIzqM2J1rgcV1GDQdl8d6oapFkDQwHiW04P
rKsi2T6Xf+knQ21GGOrQSd6cPttluw/hTta73Qa3HTcaywZgXKjXnWmRZ9WhXK9wVIFrOjD5YXkf
bqHO0uCxpsi9W0pfwG1jjPmsPqqL7gPyObEjaq7DN11fRpd+2OX2PBQfjcfOTWkoD82XvEE04bEB
jP+E2nb1LCaCGsQjrY1985SFdRV8xOKSx5jit58dqMh9HTTKJMB7JBX88HaqStbjMpuNHG7X65M/
AWOHJ2aCIKy/tlXdpxdT2pKVd+XovVSEtxgQ27tgnsScwhqRIjUYYJfJyft4YFt+C9XLvP+ItETG
zeOdXjFxRA2obHYo8/UnXUEUA6a3q9lYF2TYiB1NUMS048BMR5t2wx1Iqg18Mt+aHl6e+8MQViQd
82kSHxLFpe4drAu2gssDLsz7ijehAzK/NEmxYZFUo/XnmMuDWkMF3bUiy/2AOlJEhYOlS/uU+WmY
UjtKPZeKUU+MZOdErA2RO++w3S9JjTp+LNcozwBfAI7Y/L3mtSECBcdk9SEToMXy4oQsbHh8iK3m
of40xfPHAUMcu01ePH76ylzrAftzG8JZtKerdoIjwVHowRuLwrbX7xLzngwJLLApgddnz/WjDzUc
XaXdo0pkHF2z49TAjtvvzE5tiKkgQTTlkXu7BLG9PFsJ0IPt8/3VUi4zG/ZMWawA7pWwau5mc5MC
0di0TPGVZ4yAUIgfjCV8I15fpsffIvd6PuCulEqzCOExwsTyf5wcEAtdRc6UcYrP9mvbL+uTtJr3
VFR0q1uiQxqbPppu3++SF7fOcZp77lf4ZL89OndAEzymTX/fEP8qNSJzghMXijCCc26FqU7rJpF9
Jxpz0zjpFsuwhWOq0KFI/vA4Xs+BsCR+8zaP0SL+QPC14F7yi1yIG3kJb4Te9jZbKf9D5/wDQ4o5
SRu906NGeyiWEtPGpVoDNXWDJ5pZt1NtwTqlt9TueCf8+CbdNtH7HuoQ1/Nh3lYTw+7rj14HZZL0
Wc96VooksNJijZ+UtZNasUDGCaFk0YlnWoVRr9qpYtrWVZctroK+Ct38nDocroGK6n54974lRlW0
C5Zdahf07yxdRMPXPLuCjQqaWV30gy1JkoUVIBIq0vq9lnsO6SdH8KLOJhNZml7+OQZd51IcgTD7
94ktwdCqPYVC3RY4pOPuhalW5VMz8Nn51JUke2vWzeNtAvMV1JiSohcanCEBoolCRj7fR7eZPgOT
XGg0BIhaEDCJqE8o0rpIxxgtzpvbAy3W4d4fFIvBPoczdlq7Tkwww0svmmcG62KgUL0Ra6gFsz5f
GONqlrf8VxeK6Eenqw1R4Mt6aZwuEJxvcMhep8KszXQyeh8sdHRgpRWw+mGNktqvW4dFHNndyxTZ
PVdRTYfUkUF72Voipsrb0SVbPFLcwz+hJtQ9fpBJ1I5+2MoheDTUiPtRNb6Q4pbPJymHLyASiAh7
zKsUGQPjlTCQL7G4oj3Y9S07+uvCFsqIwViXJa1DU+Tf1FVpXgzE8x5KhDN/k82rr9cG1wsQfROy
N9qnpuI4Cy5xZNmVRWQ0FVu9XRxHdqI5QEdlvb7Lfgl5PPkjmALTi2/C6WWuVoboVec5jFHgH1bX
/Zx0LjbmS47bT2QpWejHCG4pHh7br4RWTduPwqpazvg8/oCvWFHEAz9qKWOmY2UoAYZ+E877EztR
YXAiD2DUg+wP8Ck4XRW4XUjU3N3uFAJfEgJhyrhRmtSZODd1xUWvUyEOrrvpTY0qIgcVaeGvf+h4
A18nMoSjAndgTlKCOeGP7uCxVoASJz5Uz4gtBvpRvbtxoY9x9h0f0hPpFhmaU0hT1/Nj0TUcY5Cy
RG+H8RG0Ea2Dr1sMzzIN8cRb4dgV/zsqpKswmzyFOOCxDWi9qH/dWXcr0rhRTJzoBc/CSI9vBX7W
QbC1AwhtNDkNZ3uEMzOYsKgT9lZ63QboSfOMKUrz4DVOI3FgT0imTrziJKnOZhNt7x/SDAk0uLhv
KWi7TjKmNZMEY0q6mv4o6MDkzqehqIWuLFdHaFGuHXAh0Gu6SLDLXt9fa9nWR3FibEpcPifEaEmc
9Ry+3giwgz0l4P9KH4EJyznoV+T3MiSp9Z6MGoms0i8CwPstKusi/qrEJ2n65vSH3ivfj5gngHnX
pS6tkDKpBNychtJWizTmtQx1EFBR8zGq6iaV8sE9FU/ErDPbhl9uTfzdmqNyEpV6u7gziTqPeXCR
cFklPTqUlO84pqTv9nJHdQYQS0jRjCk8UtVYmRX7kjaMPCFl5z2cICF5sjxfB8wJ6pjKWlijr0bo
CUyw1k+FnCfcf+TaoPSojjN9BdrJyP1zJU+a5fVkvDZDS0In5DjfVX3rATyDZuMUXDRKPfTzPFnc
J0K8WGMZ5nfYoQqT4z5g2B/0EZ+C5H6yFmWZjNMz5Cm3VFgz8v50hz0IcayT96BZaB2KnRZqeLDV
bx1DPKsHcAYahQMHwXFeQyfRWqH6v0WE5RV40Rujg1nTKmad6gDrLJ+VJz8RAW9KRaRM9pxgdseX
rVCHY3yhJ1oqFYZU6PAwUiMg3vB8G5T/NzkaGiii5RSVNzLlxiG2iTpYyWEriSG/t3MYef8jKuYe
Ph3Mky04l0mMk+BQLVT0SH7bwXVByYLEWiPh12iCJlw7+gc4Znuus4kjkORc/1cJv7MOHXxEwM5j
3GhdAXQnDYY4VfdDiOag82730GhmKcZgCbWtBl5xuImVIAC692HhRu5PZLJtEHeuMHGbgLOr4af+
FUGhhCUStEJo0fku00RTlMLPf4639fSOFZV20kuhlm505ExDd/eBmc8JMS1xE6wXkUvLhwkDrqOp
BF+mNHcf44FCBlq4earVKTTwESAvbmLL5ypWO+xwbpmNPTQhQjVW8DL2H+LQSuD95mAMKiIrkkdw
2OWh5GVO2NM32+Zpi18es6/LtTAe6TY45YGMPnqPKyuV0WSw3Ce0r7vWy2fTAubAPZEqMLNeY3LR
Tr/cZr8fF8rbvhVvSO4gNuWDc1cQWJ+gPmsZvL8GdkgulIS036BVbUyuRt5zj4YrmSiGLpKbPJ7Z
iKQXraeYGsE9282DUGNh+p3wDZT3T9mhyogaVkEdGzmr8VagwxucGL85uSB3har0XDcN73parYrF
xD7S83IIFPsNoxxwv4wzMk1IQFQSsITT3XvNJ2ujbDj+PsMC0JHs9ky9TxZPgUOS8T0H1nhP+TyB
Yz8GUZKXHRMAz2hR7LO9woLUdZkJDGDLgNeJfZw8p0e4YTg0GRLM5EErnSjUJ8f8O0se3rsCU3dP
Q1YbaOrf1J/n2SAAj22EfoingOQOQEO7bykj09uy57Wr3xbOUbyZaTHjpyfOz+/0INVjYMbb9EEs
CfvO5MR1O3Dn0CxstTQImS9SvOIdVhSWAvPPMsQe5JJqkISaS75Rc/dW4YFhvvGtOKltVDYz81gs
aMUk9fXrWaclw+X4PRqzbbdvsFYPIlf2tT+FXcZr8gYpXIT9OBcPQzGtDonFA8bcZeEKTn7UlTii
+6rrecsG4Zkznuu9xNMrp0wVN26dsTIbuBSrI2kTxxikM+P4PSGTHlvpIY/9vMBK8cGgkinthZGK
VyZ1Hv9JLElGBFpa2TcGz0/2ldaMeD0xPd5ffJ8CER1brYuKaoNyRblMiVDoHdtqcR1QjgnRCiVS
ow99OW1MjOlGxu5dtF99FC+Y2RW3LxuMsY9An18ukXggzSxeQE+F770zrxrSMBJOFw5MHHBetG+c
YqpqkOe+q93eW2ATdeedvs/B39HeLNWzZOQHrGiBOKdRcwJK8wqkMEXLeI3CmQCunCQL5RgRuYVB
FeiUin/3/o2DG2bMDmGa9GKyn0WvMZJFZLwoJ4w+LebxaRRkRBPn2/MVQx8qKSER4z50Ze5AW1gP
lt+7ZvY6V2Z72tqZoqNXW7HOVGcEFcow7tiWDGrn9275xFI0Aiq0BO71YfI2+Mo9hicFcB6qXgqL
6dE1zcTcnCY64dn5nYwNjPxngfgKxc0CMWXNXSvDQWDqXFYXP9k3wVH98PN137pCUGDoY2i4kD9c
0bRwqAwS12kMfCVryTSM1mnRaQaczBPHkSZlx1QnZ9ha28Np5BzgErXD8N1g5nIOye5qYfD0aouw
RkGW63rVZufh6MLKAEgv7CBNpbZOJKZnDiSy052j8heLlBU2DmEhwhB/RxfC2M0Vg1EVxQ6zCxcM
vsuk6nzdk3SgymW6qqBstKygTky4A8t/3+O4WV4hsr8VPOtlCKa4ClyKmdHbN5ENkm+IjVWuanZ+
0ax3QOqX5ycaAS/7in65lPFsc/M+vFTNaRh6TMjT6JXgUHCT/4Ms8Rj3IawNGY9/OrKeZPJYBP+q
MGQAvSHy92QWDOIlkXF4D5v5uK156DXk3J1+FoT783vEwtkkX5pHEoPYNErtFKupzzH0t8r/GMgG
E6F/RzG8iAzI13hcCQnRaDKIAGsSYNM1SNTTMgoZQopoZuc8dpqADPuKUEyJIp1F9HnZ7MLpZHcf
Ek4omLJDMi0NYrU4+NofPT+8u71RMGD3s4yXRWhu7LVNYp+low1/Xjsz0T0Qpw93Z4Nf1RNZ/ZTA
0UnskvN1ndaDd6j7WM58bBUoQY7vjgMIWB+Gp9zAJynhQQ5h/sgo6lhQGqdjs0ZF+OtlUY+ahPaT
oXTsDz76DBVFTu1IYRy2GZ0sWpdsfph1/ruBDVwlhcW9YLjXlDBclyNwI5v+abnl82pMYBFx2VhM
77wbUDAK2ile5Ennhc5pV3OaGgV4aD/Ve6R2w62o4fnndxq3bcdMe2RyDtZ6EYTI/adnl1nJrgzT
M5GPXb7/qfGtDzAfUcPm6a4CQ6GiEfLp2pXNjfXvzetF6+RrRzWyiYD8PX2Cqjg8FWDqhrmSWl4G
w6H0COVgCmzv+Aa9lJGvN4+IhfhS0qcMCmsyzwJDmRREIVS6T145TDodWzIPaz80DMaMIwY6ARdG
zkKeS7/LEHtj2RNVSItGlH+U8Fr1V9XBPm4lSDUf1tDzUEBIYOoJKFpWiH10QQu9oo92p3Cs2wqn
+QOKS6+TfoopopIhR8fc0pBQX1nGIPTTDEArgBd5uxuVHLbZlaoM441dNF8gcdj78n1k8M2ieJwk
2LWZSjSXaQYhO7zU5AYe54QcXt7OTQ3kvgwBlZsTExpqqSJ4SKsqlud0fsPqEHZZlhiJDPS4l8lz
UY/eY7KG9pgJGp8bfq1GmnfHtTUWEm6KmtA+BSVGFxY7GtkmcaUnYACX6z2QB/Ny2zASXSAc+ng1
bNrxAZ/C0ySKow4S2yBi4QL4JWU7DEqMT+Emff978rczpI7NJfnEtH6ujNxgj6YpPdoIGK622aJ0
RHimyihDVpF2Tpo+EhvSVwip7N12tR3wPKj4O4yahZ+vpaHaDKe/ybPL7DSVHE+abyEqsRuk0dbA
sB2ys+CfIH7nteHKn9d+IahJ7ei+yPtaFV/kcK/h1XA4I+iEueGM63U3bx7Mj8htQJecWjVZLRha
pX9bcUqNdhCMAI+ZmwFQGJNX8r6h+wlchEHhd5QYsvqPuen14u5i7hFQzkSu9e8zMofCNDDAXRXG
SGdDmKE3UAJAFIPc8hEG+n2mg+KmDL6GyoX3Afe73eaEqchP9i3dRPegHUotER6wtOKrVMRvQ1Qs
qmPgp3rS10w79Xa6QRm2XTMp8UDA7k5eL10qvo0KvXbmDsVlCNn3eoPX6/PPC/ta0X2nO2ntPoSJ
23d4yLXQvgfrPXqrKKmPlGPoC2peIYQYGZ1evv3V5KsKUujaaMosVUi+XaLeKgjJe+/rZ0w6aGhr
hk485naYzn/Ih9Nt9dIOEhPEyycMsHJD/aKfQvYm8UCZ1CCC4L8i5+uEGjE/XvA4Cbg/8pQvEGNi
/099HYRIi1BvIKrlFAs+CjaPv3cm/FXuZUKDdE6Bj8wgpUwdd9N9DuKi2E9FShYleYNf3ApmHLyL
K1SwkIuOvgCefHxCUYzfZEJ9wfIFLiKDiIb7tAxMQAHG7Nl9g9kb5nNTLgWA9zigmVCgMxvBgZnd
61G6e9tOGSj4GbEGv+N1ww2Z8xV1h1/JDf0yQZFLdSK3mG3xIsKbIKX+1YDf6QbDaFyGeAKGYEr0
D/mxw7r+mM49iDMlde1y2ZKPCCB6PO2QV4gKlz5w9yqVmFZio6qgQVAZA4A35bYUV5cWwd3YlyqZ
DSZyj+4civHu1aW6Tqjhllf+oVHwcioRmP7Xn2Tbs+o61DUN7aHXo2MEZftWFf9F1Ii21B8jU9or
Uh0ql/2A0ix5AlVllrlywEtT6qFX3ZF7W9xA+j8eoB/Fr8ytyjlBwjZ/grN0ITpyyq2FqKSinVqM
FsDhMSzbu0cIb/VTUTEieh64X6L/dDkCQ9cdalH3p2HKE0AzWZoMbcf5p7cWYxyZMaTlT3YkuvNu
ywoYlklC0wwssVoF31OJTSM3jsIb5nlplzXex9VHp006XQLpxcOyEpBlXGL4WpsK4M1J5Zx3xK+2
W5yzjKjQE7haI6j0D6bhJD7pCVzsHyTG3hwZMsLj/hx4IE+goSm8U/4Qdothvdo2a3NzSELJM3JC
NoBBt7zmFYB10yQCW/B5yj6NAvRtBkqfIGMg6X9PPaeHUqCETrTu5PAEqTixMCqEWdFapaieYxOI
PkxIvE78XMOsc4KCQPayhsm0PRi40hWHN4vh3DY868vdIOpb9kQTh6XrcEhhn+QB1QILXrD05z8b
FRNpWHhTMAOkjV+Rny/5caCzS3IxMKLNAqnjQe33Sj00JkQhfOdLEDV3UOCNthhWtgCom9ECHL2N
p8uPRCIxDnPVg2c/Y5/qVkdg+bppP3BCSVbln09G+ChJF30JbnVrYNrrXR6/TxdgkC5mYt9XLEY4
CM950oGQrtzQ8mCum2Kb9ZNNCf/0SichYDlcE8sUaxtPttbzwd73uF55NC/zQjgfmDWbS+r/4Exe
AdcmzHK3t70ltrsLftAWTermDQrGtr2eVta33uYs4aIq8l3oFpQMWLaztkEVqVZqzzZwo1xfHDnr
Mzrmtfg72DgKMLqmqUBIQRkvSjwZT4q2uZr+XCCVukzRysBoZSWOa45dzjhHvOWhXvdOXBi2im6r
pF0JLjFPFXF/Yg8xef/0w1XFc+6VTiWpIoIsNGaYQ4ERtw3a6ZoatC8ZJx0kZsfwU19BmoqRFe7B
ycOhyZhrZl2FSUwZJSBabwGFkgFdl+A3kXwRkaoxbEfJ+LwA4KqoICYniG5Sk6QQ9disnucKJVzJ
fpfFA39dw64F0qyiAT8eiX6WfG+A0ZRjCf5t7FsfShcJV9zThAZkuliqzf/FxLBeUBeqBd9Tx45h
BxDa67sJy7ijrIll9umLbdFIUB7BKSBqfRlxW9va1RIythwSgZ7XhivRhzafhLLsyE+tNvuhEArq
NAtgUWf/F8V2RQVH9tbTUSuIT+n52hs1UjhU4nxttvoSifs1mPKqCE6QTJcSN2lu5daOYKX7MHBG
efPTWfroRY0M+HVR/Lt2qK183rlhcSgKo9r3YamFu016ob8Kca36el12TNXqkpH0WngTRPMvRBck
QGjK3mhVw2btyM/JnpFgQhBzbB33dEJstwtatw5r3bySWDKVUP2uN6mH9K661iAgt8X5KxZ6tVWL
geM96y6L5TI9TeuFaZdxNVpYgH9WBAS+YYFarp0V7DN6jMiguxdvnhkegUB2h/2apzvwuTBHGWuH
XVtQPQEH4P4tWpkue2FwEshnJLJn94fFnZNqOjAmpw6Lk9KVrmaXgqRWyLOamLn+28HBdgLRW0rR
RJL70H/8KCaFuhvfNI4Bzg9dZNNMlM8UI8ibtgtX+fBoBUBUvE2ueAAZCvkBPUQJLvmjMtKNl4Gl
MIWvQiK602JbFSKLmzZwG7ihOXH5nHKNo6ldomaXfPxYsnJ5yjosZ8GjOckM4/LNO43SrjeRPt5W
2oEXxpuf3xp7MnTzak6C5zGoTGYfmvUGOoRisEKGTHoZPnM7SBu/T2zsu36dvdwJpVcwkEeQYK7d
qcUjyIeLYasYPVtSHs42LNXfyjgrV7eZTxz9BK4i3/xwwpXoutXFpiYCmYHxm+470op2IzWrlWjB
Dh2kX6IdWea2GR5030bEAGjijEf6uhjh1oS5uPtfU7lgVTF/MfWi1lFsEAcDNVdEESyijk16CJSN
XyrEZhfBqJEHRZWDd4vyfGG2mBoQXvXxwWrsByR0JH8h3NcnqcTXB2vFpGdxblyL6m/S8WupO767
TF0hYTJTk13o5GusrMw2WtuNyX3Rye9Qh3B54qZ7NcTPbyhugMvF4r2vN6tl5TQWBiZlhgzDvxrM
Fvgpd3sk7pIbX52kVjpgpEs1qUezga8/CEpdP/hffkwovbIsy5BurBav1nsWijCeBLVEgclKMap9
IikmjFqumiYceTp0zg/TSZnJRfW/HLfVNpfzC4zdikIr+v+DvhzW1FK5+WGFCHg+ITwcHICBcMmJ
HbGntgn5KyC0PRerj18sfgK4D/FZQv/BQpRlDh+PrxoqXuBf32fzknoU9maYOL+nsnU2hcVqboDH
ed6mGVE6rKe8GTA7GXFPrDFrfSARkp6iOFsQPPmxK+nLx+LE/KSr+GpfTvNTAebCaSy3599O3jKD
xsRXH6Sfi8Ut2K5a1sR2iPc7ZwQjlitrqF94QX0wmtEvkoHkQVRmzEjEf9sRwpOSCov1iTWvtqo6
Q2Xyegdr2xBMbxq7XJUj5jDM0biNTmiO8uvHnM73OFrLYl+u/k4kl/LytddIGQS8O+oo2sdfnwjL
n5fgfwlNiNxo7qCq4a63ysCfVyyAQD9j0PvMjicFn+BWPmC5k4HawGfYLqMKduGA7S3OYcU2vUf4
AfsgSOqg1Wk1HELnb1YVBsbeyuzpjgOAqXscICVrcZHAEwgzFZOLl+PFNKxRIQSAYe70iFXI1p3w
mB5xa8/s+befK4PCt8RB5W4WS4WfUStsdXJQUIt6TAOkqi+PDFUjSQHKsaH6HmqSspEODIxRzl/f
Z4ewr5qz8UQNijFQSh74kgFI+nsFpvifoV8nhRPgasGbDAOEU7n3U5a1x+RXuLsANizKTcl9LuKy
kqgC62uo7v/6l+p10QcqdNZlzNIHdf1DmmG27O9InMFoNkV1YD6RR1PXcVzNy6NlOlO2Q+FA6wVL
O0+HJigZNTQNRkoePnPTGuPJrxDkRCi6t55ljWlSO6chllT2VMZTFK4H/Fn5S1qUhIIcwEyYlxo/
FhB1k82/SZ9UPOVtAnt/H5Uc7US08IRR4Ll20BPIRzaxXECKZAOqdeKCaCF3032vKwSS/4ApWwkr
h43rkS0fC4ytqRW41xC44C7OpGoDbUo0Oj3fFKa8xaC1FW6Cb+k2V7Kikct1pMXSmqF4mZIXR+If
sO0/eqU0cOkQqLlYkaliHBZEtIQrEGlte1VM5jzTK4ejurwVsf29JWx+J2ZwG/D5EjS2X2GCvczI
mk4nZSq5k1PghhWC3gIF+bY9evV+RmAPUJfmYL4+LdtoqnrwVonSvLPESbazPx59W3vCrRagKVlk
RjKlkGbBfEniXpmFeStlUcATkN2I9PoJZ0xTMASAy0Zh2VkO0w8jF2A8a6nLPaTmOYFrZl7L0Xfs
144zS6oWxhNj1RHGu6g+2h7PrGR51Wv68n+qIUR7VJCzCW3S3ZblxW2T1/krQMysclmSLV11v0LN
Y6SjUdIp8KrzPDiWVcJna9tsyWFQAocYl5DRrSzWnxAIv+ZWNzND23CG351giFRPeD88hQFULJEl
G8ptA8u/Tm2BhsnPTnXeoHDj7TvA2IRXXas/hYd4St1gQZP7QkeE81tLJm1aIBYNLA8sue18VpOf
PW6z/7Xwg5K+l0YcR578eRpmXemdgTy9rYm4bt8t9q2qe0IIPRLbT+cQEiqpWOnLxPPUf1//WS9e
XE0UDXQdKIy+vtifOkAylzej2lyN+YKXbkaFFcC1/SjQkMR3PYOJICrfIFyuf2qMiS85VRn/dUWi
UUGZb83hiZcDTosp+2Sl8XrHxt2e7dYpaTLV0zRrWIg80GtPBRw0dBawZG7LwnQHD2FY4Yp0hEwX
I3d6voWPdfizxfTikNr2I5LvoZxaeqHy8Ptp69xQg5URBhzJKiBeR99+uEmvtrv7HJkc7IVCorwv
SkpZJJ8+6wm7JEcuk5tLCZCRwmO4g4p92mjjc0xg3ukGPPJRtIdHRCIZDKy6SgBd7mylC6Ou65Ll
UBBOszM0h+3jGqiFGejhqu4D1S7XHfC9ZUHe8MmXWB7MDRXJ/WegvFQjTreF7pW75Uns/OheZaYk
HmjsnLydo78UuZSU0GppOV9RVTN/kGIUEsFQBh4fjHep/aXjvkuufUsTE3EqLGb6dB8eKBMO1U4J
4tfk9SAxleljfEuU0cPzQciU/38yJ1vp/VmecR9e1JiJgOmwJTPxTf7PrGQekpnYSriw4d79NOCe
/rh1+AcH9Pk5jkKw1dBPiUL0glDPjjw5Q48PoWVuf9nNgIsnd4HJOK6/dWc6FopcL18ttlPXSU92
TD3gm2kxFkJuW87TvsRyRPPj2OKZar2pGoKGetdPRyjDtrLUyAZYSHBTfdFXpmgeDA1OJP2phlsQ
XyADV84ka+0XapuU2TFhi9mtPmXgz3KIRGPn89PH1US4qoaDCxOv26tg4JRcLwmyRyIPnYC5ePnx
U3ZxQ9Ad1pbRqyzSkM7PVhXxHMCmG1hLQhtt2bNPcc0mKW8AeTtgnzzhVdd+pwrkRf7iZ2OfLmD1
2xlCy7oAP8kprNG70qIADv7p3+AMCQUtCq6oDIM04NJPT7+emki1UWlw5ewTFxu9pDsUZ4AHEhyU
BgW25ctpzK969CTTt60qjAGobxQXs+UQ+OXFV9QbxFn5QK793TAws7r6IG/HZ4OWtd5YibbnLYyj
d1mQ3QC40sbaGK8svSe6z6+StR4pLQOx3fD+563ZERCeco5PwEUJLucTdiKHk34rAnaOHkMqs9ph
XRd3OqLv0LCVTkSOl54aH+W200ocnGWzITN6pAzO/PTwTOL1tGjrMNE7Ns3QDLWRR4THsjwdo9WI
yDSSxzWo8RfDVo4CU2bnyXnYSOKy1eokMJHB15jMXopc97AUzZJ9QIjgpJQjcgZsbwKZ6UEQOOqQ
duXlxqwYfVLqOoVBLW60YOy0pTjbVaaefI6mPZ3bKBh55rGFu6WsCQXwMgIzGY9bTaclbXfr86C6
141SPtAryf+ObI2L4N5eziAZjdoNs9SbxkZmj/lPYd2hMY/6K1TK9NfXWIhHdFJdezP+tQKiWYqt
hLn5xE3697Dwl3aMqfizeOoiPptmKjKvczwWkqTXB7URq73OnbYoBbGFZKg1rqnEibtYVgf2Eupp
OScGapz9vqjdYQ7budaD3/Q6BUGigOlXlSIHB3TphBf8CQt3PUr+/741FRZme/Wcgv6m7mCJg/rw
fNmjC2u0V8lcnml7iMvWzWgKnaNYoqAC/OjLlFs8UwB+Yp25SiRu8Yb8HCqiYD9hulPXYeDZos5z
by+OG4PopJI5bCwuD1qUwb+ZasvGQNfn7VjCM8cvn5mrG41aP989RLo8MKAdMyqEgC8JcbXHc06q
7EPFTtM0koQtRKIHAOTxVBW38L0lJluvK4ekYcOnu+oREdBPJdg3tLicHfA5qiED8rC6JJV4Tyyq
MsGkLlY5EmS8CgX4O/08KZQmL9OQ/DbYGyMYSPZPVbYGP9aZ+M0pP8sOGKxaa6Te1u/YBrRJ3YU7
/o+mlYCvp64QI7gspmyYoyBS/Rasp1x0eCGcrlz8UpJmgivybYrJD7gmZchRJbI3hRcOQTji/1Je
s44Lf7WJ7gABxZmhE0ZmUEeoX4qFonhgUCMP1ilLWW0+C11iAXhX2p3Sl1M+E60kbBD3FB05FFBN
le+XZcsJj1XR0f6LpQopaTOk9Zp+rhXsi8CVTSJ+0o1nt3ls8z3SLbJc+VozDy71nWiWb4WJ31P2
oAKqci+kLofvLF8icooOy2LtPJPYorcpLGRcD1wuLDmcBqG4/oHtE1G9wDlVDMmm7mrJP38mD0lm
x0jQ8+xuiYyUiBV8sUgi4INUEC8UlDUb48VL6RXJm2UOoxEMavrmbIEz82HmpSP3ASkIGu5kIPcy
Hb61qjDdbPf2UquonfpVfF/SHez3htfWzwSZHh6QdjUghjEoURo86RP+c+9Od9feVfCZMoRhNV/C
GNyja09CIApq9JAoYmhMjkXKcLVWCnPH3JTYp3ucew3eMepdpCVaIgMMbH9keDeo9QoFPmN2uuqP
uNnTtBPOQ5ArWCreMQ1jHntkEMP1l3gx1uAHiLhCz22NLblDy79gkk2mELjxHsw3QIf16wxEILcT
KGezjM8cbxU6RlDO9Yzr6WTCZrGLclHVOeKXaCuR+N23CHw5MMOya3EUk8YFOrqm3Csbh5T7L+kf
nBms+SRjcMbGnSY74eayPQwFTXR+1rjHhllLTGKT8FMMJldHIhxTKdGzIiZO5Ds2mf8I+CwgQkr1
LozqCHTyWcYZnwGo3vFNRbPJhEgH+m+c+rkFnOytfT0kmcPOLVigsg18A+1m7b7z/feCqg6B9l/4
jBiAjyh1x9Zc2C1PbFCr2LUxnGpOkND+pfROcljagliV9LS5elars9iMUGg+pBVzfwuvuIqWiMEy
1XSl8tiOSxviFs/vxv17vlPWkM8Mn+JfmhDVTgG0r7M4Elhmu/l13TQNyFN4anV844sVG7UqfCKX
oj2T2UzkmDeGMg6elPIvQ0lJ+zugj3Xx0rptoo0EjUIveoyj7nQmC+d5oVCeEFunuXy0OM5RykcC
BhxjQ8Bx/6HI0kSh4o2sOoliM3BYKNhQkmMAL1tSczFbjicX0wd6DC3jjLBHtoTAcuunGbUZ4+HV
pL/FQ4dRphBVi4E5YXFOUomTqq1yp68/kmZbdfPA5AkFpUltoMcQEp1I1n19GM6WFUEMqj9qegLx
QiWFqrivMUJvC3lgwyXxNx+Yki0IyjvLkKBFN4BTm8w/7jWBcHbwaT8nMIgUVqVkE8u79leR0Riy
uKy+qB3QiOw1qgOCujmzbytygY8gDrYw+YqMVs8dOVffKH8nqGjIhdKEvrKjnUjzhtgiJCmHHZzP
PInxA/lQ/b7DckB2ryMdwk1ikQ9fwec+IEWvmsBlFNFneNAoJ7B3Isa2q5B0mZe+Q27uZ2tcvzA3
9LEZqMVOvmrsvKHsfkr79M+VuJwgyLueiTnyZhT+zoyzxd2m7GokdxaYjfTO93T9q7F7UVJifVpf
qgIFj9zx1EC5j5+j2LAJF6urIlDPALG2frkpQEnD3ALFgUP9I/8nwTM8uMjbUBrpKjT3RLu4SyJN
ohpP4WOH56dWGlx/46PiG8b3apcBxKJRp8KPEO1B/VRficQbytb8Ht79/pwqJOjuF0Lh1XMMOsGn
f5RhI62A8OCbqcU943ZBmdKfqKDoOeQMNPK2G7v3kjSo0jy9SH4osnUMzO5gThdTM6y+2sB/a4lW
9b0i+1vkj0vV3vVthLznLZwkZCNM5FY2DAEK8UGPmRpvCHRILNHhSgfMigv+NRRYcNF9zobJMLXe
Bv99LwriVAmbNGSAC32xaOVg+sCHY1gXcA71VZK086w2No7kK48GUeglQKbC3aCDVVWIV9XQOBUz
+cOrqderI0FWyXTfs9t54Al6LLYTpx7UL6SQPkFIG/pVPERwZKadXWar0D69YTUXQxaBjR7xHwkW
wPDOaYJQveIjFNcUoXZ+tkoWPBO3KRapPvSNkJe/awjHeFi9BR4ZhbP5Hif/1riMJsswSLH5dlh4
qDGuITWZ8yjPkWrt+nPKWOm3N8diVq0ufhZF8+Zsek30Jxj5yCbknHxDvm7SH8wlQo6FxKIF7O2m
jTH9BJgd9cK8an393xGDDQAxZdQlb8FL6V9wVgDwRZC2u/PTKmVzQQ2811x7pXah0sq1lGbtBMdP
skrS9S4wJUNVGdzzhG8TBUhCUsTwsbn2qzGuYa+l7XTApTkKPgjz+2mKx2UcttwPHPjJbN+h1caV
fBj/b2gM1oSQE1VebOrLuyjv4mEWPfhAvMXcnkyMvLewAHm+ngP+XgcFF2o4/D52llL798QD64A5
KerArcYL1gRxon6q8vCmwNTLXdi34fFNsM4/6D0IrdwEKJXIIN59ocfS4aEhTujKqfQr3iMEYnXN
7QBsQ6xs71qHWl79H3qaZdXc6/N3wFMQeTbXYzSpaUUI5ijav3H1yyU7esFKtFT0Ik2WzHLje++7
nSDl5fLOVQqAJ/u71emwzDtPBVfdygxntdTtwas30Vbjk1aPZ5PlX6WOnL0+7wr61ft6lKb/lNGB
X8B9LMZnCa+YMt4ZNaDww+ZxAa0BCZrVM1JXM/bDoTu7mTl9LFxKimptwuZN1A/S+ms0zlwoKIZb
hoKv542ua9IDKGH2QxOkotOztgb1x/RJNZbPGGcyND/EO3OUnxWnNQxqFq5qTyEOhYnkAVEJKcVd
Tp6UC/vsjNqw+7Ezg2Vi99pOdS2QvP0V1Evzth7nfk/PujT6dDwv3XU0G0uGwOI0gz49YXIsLUFa
pG7KJEnSwuYHVs+52xjPQIKREOdTTJU0RfQftComTY0jvY7dgtUd7v0bjOliaOuyBfNaWXSWVfZ9
Pyzxk0xbRYzHmwfRjGtKogJJTq6ThCzN8BYEJFqNz3YQ+ew6+2KHEHl5jYINutOemnLYsOqqyKKP
AhILvxnObwdmSBNcrrSFmtM1tcISUAIZwPrbk0HGd/CpbSVTiIi+uvTj/jQM24ilYGIL2jvUegyz
0IDQXmmepoaoPFotFvncRM7ZjapCRDEvTJzM1pJ+5lLcKh0PYgZWwNRmOqN0Y0bVcd8nygCR9Snv
P5g4K/6ASP0BZcdaW2NIOt2OMZHjChMUmbkTZp5BbQiCz3/hg08YCknYqNW671Z+BKlAQRgyPreT
feItY+r5LapBjW52+PcHReFs+y56PzHcjoW+HrsW9YM10PyRGV5MWLJkYojTsLJNTh1IhKgql9SE
hUZ0ehF/szc1fg4XF+SbAtxpoGVaQGh28iDPWjgY7ymWyXIjXlMFD0VYbNy2GFzpYmnRdoFjVWxo
iR+uXe0QgAZD8/t7Etufj1dj/blrYXuk3ZKqwqrrvxT5UnbmwTAx/6gd30VFo+P34ChQsNheBFYf
SbNIRZT0UZcx8rKSL3xFqTJAiSNH1t2De1sO4KYwNYQMNt2JNjaFa6LuZQP+3f8kwP6GR3ti2Hx6
GKwP0n4JEq3MTWfxcJTYW6wDrvTqPgaAdxrjxfN/YtNx8yTXV/MfX/zYi00VQf21ywuJCLTfkd85
mq79t7G6sapo7tks5JTaaSUyhl8PxUvb83E+I7nqNGsnySzpQpi0XKapp3XV3nmPXr5mkrFA5+Vt
mB38LYn1Crtw9UyxRCXKqtbz5wAqnWGcbIXRik1UHu854u/Ds6nC320UrHay2SuIrdsvGqDQf/18
yV5ZpqDNKQq+lTTtxKcrZlTPhr2POYjuz6c/luapK/kv81t+4MHEfoFGVQnYdt2HL7MmaDvjUukX
70Xl3dNc5Bzc+CmnfAj9rAN6+lbqiTCRSOD+qKhYXpQTAwmsAw/71h/u9XvwFh5yhxSIhEKioxBy
Ac34vWzywr4eL31WdGT290Jvy7Wkepz9D45+J1sgzW4UA/ZwiMHNQQ9x07mauh7+AYYBgGEAFaaP
/tqR37ReFrF+89Huo9Y97q+LT6+Wo13+QZf9gDHMxEz+bcOAc4VRWYM+QYu3nIXCxaYaJAjiZndF
l/Xk5Hb+YvgpnFS1dINrrwK2cqfTcKVkkux8m5HODSeW66iEjygRPPxibNFJYmjMD8rid6UkWW60
jx/NlEXlHPoBO28oQvW9wPPL8AUuCfWgpgf3CXlzU7dW+OPd9aDAeQ/E3TCZXP5970eLZzeRkOdT
C4M9mNLADRoZa83pkep+LsXWiZR0xoYw3QxmT83l1hMMEVFnGj6AuvbuKdyAz7erXcwNLEDXUZLz
u+gBjXBuKjtlb3XJaFno012WxYd5BvhgwpGCfU9yKN+6LVJRLKUK1IY7504W+O3i1iQ0+aCKnZME
Nd3E06y2kTdz2EIMeIE+tLl3dTRiXTF0KTuuDxzxKDyvpfarhqpzXpo94uUi5MTAGXiH6M09mCRU
WcCbm2ShO7uTYusnrJnXYULVtDJ+Kyqu1AVAGZYzzzwIn38zrrLoio0ZTanNRpVnYAkBTpzX2Mge
HzE=
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
