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
	BB_SYSTEM_TEST0,
	BB_SYSTEM_TEST1,
	BB_SYSTEM_TEST2,

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
 parameter PRESCALER_DATAWIDTH = 25;
 parameter DISPLAY_DATAWIDTH = 12;  //no se usa. 
 parameter MUX101_SELECTWIDTH=4;
//---------------------------------------------------------
// Parametros Pantallas
//---------------------------------------------------------



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
	parameter DATA_FIXED_win_6 = 8'b00100100;
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
	parameter DATA_FIXED_INITREGOBS1= 8'b00000000;
	 

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
	parameter DATA_FIXED_INITREGOBS3_0 = 8'b00000000;

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

 
 parameter DATA_FIXED_INITREGBACKG_7 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_6 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_5 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_4 = 8'b11001100;
 parameter DATA_FIXED_INITREGBACKG_3 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_2 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_1 = 8'b00000000;
 parameter DATA_FIXED_INITREGBACKG_0 = 8'b00000000;
  
 parameter DATA_FIXED_INITREGHOUSES_1 = 8'b11011011;
 parameter DATA_FIXED_INITREGHOUSES_0 = 8'b11110011;
  
 parameter DATA_FIXED_INITREGHAPPY_7 = 8'b11111111;
 parameter DATA_FIXED_INITREGHAPPY_6 = 8'b10000001;
 parameter DATA_FIXED_INITREGHAPPY_5 = 8'b10100101;
 parameter DATA_FIXED_INITREGHAPPY_4 = 8'b10000001;
 parameter DATA_FIXED_INITREGHAPPY_3 = 8'b10100101;
 parameter DATA_FIXED_INITREGHAPPY_2 = 8'b10011001;
 parameter DATA_FIXED_INITREGHAPPY_1 = 8'b10000001;
 parameter DATA_FIXED_INITREGHAPPY_0 = 8'b11111111;


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
output 		BB_SYSTEM_TEST0;
output 		BB_SYSTEM_TEST1;
output 		BB_SYSTEM_TEST2;

input		BB_SYSTEM_CLOCK_50;
input		BB_SYSTEM_RESET_InHigh;
input		BB_SYSTEM_startButton_InLow;
input		BB_SYSTEM_leftButton_InLow;
input		BB_SYSTEM_rightButton_InLow;
//=======================================================
//  REG/WIRE declarations
//=======================================================
// BUTTONs
wire 	BB_SYSTEM_startButton_InLow_cwire;
wire 	BB_SYSTEM_leftButton_InLow_cwire;
wire 	BB_SYSTEM_rightButton_InLow_cwire;




//POINT


wire	STATEMACHINEPOINT_clear_cwire;
wire	STATEMACHINEPOINT_load0_cwire;
wire	STATEMACHINEPOINT_load1_cwire;
wire	STATEMACHINEPOINT_POINTselection_wire;
wire  [DATAWIDTH_BUS-1:0] MULTIPLEXOR_PointSelection_wire;
wire	[1:0] STATEMACHINEPOINT_shiftselection_cwire;

wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data7_Out;  
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data6_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data5_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data4_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data3_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data2_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data1_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data0_Out;

//BACKGROUNG
wire  STATEMACHINEBACKG_2_STATEMACHINEPOINT_WAIT_wire;
wire  [MUX101_SELECTWIDTH-1:0]STATEMACHINEBack_Mapselection_wire;
wire  [DATAWIDTH_BUS-1:0] MULTIPLEXOR_MapSelection_07_wire;
wire  [DATAWIDTH_BUS-1:0] MULTIPLEXOR_MapSelection_06_wire;
wire  [DATAWIDTH_BUS-1:0] MULTIPLEXOR_MapSelection_05_wire;
wire  [DATAWIDTH_BUS-1:0] MULTIPLEXOR_MapSelection_04_wire;
wire  [DATAWIDTH_BUS-1:0] MULTIPLEXOR_MapSelection_03_wire;
wire  [DATAWIDTH_BUS-1:0] MULTIPLEXOR_MapSelection_02_wire;
wire  [DATAWIDTH_BUS-1:0] MULTIPLEXOR_MapSelection_01_wire;
wire  [DATAWIDTH_BUS-1:0] MULTIPLEXOR_MapSelection_00_wire;

wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data7_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data6_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data5_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data4_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data3_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data2_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data1_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data0_Out;

wire [DATAWIDTH_BUS-1:0] OR_2_MULTIPLEXOR_1_wire;
wire [DATAWIDTH_BUS-1:0] OR_2_MULTIPLEXOR_0_wire;

wire HOUSESCOMPARATOR_2_STATEMACHINEBACKG_1_wire;
wire HOUSESCOMPARATOR_2_STATEMACHINEBACKG_0_wire;
wire [1:0] upLEVEL_2_STATEMACHINEBACKG_wire;

wire [PRESCALER_DATAWIDTH-1:0] upSPEEDCOUNTER_data_BUS_wire;

wire [2:0] posCOUNTER_data_BUS_wire;
wire posCOMPARATOR_2_STATEMACHINEPOINT_T0_wire;
wire SPEEDCOMPARATOR_2_STATEMACHINEPOINT_T0_cwire;
wire STATEMACHINEBACKG_clear_cwire;
wire STATEMACHINEBACKG_load_cwire;
wire [1:0] STATEMACHINEBACKG_shiftselection_cwire;
wire STATEMACHINEBACKG_upcount_cwire;
wire [DATAWIDTH_BUS-1:0] COMPARATOR_2_STATEMACHINEBACKG_wire;


//BOTTOMSIDE COMPARATOR
wire BOTTOMSIDECOMPARATOR_2_STATEMACHINEBACKG_bottomside_cwire;

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
//#	POINT
//######################################################################

CC_MUX21 #(.MUX21_DATAWIDTH(DATAWIDTH_BUS)) CC_MUX21_u0 (
// port map - connection between master ports and signals/registers   
	.CC_MUX21_z_Out(MULTIPLEXOR_PointSelection_wire), 
	.CC_MUX21_select_InBUS(STATEMACHINEPOINT_POINTselection_wire),
	.CC_MUX21_data1_InBUS(DATA_FIXED_INITREGPOINT_0),
	.CC_MUX21_data2_InBUS(DATA_FIXED_INITREGPOINT_7)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_0)) SC_RegPOINTTYPE_u7 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(   MULTIPLEXOR_PointSelection_wire     )
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_0)) SC_RegPOINTTYPE_u6 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_0)) SC_RegPOINTTYPE_u5 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_0)) SC_RegPOINTTYPE_u4 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_0)) SC_RegPOINTTYPE_u3 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_0)) SC_RegPOINTTYPE_u2 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_0)) SC_RegPOINTTYPE_u1 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_0)) SC_RegPOINTTYPE_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out)
);

SC_STATEMACHINEPOINT SC_STATEMACHINEPOINT_u0 (
// port map - connection between master ports and signals/registers
	.SC_STATEMACHINEPOINT_POINTselection_Out(STATEMACHINEPOINT_POINTselection_wire),   
	.SC_STATEMACHINEPOINT_clear_OutLow(STATEMACHINEPOINT_clear_cwire), 
	.SC_STATEMACHINEPOINT_load0_OutLow(STATEMACHINEPOINT_load0_cwire), 
	.SC_STATEMACHINEPOINT_shiftselection_Out(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_STATEMACHINEPOINT_upcount_out(STATEMACHINEBACKG_upcount_cwire),
	.SC_STATEMACHINEPOINT_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEPOINT_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEPOINT_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_leftButton_InLow(BB_SYSTEM_leftButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_rightButton_InLow(BB_SYSTEM_rightButton_InLow_cwire),
	.SC_STATEMACHINEPOINT_T0_InLow(SPEEDCOMPARATOR_2_STATEMACHINEPOINT_T0_cwire),
	.SC_STATEMACHINEPOINT_select_InLow(posCOMPARATOR_2_STATEMACHINEPOINT_T0_wire),
	.SC_STATEMACHINEPOINT_WAIT(STATEMACHINEBACKG_2_STATEMACHINEPOINT_WAIT_wire)
);

//Position
SC_posCOUNTER SC_posCOUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_posCOUNTER_data_OutBUS(posCOUNTER_data_BUS_wire),
	.SC_posCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_posCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_posCOUNTER_upcount_InLow(STATEMACHINEBACKG_upcount_cwire)
);

CC_posCOMPARATOR CC_posCOMPARATOR_u0 (
	.CC_posCOMPARATOR_T0_OutLow(posCOMPARATOR_2_STATEMACHINEPOINT_T0_wire),
	.CC_posCOMPARATOR_data_InBUS(posCOUNTER_data_BUS_wire)
);


//#SPEED
SC_upSPEEDCOUNTER #(.upSPEEDCOUNTER_DATAWIDTH(PRESCALER_DATAWIDTH)) SC_upSPEEDCOUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_upSPEEDCOUNTER_data_OutBUS(upSPEEDCOUNTER_data_BUS_wire),
	.SC_upSPEEDCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_upSPEEDCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_upSPEEDCOUNTER_upcount_InLow(STATEMACHINEBACKG_upcount_cwire)
);

