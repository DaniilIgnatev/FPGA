


INPUT reset;
INPUT pop;
INPUT push;
INPUT clk;
INPUT write_data[0];
INPUT write_data[1];
INPUT write_data[2];
INPUT write_data[3];
OUTPUT read_data[0];
OUTPUT read_data[1];
OUTPUT read_data[2];
OUTPUT read_data[3];

/*Arc definitions start here*/
pos_pop__clk__setup:		SETUP (POSEDGE) pop clk ;
pos_push__clk__setup:		SETUP (POSEDGE) push clk ;
pos_reset__clk__setup:		SETUP (POSEDGE) reset clk ;
pos_write_data[0]__clk__setup:		SETUP (POSEDGE) write_data[0] clk ;
pos_write_data[1]__clk__setup:		SETUP (POSEDGE) write_data[1] clk ;
pos_write_data[2]__clk__setup:		SETUP (POSEDGE) write_data[2] clk ;
pos_write_data[3]__clk__setup:		SETUP (POSEDGE) write_data[3] clk ;
pos_pop__clk__hold:		HOLD (POSEDGE) pop clk ;
pos_push__clk__hold:		HOLD (POSEDGE) push clk ;
pos_reset__clk__hold:		HOLD (POSEDGE) reset clk ;
pos_write_data[0]__clk__hold:		HOLD (POSEDGE) write_data[0] clk ;
pos_write_data[1]__clk__hold:		HOLD (POSEDGE) write_data[1] clk ;
pos_write_data[2]__clk__hold:		HOLD (POSEDGE) write_data[2] clk ;
pos_write_data[3]__clk__hold:		HOLD (POSEDGE) write_data[3] clk ;
pos_clk__read_data[0]__delay:		DELAY (POSEDGE) clk read_data[0] ;
pos_clk__read_data[1]__delay:		DELAY (POSEDGE) clk read_data[1] ;
pos_clk__read_data[2]__delay:		DELAY (POSEDGE) clk read_data[2] ;
pos_clk__read_data[3]__delay:		DELAY (POSEDGE) clk read_data[3] ;

ENDMODEL
