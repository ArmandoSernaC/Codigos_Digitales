///*######################################################################
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
module SC_STATEMACHINEBACKG (
	//////////// OUTPUTS //////////
	SC_STATEMACHINEBACKG_clear_OutLow,
	SC_STATEMACHINEBACKG_load_OutLow,
	SC_STATEMACHINEBACKG_MAPSELECTION,
	SC_STATEMACHINEBACKG_WAIT_InHigh,
	//////////// INPUTS //////////
	SC_STATEMACHINEBACKG_CLOCK_50,
	SC_STATEMACHINEBACKG_RESET_InHigh,
	SC_STATEMACHINEBACKG_startButton_InLow,
	SC_STATEMACHINEBACKG_LEVEL,
	SC_STATEMACHINEBACKG_LOSS_InHigh,
	SC_STATEMACHINEBACKG_Houses_1_InHigh,
    SC_STATEMACHINEBACKG_Houses_0_InHigh 
	
);	
//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
localparam STATE_RESET_0									= 0;
localparam STATE_START_0									= 1;
localparam STATE_CHECK_0									= 2;
localparam STATE_INIT_0										= 3;
localparam STATE_CHECK_1									= 4;
localparam STATE_MAPSELECT  						        = 5;
localparam STATE_LOSS      						            = 6;
localparam STATE_SCREEMSELECT  			         	        = 7;
localparam STATE_PLAY 				                        = 8;
localparam STATE_PASS 				                        = 9;
localparam STATE_WIN   						                = 10;
localparam STATE_STAY                                       = 11;
//=======================================================
//  PORT declarations
//=======================================================
output reg		SC_STATEMACHINEBACKG_clear_OutLow;
output reg		SC_STATEMACHINEBACKG_load_OutLow;
output reg		SC_STATEMACHINEBACKG_WAIT_InHigh;
output reg      [3:0]SC_STATEMACHINEBACKG_MAPSELECTION;
 