CC_SPEEDCOMPARATOR #(.SPEEDCOMPARATOR_DATAWIDTH(PRESCALER_DATAWIDTH)) CC_SPEEDCOMPARATOR_u0 (
	.CC_SPEEDCOMPARATOR_T0_OutLow(SPEEDCOMPARATOR_2_STATEMACHINEPOINT_T0_cwire),
	.CC_SPEEDCOMPARATOR_data_InBUS(upSPEEDCOUNTER_data_BUS_wire)
);






//######################################################################
//#	BACKGROUND
//######################################################################


CC_MUX101 #(.MUX101_SELECTWIDTH(MUX101_SELECTWIDTH), .MUX101_DATAWIDTH(DATAWIDTH_BUS)) CC_MUX101_u7 (
// port map - connection between master ports and signals/registers   
	.CC_MUX101_z_Out(MULTIPLEXOR_MapSelection_07_wire), 
	.CC_MUX101_select_InBUS(STATEMACHINEBack_Mapselection_wire),
	.CC_MUX101_data1_InBUS(DATA_FIXED_loss_7),
	.CC_MUX101_data2_InBUS(DATA_FIXED_win_7),
    .CC_MUX101_data3_InBUS(DATA_FIXED_LEVEL1_7),
	.CC_MUX101_data4_InBUS(DATA_FIXED_LEVEL2_7),
    .CC_MUX101_data5_InBUS(DATA_FIXED_LEVEL3_7),
	.CC_MUX101_data6_InBUS(DATA_FIXED_INITREGOBS1),
    .CC_MUX101_data7_InBUS(DATA_FIXED_INITREGOBS2_7),
	.CC_MUX101_data8_InBUS(DATA_FIXED_INITREGOBS3_7),
	.CC_MUX101_data9_InBUS(MULTIPLEXOR_MapSelection_07_wire),
	.CC_MUX101_data10_InBUS(MULTIPLEXOR_MapSelection_07_wire)
	);

SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_7)) SC_RegBACKGTYPE_u7 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data7_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_data_InBUS(MULTIPLEXOR_MapSelection_07_wire)
);

CC_MUX101 #(.MUX101_SELECTWIDTH(MUX101_SELECTWIDTH), .MUX101_DATAWIDTH(DATAWIDTH_BUS)) CC_MUX101_u6 (
// port map - connection between master ports and signals/registers   
	.CC_MUX101_z_Out(MULTIPLEXOR_MapSelection_06_wire), 
	.CC_MUX101_select_InBUS(STATEMACHINEBack_Mapselection_wire),
	.CC_MUX101_data1_InBUS(DATA_FIXED_loss_6),
	.CC_MUX101_data2_InBUS(DATA_FIXED_win_6),
    .CC_MUX101_data3_InBUS(DATA_FIXED_LEVEL1_6),
	.CC_MUX101_data4_InBUS(DATA_FIXED_LEVEL2_6),
    .CC_MUX101_data5_InBUS(DATA_FIXED_LEVEL3_6),
	.CC_MUX101_data6_InBUS(DATA_FIXED_INITREGOBS1),
    .CC_MUX101_data7_InBUS(DATA_FIXED_INITREGOBS2_6),
	.CC_MUX101_data8_InBUS(DATA_FIXED_INITREGOBS3_6),
	.CC_MUX101_data9_InBUS(MULTIPLEXOR_MapSelection_06_wire),
	.CC_MUX101_data10_InBUS(MULTIPLEXOR_MapSelection_06_wire)
	);

SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_7)) SC_RegBACKGTYPE_u6 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data6_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_data_InBUS(MULTIPLEXOR_MapSelection_06_wire)
);


CC_MUX101 #(.MUX101_SELECTWIDTH(MUX101_SELECTWIDTH), .MUX101_DATAWIDTH(DATAWIDTH_BUS)) CC_MUX101_u5 (
// port map - connection between master ports and signals/registers   
	.CC_MUX101_z_Out(MULTIPLEXOR_MapSelection_05_wire), 
	.CC_MUX101_select_InBUS(STATEMACHINEBack_Mapselection_wire),
	.CC_MUX101_data1_InBUS(DATA_FIXED_loss_5),
	.CC_MUX101_data2_InBUS(DATA_FIXED_win_5),
    .CC_MUX101_data3_InBUS(DATA_FIXED_LEVEL1_5),
	.CC_MUX101_data4_InBUS(DATA_FIXED_LEVEL2_5),
    .CC_MUX101_data5_InBUS(DATA_FIXED_LEVEL3_5),
	.CC_MUX101_data6_InBUS(DATA_FIXED_INITREGOBS1),
    .CC_MUX101_data7_InBUS(DATA_FIXED_INITREGOBS2_5),
	.CC_MUX101_data8_InBUS(DATA_FIXED_INITREGOBS3_5),
	.CC_MUX101_data9_InBUS(MULTIPLEXOR_MapSelection_05_wire),
	.CC_MUX101_data10_InBUS(MULTIPLEXOR_MapSelection_05_wire)
	);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_7)) SC_RegBACKGTYPE_u5 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data5_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_data_InBUS(MULTIPLEXOR_MapSelection_05_wire)
);

