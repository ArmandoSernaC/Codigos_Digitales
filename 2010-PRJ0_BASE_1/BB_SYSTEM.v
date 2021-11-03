/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module BB_SYSTEM (
//////////// OUTPUTS //////////
	BB_SYSTEM_display_OutBUS,
	BB_SYSTEM_max7219DIN_Out,
	BB_SYSTEM_max7219NCS_Out,
	BB_SYSTEM_max7219CLK_Out,

	BB_SYSTEM_startButton_Out, 
	BB_SYSTEM_leftButton_Out,
	BB_SYSTEM_rightButton_Out,

//////////// INPUTS //////////
	BB_SYSTEM_CLOCK_50,
	BB_SYSTEM_RESET_InHigh,
	BB_SYSTEM_startButton_InLow, 
	BB_SYSTEM_leftButton_InLow,
	BB_SYSTEM_rightButton_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================
	parameter DATAWIDTH_BUS = 8;
	parameter DATAWIDTH_OBSTACLESselection = 8;
	parameter DATAWIDTH_HOUSESselection = 8;
	parameter PRESCALER_DATAWIDTH = 23;
	parameter DISPLAY_DATAWIDTH = 12;


//-------------------------------------------------------
 // Parametros iniciales pointReg.
 //------------------------------------------------------

parameter DATA_FIXED_INITREGPOINT_7 = 8'b00010000;
parameter DATA_FIXED_INITREGPOINT_6 = 8'b00000000;
parameter DATA_FIXED_INITREGPOINT_5 = 8'b00000000;
parameter DATA_FIXED_INITREGPOINT_4 = 8'b00000000;
parameter DATA_FIXED_INITREGPOINT_3 = 8'b00000000;
parameter DATA_FIXED_INITREGPOINT_2 = 8'b00000000;
parameter DATA_FIXED_INITREGPOINT_1 = 8'b00000000;
parameter DATA_FIXED_INITREGPOINT_0 = 8'b00000000;



//---------------------------------------------------------
// Parametros Pantallas
//---------------------------------------------------------

// Parametros loss. 

parameter DATA_FIXED_loss_7 = 8'b00000000;
parameter DATA_FIXED_loss_6 = 8'b01000010;
parameter DATA_FIXED_loss_5 = 8'b00100100;
parameter DATA_FIXED_loss_4 = 8'b00011000;
parameter DATA_FIXED_loss_3 = 8'b00011000;
parameter DATA_FIXED_loss_2 = 8'b00100100;
parameter DATA_FIXED_loss_1 = 8'b01000010;
parameter DATA_FIXED_loss_0 = 8'b00000000;

// Parametros win. 
parameter DATA_FIXED_win_7 = 8'b00000000;
parameter DATA_FIXED_win_6 = 8'b00000000;
parameter DATA_FIXED_win_5 = 8'b00100100;
parameter DATA_FIXED_win_4 = 8'b00000000;
parameter DATA_FIXED_win_3 = 8'b01000010;
parameter DATA_FIXED_win_2 = 8'b00111100;
parameter DATA_FIXED_win_1 = 8'b00000000;
parameter DATA_FIXED_win_0 = 8'b00000000;


//------------------------------------------------------------
//Parametros cambio nivel 
//------------------------------------------------------------

// Parametros Cambio nivel 1 . 
parameter DATA_FIXED_LEVEL1_7 = 8'b00000000;
parameter DATA_FIXED_LEVEL1_6 = 8'b00011000;
parameter DATA_FIXED_LEVEL1_5 = 8'b00101000;
parameter DATA_FIXED_LEVEL1_4 = 8'b01001000;
parameter DATA_FIXED_LEVEL1_3 = 8'b00001000;
parameter DATA_FIXED_LEVEL1_2 = 8'b00001000;
parameter DATA_FIXED_LEVEL1_1 = 8'b01111110;
parameter DATA_FIXED_LEVEL1_0 = 8'b00000000;

// Parametros Cambio nivel 2 . 
parameter DATA_FIXED_LEVEL2_7 = 8'b00000000;
parameter DATA_FIXED_LEVEL2_6 = 8'b01111110;
parameter DATA_FIXED_LEVEL2_5 = 8'b00000010;
parameter DATA_FIXED_LEVEL2_4 = 8'b00000010;
parameter DATA_FIXED_LEVEL2_3 = 8'b01111110;
parameter DATA_FIXED_LEVEL2_2 = 8'b01000000;
parameter DATA_FIXED_LEVEL2_1 = 8'b01111110;
parameter DATA_FIXED_LEVEL2_0 = 8'b00000000;


// Parametros Cambio nivel 3 . 
parameter DATA_FIXED_LEVEL3_7 = 8'b00000000;
parameter DATA_FIXED_LEVEL3_6 = 8'b01111110;
parameter DATA_FIXED_LEVEL3_5 = 8'b00000010;
parameter DATA_FIXED_LEVEL3_4 = 8'b00111110;
parameter DATA_FIXED_LEVEL3_3 = 8'b00111110;
parameter DATA_FIXED_LEVEL3_2 = 8'b00000010;
parameter DATA_FIXED_LEVEL3_1 = 8'b01111110;
parameter DATA_FIXED_LEVEL3_0 = 8'b00000000;


//---------------------------------------------------------------
// Parametros obstaculos
//---------------------------------------------------------------

// Parametros  obstaculos  nivel 1 . 
parameter DATA_FIXED_INITREGOBS1_7 = 8'b00000000;
parameter DATA_FIXED_INITREGOBS1_6 = 8'b00000000;
parameter DATA_FIXED_INITREGOBS1_5 = 8'b00000000;
parameter DATA_FIXED_INITREGOBS1_4 = 8'b00000000;
parameter DATA_FIXED_INITREGOBS1_3 = 8'b00000000;
parameter DATA_FIXED_INITREGOBS1_2 = 8'b00000000;
parameter DATA_FIXED_INITREGOBS1_1 = 8'b00000000;
parameter DATA_FIXED_INITREGOBS1_0 = 8'b00000000;

// Parametros  obstaculos  nivel 2 .
parameter DATA_FIXED_INITREGOBS2_7 = 8'b00000000;
parameter DATA_FIXED_INITREGOBS2_6 = 8'b00000000;
parameter DATA_FIXED_INITREGOBS2_5 = 8'b00000000;
parameter DATA_FIXED_INITREGOBS2_4 = 8'b00100110;
parameter DATA_FIXED_INITREGOBS2_3 = 8'b00000000;
parameter DATA_FIXED_INITREGOBS2_2 = 8'b01010100;
parameter DATA_FIXED_INITREGOBS2_1 = 8'b00000000;
parameter DATA_FIXED_INITREGOBS2_0 = 8'b00000000; 

// Parametros  obstaculos  nivel 3 

parameter DATA_FIXED_INITREGOBS3_7 = 8'b00000000;
parameter DATA_FIXED_INITREGOBS3_6 = 8'b00000000;
parameter DATA_FIXED_INITREGOBS3_5 = 8'b01100100;
parameter DATA_FIXED_INITREGOBS3_4 = 8'b00000000;
parameter DATA_FIXED_INITREGOBS3_3 = 8'b00010010;
parameter DATA_FIXED_INITREGOBS3_2 = 8'b00000000;
parameter DATA_FIXED_INITREGOBS3_1 = 8'b00000000;
parameter DATA_FIXED_INITREGOBS3_0 = 8'b00000000;. 

//Parametros Casas
//----------------------------------------------------------
// Parametros  casas nivel 1 . 
 parameter DATA_FIXED_INITREGHOUSES1_1 = 8'b00000000;
 parameter DATA_FIXED_INITREGHOUSES1_0 = 8'b10111011;

// Parametros  casas nivel 2 . 
 parameter DATA_FIXED_INITREGHOUSES2_1 = 8'b00000000;
 parameter DATA_FIXED_INITREGHOUSES2_0 = 8'b11110011;

// Parametros  casas nivel 3 . 
 parameter DATA_FIXED_INITREGHOUSES3_1 = 8'b11011011;
 parameter DATA_FIXED_INITREGHOUSES3_0 = 8'b10011011;


 //=======================================================
//  PORT declarations
//=======================================================
output		[DISPLAY_DATAWIDTH-1:0] BB_SYSTEM_display_OutBUS;
output		BB_SYSTEM_max7219DIN_Out;
output		BB_SYSTEM_max7219NCS_Out;
output		BB_SYSTEM_max7219CLK_Out;

output 		BB_SYSTEM_startButton_Out;
output 		BB_SYSTEM_leftButton_Out;
output 		BB_SYSTEM_rightButton_Out;

input		BB_SYSTEM_CLOCK_50;
input		BB_SYSTEM_RESET_InHigh;
input		BB_SYSTEM_startButton_InLow;
input		BB_SYSTEM_leftButton_InLow;
input		BB_SYSTEM_rightButton_InLow;


//=======================================================
//  REG/WIRE declarations
//=======================================================
// BUTTONs
wire	BB_SYSTEM_resetButton_InHigh_wire;
wire 	BB_SYSTEM_startButton_InLow_wire; 
wire 	BB_SYSTEM_leftButton_InLow_wire;
wire 	BB_SYSTEM_rightButton_InLow_wire;



//POINT
wire 	[PRESCALER_DATAWIDTH-1:0] upSPEEDCOUNTER_data_BUS_wire;
wire 	SPEEDCOMPARATOR_2_STATEMACHINEPOINT_T0_wire;
wire 	STATEMACHINEPOINT_upcount_wire;

wire	STATEMACHINEPOINT_POINTselection_wire;

wire	STATEMACHINEPOINT_clear_wire;
wire	STATEMACHINEPOINT_loadPoint_wire;

wire	STATEMACHINEPOINT_shiftselection_wire;

wire [DATAWIDTH_BUS-1:0] RegPOINTMATRIX_data7_Out;  
wire [DATAWIDTH_BUS-1:0] RegPOINTMATRIX_data6_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTMATRIX_data5_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTMATRIX_data4_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTMATRIX_data3_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTMATRIX_data2_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTMATRIX_data1_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTMATRIX_data0_Out;

//BACKGROUND

wire STATEMACHINEMAP_clear_wire;
wire STATEMACHINEMAP_load_wire;

// OBSTACLES

wire [DATAWIDTH_OBSTACLESselection-1:0] STATEMACHINEMAP_OBSselection_wire;

wire [DATAWIDTH_BUS-1:0] regGAMEOBS_data7_wire;
wire [DATAWIDTH_BUS-1:0] regGAMEOBS_data6_wire;
wire [DATAWIDTH_BUS-1:0] regGAMEOBS_data5_wire;
wire [DATAWIDTH_BUS-1:0] regGAMEOBS_data4_wire;
wire [DATAWIDTH_BUS-1:0] regGAMEOBS_data3_wire;
wire [DATAWIDTH_BUS-1:0] regGAMEOBS_data2_wire;
wire [DATAWIDTH_BUS-1:0] regGAMEOBS_data1_wire;
wire [DATAWIDTH_BUS-1:0] regGAMEOBS_data0_wire;

 


//HOUSES

wire [DATAWIDTH_HOUSESselection-1:0] STATEMACHINEMAP_HOUSESselection_wire;

wire [DATAWIDTH_BUS-1:0] regGAMEHOUSE_data7_wire;
wire [DATAWIDTH_BUS-1:0] regGAMEHOUSE_data6_wire;
wire [DATAWIDTH_BUS-1:0] regGAMEHOUSE_data5_wire;
wire [DATAWIDTH_BUS-1:0] regGAMEHOUSE_data4_wire;
wire [DATAWIDTH_BUS-1:0] regGAMEHOUSE_data3_wire;
wire [DATAWIDTH_BUS-1:0] regGAMEHOUSE_data2_wire;
wire [DATAWIDTH_BUS-1:0] regGAMEHOUSE_data1_wire;
wire [DATAWIDTH_BUS-1:0] regGAMEHOUSE_data0_wire;


// GAME
wire [DATAWIDTH_BUS-1:0] regGAME_data7_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data6_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data5_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data4_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data3_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data2_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data1_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data0_wire;

wire 	[7:0] data_max;
wire 	[2:0] add;


wire [DATAWIDTH_BUS-1:0] upCOUNTER_2_BIN2BCD1_data_BUS_wire;
wire [DISPLAY_DATAWIDTH-1:0] BIN2BCD1_2_SEVENSEG1_data_BUS_wire;

//=======================================================
//  Structural coding
//=======================================================

//######################################################################
//#	INPUTS
//######################################################################
SC_DEBOUNCE1 SC_DEBOUNCE1_u0 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_startButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_startButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u1 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_leftButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_leftButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u2 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_rightButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_rightButton_InLow)
);

