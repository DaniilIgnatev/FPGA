/*
 Copyright (C) 2023  Intel Corporation. All rights reserved.
 Your use of Intel Corporation's design tools, logic functions 
 and other software and tools, and any partner logic 
 functions, and any output files from any of the foregoing 
 (including device programming or simulation files), and any 
 associated documentation or information are expressly subject 
 to the terms and conditions of the Intel Program License 
 Subscription Agreement, the Intel Quartus Prime License Agreement,
 the Intel FPGA IP License Agreement, or other applicable license
 agreement, including, without limitation, that your use is for
 the sole purpose of programming logic devices manufactured by
 Intel and sold by Intel or its authorized distributors.  Please
 refer to the applicable agreement for further details, at
 https://fpgasoftware.intel.com/eula.
*/
MODEL
/*MODEL HEADER*/
/*
 This file contains Slow Corner delays for the design using part 10M50DAF484C7G
 with speed grade 7, core voltage 1.2V, and temperature 0 Celsius

*/
MODEL_VERSION "1.0";
DESIGN "project1";
DATE "08/10/2023 23:47:05";
PROGRAM "Quartus Prime";



INPUT reset;
INPUT pop;
INPUT push;
INPUT clk;
INPUT write_data[0];
INPUT write_data[1];
INPUT write_data[2];
INPUT write_data[3];
OUTPUT read_data[0];
OUTPUT read_data[1];
OUTPUT read_data[2];
OUTPUT read_data[3];

/*Arc definitions start here*/
pos_pop__clk__setup:		SETUP (POSEDGE) pop clk ;
pos_push__clk__setup:		SETUP (POSEDGE) push clk ;
pos_reset__clk__setup:		SETUP (POSEDGE) reset clk ;
pos_write_data[0]__clk__setup:		SETUP (POSEDGE) write_data[0] clk ;
pos_write_data[1]__clk__setup:		SETUP (POSEDGE) write_data[1] clk ;
pos_write_data[2]__clk__setup:		SETUP (POSEDGE) write_data[2] clk ;
pos_write_data[3]__clk__setup:		SETUP (POSEDGE) write_data[3] clk ;
pos_pop__clk__hold:		HOLD (POSEDGE) pop clk ;
pos_push__clk__hold:		HOLD (POSEDGE) push clk ;
pos_reset__clk__hold:		HOLD (POSEDGE) reset clk ;
pos_write_data[0]__clk__hold:		HOLD (POSEDGE) write_data[0] clk ;
pos_write_data[1]__clk__hold:		HOLD (POSEDGE) write_data[1] clk ;
pos_write_data[2]__clk__hold:		HOLD (POSEDGE) write_data[2] clk ;
pos_write_data[3]__clk__hold:		HOLD (POSEDGE) write_data[3] clk ;
pos_clk__read_data[0]__delay:		DELAY (POSEDGE) clk read_data[0] ;
pos_clk__read_data[1]__delay:		DELAY (POSEDGE) clk read_data[1] ;
pos_clk__read_data[2]__delay:		DELAY (POSEDGE) clk read_data[2] ;
pos_clk__read_data[3]__delay:		DELAY (POSEDGE) clk read_data[3] ;

ENDMODEL
