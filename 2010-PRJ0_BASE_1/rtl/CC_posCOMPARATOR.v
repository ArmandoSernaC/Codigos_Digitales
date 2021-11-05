//=======================================================
//  MODULE Definition
//=======================================================
module CC_posCOMPARATOR #(parameter posCOMPARATOR_DATAWIDTH=3)(
//////////// OUTPUTS //////////
	CC_posCOMPARATOR_T0_OutLow,
//////////// INPUTS //////////
	CC_posCOMPARATOR_data_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg CC_posCOMPARATOR_T0_OutLow;
input 	[posCOMPARATOR_DATAWIDTH-1:0] CC_posCOMPARATOR_data_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
always @(CC_posCOMPARATOR_data_InBUS)
begin
	if( CC_posCOMPARATOR_data_InBUS == 3'b000)
		CC_posCOMPARATOR_T0_OutLow = 1'b0;
	else 
		CC_posCOMPARATOR_T0_OutLow = 1'b1;
end

endmodule

