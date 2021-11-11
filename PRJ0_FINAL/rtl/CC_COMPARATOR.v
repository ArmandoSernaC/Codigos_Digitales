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
module CC_COMPARATOR (

//////////// OUTPUTS //////////

	CC_COMPARATOR_resultado_OutBUS,
	
	//////////// INPUTS //////////
	
	CC_COMPARATOR_filaJugador7_InBUS,
	CC_COMPARATOR_filaJugador6_InBUS,
	CC_COMPARATOR_filaJugador5_InBUS,
	CC_COMPARATOR_filaJugador4_InBUS,
	CC_COMPARATOR_filaJugador3_InBUS,
	CC_COMPARATOR_filaJugador2_InBUS,
	CC_COMPARATOR_filaJugador1_InBUS,
	CC_COMPARATOR_filaJugador0_InBUS,
	
	CC_COMPARATOR_filaObstaculos7_InBUS,
	CC_COMPARATOR_filaObstaculos6_InBUS,
	CC_COMPARATOR_filaObstaculos5_InBUS,
	CC_COMPARATOR_filaObstaculos4_InBUS,
	CC_COMPARATOR_filaObstaculos3_InBUS,
	CC_COMPARATOR_filaObstaculos2_InBUS,
	CC_COMPARATOR_filaObstaculos1_InBUS,
	CC_COMPARATOR_filaObstaculos0_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter NUMBER_DATAWIDTH = 8;
//=======================================================
//  PORT declarations
//=======================================================
output 	CC_COMPARATOR_resultado_OutBUS;

input 	[NUMBER_DATAWIDTH-1:0] CC_COMPARATOR_filaJugador7_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_COMPARATOR_filaJugador6_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_COMPARATOR_filaJugador5_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_COMPARATOR_filaJugador4_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_COMPARATOR_filaJugador3_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_COMPARATOR_filaJugador2_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_COMPARATOR_filaJugador1_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_COMPARATOR_filaJugador0_InBUS;

input 	[NUMBER_DATAWIDTH-1:0] CC_COMPARATOR_filaObstaculos7_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_COMPARATOR_filaObstaculos6_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_COMPARATOR_filaObstaculos5_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_COMPARATOR_filaObstaculos4_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_COMPARATOR_filaObstaculos3_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_COMPARATOR_filaObstaculos2_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_COMPARATOR_filaObstaculos1_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_COMPARATOR_filaObstaculos0_InBUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================

wire 		[NUMBER_DATAWIDTH-1:0] AND_filas7_OutWIRE;
wire 		[NUMBER_DATAWIDTH-1:0] AND_filas6_OutWIRE;
wire 		[NUMBER_DATAWIDTH-1:0] AND_filas5_OutWIRE;
wire 		[NUMBER_DATAWIDTH-1:0] AND_filas4_OutWIRE;
wire 		[NUMBER_DATAWIDTH-1:0] AND_filas3_OutWIRE;
wire 		[NUMBER_DATAWIDTH-1:0] AND_filas2_OutWIRE;
wire 		[NUMBER_DATAWIDTH-1:0] AND_filas1_OutWIRE;
wire 		[NUMBER_DATAWIDTH-1:0] AND_filas0_OutWIRE;

//=======================================================
//  Structural coding
//=======================================================
//STRUCTURAL

CC_AND CC_AND_filas7 ( 

	.CC_AND_OutBUS(AND_filas7_OutWIRE),
	.CC_AND_dataA_InBUS(CC_COMPARATOR_filaJugador7_InBUS),
	.CC_AND_dataB_InBUS(CC_COMPARATOR_filaObstaculos7_InBUS)
	
);

CC_AND CC_AND_filas6 ( 

	.CC_AND_OutBUS(AND_filas6_OutWIRE),
	.CC_AND_dataA_InBUS(CC_COMPARATOR_filaJugador6_InBUS),
	.CC_AND_dataB_InBUS(CC_COMPARATOR_filaObstaculos6_InBUS)
	
);

CC_AND CC_AND_filas5 ( 

	.CC_AND_OutBUS(AND_filas5_OutWIRE),
	.CC_AND_dataA_InBUS(CC_COMPARATOR_filaJugador5_InBUS),
	.CC_AND_dataB_InBUS(CC_COMPARATOR_filaObstaculos5_InBUS)
	
);

CC_AND CC_AND_filas4 ( 

	.CC_AND_OutBUS(AND_filas4_OutWIRE),
	.CC_AND_dataA_InBUS(CC_COMPARATOR_filaJugador4_InBUS),
	.CC_AND_dataB_InBUS(CC_COMPARATOR_filaObstaculos4_InBUS)
	
);

CC_AND CC_AND_filas3 ( 

	.CC_AND_OutBUS(AND_filas3_OutWIRE),
	.CC_AND_dataA_InBUS(CC_COMPARATOR_filaJugador3_InBUS),
	.CC_AND_dataB_InBUS(CC_COMPARATOR_filaObstaculos3_InBUS)
	
);

CC_AND CC_AND_filas2 ( 

	.CC_AND_OutBUS(AND_filas2_OutWIRE),
	.CC_AND_dataA_InBUS(CC_COMPARATOR_filaJugador2_InBUS),
	.CC_AND_dataB_InBUS(CC_COMPARATOR_filaObstaculos2_InBUS)
	
);

CC_AND CC_AND_filas1 ( 

	.CC_AND_OutBUS(AND_filas1_OutWIRE),
	.CC_AND_dataA_InBUS(CC_COMPARATOR_filaJugador1_InBUS),
	.CC_AND_dataB_InBUS(CC_COMPARATOR_filaObstaculos1_InBUS)
	
);

CC_AND CC_AND_filas0 ( 

	.CC_AND_OutBUS(AND_filas0_OutWIRE),
	.CC_AND_dataA_InBUS(CC_COMPARATOR_filaJugador0_InBUS),
	.CC_AND_dataB_InBUS(CC_COMPARATOR_filaObstaculos0_InBUS)
	
);

CC_OR CC_OR_resultado (

	.CC_OR_OutBUS(CC_COMPARATOR_resultado_OutBUS),
	.CC_OR_fila7_InBUS(AND_filas7_OutWIRE),
	.CC_OR_fila6_InBUS(AND_filas6_OutWIRE),
	.CC_OR_fila5_InBUS(AND_filas5_OutWIRE),
	.CC_OR_fila4_InBUS(AND_filas4_OutWIRE),
	.CC_OR_fila3_InBUS(AND_filas3_OutWIRE),
	.CC_OR_fila2_InBUS(AND_filas2_OutWIRE),
	.CC_OR_fila1_InBUS(AND_filas1_OutWIRE),
	.CC_OR_fila0_InBUS(AND_filas0_OutWIRE)

);

endmodule

