// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Sat Mar 25 22:12:04 2023
// Host        : LAPTOP-L5E1O48L running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {D:/University/7/Electronica Digital
//               I/Laboratorio/Practica2/vivadoProject/practica2-2/practica2-2.sim/sim_1/impl/timing/xsim/test_time_impl.v}
// Design      : completeAssembly
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "482e9fc6" *) 
(* NotValidForBitStream *)
module completeAssembly
   (A,
    B,
    XYZ,
    Cout,
    displayOut,
    activeDisplay);
  input [3:0]A;
  input [3:0]B;
  input [2:0]XYZ;
  output Cout;
  output [6:0]displayOut;
  output [3:0]activeDisplay;

  wire [3:0]A;
  wire [3:0]A_IBUF;
  wire [3:0]B;
  wire [3:0]B_IBUF;
  wire Cout;
  wire Cout_OBUF;
  wire Cout_OBUF_inst_i_10_n_0;
  wire Cout_OBUF_inst_i_2_n_0;
  wire Cout_OBUF_inst_i_3_n_0;
  wire Cout_OBUF_inst_i_4_n_0;
  wire Cout_OBUF_inst_i_5_n_0;
  wire Cout_OBUF_inst_i_7_n_0;
  wire Cout_OBUF_inst_i_8_n_0;
  wire Cout_OBUF_inst_i_9_n_0;
  wire [2:0]XYZ;
  wire [2:0]XYZ_IBUF;
  wire [3:0]activeDisplay;
  wire [4:1]data1;
  wire [6:0]displayOut;
  wire [6:0]displayOut_OBUF;
  wire \displayOut_OBUF[6]_inst_i_11_n_0 ;
  wire \displayOut_OBUF[6]_inst_i_12_n_0 ;
  wire \displayOut_OBUF[6]_inst_i_13_n_0 ;
  wire \displayOut_OBUF[6]_inst_i_14_n_0 ;
  wire \displayOut_OBUF[6]_inst_i_16_n_0 ;
  wire \displayOut_OBUF[6]_inst_i_17_n_0 ;
  wire \displayOut_OBUF[6]_inst_i_18_n_0 ;
  wire \displayOut_OBUF[6]_inst_i_19_n_0 ;
  wire \displayOut_OBUF[6]_inst_i_2_n_0 ;
  wire \displayOut_OBUF[6]_inst_i_3_n_0 ;
  wire \displayOut_OBUF[6]_inst_i_4_n_0 ;
  wire \displayOut_OBUF[6]_inst_i_5_n_0 ;
  wire \displayOut_OBUF[6]_inst_i_6_n_0 ;
  wire \displayOut_OBUF[6]_inst_i_7_n_0 ;
  wire \displayOut_OBUF[6]_inst_i_8_n_0 ;

initial begin
 $sdf_annotate("test_time_impl.sdf",,,,"tool_control");
