module stack_shift
#(parameter DATA_WIDTH = 4, parameter PTR_WIDTH=2)
(
input logic clk, reset, push, pop,
input logic[DATA_WIDTH-1: 0] write_data,
output logic[DATA_WIDTH-1: 0] read_data 
);

logic [DATA_WIDTH-1: 0] stack[0: 2**PTR_WIDTH-1];
logic [PTR_WIDTH-1: 0] pointer = 0;

always_ff@(posedge clk)
begin
	if (~reset)
	begin
		pointer <= 0;
		for (int i = 0; i < 2**PTR_WIDTH; i = i + 1)
			stack[i] <= 0;
	end
	else
	begin
		case({push, pop})
			2'b10:
			begin
				if (pointer != 2**PTR_WIDTH-1)
				begin
					pointer <= pointer + 1'b1;
					stack[pointer + 1] <= write_data;
				end
				else
				begin
					stack[pointer] <= write_data;
				end
				read_data <= write_data;
			end
			2'b01:
			begin
				if (pointer == 0)
				begin
					read_data <= stack[0];
				end
				else
					begin
						read_data <= stack[pointer];
						pointer <= pointer - 1'b1;
					end
			end
			default: read_data <= stack[pointer];
		endcase
	end
end

endmodule
