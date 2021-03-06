//  MODULE Definition
//=======================================================
module SC_LEVELCOUNTER(
	//////////// OUTPUTS //////////
	SC_LEVELCOUNTER_data_OutBUS,
	//////////// INPUTS //////////
	SC_LEVELCOUNTER_CLOCK_50,
	SC_LEVELCOUNTER_RESET_InHigh,
	SC_LEVELCOUNTER_upLEVEL
);
//=======================================================
//  PARAMETER declarations
//=======================================================
localparam LEVELCOUNTER_DATAWIDTH = 2;
//=======================================================
//  PORT declarations
//=======================================================
output		[LEVELCOUNTER_DATAWIDTH-1:0]	SC_LEVELCOUNTER_data_OutBUS;
input		SC_LEVELCOUNTER_CLOCK_50;
input		SC_LEVELCOUNTER_RESET_InHigh;
input		SC_LEVELCOUNTER_upLEVEL;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [LEVELCOUNTER_DATAWIDTH-1:0] LEVELCOUNTER_Register;
reg [LEVELCOUNTER_DATAWIDTH-1:0] LEVELCOUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_LEVELCOUNTER_upLEVEL == 1'b1)
		LEVELCOUNTER_Signal = LEVELCOUNTER_Register + 1'b1;
	else
		LEVELCOUNTER_Signal = LEVELCOUNTER_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_LEVELCOUNTER_CLOCK_50, posedge SC_LEVELCOUNTER_RESET_InHigh)
begin
	if (SC_LEVELCOUNTER_RESET_InHigh  == 1'b1)
		LEVELCOUNTER_Register <= 0;
	else
		LEVELCOUNTER_Register <= LEVELCOUNTER_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_LEVELCOUNTER_data_OutBUS = LEVELCOUNTER_Register;

endmodule
