//=======================================================
//  MODULE Definition
//=======================================================
module SC_RegPOINTTYPE #(parameter RegPOINTTYPE_DATAWIDTH=8, parameter DATA_FIXED_INITREGPOINT=8'b00000000)(
	//////////// OUTPUTS //////////
	SC_RegPOINTTYPE_data_OutBUS,
	
	//////////// INPUTS //////////
	SC_RegPOINTTYPE_CLOCK_50,
	SC_RegPOINTTYPE_RESET_InHigh,
	SC_RegPOINTTYPE_clear_InLow, 
	SC_RegPOINTTYPE_load_InLow, 
	SC_RegPOINTTYPE_shiftselection_In,
	SC_RegPOINTTYPE_data_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[RegPOINTTYPE_DATAWIDTH-1:0]	SC_RegPOINTTYPE_data_OutBUS;
input		SC_RegPOINTTYPE_CLOCK_50;
input		SC_RegPOINTTYPE_RESET_InHigh;
input		SC_RegPOINTTYPE_clear_InLow;
input		SC_RegPOINTTYPE_load_InLow;	
input	    [1:0] SC_RegPOINTTYPE_shiftselection_In;
input		[RegPOINTTYPE_DATAWIDTH-1:0]	SC_RegPOINTTYPE_data_InBUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [RegPOINTTYPE_DATAWIDTH-1:0] RegPOINTTYPE_Register;
reg [RegPOINTTYPE_DATAWIDTH-1:0] RegPOINTTYPE_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_RegPOINTTYPE_clear_InLow == 1'b0)
		RegPOINTTYPE_Signal = DATA_FIXED_INITREGPOINT;
	else if (SC_RegPOINTTYPE_load_InLow == 1'b0)
		RegPOINTTYPE_Signal = SC_RegPOINTTYPE_data_InBUS;
	else if (SC_RegPOINTTYPE_shiftselection_In == 2'b01)
		RegPOINTTYPE_Signal = {RegPOINTTYPE_Register[RegPOINTTYPE_DATAWIDTH-2:0],RegPOINTTYPE_Register[RegPOINTTYPE_DATAWIDTH-1]};
	else if (SC_RegPOINTTYPE_shiftselection_In == 2'b10)
		RegPOINTTYPE_Signal = {RegPOINTTYPE_Register[0],RegPOINTTYPE_Register[RegPOINTTYPE_DATAWIDTH-1:1]};
	else
		RegPOINTTYPE_Signal = RegPOINTTYPE_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_RegPOINTTYPE_CLOCK_50, posedge SC_RegPOINTTYPE_RESET_InHigh)
begin
	if (SC_RegPOINTTYPE_RESET_InHigh == 1'b1)
		RegPOINTTYPE_Register <= 0;
	else
		RegPOINTTYPE_Register <= RegPOINTTYPE_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_RegPOINTTYPE_data_OutBUS = RegPOINTTYPE_Register;

endmodule