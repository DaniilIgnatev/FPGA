module busTransiver
#(parameter w = 8)
(
	input logic enableDriveL,
	input logic [w-1:0] valueToDrive,
	output logic [w-1:0] valueReceived,
	inout logic [w-1:0] busLine
);

assign valueReceived = busLine;
assign busLine = (~enableDriveL) ? valueToDrive : 'bz;

endmodule: busTransiver