CC_MUX101 #(.MUX101_SELECTWIDTH(MUX101_SELECTWIDTH), .MUX101_DATAWIDTH(DATAWIDTH_BUS)) CC_MUX101_u4 (
// port map - connection between master ports and signals/registers   
	.CC_MUX101_z_Out(MULTIPLEXOR_MapSelection_04_wire), 
	.CC_MUX101_select_InBUS(STATEMACHINEBack_Mapselection_wire),
	.CC_MUX101_data1_InBUS(DATA_FIXED_loss_4),
	.CC_MUX101_data2_InBUS(DATA_FIXED_win_4),
    .CC_MUX101_data3_InBUS(DATA_FIXED_LEVEL1_4),
	.CC_MUX101_data4_InBUS(DATA_FIXED_LEVEL2_4),
    .CC_MUX101_data5_InBUS(DATA_FIXED_LEVEL3_4),
	.CC_MUX101_data6_InBUS(DATA_FIXED_INITREGOBS1),
    .CC_MUX101_data7_InBUS(DATA_FIXED_INITREGOBS2_4),
	.CC_MUX101_data8_InBUS(DATA_FIXED_INITREGOBS3_4),
	.CC_MUX101_data9_InBUS(MULTIPLEXOR_MapSelection_04_wire),
	.CC_MUX101_data10_InBUS(MULTIPLEXOR_MapSelection_04_wire)

	);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_7)) SC_RegBACKGTYPE_u4 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data4_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_data_InBUS(MULTIPLEXOR_MapSelection_04_wire)
	
);
CC_MUX101 #(.MUX101_SELECTWIDTH(MUX101_SELECTWIDTH), .MUX101_DATAWIDTH(DATAWIDTH_BUS)) CC_MUX101_u3 (
// port map - connection between master ports and signals/registers   
	.CC_MUX101_z_Out(MULTIPLEXOR_MapSelection_03_wire), 
	.CC_MUX101_select_InBUS(STATEMACHINEBack_Mapselection_wire),
	.CC_MUX101_data1_InBUS(DATA_FIXED_loss_3),
	.CC_MUX101_data2_InBUS(DATA_FIXED_win_3),
    .CC_MUX101_data3_InBUS(DATA_FIXED_LEVEL1_3),
	.CC_MUX101_data4_InBUS(DATA_FIXED_LEVEL2_3),
    .CC_MUX101_data5_InBUS(DATA_FIXED_LEVEL3_3),
	.CC_MUX101_data6_InBUS(DATA_FIXED_INITREGOBS1),
    .CC_MUX101_data7_InBUS(DATA_FIXED_INITREGOBS2_3),
	.CC_MUX101_data8_InBUS(DATA_FIXED_INITREGOBS3_3),
	.CC_MUX101_data9_InBUS(MULTIPLEXOR_MapSelection_03_wire),
	.CC_MUX101_data10_InBUS(MULTIPLEXOR_MapSelection_03_wire)
	);
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_7)) SC_RegBACKGTYPE_u3 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data3_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_data_InBUS(MULTIPLEXOR_MapSelection_03_wire)
);
CC_MUX101 #(.MUX101_SELECTWIDTH(MUX101_SELECTWIDTH), .MUX101_DATAWIDTH(DATAWIDTH_BUS)) CC_MUX101_u2 (
// port map - connection between master ports and signals/registers   
	.CC_MUX101_z_Out(MULTIPLEXOR_MapSelection_02_wire), 
	.CC_MUX101_select_InBUS(STATEMACHINEBack_Mapselection_wire),
	.CC_MUX101_data1_InBUS(DATA_FIXED_loss_2),
	.CC_MUX101_data2_InBUS(DATA_FIXED_win_2),
    .CC_MUX101_data3_InBUS(DATA_FIXED_LEVEL1_2),
	.CC_MUX101_data4_InBUS(DATA_FIXED_LEVEL2_2),
    .CC_MUX101_data5_InBUS(DATA_FIXED_LEVEL3_2),
	.CC_MUX101_data6_InBUS(DATA_FIXED_INITREGOBS1),
    .CC_MUX101_data7_InBUS(DATA_FIXED_INITREGOBS2_2),
	.CC_MUX101_data8_InBUS(DATA_FIXED_INITREGOBS3_2),
	.CC_MUX101_data9_InBUS(MULTIPLEXOR_MapSelection_02_wire),
	.CC_MUX101_data10_InBUS(MULTIPLEXOR_MapSelection_02_wire)
	);
	
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_7)) SC_RegBACKGTYPE_u2 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data2_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_data_InBUS(MULTIPLEXOR_MapSelection_02_wire)
  );
CC_MUX101 #(.MUX101_SELECTWIDTH(MUX101_SELECTWIDTH), .MUX101_DATAWIDTH(DATAWIDTH_BUS)) CC_MUX101_u1 (
// port map - connection between master ports and signals/registers   
	.CC_MUX101_z_Out(MULTIPLEXOR_MapSelection_01_wire), 
	.CC_MUX101_select_InBUS(STATEMACHINEBack_Mapselection_wire),
	.CC_MUX101_data1_InBUS(DATA_FIXED_loss_1),
	.CC_MUX101_data2_InBUS(DATA_FIXED_win_1),
    .CC_MUX101_data3_InBUS(DATA_FIXED_LEVEL1_1),
	.CC_MUX101_data4_InBUS(DATA_FIXED_LEVEL2_1),
    .CC_MUX101_data5_InBUS(DATA_FIXED_LEVEL3_1),
	.CC_MUX101_data6_InBUS(DATA_FIXED_INITREGHOUSES1_1),
    .CC_MUX101_data7_InBUS(DATA_FIXED_INITREGHOUSES2_1),
	.CC_MUX101_data8_InBUS(DATA_FIXED_INITREGHOUSES3_1),
	.CC_MUX101_data9_InBUS(OR_2_MULTIPLEXOR_1_wire ),
	.CC_MUX101_data10_InBUS(DATA_FIXED_INITREGPOINT_0)
	);
	
	
	
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_7)) SC_RegBACKGTYPE_u1 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data1_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_data_InBUS(MULTIPLEXOR_MapSelection_01_wire),
	
	
);
CC_OR21 CC_OR_u1 (

	.CC_OR_OutBUS(OR_2_MULTIPLEXOR_1_wire),	 
	.CC_OR_obs_InBUS(RegBACKGTYPE_2_BACKGMATRIX_data1_Out),
	.CC_OR_point_InBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out)
);


	CC_MUX101 #(.MUX101_SELECTWIDTH(MUX101_SELECTWIDTH), .MUX101_DATAWIDTH(DATAWIDTH_BUS)) CC_MUX101_u0 (
