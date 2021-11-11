
//=======================================================
//  MODULE Definition
//=======================================================
module CC_MUX81 #(parameter MUX81_SELECTWIDTH=4,parameter MUX81_DATAWIDTH=8)(
//////////// OUTPUTS //////////
	CC_MUX81_z_Out,
//////////// INPUTS //////////
	CC_MUX81_select_InBUS,
	CC_MUX81_data1_InBUS,
	CC_MUX81_data2_InBUS,
    CC_MUX81_data3_InBUS,
	CC_MUX81_data4_InBUS,
    CC_MUX81_data5_InBUS,
	CC_MUX81_data6_InBUS,
    CC_MUX81_data7_InBUS,
	CC_MUX81_data8_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg CC_MUX81_z_Out;
input 	[MUX81_SELECTWIDTH-1:0]CC_MUX81_select_InBUS;
input 	[MUX81_DATAWIDTH-1:0] CC_MUX81_data1_InBUS;
input 	[MUX81_DATAWIDTH-1:0] CC_MUX81_data2_InBUS;
input 	[MUX81_DATAWIDTH-1:0] CC_MUX81_data3_InBUS;
input 	[MUX81_DATAWIDTH-1:0] CC_MUX81_data4_InBUS;
input 	[MUX81_DATAWIDTH-1:0] CC_MUX81_data5_InBUS;
input 	[MUX81_DATAWIDTH-1:0] CC_MUX81_data6_InBUS;
input 	[MUX81_DATAWIDTH-1:0] CC_MUX81_data7_InBUS;
input 	[MUX81_DATAWIDTH-1:0] CC_MUX81_data8_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
always @(CC_MUX81_data1_InBUS or CC_MUX81_select_InBUS or CC_MUX81_data2_InBUS 
        or CC_MUX81_data2_InBUS or  CC_MUX81_data4_InBUS or CC_MUX81_data5_InBUS or 
         CC_MUX81_data6_InBUS or CC_MUX81_data7_InBUS or CC_MUX81_data8_InBUS)
begin
    if( CC_MUX81_select_InBUS == 0)
      CC_MUX81_z_Out = CC_MUX81_data1_InBUS;   
    else if( CC_MUX81_select_InBUS == 1)
      CC_MUX81_z_Out = CC_MUX81_data2_InBUS;  
    else if( CC_MUX81_select_InBUS == 2)
      CC_MUX81_z_Out = CC_MUX81_data3_InBUS;  
    else if( CC_MUX81_select_InBUS == 3)
      CC_MUX81_z_Out = CC_MUX81_data4_InBUS;  
    else if( CC_MUX81_select_InBUS == 4)
      CC_MUX81_z_Out = CC_MUX81_data5_InBUS;  
    else if( CC_MUX81_select_InBUS == 5)
      CC_MUX81_z_Out = CC_MUX81_data6_InBUS;  
    else if( CC_MUX81_select_InBUS == 6)
      CC_MUX81_z_Out = CC_MUX81_data7_InBUS;  
    else if( CC_MUX81_select_InBUS == 7)
      CC_MUX81_z_Out = CC_MUX81_data8_InBUS; 
    else	
	   CC_MUX81_z_Out = CC_MUX81_z_Out;
end

endmodule

