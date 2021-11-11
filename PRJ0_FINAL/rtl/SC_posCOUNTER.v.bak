//  MODULE Definition
//=======================================================
module SC_posCOUNTER #(parameter posCOUNTER_DATAWIDTH=3)(
	//////////// OUTPUTS //////////
	SC_posCOUNTER_data_OutBUS,
	//////////// INPUTS //////////
	SC_posCOUNTER_CLOCK_50,
	SC_posCOUNTER_RESET_InHigh,
	SC_posCOUNTER_upcount_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[posCOUNTER_DATAWIDTH-1:0]	SC_upSPEEDCOUNTER_data_OutBUS;
input		SC_posCOUNTER_CLOCK_50;
input		SC_posCOUNTER_RESET_InHigh;
input		SC_posCOUNTER_upcount_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [posCOUNTER_DATAWIDTH-1:0] posCOUNTER_Register;
reg [posCOUNTER_DATAWIDTH-1:0] posCOUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (posCOUNTER_upcount_InLow == 1'b0)
		posCOUNTER_Signal = posCOUNTER_Register + 1'b1;
	else
		posCOUNTER_Signal = posCOUNTER_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_posCOUNTER_CLOCK_50, posedge SC_posCOUNTER_RESET_InHigh)
begin
	if (SC_posCOUNTER_RESET_InHigh  == 1'b1)
		posCOUNTER_Register <= 0;
	else
		posCOUNTER_Register <= posCOUNTER_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_posCOUNTER_data_OutBUS = posCOUNTER_Register;

endmodule