input			 SC_STATEMACHINEBACKG_CLOCK_50;
input 			 SC_STATEMACHINEBACKG_RESET_InHigh;
input			 SC_STATEMACHINEBACKG_startButton_InLow;
input            [1:0] SC_STATEMACHINEBACKG_LEVEL;
input            [7:0] SC_STATEMACHINEBACKG_LOSS_InHigh;
input            SC_STATEMACHINEBACKG_Houses_1_InHigh;
input            SC_STATEMACHINEBACKG_Houses_0_InHigh;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [3:0] STATE_Register;
reg [3:0] STATE_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
// NEXT STATE LOGIC : COMBINATIONAL
always @(*)
begin
	case (STATE_Register)
		STATE_RESET_0:      STATE_Signal = STATE_START_0;
		STATE_START_0:      STATE_Signal = STATE_CHECK_0;
		STATE_CHECK_0:      if (SC_STATEMACHINEBACKG_startButton_InLow == 1'b0) STATE_Signal = STATE_INIT_0;
							else if (SC_STATEMACHINEBACKG_LOSS_InHigh != 8'b00000000)STATE_Signal = STATE_LOSS;
							else if (SC_STATEMACHINEBACKG_Houses_1_InHigh == 1'b1 )STATE_Signal = STATE_PASS;
							else if (SC_STATEMACHINEBACKG_Houses_0_InHigh == 1'b1 )STATE_Signal = STATE_SCREEMSELECT;
							else if (SC_STATEMACHINEBACKG_Houses_1_InHigh == 1'b0 )STATE_Signal = STATE_STAY;
							else if (SC_STATEMACHINEBACKG_Houses_0_InHigh == 1'b0 )STATE_Signal = STATE_STAY;					   
							
							else STATE_Signal = STATE_CHECK_0;
		STATE_INIT_0:       STATE_Signal = STATE_CHECK_1;

		STATE_SCREEMSELECT: STATE_Signal =  STATE_MAPSELECT;
		STATE_MAPSELECT:    if(SC_STATEMACHINEBACKG_LEVEL== 2'b11)STATE_Signal = STATE_WIN;
		                    else STATE_Signal = STATE_PLAY;

		STATE_PLAY:         STATE_Signal = STATE_CHECK_0;
		STATE_PASS:         STATE_Signal = STATE_CHECK_0;
		STATE_STAY:         STATE_Signal = STATE_CHECK_0;
		STATE_LOSS:         STATE_Signal = STATE_INIT_0;
		STATE_WIN:          STATE_Signal = STATE_START_0;
		
		STATE_CHECK_1:      if (SC_STATEMACHINEBACKG_startButton_InLow == 1'b0) STATE_Signal = STATE_CHECK_1;
					        else STATE_Signal = STATE_SCREEMSELECT;

		default : 		STATE_Signal = STATE_CHECK_0;
	endcase
end
// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_STATEMACHINEBACKG_CLOCK_50 , posedge SC_STATEMACHINEBACKG_RESET_InHigh)
begin
	if (SC_STATEMACHINEBACKG_RESET_InHigh == 1'b1)
		STATE_Register <= STATE_RESET_0;
	else
		STATE_Register <= STATE_Signal;
end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
always @ (*)
begin
	case (STATE_Register)
//=========================================================
// STATE_RESET
//=========================================================
	STATE_RESET_0 :	
		begin
		   SC_STATEMACHINEBACKG_MAPSELECTION = 4'b1111;
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_WAIT_InHigh =1'b0;
		end
//=========================================================
// STATE_START
//=========================================================
	STATE_START_0 :	
		begin
		   SC_STATEMACHINEBACKG_MAPSELECTION = 4'b1111;
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_WAIT_InHigh =1'b0;
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_0 :
		begin
		
		   SC_STATEMACHINEBACKG_MAPSELECTION = 4'b1111;
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_WAIT_InHigh =1'b0;
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_1 :
		begin
		   SC_STATEMACHINEBACKG_MAPSELECTION = 4'b1111;
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_WAIT_InHigh =1'b0;
		end
//=========================================================
// STATE_INIT
//=========================================================
	STATE_INIT_0 :	
		begin
		
		   SC_STATEMACHINEBACKG_MAPSELECTION = 4'b1111;
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_WAIT_InHigh =1'b0;
		end
		
			
//=========================================================
// STATE_SCREEMSELECT
//=========================================================
	STATE_SCREEMSELECT:
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_WAIT_InHigh =1'b1;
			
		   if(SC_STATEMACHINEBACKG_LEVEL== 2'b00)SC_STATEMACHINEBACKG_MAPSELECTION = 4'b0010;
			else if(SC_STATEMACHINEBACKG_LEVEL== 2'b01)SC_STATEMACHINEBACKG_MAPSELECTION = 4'b0011;
			else if(SC_STATEMACHINEBACKG_LEVEL== 2'b10)SC_STATEMACHINEBACKG_MAPSELECTION = 4'b0100;
			else if(SC_STATEMACHINEBACKG_LEVEL== 2'b11)SC_STATEMACHINEBACKG_MAPSELECTION = 4'b0001;
	 
			
		end	
		
				
//=========================================================
// STATE_MAPSELECT
//=========================================================
	STATE_MAPSELECT:
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_WAIT_InHigh =1'b1;
			
		   if(SC_STATEMACHINEBACKG_LEVEL== 2'b00)SC_STATEMACHINEBACKG_MAPSELECTION = 4'b0101;
			else if(SC_STATEMACHINEBACKG_LEVEL== 2'b01)SC_STATEMACHINEBACKG_MAPSELECTION = 4'b0110;
			else if(SC_STATEMACHINEBACKG_LEVEL== 2'b10)SC_STATEMACHINEBACKG_MAPSELECTION = 4'b0111;
			else if(SC_STATEMACHINEBACKG_LEVEL== 2'b11)SC_STATEMACHINEBACKG_MAPSELECTION = 4'b0001;
	 
			
		end	
	//=========================================================
// STATE_LOSS
//=========================================================
	STATE_LOSS:
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_WAIT_InHigh =1'b1;			
		   SC_STATEMACHINEBACKG_MAPSELECTION = 4'b0000;	 
			
		end	
		
			//=========================================================
// STATE_WIN
//=========================================================
	STATE_WIN:
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_WAIT_InHigh =1'b1;			
		   SC_STATEMACHINEBACKG_MAPSELECTION = 4'b0001;	 
			
		end
			//=========================================================
// STATE_PLAY
//=========================================================
	STATE_PLAY:
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_WAIT_InHigh =1'b0;			
		   SC_STATEMACHINEBACKG_MAPSELECTION = 4'b1111;	 
			
		end		
				//=========================================================
// STATE_PASS
//=========================================================
	STATE_PASS:
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_WAIT_InHigh =1'b0;			
		   SC_STATEMACHINEBACKG_MAPSELECTION = 4'b1001;	 
			
		end		


		//=========================================================
// STATE_STAY
//=========================================================
	STATE_STAY:
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_WAIT_InHigh =1'b0;			
		   SC_STATEMACHINEBACKG_MAPSELECTION = 4'b1000;	 
			
		end		
		
		
		
		
		
		
//=========================================================
// DEFAULT
//=========================================================
	default :
		begin
		   SC_STATEMACHINEBACKG_MAPSELECTION = 4'b1111;
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_WAIT_InHigh =1'b0;
		end
	endcase
end
endmodule
