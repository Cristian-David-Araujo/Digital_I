// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Wed Mar 22 21:58:46 2023
// Host        : LAPTOP-L5E1O48L running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {D:/University/7/Electronica Digital
//               I/Laboratorio/Practica2/vivadoProject/Practica1-2/Practica1-2.sim/sim_1/impl/timing/xsim/test_time_impl.v}
// Design      : completeAssembly
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module behavioral
   (Fbehavioral_OBUF,
    ABCinput_IBUF);
  output Fbehavioral_OBUF;
  input [2:0]ABCinput_IBUF;

  wire \/i__n_0 ;
  wire [2:0]ABCinput_IBUF;
  wire Fbehavioral_OBUF;
  wire Fout1_out;
  wire Fout_reg_i_2_n_0;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \/i_ 
       (.I0(ABCinput_IBUF[2]),
        .I1(ABCinput_IBUF[1]),
        .O(\/i__n_0 ));
  (* XILINX_LEGACY_PRIM = "LDP" *) 
  LDPE #(
    .INIT(1'b1)) 
    Fout_reg
       (.D(Fout1_out),
        .G(\/i__n_0 ),
        .GE(1'b1),
        .PRE(Fout_reg_i_2_n_0),
        .Q(Fbehavioral_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h15)) 
    Fout_reg_i_1
       (.I0(ABCinput_IBUF[0]),
        .I1(ABCinput_IBUF[2]),
        .I2(ABCinput_IBUF[1]),
        .O(Fout1_out));
  LUT2 #(
    .INIT(4'h8)) 
    Fout_reg_i_2
       (.I0(ABCinput_IBUF[2]),
        .I1(ABCinput_IBUF[1]),
        .O(Fout_reg_i_2_n_0));
endmodule

(* ECO_CHECKSUM = "8fe516d2" *) 
(* NotValidForBitStream *)
module completeAssembly
   (ABCinput,
    Fbehavioral,
    FdataFlow,
    Fstructural);
  input [2:0]ABCinput;
  output Fbehavioral;
  output FdataFlow;
  output Fstructural;

  wire [2:0]ABCinput;
  wire [2:0]ABCinput_IBUF;
  wire Fbehavioral;
  wire Fbehavioral_OBUF;
  wire FdataFlow;
  wire Fstructural;
  wire Fstructural_OBUF;

initial begin
 $sdf_annotate("test_time_impl.sdf",,,,"tool_control");
end
  IBUF \ABCinput_IBUF[0]_inst 
       (.I(ABCinput[0]),
        .O(ABCinput_IBUF[0]));
  IBUF \ABCinput_IBUF[1]_inst 
       (.I(ABCinput[1]),
        .O(ABCinput_IBUF[1]));
  IBUF \ABCinput_IBUF[2]_inst 
       (.I(ABCinput[2]),
        .O(ABCinput_IBUF[2]));
  OBUF Fbehavioral_OBUF_inst
       (.I(Fbehavioral_OBUF),
        .O(Fbehavioral));
  OBUF FdataFlow_OBUF_inst
       (.I(Fstructural_OBUF),
        .O(FdataFlow));
  LUT3 #(
    .INIT(8'h8F)) 
    FdataFlow_OBUF_inst_i_1
       (.I0(ABCinput_IBUF[1]),
        .I1(ABCinput_IBUF[2]),
        .I2(ABCinput_IBUF[0]),
        .O(Fstructural_OBUF));
  OBUF Fstructural_OBUF_inst
       (.I(Fstructural_OBUF),
        .O(Fstructural));
  behavioral behavioral1
       (.ABCinput_IBUF(ABCinput_IBUF),
        .Fbehavioral_OBUF(Fbehavioral_OBUF));
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
