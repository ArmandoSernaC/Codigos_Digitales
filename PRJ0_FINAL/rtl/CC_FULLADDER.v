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
module CC_FULLADDER (
//////////// OUTPUTS //////////
	CC_FULLADDER_cout_Out,
	CC_FULLADDER_sum_Out,
//////////// INPUTS //////////
	CC_FULLADDER_a_In,
	CC_FULLADDER_b_In,
	CC_FULLADDER_cin_In
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output 	CC_FULLADDER_cout_Out;
output 	CC_FULLADDER_sum_Out;
input 	CC_FULLADDER_a_In;
input 	CC_FULLADDER_b_In;
input 	CC_FULLADDER_cin_In;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
//SIMPLIFIED EQUATIONS
assign {CC_FULLADDER_cout_Out,CC_FULLADDER_sum_Out} = CC_FULLADDER_a_In + CC_FULLADDER_b_In + CC_FULLADDER_cin_In;
endmodule

