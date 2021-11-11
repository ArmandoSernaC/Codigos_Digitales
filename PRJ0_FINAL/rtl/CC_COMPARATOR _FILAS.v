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
module CC_COMPARATOR_FILAS (

//////////// OUTPUTS //////////

	CC_COMPARATOR_FILAS_resultado_OutBUS,
	
	//////////// INPUTS //////////
	
	CC_COMPARATOR_FILAS_InBus
	);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter NUMBER_DATAWIDTH = 8;
//=======================================================
//  PORT declarations
//=======================================================
output reg CC_COMPARATOR_FILAS_resultado_OutBUS;

input  	[NUMBER_DATAWIDTH-1:0] CC_COMPARATOR_FILAS_InBus;

//=======================================================
//  REG/WIRE declarations
//=======================================================


//=======================================================
//  Structural coding
//=======================================================
//STRUCTURAL

always @(*)
begin
 if(CC_COMPARATOR_FILAS_InBus == 8'b00000000)
		CC_COMPARATOR_FILAS_resultado_OutBUS = 1'b1;
	
 else
	if (CC_COMPARATOR_FILAS_InBus != 8'b11111111)
		CC_COMPARATOR_FILAS_resultado_OutBUS = 1'b0;
	else
		CC_COMPARATOR_FILAS_resultado_OutBUS = 1'b1;
end

endmodule