// port map - connection between master ports and signals/registers   
	.CC_MUX101_z_Out(MULTIPLEXOR_MapSelection_00_wire), 
	.CC_MUX101_select_InBUS(STATEMACHINEBack_Mapselection_wire),
	.CC_MUX101_data1_InBUS(DATA_FIXED_loss_0),
	.CC_MUX101_data2_InBUS(DATA_FIXED_win_0),
    .CC_MUX101_data3_InBUS(DATA_FIXED_LEVEL1_0),
	.CC_MUX101_data4_InBUS(DATA_FIXED_LEVEL2_0),
    .CC_MUX101_data5_InBUS(DATA_FIXED_LEVEL3_0),
	.CC_MUX101_data6_InBUS(DATA_FIXED_INITREGHOUSES1_0),
    .CC_MUX101_data7_InBUS(DATA_FIXED_INITREGHOUSES2_0),
	.CC_MUX101_data8_InBUS(DATA_FIXED_INITREGHOUSES3_0),
	.CC_MUX101_data9_InBUS(OR_2_MULTIPLEXOR_0_wire),
	.CC_MUX101_data10_InBUS(OR_2_MULTIPLEXOR_0_wire)
	);
	
SC_RegBACKGTYPE #(.RegBACKGTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGBACKG(DATA_FIXED_INITREGBACKG_7)) SC_RegBACKGTYPE_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data0_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_data_InBUS(MULTIPLEXOR_MapSelection_00_wire)
);

CC_OR21 CC_OR_u0 (

	.CC_OR_OutBUS(OR_2_MULTIPLEXOR_0_wire),	 
	.CC_OR_obs_InBUS(RegBACKGTYPE_2_BACKGMATRIX_data0_Out),
	.CC_OR_point_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out)
);

SC_STATEMACHINEBACKG SC_STATEMACHINEBACKG_u0 (
// port map - connection between master ports and signals/registers
    .SC_STATEMACHINEBACKG_MAPSELECTION(STATEMACHINEBack_Mapselection_wire),  
	.SC_STATEMACHINEBACKG_clear_OutLow(STATEMACHINEBACKG_clear_cwire), 
	.SC_STATEMACHINEBACKG_load_OutLow(STATEMACHINEBACKG_load_cwire), 
	.SC_STATEMACHINEBACKG_WAIT_InHigh(STATEMACHINEBACKG_2_STATEMACHINEPOINT_WAIT_wire), 

	.SC_STATEMACHINEBACKG_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEBACKG_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEBACKG_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINEBACKG_LEVEL(upLEVEL_2_STATEMACHINEBACKG_wire),
	.SC_STATEMACHINEBACKG_LOSS_InHigh(COMPARATOR_2_STATEMACHINEBACKG_wire),
	.SC_STATEMACHINEBACKG_Houses_1_InHigh(HOUSESCOMPARATOR_2_STATEMACHINEBACKG_1_wire),
    .SC_STATEMACHINEBACKG_Houses_0_InHigh(HOUSESCOMPARATOR_2_STATEMACHINEBACKG_0_wire) 
	
);


