// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Aug 12 16:00:36 2025
// Host        : Suwzw running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Code/Verilog/Radar_Pulse_Compression/Radar_Pulse_Compression.gen/sources_1/ip/if_data_rom/if_data_rom_sim_netlist.v
// Design      : if_data_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "if_data_rom,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module if_data_rom
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [11:0]douta;

  wire [10:0]addra;
  wire clka;
  wire [11:0]douta;
  wire ena;
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
  wire [11:0]NLW_U0_doutb_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.35235 mW" *) 
  (* C_FAMILY = "zynq" *) 
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
  (* C_INIT_FILE = "if_data_rom.mem" *) 
  (* C_INIT_FILE_NAME = "if_data_rom.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1500" *) 
  (* C_READ_DEPTH_B = "1500" *) 
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
  (* C_WRITE_DEPTH_A = "1500" *) 
  (* C_WRITE_DEPTH_B = "1500" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "12" *) 
  (* C_WRITE_WIDTH_B = "12" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  if_data_rom_blk_mem_gen_v8_4_9 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[11:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 26624)
`pragma protect data_block
11SJC2nSQBVg63QEkv2dLiwmZNPFjQHES+9kD7z8xhB6zKkszZr91LGHlu9m6ifyrkxopJT8xmo4
L5v+OqEDxcaY9NIW5JW0lxFNaKYMOqNUNEay1NqGoiffWG5SREoPovtU70uS25eQwHZj602bKhxh
iUnw88dfGS5ecY96deFXIRH+3xCEN3ja0SbOLOz47f54vvaNHZB6lYNK/NlvPO82VI1NheZcQ6JU
7v7dfonus4VtzvSQ5fEjyf2bh7SKBnjwnRnuMttI/M5A6UEq+ZDGgrnpEHSmsuBo1KpH3t8VRMmG
SK+Sbpi9wF3RbrtMthli4xMJubERYOrjGHsKo4eJejRz9A3W9jw3rHAVKUFfInnsf6hqbuZBBehA
t4bLgHxO8n7r/0A3WZqAxkNuEQ6L6wZKWkbgol1iPjNK+7eT6r+gVY1O1e9wHT/c9dB3xFetXdbb
sx0CNTP9PCZvsx3ONZV4b7TJg/gzk1ENZiR9aQlsXyBHdMzBboJERRuJ2H4DXyWhs2tWdWyZbEUL
GzG27lFqTYDKLAEIo8O77fHFVsfdc0znYF244omG8u7Mfm5d3b0kjlJdZlucIPMXMoXCh6fYr2M+
WoCL59R1gSauGO5MDegURUtIjR3ATIznkqYgweCQigPLfvvc3Jy6JdPo+Vs/DXfCUsjyN0XLJ/v5
3uSsj51pujFluqWckMRdy3vryFn9YNKm/VE3P9uVaSANZeZ9qizKq1os0dvq0jt0JrRHMgvhNAhs
Qb0x7BOwckpz8bZbZHiTOWLb3iCajVHL+i2+pGO2w7/7FbzCA0QDbWzNNeWFcP03nmZPlHwTIZwd
QjsPJzvGYOlMBV6poTVzia+Hpl72EiW5CHZZHw2DD+HdtAkNMazkBUhwNtN18NEXREzpcEXhzmd+
bodLXCTNALT2XAohQy5uTtnYcf7d3BhG2E8zFycqcUqyl6OvaZHJijYIlBumAth7DqsU4tM+IXOT
BUM2BISPrGmnbslp00/7KcrASwBYN15lyfvlzsspybMn1Qzm6IuBgxNh9ZWmLtIX/9GU7fvG2qSy
PdyiuylStOc0Z+WVR2gROB31u/HPGeqhWPXXJoj7Z5Y9NEiq4qYZwlUbDO8jRx9iknls9ETrAbKH
6YcY/L5lJuC6in5BUJzUFDNP5Ppi2JjEs4zG+hsrposMOZ9jcUAJmX+eksRh6jkUOBNvO7BLEKWm
ND+oOkzmUj+R3ounQnQokLfMuH3Rbo5V4noAeQMBxhuz8tu3TofCp+MaZL11EpR1ha+Wjq4uZ0xx
legdXOJJejOpC8oSlTxnQ2UqMu4R/ttFFuYCUOJdvdt5X5WgjZS7Iiq61/ccKR7kgvwAbzStbm/6
dFC7Z8tcuxxCANcdARQJFrYqx49sw7FJ/lLAmYq3SHdatz/61WX4yTNZigj9bYipaM/PvBasY1VO
D7k+5BKF/fNmHWRpKrD8rvjdxxs7k7/0M3FwFlq4/u/XG+Eyyy+1bCsGbS1qSUGRYj6DGVd1Z7mz
G5l3IRkwz19bi7zeVELrfMW4/jT8aEDZwiLGT8ufWvAjUZvKkj47a2zDyhTXDl9eKQTzGJKZwK6y
TYnu1EoLbMk9i35Lur+n1KqQ0/cIH8EBLTyghhvFSr8K7j930cYvc3e+9Ii9pnosbLrDid4rBp7z
O7kj31CfExb4FmKjqn42/g02yi9ttd5GUHQrTwnyMoHlfXJp3MlxXcCjp2QTL0LeIdsZcOrguZ9b
iNP30/7Q4ZtTpq+7ElWE3etomM3XAZa50LVMP9DHTZvsQKwV9XfZkt+Y0j4Zj+iBCzvb3+fmPsJA
7u2qUU8hWIM/OlH8QO38MKcOneOBSjf67vU88tXT0TclFILtqepceSy8DAmdiUzhkKG6vxNm+Tkt
CI5GEfoCbsa9U8lqM7mND+Ox+JYpUSF2hsGpZvz4ia5t11FbjhZk/8rJt9+Ai0hShSwRRq/NeGuB
q77LPT8uhs8jGsJv2Mm6pKvd47ILL28NuZJs0DIIrV76w6o9tvIGKj7/B16ASq+xELy1iu/ta5e5
teRJKVsHjMTOui8CaFyMo+2tmrr3Lwjcl2SglidFnXWNlEkbWR5GYMVu73a9CmRfs5SiX7tRH9wM
fwiaxOqQPqpbeSXTFY1bLiu8QOEjzbBbwVi1oEvL7WAufwBBlX6JP4VNwMABAPtFv702ySdrHMbd
If5IJt8wiXyPLA3f28D+H85hyyAF1YZWRRyPNXIygf51vtJFcDrhYfEPHMOhyAkVeLse/jMSbsbT
3n7o+/ngK8hS4DLlmnEofs92wGBdC21lmPo73i+nLjn9VnK8dMg/QYrrjhlLbz4k7uhTxZsnZ7bk
g5oQjiir/0WMJ7rafwUHSfthLACQti4oey+5Kmbv/4U2/8clqwwV52c9nuqa2FIxR4Nn6URqSPFX
JxYXthY5UUNxg5O+uKzwOab92OqNJ32khwmDSSEtxyc6TJlG5ThxMyyRO06q+9dtxToKV+FtF949
BjFmFFQ+ofMnFFO1Yl1kWZ6K2z/6AgrgE3PRnBnGIWgXWjQFbmbz4MZI8RaD/5fQHLnRZ1XFHnjd
SUTTusUrqqBPcp6+J9w98COUR04c4QRMl0KYmkvQ8+TkePjyHJc0Bjen9SOsnXxEWSthWXPLC+w1
XBONUTIx9bKhVTLo4xe+GblGK6DtkPkktZ9OexzyJPWKoI0BxStLw0C5V+GpZCt4v8R70hA9h+X9
hseLwFvYk1dys8juzmHhKdJa54Prbcg5NuwGFYgRUnNMMZud28FZdlnpi4u+51hCh3dgPPXq2IOw
gViWYCS3SpeZIUgN0nXBNKc/mejwg74xVsc/ndxHfv/Oko/TKNph21J3DmgK/BZ5QujO9HWz5ba3
7b6Vwg4vId5UZoBPsfSeQGx5sLrXLkOe0xSrSpj7V0HxpqC/UQp84LopfYi0NXsSF2xDiBCcCw+D
05J00soorJWQYlq0d4Zq5CriqrXNfEScaAxGdU+TJFSz4O/+1GjYg7TFPVCw9/F3Vfc3J3s5zbZ7
lQT/s6SGHRviPuHr7WdDyBVJNdQQNdOBjsjS1oSdpb6U35i6EVf7cS+1nNFrjeXy4Uo18ckQiGXD
TsW1KckH+bgRc3zHG6vxjCW3Rekv51EyUfba3vqZkpLVxQMlFPCBBa7PFhdg1tH0tXYj5etPd1ub
0I84TUOSTjz5HHzGWavEMpEullC2nnt0bh/O3WbmdsATs9Uw6BdOQ7kfX5NqRqyRiEikhe8BR2vt
dt5ZKUzlHAowSAZ9r/oKAL2+y2i1GmnOr1pA6PUhL6lKosSy4LN1yC931SOake5OkAOx45f0GQcM
sNY9GnH79bOptpEUOaZ1Ng00OFjLc8syzYl6vrpwI5Bkwj+se3GWPXjTvcDxw1tDWY78hwoabc5q
ws4w3sIE/iCFmF99v59dybGH3C8bVKTsv+fZUIPYvcWgMpIurIdeqftF9k7QTgF0dy8OPts71af1
jOVwJMdz7YM79gsNkMWIcaN9ghEqHYNefXTrLyYPORINxZ62Vr6K2HwzAgj+JsVfwGYYY+MJmioJ
fRje26X7/aVBzlRv54cwcRrr0gvfi5D+DwfwSAQyBYZ605o1x1aXGpW2mVjIkhzq72LrB1VqHohD
JpDZmoz6sEaQVH/AHySi769ZdFngOePW4ug+xlbrgzBE8uIdG8iwnN0qe3KSXs21VbCkVtx0gnA4
sun9cQA5OWk/P6KDZoi2wgSRK4NTDARpiumY7g37xEEkNGonY8SjHVjCVstm66esTiV6ewCTOf6r
3/3bq5HWkgcqxwwDAtXdn/cQVYbZpbldWupZa1Dc7kDFnZyG7k4jGaup0bH4Y4g8ZrdCnGhJ5AyH
zPjXwPC97pbWek8lLLyXUYte2I3bDs0p8rSN1II1kUxH/f0a7OoYe3uAp8iLJ8xpk9/aXyOEGTOC
ZLOWyhxdtXRn1QGYHJTKPma2INe7/fC6e9jhcIk+ohp+hBmCIOLmfSH/xSpOjIpU3IQiGJNR9nvx
c7pfzgBgWs8ZRbeC2G0Uae99erBXJUIXECExTny/Qio7yjF0Sy3xWiFSzNC2o35vSMXrq0b6FAGO
qGwxrW5gE26t93uhEelyyUIUsvfCeoIbywwUNU8DceZnoscyTUZex8xkSVG3RX5El69sLVV0WsZL
URLoQo2Cwc/xdpfpiiTmFhIhEad/AgYOSOoilEo8OpbMDjKqQGjyjHmVwfgBLHkBadUfBi55TDz4
h8g6bAgeVDS4kvMbXpCQuBcAEBn6EvOAGzjT6HJKrI/1oeqIb/L/7jMGr9O/cvfwnVNw3XOBeCVC
RRCKUTJWutPgKGjma/4cuTsSkpRzvcuZ8iRfGLkcOTJSCeMvfAyOtanHMgdhYutvVlx2pvL5YT4Z
O54JIWY/vcU6xA62XEZi+h1tKt25UH4dSrLCFMNC3TFnNSQ49u0tV6vMgJ1ezLyNWt9SUo18uEzu
QC5Taomu1RoCR/NxGMyfNnhkdVnG6XNgOMLOiBLO0qpI+tTQwHzxRAlZ6pQw6soBPCbPUNok4G0C
ZQO1//D2vWjoq0sdEQ4hBH1JBHRWUFVmYfkasmO0FXWCY3vpYZiWqTRdKXlugpWhZKQvM6UmufRo
oWX5ZrXqBpXgEYrDzb8CI3uiRoC3JcGOFWL9IOqiCNTOZVQGNedV8Ah+dyOREtmeiC9P8SXgj0iE
kOxfM6dBl+ECG4a2Xswb/YFDIwe84H/onSqIsteYdxbkxX10Fl1MzIQI9SuIi7iTmxtwqwZF25u0
42NQQl64fhyQJ+k/DKne0q5epq7NQfsl6io65ePDRDEdK/5Cn6T7p9rpe2Jfmm15WelD3jBY2ANa
nwWuKoou2/TunTDNHAesFQjcaHULrm7viwgf7ifEOwclvWCQ8sFZsU5VtO36Wd6cA+3DhyfLxAWa
YHrYXrMGTqU7ZBGyE6kD+4v1TL1U9TbFQ1qNh/FaK/q8gQNwm/mTEaKKgUwM7kdmVfiuarhzplKf
+gpIZyQPLa/S/mmFDwUY1uiZ0xpnrb0d+TjvZH0zSqsBCHo8RQyX3cbGI3+MyRnRJeu+RX2BUuiW
Glat2yTUOFYQ/P+vn4dYk1yKvT+C4tV3TzvO1iIdy55h9SoAJ3aavcYtF1ADBFHYLjtqwfe5F2s0
wxZkFOZ78Qf1Sk4G9c2DQJpW12EwzryFmyL049oMyBSnDetm5s7LbMIk3XnQp2dlzaRGJeeDBTc8
+Lzd5sERhkf7PBi1Mk4/doKcfLxbGEFpJAFeEP7nW55B89czOrhDLg9zwxlBzwmjE7PqMFLHMQyQ
WHpbNEIdtKYqImD/X3FlHU9k2PkFm2IzG6vSsmJVSFUGs8gXw5/QYARmGxnUp7IGYAzagHcHLo95
mndA+6hCmm+JzMuhnJWbHYtvZ6BMJ9RkY+ffm0YKjReGWTCp0LN8z/BpUVMPNYzlNUtp5DhCjiOx
h/Dm0+/s+Nz6NcQOHznWPGsP/iC87PWsHHeo9xHbSuA0ffPN/7frz42f0giWtRIRnLbxI4eHikVz
gEF3XBhOhY1uWLxYlaBvJ3uWf6uTw9nk478YIiQ2mRRwA8r0Ll5fprNV5nBarTj4fXmxsmAHZiLQ
QjW1f0/T11V8l50b7HR7nuxhxBHy6w0rM3KV7Oj8o4qUYdDUtj9uEJ/FcL8yo3udzs/J3s3GxjWO
UmxC9ghgfQcjabzAhdvYS2m267tPgHQGt0CuxGt5zjActJGeBApbg+TYwzfYFetGDis2UFE+Z7XP
pocf2du3J42+9L8ElgSOB/gwY2EbWt/YRD1RYoqLCt/X/3hxj/Z54P7XERSthr6Pz70DOi9gwEHc
IRkUrC41VWnrJV1uGf0oMw8zx0PCxqm8xnMStcEa47tEfxPrbpwS0RfTDE9hvb0thKboo30i6TrO
2ptl7njTM0Nw9FvkX6HpHl5X01aOlaOVNP9k6lbn+3sRa+3vfmcs+GFS4XVmjt/kFYqwL8PNwfLx
DTIzXfQrZ1ji1reDvrJKDIo7FKV8dtiKlB5Xq0YVWFT3wOAy/M4wFJ/WJJRoSl2LKXnB8W5Ky1Pg
pzwRQJscf9nNkikiXWfnCRGllIxVb4RGbw48FLF0m9V7LDbbwSyYzeZNRgUN5mci0uZNQRFDm1gB
7CB+6I3Ru6OobvFSp+bFnCebcihk6N9OIo7VNmJw0f0Lo4f6cprsIckS6OGMLPACO3pGl+w4WqHT
8zbBWK0R0CCyyY9jMmrkRWLyV+OYz7TbHrQDWRBE2FD2ClM57iVMTKBNKaT59C1hHAwpzi/vuUHM
5sF2thWIu718SPHdbNeA3Mc2dOtFqouijDzgs1MnaTPSoec74HXAT4SqTKSgJfyv7YQdNrkpT9RR
Dm578QOANxwtNvuCXiUA++bEOln6/vX86TdplPbdJ2U8LiuVKSTddJxUp0F9+FTy/DcNF5kEAFZW
xEElJswmOTzsavgBgwnb4J7mjP1i3Z0aLpRFrGAUIjCFrDhzOgfWqc/pJqIuZMc9mC4KSuIm5GVW
etuRRZugVEfbCXF7JmF0aLbBqjLuCij5eH7C0OGTxO0G0U8ah2zJgJCFY1q89/nIAJCoqcmuYWnX
dNSYzj8VhSoPt0XAgmOGng8r/zYioHcJg4ywGDWovUHb3Q3k9QYjF+RUOG5HX6Bl79+2L4M2VAl2
ciTkXjgwFR3OmKGBxVPJPaPGojYPLFLbevn6/uIGLU6IZkJUp30KGTeVSTvpRiRriW0xh48q/COR
4oElD8Sqd1I3+alsW6WtVx6hRzTCsFsKCXLHCDghTvjbQgh5AIgeexIgYcDNyO9MyAS2Tekj7STc
qLdJ2o1XYmvDYOEt4XkoGIFvZi+jmnUPHCavZhsyyVo7dDbrdOyIroYEqxdeGt53A7Q+cMUuRQM7
mRaVX0LurBXVhTxdztJk+qgLuxl5QKwHNjgIRitnm23hnBPJwfE6FuUDqJ4aBcG5lRzExdlS6gpf
Gi4u2U4iC2mMnSuTogRzLcGCmGWOikQFrNZOtnAJ9ahREuLiUGPtkYR+Cz+73ccZBiVinxI8CGyE
hXri8EmfeO6evrZzma2MQk8WKUj9gvqKP2XOaKduE4UIR/kync6mnb0i+EhpwANtZf2QOr8GCrjl
Ai7oHMsddG8500VGNRYoGouU/Mc0Gy9Co0G8y88Ze/VQTIsnt+myRBCTiwW9mKxB4KFqL7KVBFcH
8WzCJJK5FeU7e/0jM+yi2UKVHzR+9dIuxKNWFjstzhZFe+kOKYds3ETznb0N/fRIJAOIHAHfNSeN
21k4fuK8EPOZREMc0zwCBFRcU256vbm4d/HQOPiASeD/B+gWDi/iy3l+e0tdD0gSNNk+oKR3pNf/
EjYvAdrc5AbwYBUGWw+WTzsQiFcqQlF2gVZAJq6w0PXlHDUbru0sSAMOKH5FBwFz+uJmLR3m2hZf
Md08uQxpcq3NgEvYMHZ5gVZFKjI3QwmuycbkWSNXJMpsCWrhYA87aRNfCuomE4wXk9Pgt8RE8U+z
zElSgXZXO0y8Vr7lnY/RP1vZzifg8FjXfGvx5nhcClDK+HKfZveWSVM0PMBhuLAez60XLawX0tDX
U1eDIFyKfPPPyEc/mmYck5J3Ysrjafv06QZwjrlT7ua2b5bAUZEmKJOit1ZRRND0s9SL5wg+TaEv
rhsjXf6yvZN+0QSJNqkznRR80wy2tk8SRSLsRmU1j3DJcWR8/ph/NjSDdQhjBbUL4iyvMVMexEZP
SoZCCtw+Rn18pACgUIr38H2B/wuB703R076jj0FXp++9fLkA+Y0P1/wCWbBN2w6HwEmfiFJMRn94
27naNEjJIHfVO7nQqOylNMFM1DYqqGZ7PXaNxaIc6jDs5qO5ggVgKxjwqeW4GfQjzJYp/Alu1CWB
9aS4kFOTyIMWVelxLc2jf0bjhnZDw5o9AyWdDjjYD3r69PIqohzBiMxxDAo8B7RhJPwuGa4qQNka
rL4dzaOrb9yCn8SpTSV/AIWgOJo5M2Tl/IoH1muAbHc7dKnArNXCkG1pGTXKJKNp4YtVMIeBclr5
5Vil6iaywcGQUUx4xbUlv+tDUHubRswVQ3kyt1+tI+Vaeqte0pPHykVMX6qkYsvd5CkS574xGJ0O
ghi350RCTdKmQ3AQXZo/GTfMFzAUno8J9uNwCaDBEcZL34mivYv/TA9ne1OR1XQFaRduItuS34rK
N07DtwXgCMKZXzcsMF7+rRlEHtiS+ohjt2ba8xqlBMKIT39hbZ4JLgvkYUYsLxYN6aAcgTR4mycO
EOq3WjhjZRcRVSYRkQoLXbrgfFc5md6H5qozhRGgWVAz+iTpfk2getD0gCNZxmlI8UhO0C+ZS6ge
lMKbYwvt+vWmztr2TP2ii39F3JYd94CeXWk63PEhbgmvNqVuJGbJkqJ23Q5yUe/kEF/yTLSa5z1g
3dJIFRu8hr7vjZWKkd2LuHvoM4A1zPca+3DpAxBMy9nuJ+V479XEmw2Ob5re91sLUib6Jo21Eeup
GjiOyB8Fq+mw2MG/hzNJTNvmPJ10fX0/hvEUiQqH3+2pbBe/EWRfLXkrs6/cUvm34xTnbyHJPPb+
pTtSjhKJxrZMhWt73eJN0VNSfRe3xcuwzc+Fg37iAbgmXOl0rPKJvtGLuQNI0Z19xolq95gdjtRq
WnBMle1S/B2t6jzMvUzlbDrxvFR0ZoBe/h790Q4DDcaw7CLWj3aTShSW7EUH8ZB6elKmm2+8iUlc
RXlR7sqhNbJdQ1GhBuaW7gpxd2bA0jWj5xOrJVxE0mPT1/i4rRpuOrmTrNZ/3LLAd4n58iW3QH4r
H9jovRLt3vRYht8Q7I2EUnS9vEq3zDRu8/nPyT64jFoPCw78XEp/UOw6Ch1sNowiYiigFeZC3mEQ
KQ7TGUHr8fo7ib/8wx5h3ot+wpfYBXMJhuxzZn5XA5zAUX7fyL7g0SJR4NPHJuauV3G7BDKfSiSA
90hDsCGQAae56+yK8SsD6D2ob9CepgZwPIEVynQ+gjmqnFzYRlC4O/Q+903jIiPgoYY6p96Qwej3
ojd/zEMaaBf1L3yzoTJrCzdPdfi4JVqpLHK8rsnOGug2KEnpt3lHQrbooHoL3ofbGNPVxqSrb07x
K8ItgjiQZUylYGo0XrVh1Hhgh0vTUYRcy6Cf2DM9xs6VHLgWR3WFJdyAF197292qTB/MkK8ZaTVV
LTUKVWfX4F8+RBv9TxTBB8NoOalNfwnWFxeqFrusEZHNLu3tIWaIvLw1beD2Ve3zbKsWCZ8jU5W0
hiTrGWiQxZ2lFmHLbHQcuEYPYvz/vEywnZwO+Yt2V9rRVU7pcM0EcybHjotoh5r8scFOsBWtpBw3
xC+jfMh29pp1JC364Fi3ErG+l61tKmKD+Q7jx15n2TKY25Asw74n7csXJNk0l7Q5Fy8uUxCvnV4q
lUcV3XaKLjl9CtlDYpUe5pt9YnnldJ6xaSgaw6LIqcSWKASQW7G4PZmy4Dj6EF4NhEy3igfwoU2A
aGMQz+DYEEQdnMTodRhfzUl1RuPLQB3S1x2G7ckuE6ZySGGDx623GKgj3/JX521c8aIId9L+K3Zt
7f53OgBMynOdBovOlfTZJDgFm56TnYFjD7u1w/RgoP2UNonrmEU05RbEejGYv/82IGCwRNN7svLB
XEhuVAU2d1GRSisdk5VjF6dpyGAqJEHDOYDgo+uERDo4AM4o/yasFp1kIzJyG07a8ZWaO4ki88za
YhC3XSTR3IKBqRLRFcl39FLX8Y6Qm2DQ+B9RI/JNubh/Gawdsn+SgKhYMHt+U+V/m5odFK8NBhVD
YTVQau1PEFDbuizBFn8hin7zmi4JrEJc0cxsGj238iRC2CZ7j2JFprF7tcwkCGcN7W/QlUlKVazx
54f+3soRGYdp60jTIIwDVzFMsDNSXsaf4KWgbi1PHLOhASFPAb4+0eosRvFsi+4Sw1BPBjHfSSh8
Ph+8dz9BAAPpaTZ3EnxwnEjSvFy9f9/PTL24A7JclmMmFCB+ieJePSfqjNryT6V6nNVyGsBKbrsG
ZTcX0XiIj5pRyeP4F2ozvR4InE33gJ5Bi0T4jSuDSUAeLbulRZhg6XR7NCIjUguwMvmvwUIaISy5
M/AgpUMMkRxzc9//AnU7VsarLO3I7fHgneWbXNYl+m2v0afyJnwH9lOQtGnW1clMeFremjv7Ecxf
CUnpH4uPGsqWHYLw1avpSNDmoYLaGCgU3NLNBfb7S1T9p/2KDpRq3WLwZt/4BWeGNTnHvoVaihPA
JW4bT+AQCqu8Tx4StpDpwd6C/x9K0QrFiy/8o7ps0/Ny5Sbc8UZWYkTfcGRg04iN1rLfQrS9kGyb
dDUh7v6QD6lekxao/qFKRk5pS/uIuG19qYQLIrr8XNJYZxYGxqfq+F+HUaPostFRHsEWwRLRbwtW
i6mptYAftnbP0AhKOFyg50sYAAAf0RlTcQ8wX63oFBuJfY9LBgwdchnE9Mbc5LHKMw5iJxbarhmB
necXNYWny/uqHc0RRbVBzkktkuJnp+5+eindzHBMnQL1lyfD57h0KILPR9GH42CE2sSC17K4tetz
itjMCH28Unnk0SWv8XYK9XkHos9e0Y1BXmwgAqwHyp0r7AIbYOrCPS5YDrBIBmNGNx6XPlTesmLj
XFfgAUKRWk7UCi7pRy2XmPRwpz9AteVJc0W0QVY3Jo/VWabw+M/VJUanu9Fl+ulOMORxaJGB35Ll
DuVw9IvyDepm/iyLDVhTFgU3XtAkJW4TS59thI1A9qB4qE8yCi0Q0CcUzS6NHFFI5SnqK06pnsiQ
lnYiw9p4hjx0ciapaaZ4dAvwu9YsJvd0R54fYYpiQH/0I7++XqSqNM12k9j8jtHL0tFWxx6ngtK/
g/x2vUnEq+BhQwVKXUWTN1Z/dpSKGET5j6wZqSWqzx+UqlFL3B7JWyWuGoJvZ+Q2hSgicazX8y/6
kaa8HwRUtHRd9Zd10RiaUYsgTC+8JW8nwGVTIoA1nGm2/BedaQUZnAzM41WiQ1y5eP5N2GZQmE1+
A6BBfZQi5b48bk/m29HD5saSpfQA7SuzBcHmFH2ouChYUSQmrwRSwuVOeZ5l0Xh7XjmQWXQsUkQg
IcMhTEVMsdEoI/J6ur1eI/2geywBFwvcWOIQzEQh5fwnopVEgc7sH1Ks1cWk2qc5V1mCqZJn/BHY
a2CfjcpTQGdbOnv0UL4mo0xZ/yf8JFsxpJ9F/RP/NdAs/9xnVkC9LiStsVNyLD/LZxf77/6sheTw
FV0pSy2NSCS0v3mRuQWpc11vSSKC+2LXQTbGoUKe0SBoIVFYnJq7/6/e4ku963tSHI9Dpvb0zCFv
tYDht2O1H27K0ZiDNF1CjTb2P0bAbU2mEIw5Y9O/PymCJBXESUONfKElIRQPp8PUII+4RsaR7N12
19c+IW8306ged3/lwWoMBMNV5qHlwMPDgIMxjxktZ+mFmCbrRe6Cp+j52LlxOKCCipRnELe4ha11
dfzAVsfOGWvJ8L+JT3N+DXnOIpqRKgKIUj3nrFkjWk9Lh2mD7vabDfqwA08YQY8mcPsP26xqEDp4
u+LQ0WdHYdAR8tcIvfpp+KYTAatzq4Rz3QQNtv1bgiudMOHqbnMeZQNdM6c+LfVk110Dof50igP+
uILfJFYVIEMd42dJT6RjozEMRjyIKXR2x5Vxysof5+ps9VHkKQdzImng8VublXUpTTTLin1apzvs
YUJZWr7hSLLXw7A7LiPD46XLdZ0OTJw1J1P7blFN9+V6aWNh+Zt77btjoetNVMeTVAL/PB6uHU7b
NGOd/yuA3VNi6cgQTfuWcGreV0pd+yKriipCkR3KDaMSb7ksHi6vFRCnNAXJUoz7Mp/goJ/jgADl
VumjSZhepKVkA36XIoqn+c3wOISWtd+a0HJKjS0VmNZmxhnqJIRZmZxvq/03Fl3RhDtBluy4m0dh
DdaNL5+uuv4oZAGMoICrAdM+plxB6L2eSvcIFz3PFJUC+sO8iyGB5OIQPvhpbksDAZpca9c8OB5S
M8F9o7Gimswlr+2aZtx1TOj7/BorBGabx9xs1wXDDQutdlzEYH7fioSY+P+3EellYNvuadb/j2f9
fQW5xlkaPLA+GXHzoviB5cXyTUKvf0K5H5cJf6umRtR4BX5FnPfYf1bJXe6P8huvu0newqzNGHue
6Mhgd1Eqmp3YD7rv5D8e8BpHLfSP7NhnsGHI6EECDg5ObrckHzBajp1/q/7Kx6kjoSNs5rAZQg9d
l5A49nPLXVcLLOU6DdDokLLtqFHekHwekAadgOo8GggFUBqhpnVp9LRnHSV2SyJEd4KNXhm95tsO
Med5/bHHek6tuBEHPyKBcTgX74nh3qhPmXN+5Y5eKPW1CROrn0t9DERol1ouec7w3xvYKK/LUsjW
CkhfP0yxk5wZ5vPQbwRj6IhgQPpfIBURsctZo68BjRf88OQ2y5TO41VnAe8d6Nrf5jLdtJbp7RNk
1TuLm5SvnFcA4eoc1KHPMPIR0ZgwvqZtLhostEMU4roXxAndhPG8W+WoVtj4GMJ3ZeGHQpFC1kAd
KQ3Bc42us4MX78KB9ANo6S4aVTQeYBE325DMUl59Ky6XbpR2k2hweFlK1/EQopVZK29ok4DgQSYn
UvoBG2i0+P9t4FBTmWR8hmBVM5y7ngvicSf+KIpCsZbzC1pZpeE3uEp+2gY2E0tmxA/T0nSRFLMe
fXy3YfR8g6vBpMpEJ6ySPVfUKKTQX5vYKSxGduMl8VG2w5hzFWbvLGMMuKWLW56w67WFsPmPadiU
67D1gEKNxsUpE45ca+kqvsNECqj+cv6+g43yBqmkn1t5flw+UgaR4zMVCShx1kn7OXuZXM7FW62e
wd1d3WriQBl4h7PuK0tNDHVqe4FD/acWA61V4bXcELSpzxEmIGx03lR8fo1iOeKcLQHP4EoWN+UZ
lEvO2ashm2Tt9aaEEJXrRTPTXyj2WSshtk53WDO41tZJdQ+C2PCKHMG/Qyd/FGWg+er/xd7A4Y5D
dbEHHdVg/hStLZttc6VSLr29tQ4bZJ4zC0MsPz6lWTEQr1oWL6GgKduvGUlr88iFpph2nIVxr9z/
Fxul/mTO7dH+VTJ/GnWfnZbAJoZPTD4UaBpYlH6vu4eDbk00uImjQaSzpw09ceXcDR5YJTsOYVrC
1lzIaxQJhY7eWfDuMeKSi1QbjljhOHOGduVZRMEZByqH17WFZuMw4b/IynXr7iVfUNJgxsN6B6/6
P9psbXyCzgkFCDlVtUyD/z99iimA2/UAwcJJ498sbJ16dMSJHw3AcGceg1bi5dHQeJ55UZyJ/ljU
CxCOCNrm1o/yZan9XG0bArM2nBOnv66WHoArRA494JKu5UiJdPcGWX1TjFq6y7F0POCfeNlmcwK2
vx5kery3YfIsUUoKmLgXPU3of6gNrwhuqLJ2pc7q/JDYypW0yzu4+iFQy4LNo4NhCDYWDa9GtPwV
stkg2baef0Q0YCgnttlLr7DRNR0fs66WhqufQVPv8ZLwCn3H4pmb3YtLwqH6MaAlt5uXlIVIi+gF
1q5Az0FIld2U1UCxRbXRhjeo+RltQmN3rjF4VCr5n4/upmmFCXoDD1+1hbA85ylGDJyzmPhuQi+F
qKuCJ4vOS/LzlHaO3Is3MPseuFCwMk+R9pBAnn5TZalgdDWs58KhTMhuLdqzLkdY6FxqzpLg7Sut
N1F9289UTvizJhEA8j/S8yDi0xZWTL8PuGoZ6U0pOi1lyP28cTbrQjSMNQW1FpiSG8EaIrUFblvu
8Ob2HOOvTv/YZLaPhidkayExIAQtI69hemT7hUTzE6o1G3YcKjbvFUW0Thvr9mzzx1eDKOqr/BiN
4tJ4PPe5QhPt2hIInYzF7pc2PNSdkZXLKXQEkixeccw5ZrTvPcGwEhIDbLnjoa/FAZPQK3By3CyP
JfMErEqhaUMSlrD2F3G/6Kbc0AuDp/Q5dcrZjPT9eejSjtGy736kOxyBtVEBGaKNLngYLOyfMZXZ
LviqcmAthzQvoI/9nXgZ0TXS8+j0GrQ85KDeukBKHAYab0utz9KssLLXcyt6rHlLLCsLbAXCR1qE
i3y+KipZDvXNZKE/XHq/hrKlXdIcVBQuFz9OVlXRnFZMPbTceQ7CYJDLDDizMdxJP9fObHqOMg2j
7hG/kDyWUp0iC4ITmrf7noIpbdBLWCrPNooZyIrS2p3pbol/X/dzRKzIsrpEzZrsF0FGPCTXM8X9
qxWYZbg5C9uolFFtZ/Cb7AtZoIdEa0raIqURlYKEYYsIg3tm82N59bKjaUN0K3rswIX8ty7PpDK9
ClofpJbyVvqlqhVkVn7jkrbVA9hXngo27n6j8eMmzPTchCXXzkPIXNjjMDULvLjp1clWEUxbKG0D
Kbgtab3HkngkJPqBEfm5u3DRc7Qf30YVtaHhA9CEsJNlDu4QiGfZ6xru23NRNoTKLq6UOFRiXWn0
0jqhkLUBK7j9aR6hstySB7hC+cLM9ZkVyA4g7j0+l0KT8MKLHzGrqGXPWN8DUPu9sfjK5mrWKU1N
cwtZRDi+WXrHXETVabIKguM9/FTNfr6MMENhJhEWwBWXPm+8oeOATFc59DwpkSN24m70BJPmwTSm
Bg35y/awr/sqbGgUKG9S2MVvufnHoJtEB+sOnmlYDJwOSEkr886j2NPnApKEoeNxyjJAcXt0oBbx
opyv09a/lliBsMEHlXWFn4d96F3O57bo/AFCBkuuy3oY9sjEBXUantSR8gUpTuDEW0IDdrDfYJtj
Ad10lJC9HOCApm//DhYzucSoZV0mxERat4JQwqpGBLZ7IzvSJG74hJ8jQMOZZ29JYJAyG+J7xRAC
8M2FLBoZG+fjvY+/55GAxPIMoOz5iD/athZWJceUjXnuzGP2OoBkt0hFJXFF11QAYSzhWnbhSTo8
jEq1KuCz5uaHGOVQyVQz2wEOeEVaGx/6mlh8aK86GM+kzyk9GiPC6lfYAhlGjmo2dADqQ1pT0dkE
GpFQFQj2RohMEpfOiMGTNSM9e+Rxz+HOdl/rU6CqP4HTeX9BHszaniDk9D6TOIYSPwrP1vOp+ox/
JDRB2LRmCXTV/LjS0FtB8FsguvJrFQoS8fi0Lx3TzcwRMFTnSIXSTZ1NSk4G8AkxiGcgTPMUreJi
Wssu1sJMQ5AD0b6WTh11GXXI5eXesMak2n5peo66NqFZQCP6F3rK07Ip01oP7FEIDsI0Jjoj4171
VGkkC6iQi/D9GvKhOnD8VF1OAHA6uoGW4rVb+M0Bo6paHPQziqU2joOqeVY1hrSiUgiakSkS16Ah
IlsuVvN+QM6/k4v0S1A4+wJe2IgB1KZK1+OctJr7BCUrIBT8UuyNsP+d386418a9PyrJyeA8pY8S
HKlJt60HZ2OT43dT3OlSChbCjpCQ3AVWhpi/esTeQ0SzNsw+OMs0wfScgb4k6UFgVdtDa+ctIGm9
orJ7WLqHG8wZ9s2FiWMyZ4PY7wRfR/Ccm/QrKG6M79Oi0OCu4OnB5OB6Lk39qgpgBBPBTong7xUi
EdvS8t9PvKnOE3RnZR85gUFGWU8xEDR2R5DxahBBm2eK8fcMKIucfcuO6XEXJHsGzXpgV9baQNI7
tjf7XqeyMSH5ddrlBKZXkDy8A8ll7l1sTlp3KwzmdPjnhuhVVxdh1Fn6VdqHBtCavKPC9WtCehak
5Fd9hEOBS9k7TEV7baf3pz6Jg9Yo6HLJJVHmkqPr/iWPrUuPFIsbCTG5Zt5n6ra0v20lSY0Uhcf0
tn1IL+Tr9KjtglL5eWTBamKvQguyv+fFz4CkcW3RAC7p+CiA4grZ6nJ8Tr4uRqvJp83+GaspCqCz
H/+8ZMsyqUcceAslzjsx393YiuQPDVQfQPrA4Ni1gLfULhcU/FAPeh/npa7lCD4NtWDI5/UCk8Hm
Z/d4vZz5Nr4v0eVXSnxRtNsjLzMANjprfOmFuZUZfjHLJYKQV8SWwZHQQD1Dv3SOgW4CyJ71ttum
w3Gqb3OAM+kyRFwJQWYFrttKEUxxnAoAOumUENIIr5wDl2NhDaLcGFtaYpWb+b3yHz80wW4O6YRF
pN+d0qg87YHS8dSxrnuh/1AmyHdpNGdWQOUnUo1xcD6KjNG4j/8pZqlNwuC1+epNcYte8hMNAvee
iT7HCoHwNRQGdcJqFWQzmobS3D8pCqqksF2FFXgKSPMBq/VAw+COOiTsX4Ewv5rdMvx2h3ZXaZ+H
SW4hT2toXBhYXgsTdR8Sfsu0Znyaj9ESmd2r8Bo2CQnyuZtSeXX878LmS2SatLAIbl/kGLhYdMR4
8Wf+An98S9KGRtZhFNTCobwQlDOpwg8bN7YAYns8Fip+tB8RkN53+MTVYz/poDq9YaXwqDPrpDWQ
NF6HYJJicnEVc3YRQTQHEAVgWyHtSWW1LN4cZE3cL3E+sXn+Pv/tlHEbPgd5BNc2So2pwzix9uwa
9wvChhdXd5IjlZTLcH7b0NBPM2H1KXMWlGNAmjnGZvjrkH73PLihfG3q3HNL3/cNMPmaznBCKyHz
JGs3fsIIkOXW9wAJ93UbtEcg0Phz9XNqfk/QIYmVd6BaOJHKn7nDdWfEqRAlkclcUzsGg87mBKwV
ItVbN7eIrmyXrhy+DeJa38gc5x/tdCRn53o8YKoovYOtjmIgOYY+47FQ4CmQ9cJ6U1vmdIVBtf9Z
rdkhagu6Ce6znqHu0T8/cH/XsXxDGm4fuereBf4pEIl0uk+WgXSEoF0m5wvH8pDgeV9Npkt+cNbk
B5xSfAA0z3CB4KNVFymfT+IAn/tDR0/P+jo6nbljs3AxynzB3yHG7VnarBBAZtnstTzcIDDPIe+8
djbzEMRTGS6RgUVoLA2byXq38pD7gJAs1pvwoMZOf3ZQRgDXUuJQO5UKWKfIKJA4OHf1HO+UVv/i
A7IjT2A+HP9HlA3su7kRTGVYbrdyfzc6SlOEJ5mfw4BFf/bhxnxxRPojVkTMw831cQWRruMjaIhO
QwNixIxcgWD59Hl8AP2wEVkJu5P7s1xfNTR8T/Zny9n8UZELuchsVZWcrZwf20g+O0ed5zd/63db
VLS6480vPeAs7aRoPFuTc6SRa4kAziA2UIM7TAnllZ3a+FDRvJT7JdC3IxmwEOD/nhvlSx0d5O87
PnITgV1c7aL4RcAz9jAI+X0eaKYcklCOs7dASwGwm4AaNPAfWfIWiiokRM0WAVA+BLL6TPTmLbuD
cQjXrLCxfOR40uqM6s8SlfzrPJSd4xMxUqanP6rV4rBImix6FjJMvAKxZlpUYJZrD43mBAH7CqLd
rUFIDl9UWisULsKPipcIrWJWEYtErX3+IIn2xdyFUjFxLcKRtbvJeQbDBH3ppgLRDSlJYnGWRs95
g7QRto37j4m6LX0tsA8P+83cEuUnufDdYcYvcJhTFjYGGuHqpzJGsXLJcsHtAySJBDOlpZBn1I2j
QLcKwoBg32SWLvD78/X/UfyHB5xW6PBc/QeuUYwnhllABs/qulfBxFiHRVMuSfkoSLmuO4ImauzP
qdN+ZKxqCH5wjeKXJl9BgGvCdCTX1yN/F6zmwwAYXz95D9SVuZNHqKEx3I/KWLSFiClyxg5WuuLX
Mh4YCSjAitOQFpC0bWNiPOJgFpzQ1wvEAHrC5MfdxGwBb7mW/YJBy03jsSahioUQuhfeXfIQERqc
gfLsSaSJSRC85GJoHsRmjcH5IdMk3q7lCulyPLJGCjNJPSFp2Y+Qj2PNF8HCI+DKvsICJkjaFdh6
3lReUnbsxfgxT37u73TEFybt5lZx+NgdPdDpkpnVbcTXpSGrsBzse8haOV6dZGGbhX7V9ilKOnym
tI3XX/2bLaL9KmVvGrYGxTdgorp3xboH1BZEKck3CkJBc4LGhWzxMDeSduVxlB1Bh+Zav/ZL6ell
HWhjqmSVPfo0xkNRn+JyGy45K4ZDAMxYFmiJDBsOsUQzfc739z63zEUmTRtY6HWYp+XZrNdP8cyC
vINsqARGS5HxU5eNmrbOXVCGLyUGdRAkw6NTtokFHWbWlYjBA+JLreUL7OWbVANXj/gdaPamMkuN
Z3HGVkza0+KfmsJVKYZKOPYRXpfWJXoSlch8lHuqxn+fGusbUNoViuU79qp5gfBs2CZv3aC4qCuK
PngLPYbkBeL4dhdIcMkyCugi2dZBZTgaLr0w4nrXLDvTPIoVgD6B8JxqaorLqH/3yzsy7ePIM8e2
stVT9CRdwwNLoDkUjo27+oFClXL5ACK1KVq8LEm7/7iWSDfag7f27I5C86fU0TMkkPSbYXKhEJQK
bSTlG82hy6PLov3mQQN9bHbo4sQchid41/HHriO2C9VB0hyq1KGC7TL2Chir06GXHdlt2Q4rwHyg
az6tyNqj2eRqKLMi9O42a9u/i95goeKI5SzlV+jFGLyIPD7b2tYJGchp7lENCsHBSdGlhhzq28ji
v5u8B/p91+K2+jSaLKi9/KcaKLsCWY8iYn8pRlOgyLZ96e4PURkbYHvLUPtG48mcZnwIGfeJ1Nsn
RzKR87mhbBSwtNXNfS3QX/FxSHrncK4frYZfdn7mPFvmdKuL6N3a7rC/waMbOKPIG6cYL2wkLuK8
9n0jc9Gh6u7Simc2nUWKK4XhVtQj6+c6dba1buXhjqJ/rI5ivE4OUa9kHKdUrdIINV6nAO3ueakE
5MO0x/MlRgkmeUYB/oeOWs0+PWy8i8N9sHU8LnYoTrcmEScJ/7x+TMlobDHyKtDTCz+VvhLS2/xk
9D7paRrM6XmPQiHbv+hy7tesHNPGllQEgHOjkEMYSe8m+CGT322K+IKhq8wJZIa4gZmu/5sLdw4p
OIvPb3iYUzbdKjDce7IOp9ZECJA/iikTMLrLL+Y6rvg8BPzqfDjYAAjB0eF+EBjsrLV3sqCOMxxM
itGpkMBYjI8znFM4iqQdcT79XgnL8Mu6PaPuVJyl2F4culrA+5l92cFHxlnNJHqtDa/0AvAIXhDR
/vD0nH6AbXBLr+XIMSQPLzDZNF2BuK7xGMg/3IBEUfzud9nvdzjnGkLVkx7jhv8KBuE/zuebJslp
V/Hp1QEO/6psGnO8DM27Yf/vAGQX9MSyDTlxMEQ6xyVKBkQH6Las9LEyCtoQY+dqu/rBE0D5SKS4
TBYOmtQh2+RYEuBB4lnipetVkWeWb3zHVf7hESMQfDreExxHEzDLxHmEUv9Iazj2busmBWD87vR3
0/Sd6LzAYENeiecf5FyOsJo+QDuuVDtYUPlqQ99LwGUVxv2agRLAB0Hf+y6EUMDm0lIMsJ2w6PWX
f+L0Llv8Gz9oPHWibE1E0hgOmdTtgQPN9Tk+s1p32Z55Hw0LjU0qqTa0ZWtOMcm7perwPmvZDdfk
f/XiWZ58DX6x29JY5EfiK/iNhEAfJ5IPZFPCMtVeA83kwDalcBpzjsI0XfIDBNuqCYM/EKpcGkWj
vOKL7RRgIm2ehvmKASpgVo1wv5ifdWTIR0fylPhUluGM9CJTtK1Bt5o9Anah9S28APFakm1znPGa
XMMcymcfEYkEnL0ZXOsaKZeIUl5lDrhfHiIc7OVS0UxNmpJb/LxxIMhne3X+X/oWTAEL/yVZCZCG
xKgi3hhwOopHu5I+Fr4eeEAST8JQ1VCOEZIpwf+F/sVi5pZivEjjZka5WfHkQgGf8bgRNyGI6UiI
qoL7rNcUQY7PLtx0qHE3mrcDH2qlnYvolXnYEySmjPteNOH5oG0kYjAiqCeXD+x9MWpdrnKL99+F
vsyRcM739AVkhOXPQFD1z7dSkOa5+y5KkW2Dd8ylKUho0sAR3r/dIfGlBJ8tXpsHCi42n1wdxfhp
ZG/d64Ul78aaXU25xsjXfBc70ISApW3pXiOM4mvnkZEbxNvp8kXABwTkTzkDSkwXzwss3pauyF2b
yV/L1r9dMu5BGazJnqq1FJM/XCmQStiHR4nSjJ6CBzKUZbvcRlx2gzvhxk3wHtDPBPpKpzoisQZA
g9PHQN9Nw/Wy+wdgOLmS1LZ/PdE4P2eE1T4TymrINOIrUOaCVMCcE5RPsdSrBOmqS+SxxHOUsXlg
m77FE7V1Rdzw6y9bHsV9WdUHpKckcqS398OPNfoZF+moTLb8MQ/VWQMwC1Z7nC/T70TldUv7NhtS
cHGeL6zOHZr0UpJNFSnX2PjbF/y7VZy7tns/q61IggfuBOxbTlbgfPGSl0F4yLVnzZdh+btDO25v
3fmieLuRISKyJ1/MyCdPJKeUaCVoKouflpLIfi6OHnu/iko6m0Y1AhrGw3kbATRjpoNaEyA/6aNc
1AWqceJL7smpMZ7IilcwELVh/+u6mTbGc3OrpiIgEd60izONLptEGJAWZ/IeMNnldg2oyBTMYgrq
SP/sp2U/zbGu9x+NMjzoly95718i/XnEFq5Kws3Is2Him2PgbVfkFhTSpZCO7PzoKqanfkKwKNni
cC5IpqrvxoIyYLHx79aWM6nFlmzbbr6WVQSB+QJlMdtiutdIOVBM2AFolYekUCrEqgLLxb5BdU2F
nBsz6mA8K9xMmPGq+jUkrYnhDrJxNJCtjo+JZ/hRkAhMFHoZgl+YlIJslYhWTUFHM+udzsOuuJ5u
5xfXg4gAku1Bm6+jU83/k+qWcZd9qq4ZZumfCQ/5l/hBhkOV55IbINwoIC8xAqC3gN9vZNszZMsh
bDsFH6HWc8/UgCbO+qCBpevZuQdEmr4q7YBUxBZut3W8kNSWYDDSMDxPw3M5RAMnsf2V+ApE3TEA
T3e0OuYh37pAvNagWbMhmUvb1PHcHWSezxYEr6tCvqBR/0Xf4bTyj504GERurqomPPJh16awXbo7
HrQdqQZNcxvMI0MhFT9OdFOC4e4JL7GWTgeNdtXiQj6bV9VQX6ZopNddZ4TMZidZAxkjVdzYIHBx
sLVrlEdDWQ3HwurQuM68vOJ/4MJKZX5uCjHerw/tnvD3T+4tCsUf3+hgpLa/FT7PQHUmDbjdZ6KV
rVFqbVLVsptKWjlsN5Rce6/ntUBoan5GriRPT7TzXGG0HBgZ0IMQJQtgaji129ZRYRNDS4LnU3+5
19u3tglFd0D57G+o2R7Vwo5bh+oXCKSDOPbNmjkouC1+Zt8+tPZ/BoJyECz2waccmmGhN7USn3Zu
OSyhapCzxiOplGNsyP9mAqdwLpdjVYSlfrWIsZ4iHg/wma5KhJsE1Lvnn5DFJ/+d9bExRojn+3BZ
G8UuNB4ztm1TuMDoXyrt6KrZ7lz6OFQncJUKDge6PJEpWm6dODpFI2NaSDtXMDwA0Z/nLfrJix9a
71Ml/M6RscgPZw3nG/bXbREbSKhKk2STu4a5zicDJrQhMfKZmGY9qWjc4TbNVSNbEKzH15nIwu8i
4CNRPA36OrQbzyXGmAEBKtQotB9Uhk0t8iPQLSKZfyhxHQn1iVe8iu5kBxOYGEeke2aar33eLA9i
o7a7jj5kRihFbOINCWR8d/mKIWUIZetFY3PyiDqvfX49xxUgzngcMg9vdJ8tFhaawz6qTMPwtA2D
GDzvttvA8CJbXjv+MxpKcnhftXS5JDS7Od6ZgGjcYTvicpF/0wBAIwBW4pNUf8HHpGHm5x6I04+g
6oFod9VjMFEz3pt4cfmVTq0QXoy/zSI4rPUSnzPhTPa0ZnSp9abEFAeN/ZLNgpnx8OYQeet3SjMB
FdI2gjsSNoz9xmqIJw+xhAQ28sytt5msvefm2YY4P8CStXyj3h0y89dlYuGhNmvExHwN3VVDhTnr
RDRVs285M+C4aZ+rIWv7giibh5mBtzZmqW2upbTygT4tfVCHMAjGT4QgQJlOZLU8ascfhCP7/xjI
Bht0gPZSA9X/S0DAz4lgE53u3r4iKLXIMBdHPKnjjbkBp2kVjfJQnSm/h4HUnEdPl6qM3E4lW5zN
MIoM3SzSn3WKYbfT+SBtFjC+qWQObR9zODzruwJGkUNca/JQ/CG6mA6qIcFXXycgo/SXL2X+azMv
5ARfKX4CurlxHpzTWlUrt1i3sl+yZAypGzM1T4xZ1QD1W2vfbdmPmCYVlqZ+O5Eg+QxDTZXOvmTT
rEk6H+dc7wRan9oKB2HOh63Ag6yGiDZwYLSuEe+1higfcpHabpQI7t7DmMOO/HhxtRF9pOCBfTXy
q1wVb85pyEQ13+dlvzwM9kUKVXFDQ9fYtXaOmTjyne0rQj6y7z9UU32Jd/w+c039+NmAcJY6tpOS
14jBl6sEhgRq8fpxP/Ym0Zr+Tc1fNWxeRIxUC0zjp5Tcw8FCGj1TssTiCGDuvu7mIlRw7sXNDoaw
D//KsbxpNPiO48ax1djybKhW9oxdZ/8ow0zLQUzoUv2va2r70hlrcZgaqFHpcv1H3zIAsWiWhMTs
GMazUm8itwTNMrX4wNeXsJuJCKjjrWKaz8lEMS02nST/bsj6zRSoJP1Y0qKu9ldD4/ZjppNLH2qX
AF2kZeIhPnWdIix5MeCFiOj0gRhaFT/MIXRnsN30A9N1EgkDTt65SqYmV1vCC+jdQKUT7FpaPLWu
X5YOrhGViIThgEbg//yEsauV+Lf3wVA90huYyVnslR5ViqBa1WI/nwm8VMY/0FnPiyKyfa4sGoxA
I/zncK3clA7JM+Pqa0XvxzHB2/NIM3Y8b956j3Fp0WS21ziocNifgPYp5FbvnMoY+mu8v+lfnTxu
ed/yaZ8FG8xT4g9GT6dwkpUZaORNRoJ5cOnHFLUwt9N3ivyolqL08mgO6OXhqb6wTfjbrwpNNKIk
GAEyJpTbNQh7oES4naofxRVA7YYkVV3ZUcvQXD0C2nt2c26maf/qPttDKRloUSXosdn1+j4NkL1l
B7wZ0tY8ad7iVHZw4Eoflssra4z1RGI4zn9xg9jN+ESzsXePu0h7odWJLS/qB+d+ukVDi40yUNR9
0L57nWxFyuQBGDO/gcuOv4tp1n679aDmvFANvxUK0/nrapYWE7b4klEYKV01ke575JxSTAIq5+ks
ziXN3bh4B5t+4ZdnZ8fIqssMJpkfW4i8LYE2/XJ80MRJz3c6UFSJontwZOLF/zZZE5kYwUVcrEiH
K42pHARE7F+ETFCmoxPpfo1JjmlpVw57W5icnNHHpmWLp3KzzZD2ZfNKUhkCAIVTFhj/CnGB+isB
2S/mRL/5xEwfLnT6ILmxKWAefuFeYJ1NcIcfCS6tDZn5jw2Ccj+X+vSJ8X6tYLY5bjKpFNR7nbBF
mwCebJgi9NED1Y/xKya1MtlADgO6c4q9qzpHywyqUoySaHzNkgCx3sI+L8IP53JV/fkTa2NLDj6C
Csy0fRpCjKWAYBW4xI7wy1ss5W7TWrwvaz1R2SVQcx5VVqphNK2tJycCwr+yyJmTKtT/p/rwev8+
qo6mKClGCfZv2qgdto5Pi4MRLdp7C4559qhDqxhnZPlGC0ukxTMBItN23DXRR5qvEfocGvSSlQ+A
77/AR7CT+Ur3f5SbW6w4+gE0pz4ivm0jnQk5DxtK6rPAHlozU5Nm1ni/UCXLm8f7qoE3rGrJ48eS
zbiTqE5h/J1DdNMxC4xK7BAsexuAwpZkZpGTlR/IjH7OnPpC5geJOYyK/rcGYb0dYTfCLCnXAoGF
0JpQNMQLf25UmVu5PjFyVEFOKobE22tFCQgpDQP6FrpyCXbj7W9um8Up9V84uIDKb6OzjwST34eB
+7LvN5WBI1yKl2ozZavMNT7UBsTNBzQ/UIuA3SX7RVOTUsJLbVj2Mu6xFpKE1iEfI5Hfhky6V6L1
zS6rXF4dRoCPGzR8b9RiqGgexk5d+FakC5Ikmyo5WayMIH7+T+XSSAt5Q9Gctrg6DbYI+FcYnx85
LqzT5MOgEMfXwHIvAQP9pVCUra4Lecq9T1b0Cwz/MEKECwX7jFyXNUexicWFhRLE8w3K9IdYEWLU
zmPcHDBS7FvkJnuAd+K24GsLrIW5lUAIaCh98u3Akg8ZqpIGagfBfc1N95cEBSFJ0YVomEto8eua
jSvwJpMFiuHq+u41rfNTpQdOH0Hhn+aAYjfrtQUxC8SPb2UjVaMuLrqrmvfXVb1PBz2LI5EQjHlp
V8Et272Sot3SEBZlbqSqxCKxGxAzXIUodJAuXLrpVAmQ7xZKVa1qwwWKaNdo0FoKIMUFSnJdo4F/
DjWGmb8poXmMxacgqvXaYLpEYRyl0Zjlc1XjHMcxulqTXGI4wR+W6Feben7oEiCvVNVhXS95GIDt
qbaOfXDHQ7QUBBwKW8HOgC0T3+lHdzEYw0612XpX4HZHlY4ONpicAHQOWz4Ba2CLHfDZn+2c4gjT
HDE/3hLrVb/ghIZb0x23apT9hy0AjB304yQKBofEO8VSMW4x7IUZmiwJGxKP2xB0yIBFWY8TFGzy
PV8wxTyJ4cqxBMkxfDWD0rVMSGKC8O+QveTb/QCYO6Szxn1WHpN+fVNd7jxBXIz1R8RXs4pk03Az
Sy2dJZOQ7CWZ0qtPCSogLZfpNhA/+RqrMwRnUAnzf3U3/0UvNF5GJZEQ7DPPSb43Qa0LbtivoQMX
kS6uOR2GeQVlrcWefYZ7J4TNB95g/NKZrSezEG0j985a93N/OQdba9dASb99/XalZMvFsSvcsk/M
ykfl8pZ6kq0G7c2fw02FYmNP/GCOmFdE/3s/5ytg/SPPEA78L6daW8mKaAw7+9vOwQvuB7JUWpX3
qt1LW465+zjHioNbVLCy0FsTz8XVxpJiXbY2WkjgBjeCKbTrUmBeyeMj+766ahdXQHeRwy3U08ll
jV6DH+QnazMiakYWce9R0pUJBV5Z/cA5KZ8Rs4TE0cURzts3ECBe1OdWVqo69+WOiUFUYG13z6nh
+j9uSVkXEKSHd/NVZxhUjBkUJwdKdTlBX/1Qp0S8oHWlxWBz7TiKO47fzq8ExEGczuQBzEondgim
5/QO1NVCgXmP2k7wKJpqliMJ9k95Xx92/o4EbnSBckCVwYH3jLrVQ5gJz6XzGYwl7dbrCrpfOeut
FHEhSieHQfgXUQ7vJASuXP+3GiF8pojuLM1unZG7+rmXu8E+B1xSGc3mKLYXJG85bAh79IoutlFD
8+89voSbVqOlt6y6hvumTBOAAdr7WLcxIxFBeKVo6DF6fHJBa5HJ3C1N8knp6i6EfiENBGHO8WjG
goRSKOECam1/mWa+8EzYlETvkF4XY+jbkzqy+7FQREJD2eLydaGDsOOV97gQt8XSxW1RzsfLz4Bm
NcF9afQGD3WVMr2d1uY14xhTZhZaI4xpknb3/Gn3UgPESKdnMzy6+ydIUM4G2W/s5wGjgCdwgbm6
htWeE2/ByfEQR3XoacHF/TMgM3oxNMtSIGKGsVAXDDDL1trHS0hIuRpLhrlweVxCfI3pwWDxCEXd
KRJuj/qOUv83vZLqA6iL1wtJyNJewf8CdELk1XxwBp6Vm/xxqdGq21lV845zCjVKrkP0e5e9MmBs
bVVq+pW3Cm6ieY+uTP3Yr0M77FAXQh1KJ/Ni63H6T1EBUSp+R3+F3g/7iE0/duVLGLzEu6p5ynUO
3sjECd9HRHm01K4sROmhoEczeYwM4ESZNff0ZPW9mPR8znP95VfVifljlg2qD544GlGBEwwQQVer
pGTf1yx0bQSzYLwtpwmBs2nVlLqNXazZ1TU3iikzKUNNenONT1KfleQo8rDzNy+xcQhsAUTR+zTV
+nOHtM4S47j3uKGad/+tIwgfn34RtdzWIdxoDd66ZtnuDNFNbameEoQexmlwTuxYKgMd+UB5f9Wb
T61hMGcs6G9PQvcP96+9AJ4RpX/X2dlt1qbJ3qm0rOzblqBQqGj2HjB7fWgqF5pSME4TJMmf9eZ7
rFCOjeN3hkY1BsoahNOntXF2X40+0PqhBk0Q+bJj0cywKboGw7vRYH5hu7GN+0ti7bdwhPN2jDU4
C9zZBocHg12S2SYcCb3Y2Uf3uBsqb2C4zO7VAvqXFzG0AU0LGESenQbbLpJpfTDYzqaGesElzLDR
VgB/1wxrcOdMTDtWpuH4GIh1pejsHT7XuSzz6vInCIOl+Z1CC+W+hcrQG6xapL/iXdHfYHyCAqzg
RbDwec7a8BalOPdMRfB8Mz7i4CmvAYna70+9LwubMqAeVDgWsAF0niY4ql2oCexFo/hwt3mYk7km
JCMWZlvStsS/ZzbIdEWJiVP2U67neMpC4nlOj/rl80JXZm/wkYtCsSA5lT4huLfuFfF5fR4JBmfP
PIff57AnI7sEmu7yvn5CJN5KphD+BYYMvx1sAEX2NLd3Sp8zUB5XgruqdIb2H2zQ9BjhJeIFfPHb
HQ4HRjohonq2B40SDoUXWHIKmP2Axvzz9db+GffrGR7ke0gY0jhBUuBsjNc/enCH9EPKIPOewHbv
DDwiDll9Ni0u1WzIF/b7UyNPR4OLm/Q6P2K//dXtQJYjCba8LMnkmzH42uxP+sAYql667JIUBrPS
wDCQh6/tdrxxCgp74m9VZpZvGVM/lnKEO1Ih9i1yeRne/u+t6BTgC/nEjiCB8Vuhhp9A8Q3VSjRO
7tyQiaXOG8Bm0F4DGStuQHNMgRKwMpDt11Ly92K4cbtkgNXcpyqfCkgUJ/eY4aHPWqg72HNaSicN
rNCOkHxgVO8ueEDfer7e/nfFugzzyc7lIugC4DpWK9gcf3KM0OhCH7QB8FC49awE2CDnhbmvPdal
ywsLuFlUfQ7BifDbuPTNbmMbW9vmSxs2hBW5aTPw4LsG6fM1SnuNfRIwxpMTv5ueH7b8SGDmoAXF
JGr7xF3W7iF3JM6ShO6bcBv+DecXSeHpVk7MGMjTPf2ZteTZec8bZvgLLx6zv3gOGR3ZhZWXJTtq
Rz80VhuE4K/ERn6w+b2v+Nu10ISrw5zVzKEMe6OfAXBTdqVxvulwxazkYPZFLJ5qt66BG+OLPGoA
eCYTtTguZpmhyrUMpUbk8XZpeHV24HkJk2h2vV2xRZYdVOyKsGCTDlSK/RmxfNGn1vBIlbTwKW72
Wj+NIDXoFR27QF21URF1b8slaPh4gPJyQTRZdJgqhwexCVkrr5AdAbHZKexDsDswLhe4KhFOSXDv
U6w7KS24TDEzgPdq35yUpl5MmacFhyDHvfAQ2INoHgxnE4ssAdQvtV+Ff/QctTd3gAPA9abas1Yi
ueF/RJ+70uCXfQlvVY5iUohd7TEtwaWIlpDgzk4pSKlXkUU6nR6jn2oXuW/IId5GZ4LZ26cbgTMp
bL+PutCtxAc4f+Opgzrpo0c3YSt0aNoF7vfV1kX1CVe3eJAQ5NnmijmJLR6oI93etAzuXk5pXX+j
ADcbf1Ec2SAaBY0gr9qYazCMMyJ/uovnEq18FOvQencx3U+E77cXYInX4aEIYBJB1V0uipqJ+Gwj
54ldUNfjzfO4mgx0KYitqvXGFIXtEsC+dUjZLn/rYpMH4wverlcfgJ3oJ5Lh4Ruj5sN8aUq6dO5s
V5+BZYkMxMTVnIDgLuAHTR+nH3dnY6DEIj3EyfOlqbLEp3YP5r4rW1QXLRmPmzDj+Lo6YZGPMlos
rtqAKSs5Fm8YAWHUKzJiehrWmgyyssgVoNzaS5K6bkhlZ8Y4QMx/Lwfbx2yn717CEmjPYxKjgJx/
Q5axrnOyzsnY6TmNOGzV+5J8r67gpdDqJXDpK/w8G2YRlsZGYSP7bE5jGsBJqLE6Aj/KpMD3kckT
WHwzLUi1ryqlUgDeSC5eKoOIU1yYY2dQaY9qZBgsHKAxpTsaSSLilwc1dyxiy5Tj4gl74MV3OKy9
t6RhtO1hUAUKK4gQfZI/uWb9/xL3nRKiwGb3p04wH4cIws0AbwUOcMZUq1MvQZ5kn6jr+j7kqSnv
RqaiQ54gQSvhDzD6VDmwFYwvAMx2t2zqTJB2AX/JCPFd4CzpoXcClv+mp6jh1kQF7UaA+MJgdeG5
e7IoFbGFX7155+QnZae3Niz+1Sy8pj6h0o/JPhO4Iijmndq39pFMiTFduf+Dw13HeDKcEAkihpEC
JBrOzx4oGXXrUhAbP/y9QZp146wHDRy49FBujl3DQrIxosaOxoYZ2TtWdPCGVxTcLosRWeqzcdOD
1evqlH+Ni04UpJefto+c2WKrnWrU/pizAR89cTWgRYRWHB9PJXvI8IpeqyCvBx/ByQ5BENnecXoE
ZjQE4QHCGdFULxwj4rvfk5TX1ndR4DpzNo2zZyIfPr4GaTNS36td9CjJa6s19M9hO7oD5lQT9oEI
nnpNUx6I2EVbWDJ3w7KVLTZbzt5EMFkb6YGnZbDAPycWkkzS++WG3rbVx7bEo6o1gCGsf93EkiYr
c0puneWxPY9SrUpa9ig/EtBu3MaFSFe4Wi7ZOIuVx9DIikYRQbbllmqySY07YonEzu0HkErYzYWE
DGnfr9ghUh+NiDHl67b7ZXZlFFgIQmS6cF2E+3GAYWi2uCPOgB+oVrhIyN5VC08JkqXdsg/3FW4k
bML3lZWijWp0LgdjI1d64V3vdP++09wG3BRsLZ5G+kEH5PI8s+9n4NHNzC2g30JcngvuMa9U4hwG
9KRf+YCynAbNSUwDJg5qsEdp6GHSWCfYkVnIGcvWqVrBclEShWQXe0q07EypvsVDhskdpn/K0uYW
8mm30J3i4Ut2u7ud4uS9kaoYKide2Z6yo7gJNNuvHO5JrmNnF+jJ+3ztKy1VKweDnNY81jkQJP0M
cqiuBvZJjTiTcIX0aqT204JKlmfUo6CaeznLfpi18uIte8l/gGOEOqr0LsButcTPrr7pHVW1aEVI
OEwQCX0C9YuaciyoqT6LBRuJqY0FuF8IuOD2gMaXrP9EBPQ7pbcLBAbv9+gA7K4Kdn+GMd5m3k0k
qkl+nUn0MGEZisQXEVozRwTmZSCqceDRObV2zc8Emzg5sHWCx9i/dDQmg+9hpVhPj1Zm/loF8Iyq
IqMgxhf/OJorxM2I+14or8U+UT4ZWndVLRUQagwJ+YClOBg64alPPxPutDPC6qGydHg6zTJt/+Vo
/8TV6ifBIgKBJ5O/ZlrlsgtVdM8zvAEmAELucRGoPG1TDM7NW1/KWH5u5F6Ap6czjFEPpE6hEyVD
YS2Ib0e5DsTjB5UlsbE9m0v0SMK06HnawiEqVSyG9b0mGiR8cLtHj2JhqLNBeCaGCEBBjtvHMTSs
jmBaLgztqm9kuzTIpF3R3+X/g2a/rnjQABeoYghL0hjlmh9ZUGran5UEEHLsLLoelLaY1rLzmDA+
vnHU8YMy6WBTHRRXju0ZFYIbvznlc0PCwA2lYsuMxnEkCxDbx29ueEOGLNnE9kVHvc19GyRMsMkX
HlpA5jdVWzHwaxs92lLvWG9aqA/NvSfAFFKC8Zi4nROH8TUG1UnxysKJln92lxToJGza85Khg9aG
LEPTvo4PxEtdi3Gc/vFgJ9QwKAqjPVtpchLeGk/mY/ISPrin1NE0bcykOEzLyU+FDpYzSqgxWvMc
RehSgbjqxkkOXNGa0Y78pj/PabeyBL9R9x2679p1P3dXkEgCJ/GANrFulAgoMoRjHbGvVDo1+GHF
qlPwNhmfx62XYbb0vFo+pKRAwIjRBDrZKZqW7po+bUp2V+xcGDtP7Yg0y0DMa6nPIJFIBu/UqBV0
PFrzOEleJ7Tn781jVr59BFsSXUsD/7XyL9g8lJ2JN/rChB2mXy37WRlGi4ztA+MFgsV2KGB8oP4m
RpGVtwzjtKxC43WzmFoubFcLXJ9zNy3nczRsjgJSeJQrgQmSSVE554j7nQxaeHxDyHv/0bQwE99+
o/wKB1AXhRcjVwV5i+Waq1X/gK4ohXdGsH7gN9uM1BHUE01GR/3ngAeoWwi48wvQ+bf3ajgdIiJI
LxTYCTy95c3ffcwj6JI9bs/HXYAQIaxWVQDlw11nZg+Xep0fj3/x6XwUnn/plwc6Xd+hy4j+IGqi
+fRrAop3tNOatfY//RyytJYPwQs2hhRZNLHnwQuWagRTTPh3lZAzOM23fHYQ+hIIEohvxpJWerlU
WHCuozLPbJm/n5lnOt8LfxuNwEk8LnMn6MMxnxxkZGk8j+vnmJxlhqbHzhxhNpavp1RVxqOgdaml
np2aTH5B5rjIBK4/zh4I/XsFinrJ/3XtpmTKDxhGlsFGJPn5+yqpk9nh+rDnMSCSQvk3LuSfj/hM
vpHhEjxtQDax3oDiC1XZCJWF+o+EIOWBM5j6U6iK8yZ0es7hWSrFPzIcyU6lCNq0JMTMgLr2YFc9
NvBvYA1YKYKvCa4ol8DCg9lzeypRwIQIJ8mB/voGbSz/rmWST8ML9R5XLg5BQZDtoizwl82Kwfml
xJdlTg3Cbn/ZSA0fGZtgKpKa7FJ3CO+sG9VPLSLNEXZAeLQ7z8xuHiyus45pbRXVFKJaR6R/PseL
yN0ytpB4ebkBMo0IW++ftjqexxn9rU826xFNTVckVyeoUKeSt339yQXp2hdu0fMVazCZLsRBlQFr
FHz4tjb3Z8j1yxlqjf4ZnSe2Y96cyxdDT1uN+kuIlE/IgopiKyEUnp6Y9RPgpqZDMZTm909YP3kN
WRGuFKzirFEuKEbN6X7f9hQQeqqFNb79N+cWGfQta8F1TFbqck3u1KbQwTYHahR3vwEY9h2TR6ns
zQE/r5EU7UwAQ/zD2wsUP1o/SMweeoHH0VNDXf+bXbXeEHp1g9RV1W0og+atJsyfmDshTLd7DbfO
0AkOaJzSgCINLaMTxjeHMj6x3z0CfAvIkN7Nzspkwh1iHOZSQb8pd73Ql5T0no5f1zjuUg3BO3o6
3NgxNXsjmpxYF+gor0Rq8Ul6FydmPzu/awpKWah3hg59473HsGuryFc8G6mo3SeGffFIuUwYUVRF
XtdQDXBAWNVah4iwU3vCAnsuSdTNWTGFVqtF23YCY4sJcsc8vUE/P9ovLkbHid1GRP03JZA+YRkT
G4YjTLSttFEaWVCS9Im3FmNxXfvReRFep6TGOQHNqjjIWSqw3bypkoOTglG5lIO5XvQIc1CqRK/b
SNFuVP12mx/9/mGa8uqkYT89m5RNk/5kk4AIjUdlBLNOc0g5DbLo5nk6xjKEaDJNdOOkZkiQAqt6
9BTDGfwzEFaT3L7MSCiVzxiECPruuNUcuRb3IQNOypgJIjLQ+c66KzjB5HT4oT3P51kYGYRO0MbM
MSR5aoedYTeFLUHT8dzznGXeO/e/d/seVQFJQopyvpOFTNvosSE+oDDZc7EUW7ASwPCZ8rYxu3sm
4vOA1Y+tB9Tqk8ZN8HxskB7hgMBziYJcc14otDaEFTF3ATyKt3+Vi0a26oip7XFwl4X4EnbqEZYI
5NwSi6IEIn6t5Fjj684p986EJGBCc1Ea2vvD5bdDos5GW8PzDdNNbT3pRxcj2+3hhAlRjUZIgXJF
6tJNvfdoKUQUZf8sKsjcfW89fXrD6wKzwo3EgIO74HH5TmydmD6KGK/rOkkLxdcpzq9b4WTcUTcl
JiolSq1UQzPEFGkdLNINKra37I/pSIYWLT7DXZGF7SqSIJ8vZ5L02tILkSOPaZ9D6gDsdFVkZT+l
TYHFOZpu7H1UR3NGY23KqMNBr+Sm7MoWjsl8Qc9zomUxK5P/RyQVaaePY66LUYOQ7LpZKUTrI5n0
rYnV6PUzcVAp0E5gH280gYhihMJPllGMkoieF4jHf6zT+Mv7AH0t7FUYEpUKoqCGL4FaOl9M297C
huT+JjSvx4X2KZZ7Z3Yj26bcsUAuFr2iRALL/mrI5+DiQW5MM0rIIqHlV6pHiverpIa7EaSIgvnD
phDzh6JNlRjvpWgxox0p0km0IZ8zyrjayfbXuSa7m5flkD1/1UtCnSNu8zjCFWYJrPUr6y1jfbn7
2A1K6WUyKfrN1B1fexkyGV+Zf3ckAM9bSqDK+SlP/fCHEzXRzmmA6xZocn5VZT+4aVnNn1zXqpBx
qSOeYVoweBnpAfIuyHCZOLLUg839aMP/q/+fqCFnk/amCzJDyrByFEWy6vV+Hcff1zF4GHCQgqBo
hL5OO8E7EfAPhzB8tsQ0vIf1WJKTSagBhis3My4zMVSRsXS+56akhtvN1e8d1Q3SIdgSaG5ERFSi
yx7JJh3NrfWQJWg81vKqn8xc2+b9Op6RgkriX1jLP2wWk8EYodiK5u3Nj59ErGhaAOV09h+pgBx4
YUekHQHZ7iUjAgr/g/l4YNva99hHcRhwWgeIhKjlb/dbeZBhUxO3KBENveEBlzT2jVCE2P8cmhdP
fMHc2qLOYYyiUMWQpvSc6+MpAchVJqJSYJc1oDpGB4Ad6odl57Ry0vlz4UjL0MVmrV7V4nB3ZmIx
vWuJLyXiu33xyaUbhg5t9FlSOHaGHviDlFOTp1jNz5heXmSiyy7VBHVhlC/4dMPcz20/mzgSiud8
3tErS+0Od/2SDMGFmjT0j8rVxBRM6VXOsspLF04ptI8TFczrUNHic+rseor8WX02s6iHG++M9Qxw
mN7nM6mG3ErcntuJ98SiIrbCKNj9FA3pvsvyIU4RtBtq+VBQuHp1yidupXbDYwcVt6Dgr9NefM43
4kjrbujpgeRtLYUe9mVqhLUn54kqlujGgQL2FnbJblV3ocrrW0biJlWtqEQW9XmHiuenMm1mXcB6
byQW9MP11iCcC0UZ8xG4M6xdT+fdMdHWKHJItR/OeHaqmAHEm6rj3VmkjbEs13KqX6VgXfCcVMyY
rSzOqtyvpOYKNc0Rjf5DBdZERSiT5/FOg7NdCZG3/Rx+nkHmmzQ7bWTWCDH8OpJFE0rTB5lTZG7q
31WUloXopFql5Ib7BUVUfz6shy/rNM0gKCZdT3Sla70d+MkvfCA87b9FBuul3Em5r2zlt6nXpOK1
9XjkkAN2ZrW4U3jsdPF+TyGbAol87w4AdUrThoX1xF018Q60zfoq7WYbK4Le1gDWy+KwWlszKIb0
dDxcc8Pti0rwV1rpwcADlKK80lBozO/AENKwDAyfFScK9Ayd+16Uvcwvju9WG0JaSvxkhfeW1R3O
uGIkNFu6pzsUiLN1mxDSsjZRSHWxTuwJ/hERnK5cHVJsOMcu6y7Hp/NNWWW2a4qUZrcQz2v8lRzq
qXkWETs9SrjPzZzOC27N9XzE5n6QKizSdmYrrCk02xRj/QZfUkLHUornIXIwTvAwp0f/zt22swCi
BlExiH+5Yczp4aaUGCS4CvhU8Mq2/GA1/TLET3M0zARarcvrLQsMV93sOjIMOs5mefyylsjQUKLl
DXns3Cg+AKyobE2ZkzQr774crYTtOBT2oxrPaXWgSoaongxVCjMkC8H5zYy/ikaKahBTOkzVAz4k
ZVD2rLTvgSTuXVIvE594BCNpe+dp9ATUhmSrH02LtrPmnUnMW+9pUaQj0DHUyEljMJdGs9qn24SE
fhJtFr43dYBz1L1+Rn0imDfzc+k4HXctzlDW2yA3v+jOagQrgEXxYhJEhs1mjwiQX5Iso+t34/TI
6aGKmo3GTvaawq/sidZRynqQao3y/Wu9HFyj8JFTp/ZbQIk1UbgU8q0viUzNXEU1As694rb9oIbl
uNVfmEt9w41FO+SUHmR2mAtDLA4EGfAx2KEn2VKHT2eJ8OWJAdXiWdR6w0r1K0O3cvSolMshF1WS
IaALTd5wcimssqJRAnGB6Uo5tdje6Zxx2kvkUiDsZawWKn5nLXrWNXr37BzmSxVXCC55uBM365Bh
dCcasl+owRGbE9Ja+SSM7DgnnqctLrgIoajXIfUoDpgP7LZ8x7PpRtwvyuQQg21BkNw3W9Yrl7T8
kTGAJY1epUc/AhG1CvV6BrZfTpn9MmMvPVnfGPfBmvUSExGkT+gDdB4h1s9+pHop975NMoxUZ3bB
/vx1pEjVPkUNUd9k2z7hKGsQ40tF4YZV5Dr1blGnxe1UsaA6RBFlxbnFUYMbsw20UFgeBnObPkQO
/xXaOVimAlORDxOEmKO5o2WMRO3dkwRvNZgTtbm+qmqNxhEDpNnbNlf0+Ni7gI1hFnSS+at+9VdP
dRUk7fXd8pmcKblPOmZ+Q2BIBuRQctr5ZeqRSKQK4qWWZBMlAi7r9AdjhU+9XzMbmzajWuF5hScS
tbso82pVLT1Ttoca01gBkJyQXXBgzd3zDzSc0h4j4un8Ujon19w50z3n2EqM1ZIv+4nON/pZvZY0
AAyF0PO85DyZZkQVcxTmlwOwmUEPqS6NBEUuqod9cynJ9RDo8JrOyjrfYFjg8t0z/SoE/m2WfJs7
P+Dyyykwnok1QZVxKMGys4IQNtaHo8reFizw9n++jqfRF5yZlL+8FNBKeZ+s1G9ZRttLIRLkT9KE
xBrkQ9Ht7rf8LO6trCM/1vKg0A820DMgpjfsrbS/fiM1k8GynCl9u2ndTFDiP4HokLd0+rph7GdF
1dqvv6BkSWYtCa8fTAzP5nMrGMxOdPIi0LWBda+dcFLOCFaSUrEzhwa6dRMgQPK8M6Q4+XAPTNRo
FU3ydzDbwi8xxnXWL2DtcctXIh2hiLwUgWdPJkfwRNHi1gELUY06VU1IdDhY8ppY5h7SSvN9jeGm
bekdWVLMMb3/mxVHvX9UJDK5pkSLnXYlmvm1/vjqVciJBDtu0zxh71fbiDQ0ndhw7klk/2vE7gws
17gWWBZY9GfKiU5/9Vfiqgqt4JwgBzPpieZFWz2gB6jM92OUVp3UxtfGhviGDprtriUDGnk+KztS
N9okU8UpOGdZ739SXUvEmbXyVL2Vj9E750Fvi3LGJlBih1w3XUcec6thsXeMeHRN+xlHYF96WlNY
fgkjgF+G7AUXLjpyGPHZSWTG5FrSWfJwnbII2Y1+waWUF8jim7OoHEHXs0q+ofThYeTgvkU6lFiJ
ABtzvzg9Ve7gG+0uHLLuBbw2AGMbWcsRIGS17wsXbGxNVtF6qRtrp4jOCfGDg+SslqcdQ+h//UZS
TQqHlbFnfvU4skX9iJiYG0sNjgJxoH/5JFtfGRaQxENB5Y61CqUBYuwaEUW9P0bKc3IkLapDvPTS
GMLbhKG9MnRfJ4rmxgGDXq30I3VH5B6W6ottt/TT/D9OrPtxj3I3MTPXTbwZbMjuE3wtqO1VJD5N
b4aRVkizn39Vr8bRQnMmVhOPHlcf8icnTZD3GYpBmaAOYFrvhU2WT49FZ2F9SSHJZv/A/jb5IF/u
Fktxa2f4EuRxS3h5YJ25GKUUtYdc078Jd7ae6zxBgFHdN76IaVwErMe0gfSRRG7y1Rb9Z+OC8/FE
2XRKoSW+I2Xny79yLdPlJhuhOObacCAZ0uWuB2JWrUPcEdPRdVuO+k3yrEJX+K4XZmSYg38QwNs1
nL/Am0GKCRWgN7HzHTbQ9wq78sZIePUNUo20HRaOJmXJe23zEmo3uk76aqhYLjs46LrEwh0b/677
3EG+5Jyj+GxQpi+Mz12oJKHsPipWPZfLc8uq4SalSjgckacFmIKcCtCrRt2jm05OcropP2+KUOcP
5zZy4dM6LdBZnkxGi6xI/VgySqE9W8tgZT2GaJQDw3yLmQ9LNckMza38giLuhOWj+w4jQHI7JiyR
qyF35CjkdaGsuDUmUEvzyNdM1zTS9P3cuhoqADe5Qxr3nswXbds4uRwvc9mKZ2DySx4K+/tqjs+U
lbhTSq3idypYBKaroMmyu20CFptpEdrPja+ohZdowbrEyFZ10CUL2sOXMZHYeck8JIWbuuxXVxGr
Xdp+Utttdc3D+QtzfDDEPn3RUhRICs2dcJLJP5ZgATlb4pgDsto0hvy5f8iE3eJ5zQ8TLoIruc50
QusrRvA=
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