//######################################################################
//#	!!! ACA VAN TUS COMPONENTES
//######################################################################




//######################################################################
//#	TO LED MATRIZ: VISUALIZATION
//######################################################################
assign regGAME_data0_wire = DATA_FIXED_INITREGPOINT_0;
assign regGAME_data1_wire = DATA_FIXED_INITREGPOINT_1;
assign regGAME_data2_wire = DATA_FIXED_INITREGPOINT_2;
assign regGAME_data3_wire = DATA_FIXED_INITREGPOINT_3;
assign regGAME_data4_wire = DATA_FIXED_INITREGPOINT_4;
assign regGAME_data5_wire = DATA_FIXED_INITREGPOINT_5;
assign regGAME_data6_wire = DATA_FIXED_INITREGPOINT_6;
assign regGAME_data7_wire = DATA_FIXED_INITREGPOINT_7;

assign data_max =(add==3'b000)?{regGAME_data0_wire[7],regGAME_data1_wire[7],regGAME_data2_wire[7],regGAME_data3_wire[7],regGAME_data4_wire[7],regGAME_data5_wire[7],regGAME_data6_wire[7],regGAME_data7_wire[7]}:
	       (add==3'b001)?{regGAME_data0_wire[6],regGAME_data1_wire[6],regGAME_data2_wire[6],regGAME_data3_wire[6],regGAME_data4_wire[6],regGAME_data5_wire[6],regGAME_data6_wire[6],regGAME_data7_wire[6]}:
	       (add==3'b010)?{regGAME_data0_wire[5],regGAME_data1_wire[5],regGAME_data2_wire[5],regGAME_data3_wire[5],regGAME_data4_wire[5],regGAME_data5_wire[5],regGAME_data6_wire[5],regGAME_data7_wire[5]}:
	       (add==3'b011)?{regGAME_data0_wire[4],regGAME_data1_wire[4],regGAME_data2_wire[4],regGAME_data3_wire[4],regGAME_data4_wire[4],regGAME_data5_wire[4],regGAME_data6_wire[4],regGAME_data7_wire[4]}:
	       (add==3'b100)?{regGAME_data0_wire[3],regGAME_data1_wire[3],regGAME_data2_wire[3],regGAME_data3_wire[3],regGAME_data4_wire[3],regGAME_data5_wire[3],regGAME_data6_wire[3],regGAME_data7_wire[3]}:
	       (add==3'b101)?{regGAME_data0_wire[2],regGAME_data1_wire[2],regGAME_data2_wire[2],regGAME_data3_wire[2],regGAME_data4_wire[2],regGAME_data5_wire[2],regGAME_data6_wire[2],regGAME_data7_wire[2]}:
	       (add==3'b110)?{regGAME_data0_wire[1],regGAME_data1_wire[1],regGAME_data2_wire[1],regGAME_data3_wire[1],regGAME_data4_wire[1],regGAME_data5_wire[1],regGAME_data6_wire[1],regGAME_data7_wire[1]}:
						{regGAME_data0_wire[0],regGAME_data1_wire[0],regGAME_data2_wire[0],regGAME_data3_wire[0],regGAME_data4_wire[0],regGAME_data5_wire[0],regGAME_data6_wire[0],regGAME_data7_wire[0]};
									 
matrix_ctrl matrix_ctrl_unit_0( 
.max7219_din(BB_SYSTEM_max7219DIN_Out),//max7219_din 
.max7219_ncs(BB_SYSTEM_max7219NCS_Out),//max7219_ncs 
.max7219_clk(BB_SYSTEM_max7219CLK_Out),//max7219_clk
.disp_data(data_max), 
.disp_addr(add),
.intensity(4'hA),
.clk(BB_SYSTEM_CLOCK_50),
.reset(BB_SYSTEM_RESET_InHigh) //~lowRst_System
 ); 
 
//######################################################################
//#	TO TEST
//######################################################################

assign BB_SYSTEM_startButton_Out = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_leftButton_Out = BB_SYSTEM_leftButton_InLow_cwire;
assign BB_SYSTEM_rightButton_Out = BB_SYSTEM_rightButton_InLow_cwire;
//TO TEST
assign BB_SYSTEM_TEST0 = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_TEST1 = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_TEST2 = BB_SYSTEM_startButton_InLow_cwire;



endmodule