//####################################################################################
// # COMPARADORES 
//####################################################################################
CC_COMPARATOR CC_COMPARADOR_PRINCIPAL (

//////////// OUTPUTS //////////

	.CC_COMPARATOR_resultado_OutBUS(COMPARATOR_2_STATEMACHINEBACKG_wire),
	
	//////////// INPUTS //////////
	
	.CC_COMPARATOR_filaJugador7_InBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
	.CC_COMPARATOR_filaJugador6_InBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out),
	.CC_COMPARATOR_filaJugador5_InBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out),
	.CC_COMPARATOR_filaJugador4_InBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out),
	.CC_COMPARATOR_filaJugador3_InBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out),
	.CC_COMPARATOR_filaJugador2_InBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out),
	.CC_COMPARATOR_filaJugador1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out),
	.CC_COMPARATOR_filaJugador0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out),
	
	.CC_COMPARATOR_filaObstaculos7_InBUS(RegBACKGTYPE_2_BACKGMATRIX_data7_Out),
	.CC_COMPARATOR_filaObstaculos6_InBUS(RegBACKGTYPE_2_BACKGMATRIX_data6_Out),
	.CC_COMPARATOR_filaObstaculos5_InBUS(RegBACKGTYPE_2_BACKGMATRIX_data5_Out),
	.CC_COMPARATOR_filaObstaculos4_InBUS(RegBACKGTYPE_2_BACKGMATRIX_data4_Out),
	.CC_COMPARATOR_filaObstaculos3_InBUS(RegBACKGTYPE_2_BACKGMATRIX_data3_Out),
	.CC_COMPARATOR_filaObstaculos2_InBUS(RegBACKGTYPE_2_BACKGMATRIX_data2_Out),
	.CC_COMPARATOR_filaObstaculos1_InBUS(RegBACKGTYPE_2_BACKGMATRIX_data1_Out),
	.CC_COMPARATOR_filaObstaculos0_InBUS(RegBACKGTYPE_2_BACKGMATRIX_data0_Out)
);


CC_COMPARATOR_FILAS CC_COMPARADOR_HOUSES_u1 (

 

	.CC_COMPARATOR_FILAS_resultado_OutBUS(HOUSESCOMPARATOR_2_STATEMACHINEBACKG_1_wire),	
	.CC_COMPARATOR_FILAS_InBus(RegBACKGTYPE_2_BACKGMATRIX_data1_Out)


	);
CC_COMPARATOR_FILAS CC_COMPARADOR_HOUSES_u0 (

 

	.CC_COMPARATOR_FILAS_resultado_OutBUS(HOUSESCOMPARATOR_2_STATEMACHINEBACKG_0_wire),	
	.CC_COMPARATOR_FILAS_InBus(RegBACKGTYPE_2_BACKGMATRIX_data0_Out)


	);

SC_LEVELCOUNTER SC_LEVELCOUNTER_u0(
	//////////// OUTPUTS //////////
	.SC_LEVELCOUNTER_data_OutBUS(upLEVEL_2_STATEMACHINEBACKG_wire),
	//////////// INPUTS //////////
	.SC_LEVELCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_LEVELCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_LEVELCOUNTER_upLEVEL(HOUSESCOMPARATOR_2_STATEMACHINEBACKG_0_wire)
);


//######################################################################
//#	COMPARATOR END OF MATRIX (BOTTON SIDE)
//######################################################################
CC_BOTTOMSIDECOMPARATOR #(.BOTTOMSIDECOMPARATOR_DATAWIDTH(DATAWIDTH_BUS)) CC_BOTTOMSIDECOMPARATOR_u0 (
	.CC_BOTTOMSIDECOMPARATOR_bottomside_OutLow(BOTTOMSIDECOMPARATOR_2_STATEMACHINEBACKG_bottomside_cwire),
	.CC_BOTTOMSIDECOMPARATOR_data_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out)
);


//######################################################################
//#	TO LED MATRIZ: VISUALIZATION
//######################################################################
assign regGAME_data0_wire = RegPOINTTYPE_2_POINTMATRIX_data0_Out | RegBACKGTYPE_2_BACKGMATRIX_data0_Out;
assign regGAME_data1_wire = RegPOINTTYPE_2_POINTMATRIX_data1_Out | RegBACKGTYPE_2_BACKGMATRIX_data1_Out;
assign regGAME_data2_wire = RegPOINTTYPE_2_POINTMATRIX_data2_Out | RegBACKGTYPE_2_BACKGMATRIX_data2_Out;
assign regGAME_data3_wire = RegPOINTTYPE_2_POINTMATRIX_data3_Out | RegBACKGTYPE_2_BACKGMATRIX_data3_Out;
assign regGAME_data4_wire = RegPOINTTYPE_2_POINTMATRIX_data4_Out | RegBACKGTYPE_2_BACKGMATRIX_data4_Out;
assign regGAME_data5_wire = RegPOINTTYPE_2_POINTMATRIX_data5_Out | RegBACKGTYPE_2_BACKGMATRIX_data5_Out;
assign regGAME_data6_wire = RegPOINTTYPE_2_POINTMATRIX_data6_Out | RegBACKGTYPE_2_BACKGMATRIX_data6_Out;
assign regGAME_data7_wire = RegPOINTTYPE_2_POINTMATRIX_data7_Out | RegBACKGTYPE_2_BACKGMATRIX_data7_Out;

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
 
