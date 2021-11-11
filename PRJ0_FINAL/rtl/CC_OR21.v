//=======================================================
//  MODULE Definition
//=======================================================
module CC_OR21 (

//////////// OUTPUTS //////////

	CC_OR_OutBUS,
	
//////////// INPUTS //////////

	 
	CC_OR_obs_InBUS,
	CC_OR_point_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================
localparam NUMBER_DATAWIDTH = 8;
//=======================================================
//  PORT declarations
//=======================================================

output 	[NUMBER_DATAWIDTH-1:0] CC_OR_OutBUS;

input 	[NUMBER_DATAWIDTH-1:0] CC_OR_obs_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_OR_point_InBUS;
 
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
	
or(CC_OR_OutBUS,CC_OR_obs_InBUS,CC_OR_point_InBUS);

endmodule
