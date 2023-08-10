module uart( 
    input clock,
    input set_tx_data,
    input [7:0] tx_data_input,
    input start_tx,
    output tx_empty,
    output tx_line
);

reg [7:0] tx_data;
reg [2:0] tx_counter = 7;
assign tx_empty = tx_counter == 0;
assign tx_line = tx_data[0];

always @(posedge clock)
begin
    if (set_tx_data) begin
        tx_data <= tx_data_input;
        tx_counter <= 7;
    end
end

always @(posedge clock)
begin
    if (tx_counter != 0) begin
        tx_data <= tx_data >> 1;
        tx_counter <= tx_counter - 1;
    end
end

endmodule