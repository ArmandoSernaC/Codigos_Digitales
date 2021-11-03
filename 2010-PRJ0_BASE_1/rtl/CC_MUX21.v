
//=======================================================
//  MODULE Definition
//=======================================================
module CC_MUX21 #(parameter MUX21_DATAWIDTH=8)(
//////////// OUTPUTS //////////
	CC_MUX21_z_Out,
//////////// INPUTS //////////
	CC_MUX21_select_InBUS,
	CC_MUX21_data1_InBUS,
	CC_MUX21_data2_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg [MUX21_DATAWIDTH-1:0] CC_MUX21_z_Out;
input 	CC_MUX21_select_InBUS;
input 	[MUX21_DATAWIDTH-1:0] CC_MUX21_data1_InBUS;
input 	[MUX21_DATAWIDTH-1:0] CC_MUX21_data2_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
always @(CC_MUX21_data1_InBUS or CC_MUX21_select_InBUS or CC_MUX21_data2_InBUS  )
begin
   if( CC_MUX21_select_InBUS == 0)
      CC_MUX21_z_Out = CC_MUX21_data1_InBUS;
   else if( CC_MUX21_select_InBUS == 1)
      CC_MUX21_z_Out = CC_MUX21_data2_InBUS;   
end

endmodule