end
  IBUF \A_IBUF[0]_inst 
       (.I(A[0]),
        .O(A_IBUF[0]));
  IBUF \A_IBUF[1]_inst 
       (.I(A[1]),
        .O(A_IBUF[1]));
  IBUF \A_IBUF[2]_inst 
       (.I(A[2]),
        .O(A_IBUF[2]));
  IBUF \A_IBUF[3]_inst 
       (.I(A[3]),
        .O(A_IBUF[3]));
  IBUF \B_IBUF[0]_inst 
       (.I(B[0]),
        .O(B_IBUF[0]));
  IBUF \B_IBUF[1]_inst 
       (.I(B[1]),
        .O(B_IBUF[1]));
  IBUF \B_IBUF[2]_inst 
       (.I(B[2]),
        .O(B_IBUF[2]));
  IBUF \B_IBUF[3]_inst 
       (.I(B[3]),
        .O(B_IBUF[3]));
  OBUF Cout_OBUF_inst
       (.I(Cout_OBUF),
        .O(Cout));
  LUT5 #(
    .INIT(32'hFFEAAAAA)) 
    Cout_OBUF_inst_i_1
       (.I0(Cout_OBUF_inst_i_2_n_0),
        .I1(Cout_OBUF_inst_i_3_n_0),
        .I2(Cout_OBUF_inst_i_4_n_0),
        .I3(Cout_OBUF_inst_i_5_n_0),
        .I4(data1[4]),
        .O(Cout_OBUF));
  LUT2 #(
    .INIT(4'h8)) 
    Cout_OBUF_inst_i_10
       (.I0(XYZ_IBUF[2]),
        .I1(XYZ_IBUF[1]),
        .O(Cout_OBUF_inst_i_10_n_0));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    Cout_OBUF_inst_i_2
       (.I0(A_IBUF[1]),
        .I1(A_IBUF[2]),
        .I2(A_IBUF[3]),
        .I3(XYZ_IBUF[0]),
        .I4(XYZ_IBUF[1]),
        .I5(XYZ_IBUF[2]),
        .O(Cout_OBUF_inst_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h02)) 
    Cout_OBUF_inst_i_3
       (.I0(XYZ_IBUF[0]),
        .I1(XYZ_IBUF[1]),
        .I2(XYZ_IBUF[2]),
        .O(Cout_OBUF_inst_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h07)) 
    Cout_OBUF_inst_i_4
       (.I0(XYZ_IBUF[0]),
        .I1(XYZ_IBUF[1]),
        .I2(XYZ_IBUF[2]),
        .O(Cout_OBUF_inst_i_4_n_0));
  LUT6 #(
    .INIT(64'h00007CC000000000)) 
    Cout_OBUF_inst_i_5
       (.I0(Cout_OBUF_inst_i_7_n_0),
        .I1(B_IBUF[3]),
        .I2(A_IBUF[3]),
        .I3(Cout_OBUF_inst_i_8_n_0),
        .I4(Cout_OBUF_inst_i_9_n_0),
        .I5(Cout_OBUF_inst_i_10_n_0),
        .O(Cout_OBUF_inst_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    Cout_OBUF_inst_i_6
       (.I0(Cout_OBUF_inst_i_8_n_0),
        .I1(A_IBUF[3]),
        .I2(B_IBUF[3]),
        .O(data1[4]));
  LUT6 #(
    .INIT(64'hFFF99FFF9FFFFFF6)) 
    Cout_OBUF_inst_i_7
       (.I0(A_IBUF[2]),
        .I1(B_IBUF[2]),
        .I2(B_IBUF[0]),
        .I3(A_IBUF[0]),
        .I4(A_IBUF[1]),
        .I5(B_IBUF[1]),
        .O(Cout_OBUF_inst_i_7_n_0));
  LUT6 #(
    .INIT(64'hFFFFF880F8800000)) 
    Cout_OBUF_inst_i_8
       (.I0(B_IBUF[0]),
        .I1(A_IBUF[0]),
        .I2(A_IBUF[1]),
        .I3(B_IBUF[1]),
        .I4(A_IBUF[2]),
        .I5(B_IBUF[2]),
        .O(Cout_OBUF_inst_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h08)) 
    Cout_OBUF_inst_i_9
       (.I0(XYZ_IBUF[2]),
        .I1(XYZ_IBUF[1]),
        .I2(XYZ_IBUF[0]),
        .O(Cout_OBUF_inst_i_9_n_0));
  IBUF \XYZ_IBUF[0]_inst 
       (.I(XYZ[0]),
        .O(XYZ_IBUF[0]));
  IBUF \XYZ_IBUF[1]_inst 
       (.I(XYZ[1]),
        .O(XYZ_IBUF[1]));
  IBUF \XYZ_IBUF[2]_inst 
       (.I(XYZ[2]),
        .O(XYZ_IBUF[2]));
  OBUF \activeDisplay_OBUF[0]_inst 
       (.I(1'b0),
        .O(activeDisplay[0]));
  OBUF \activeDisplay_OBUF[1]_inst 
       (.I(1'b1),
        .O(activeDisplay[1]));
  OBUF \activeDisplay_OBUF[2]_inst 
       (.I(1'b1),
        .O(activeDisplay[2]));
  OBUF \activeDisplay_OBUF[3]_inst 
       (.I(1'b1),
        .O(activeDisplay[3]));
  OBUF \displayOut_OBUF[0]_inst 
       (.I(displayOut_OBUF[0]),
        .O(displayOut[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00001083)) 
    \displayOut_OBUF[0]_inst_i_1 
       (.I0(\displayOut_OBUF[6]_inst_i_6_n_0 ),
        .I1(\displayOut_OBUF[6]_inst_i_5_n_0 ),
        .I2(\displayOut_OBUF[6]_inst_i_4_n_0 ),
        .I3(\displayOut_OBUF[6]_inst_i_3_n_0 ),
        .I4(\displayOut_OBUF[6]_inst_i_2_n_0 ),
        .O(displayOut_OBUF[0]));
  OBUF \displayOut_OBUF[1]_inst 
       (.I(displayOut_OBUF[1]),
        .O(displayOut[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hBAEAAAFE)) 
    \displayOut_OBUF[1]_inst_i_1 
       (.I0(\displayOut_OBUF[6]_inst_i_2_n_0 ),
        .I1(\displayOut_OBUF[6]_inst_i_5_n_0 ),
        .I2(\displayOut_OBUF[6]_inst_i_6_n_0 ),
        .I3(\displayOut_OBUF[6]_inst_i_3_n_0 ),
        .I4(\displayOut_OBUF[6]_inst_i_4_n_0 ),
        .O(displayOut_OBUF[1]));
  OBUF \displayOut_OBUF[2]_inst 
       (.I(displayOut_OBUF[2]),
        .O(displayOut[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hF1F0FFF2)) 
    \displayOut_OBUF[2]_inst_i_1 
       (.I0(\displayOut_OBUF[6]_inst_i_4_n_0 ),
        .I1(\displayOut_OBUF[6]_inst_i_5_n_0 ),
        .I2(\displayOut_OBUF[6]_inst_i_2_n_0 ),
        .I3(\displayOut_OBUF[6]_inst_i_6_n_0 ),
        .I4(\displayOut_OBUF[6]_inst_i_3_n_0 ),
        .O(displayOut_OBUF[2]));
  OBUF \displayOut_OBUF[3]_inst 
       (.I(displayOut_OBUF[3]),
        .O(displayOut[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hEEBAABAE)) 
    \displayOut_OBUF[3]_inst_i_1 
       (.I0(\displayOut_OBUF[6]_inst_i_2_n_0 ),
        .I1(\displayOut_OBUF[6]_inst_i_4_n_0 ),
        .I2(\displayOut_OBUF[6]_inst_i_3_n_0 ),
        .I3(\displayOut_OBUF[6]_inst_i_6_n_0 ),
        .I4(\displayOut_OBUF[6]_inst_i_5_n_0 ),
        .O(displayOut_OBUF[3]));
  OBUF \displayOut_OBUF[4]_inst 
       (.I(displayOut_OBUF[4]),
        .O(displayOut[4]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hEFAAAAAE)) 
    \displayOut_OBUF[4]_inst_i_1 
       (.I0(\displayOut_OBUF[6]_inst_i_2_n_0 ),
        .I1(\displayOut_OBUF[6]_inst_i_5_n_0 ),
        .I2(\displayOut_OBUF[6]_inst_i_6_n_0 ),
        .I3(\displayOut_OBUF[6]_inst_i_4_n_0 ),
        .I4(\displayOut_OBUF[6]_inst_i_3_n_0 ),
        .O(displayOut_OBUF[4]));
  OBUF \displayOut_OBUF[5]_inst 
       (.I(displayOut_OBUF[5]),
        .O(displayOut[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFFCA28)) 
    \displayOut_OBUF[5]_inst_i_1 
       (.I0(\displayOut_OBUF[6]_inst_i_4_n_0 ),
        .I1(\displayOut_OBUF[6]_inst_i_3_n_0 ),
        .I2(\displayOut_OBUF[6]_inst_i_6_n_0 ),
        .I3(\displayOut_OBUF[6]_inst_i_5_n_0 ),
        .I4(\displayOut_OBUF[6]_inst_i_2_n_0 ),
        .O(displayOut_OBUF[5]));
  OBUF \displayOut_OBUF[6]_inst 
       (.I(displayOut_OBUF[6]),
        .O(displayOut[6]));
  LUT5 #(
    .INIT(32'hAEEBAABA)) 
    \displayOut_OBUF[6]_inst_i_1 
       (.I0(\displayOut_OBUF[6]_inst_i_2_n_0 ),
        .I1(\displayOut_OBUF[6]_inst_i_3_n_0 ),
        .I2(\displayOut_OBUF[6]_inst_i_4_n_0 ),
        .I3(\displayOut_OBUF[6]_inst_i_5_n_0 ),
        .I4(\displayOut_OBUF[6]_inst_i_6_n_0 ),
        .O(displayOut_OBUF[6]));
  LUT6 #(
    .INIT(64'hE88817771777E888)) 
    \displayOut_OBUF[6]_inst_i_10 
       (.I0(B_IBUF[1]),
        .I1(A_IBUF[1]),
        .I2(A_IBUF[0]),
        .I3(B_IBUF[0]),
        .I4(B_IBUF[2]),
        .I5(A_IBUF[2]),
        .O(data1[2]));
  LUT6 #(
    .INIT(64'h00F9600000F86000)) 
    \displayOut_OBUF[6]_inst_i_11 
       (.I0(A_IBUF[2]),
        .I1(A_IBUF[1]),
        .I2(XYZ_IBUF[0]),
        .I3(XYZ_IBUF[1]),
        .I4(XYZ_IBUF[2]),
        .I5(A_IBUF[3]),
        .O(\displayOut_OBUF[6]_inst_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h000000F0005500EE)) 
    \displayOut_OBUF[6]_inst_i_12 
       (.I0(B_IBUF[2]),
        .I1(A_IBUF[2]),
        .I2(data1[2]),
        .I3(XYZ_IBUF[2]),
        .I4(XYZ_IBUF[1]),
        .I5(XYZ_IBUF[0]),
        .O(\displayOut_OBUF[6]_inst_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h2020202038383828)) 
    \displayOut_OBUF[6]_inst_i_13 
       (.I0(XYZ_IBUF[0]),
        .I1(XYZ_IBUF[1]),
        .I2(XYZ_IBUF[2]),
        .I3(A_IBUF[3]),
        .I4(A_IBUF[2]),
        .I5(A_IBUF[1]),
        .O(\displayOut_OBUF[6]_inst_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h000000F0005500EE)) 
    \displayOut_OBUF[6]_inst_i_14 
       (.I0(B_IBUF[1]),
        .I1(A_IBUF[1]),
        .I2(data1[1]),
        .I3(XYZ_IBUF[2]),
        .I4(XYZ_IBUF[1]),
        .I5(XYZ_IBUF[0]),
        .O(\displayOut_OBUF[6]_inst_i_14_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \displayOut_OBUF[6]_inst_i_15 
       (.I0(A_IBUF[0]),
        .I1(B_IBUF[0]),
        .I2(B_IBUF[1]),
        .I3(A_IBUF[1]),
        .O(data1[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \displayOut_OBUF[6]_inst_i_16 
       (.I0(B_IBUF[1]),
        .I1(XYZ_IBUF[0]),
        .I2(XYZ_IBUF[1]),
        .I3(XYZ_IBUF[2]),
        .O(\displayOut_OBUF[6]_inst_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h28382020)) 
    \displayOut_OBUF[6]_inst_i_17 
       (.I0(XYZ_IBUF[0]),
        .I1(XYZ_IBUF[1]),
        .I2(XYZ_IBUF[2]),
        .I3(\displayOut_OBUF[6]_inst_i_19_n_0 ),
        .I4(A_IBUF[0]),
        .O(\displayOut_OBUF[6]_inst_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h0006030E)) 
    \displayOut_OBUF[6]_inst_i_18 
       (.I0(A_IBUF[0]),
        .I1(B_IBUF[0]),
        .I2(XYZ_IBUF[2]),
        .I3(XYZ_IBUF[1]),
        .I4(XYZ_IBUF[0]),
        .O(\displayOut_OBUF[6]_inst_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF01FFFF)) 
    \displayOut_OBUF[6]_inst_i_19 
       (.I0(A_IBUF[3]),
        .I1(A_IBUF[2]),
        .I2(A_IBUF[1]),
        .I3(XYZ_IBUF[0]),
        .I4(XYZ_IBUF[2]),
        .I5(XYZ_IBUF[1]),
        .O(\displayOut_OBUF[6]_inst_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \displayOut_OBUF[6]_inst_i_2 
       (.I0(XYZ_IBUF[1]),
        .I1(XYZ_IBUF[2]),
        .I2(XYZ_IBUF[0]),
        .O(\displayOut_OBUF[6]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFCCCFEEEFCCC)) 
    \displayOut_OBUF[6]_inst_i_3 
       (.I0(Cout_OBUF_inst_i_5_n_0),
        .I1(\displayOut_OBUF[6]_inst_i_7_n_0 ),
        .I2(Cout_OBUF_inst_i_4_n_0),
        .I3(\displayOut_OBUF[6]_inst_i_8_n_0 ),
        .I4(data1[3]),
        .I5(Cout_OBUF_inst_i_3_n_0),
        .O(\displayOut_OBUF[6]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFF8)) 
    \displayOut_OBUF[6]_inst_i_4 
       (.I0(Cout_OBUF_inst_i_5_n_0),
        .I1(data1[2]),
        .I2(\displayOut_OBUF[6]_inst_i_11_n_0 ),
        .I3(\displayOut_OBUF[6]_inst_i_12_n_0 ),
        .O(\displayOut_OBUF[6]_inst_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEEE)) 
    \displayOut_OBUF[6]_inst_i_5 
       (.I0(\displayOut_OBUF[6]_inst_i_13_n_0 ),
        .I1(\displayOut_OBUF[6]_inst_i_14_n_0 ),
        .I2(Cout_OBUF_inst_i_5_n_0),
        .I3(data1[1]),
        .I4(\displayOut_OBUF[6]_inst_i_16_n_0 ),
        .O(\displayOut_OBUF[6]_inst_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFF28)) 
    \displayOut_OBUF[6]_inst_i_6 
       (.I0(Cout_OBUF_inst_i_5_n_0),
        .I1(B_IBUF[0]),
        .I2(A_IBUF[0]),
        .I3(\displayOut_OBUF[6]_inst_i_17_n_0 ),
        .I4(\displayOut_OBUF[6]_inst_i_18_n_0 ),
        .O(\displayOut_OBUF[6]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0078FF000000E000)) 
    \displayOut_OBUF[6]_inst_i_7 
       (.I0(A_IBUF[1]),
        .I1(A_IBUF[2]),
        .I2(A_IBUF[3]),
        .I3(XYZ_IBUF[2]),
        .I4(XYZ_IBUF[1]),
        .I5(XYZ_IBUF[0]),
        .O(\displayOut_OBUF[6]_inst_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h0000030E)) 
    \displayOut_OBUF[6]_inst_i_8 
       (.I0(A_IBUF[3]),
        .I1(B_IBUF[3]),
        .I2(XYZ_IBUF[2]),
        .I3(XYZ_IBUF[1]),
        .I4(XYZ_IBUF[0]),
        .O(\displayOut_OBUF[6]_inst_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \displayOut_OBUF[6]_inst_i_9 
       (.I0(Cout_OBUF_inst_i_8_n_0),
        .I1(B_IBUF[3]),
        .I2(A_IBUF[3]),
        .O(data1[3]));
endmodule
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