//~ imagen img1(
//~ .act_add(add), 
//~ .max_in(data_max) );

//~ SC_CTRLMATRIX SC_CTRLMATRIX_u0( 
//~ .SC_CTRLMATRIX_max7219DIN_Out(BB_SYSTEM_max7219DIN_Out),	//max7219_din 
//~ .SC_CTRLMATRIX_max7219NCS_out(BB_SYSTEM_max7219NCS_Out),	//max7219_ncs 
//~ .SC_CTRLMATRIX_max7219CLK_Out(BB_SYSTEM_max7219CLK_Out),	//max7219_clk
//~ .SC_CTRLMATRIX_dispdata(data_max), 
//~ .SC_CTRLMATRIX_dispaddr(add),
//~ .SC_CTRLMATRIX_intensity(4'hA),
//~ .SC_CTRLMATRIX_CLOCK_50(BB_SYSTEM_CLOCK_50),
//~ .SC_CTRLMATRIX_RESET_InHigh(~BB_SYSTEM_RESET_InHigh) 		//~lowRst_System
 //~ ); 
 
//~ SC_IMAGE SC_IMAGE_u0(
//~ .SC_IMAGE_actadd(add), 
//~ .SC_IMAGE_maxin(data_max) );

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

//######################################################################
//#	TO 7SEG
//######################################################################

CC_BIN2BCD1 CC_BIN2BCD1_u0 (
// port map - connection between master ports and signals/registers   
	.CC_BIN2BCD_bcd_OutBUS(BIN2BCD1_2_SEVENSEG1_data_BUS_wire),
	.CC_BIN2BCD_bin_InBUS(upCOUNTER_2_BIN2BCD1_data_BUS_wire)
);

CC_SEVENSEG1 CC_SEVENSEG1_u0 (
// port map - connection between master ports and signals/registers   
	.CC_SEVENSEG1_an(BB_SYSTEM_display_OutBUS[11:8]),
	.CC_SEVENSEG1_a(BB_SYSTEM_display_OutBUS[0]),
	.CC_SEVENSEG1_b(BB_SYSTEM_display_OutBUS[1]),
	.CC_SEVENSEG1_c(BB_SYSTEM_display_OutBUS[2]),
	.CC_SEVENSEG1_d(BB_SYSTEM_display_OutBUS[3]),
	.CC_SEVENSEG1_e(BB_SYSTEM_display_OutBUS[4]),
	.CC_SEVENSEG1_f(BB_SYSTEM_display_OutBUS[5]),
	.CC_SEVENSEG1_g(BB_SYSTEM_display_OutBUS[6]),
	.CC_SEVENSEG1_dp(BB_SYSTEM_display_OutBUS[7]),
	.CC_SEVENSEG1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.CC_SEVENSEG1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.CC_SEVENSEG1_in0(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[3:0]),
	.CC_SEVENSEG1_in1(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[7:4]),
	.CC_SEVENSEG1_in2(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[11:8]),
	.CC_SEVENSEG1_in3(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[11:8])
);

SC_upCOUNTER #(.upCOUNTER_DATAWIDTH(DATAWIDTH_BUS)) SC_upCOUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_upCOUNTER_data_OutBUS(upCOUNTER_2_BIN2BCD1_data_BUS_wire),
	.SC_upCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_upCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_upCOUNTER_upcount_InLow(STATEMACHINEPOINT_load0_cwire)
);

endmodule
