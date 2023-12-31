// cic_ii_0_example_design_tb.v

// Generated using ACDS version 20.1 711

`timescale 1 ps / 1 ps
module cic_ii_0_example_design_tb (
	);

	wire         cic_ii_0_example_design_inst_core_av_st_out_valid;        // cic_ii_0_example_design_inst:core_av_st_out_valid -> cic_ii_0_example_design_inst_core_av_st_out_bfm:sink_valid
	wire  [40:0] cic_ii_0_example_design_inst_core_av_st_out_data;         // cic_ii_0_example_design_inst:core_av_st_out_data -> cic_ii_0_example_design_inst_core_av_st_out_bfm:sink_data
	wire         cic_ii_0_example_design_inst_core_av_st_out_ready;        // cic_ii_0_example_design_inst_core_av_st_out_bfm:sink_ready -> cic_ii_0_example_design_inst:core_av_st_out_ready
	wire   [1:0] cic_ii_0_example_design_inst_core_av_st_out_error;        // cic_ii_0_example_design_inst:core_av_st_out_error -> cic_ii_0_example_design_inst_core_av_st_out_bfm:sink_error
	wire   [0:0] cic_ii_0_example_design_inst_core_av_st_in_bfm_src_valid; // cic_ii_0_example_design_inst_core_av_st_in_bfm:src_valid -> cic_ii_0_example_design_inst:core_av_st_in_valid
	wire   [7:0] cic_ii_0_example_design_inst_core_av_st_in_bfm_src_data;  // cic_ii_0_example_design_inst_core_av_st_in_bfm:src_data -> cic_ii_0_example_design_inst:core_av_st_in_data
	wire         cic_ii_0_example_design_inst_core_av_st_in_bfm_src_ready; // cic_ii_0_example_design_inst:core_av_st_in_ready -> cic_ii_0_example_design_inst_core_av_st_in_bfm:src_ready
	wire   [1:0] cic_ii_0_example_design_inst_core_av_st_in_bfm_src_error; // cic_ii_0_example_design_inst_core_av_st_in_bfm:src_error -> cic_ii_0_example_design_inst:core_av_st_in_error
	wire         cic_ii_0_example_design_inst_core_clock_bfm_clk_clk;      // cic_ii_0_example_design_inst_core_clock_bfm:clk -> [cic_ii_0_example_design_inst:core_clock_clk, cic_ii_0_example_design_inst_core_av_st_in_bfm:clk, cic_ii_0_example_design_inst_core_av_st_out_bfm:clk, cic_ii_0_example_design_inst_core_reset_bfm:clk]
	wire         cic_ii_0_example_design_inst_core_reset_bfm_reset_reset;  // cic_ii_0_example_design_inst_core_reset_bfm:reset -> [cic_ii_0_example_design_inst:core_reset_reset_n, cic_ii_0_example_design_inst_core_av_st_in_bfm:reset, cic_ii_0_example_design_inst_core_av_st_out_bfm:reset]

	cic_ii_0_example_design cic_ii_0_example_design_inst (
		.core_av_st_in_error  (cic_ii_0_example_design_inst_core_av_st_in_bfm_src_error), //  core_av_st_in.error
		.core_av_st_in_valid  (cic_ii_0_example_design_inst_core_av_st_in_bfm_src_valid), //               .valid
		.core_av_st_in_ready  (cic_ii_0_example_design_inst_core_av_st_in_bfm_src_ready), //               .ready
		.core_av_st_in_data   (cic_ii_0_example_design_inst_core_av_st_in_bfm_src_data),  //               .data
		.core_av_st_out_data  (cic_ii_0_example_design_inst_core_av_st_out_data),         // core_av_st_out.data
		.core_av_st_out_error (cic_ii_0_example_design_inst_core_av_st_out_error),        //               .error
		.core_av_st_out_valid (cic_ii_0_example_design_inst_core_av_st_out_valid),        //               .valid
		.core_av_st_out_ready (cic_ii_0_example_design_inst_core_av_st_out_ready),        //               .ready
		.core_clock_clk       (cic_ii_0_example_design_inst_core_clock_bfm_clk_clk),      //     core_clock.clk
		.core_reset_reset_n   (cic_ii_0_example_design_inst_core_reset_bfm_reset_reset)   //     core_reset.reset_n
	);

	altera_avalon_st_source_bfm #(
		.USE_PACKET       (0),
		.USE_CHANNEL      (0),
		.USE_ERROR        (1),
		.USE_READY        (1),
		.USE_VALID        (1),
		.USE_EMPTY        (0),
		.ST_SYMBOL_W      (8),
		.ST_NUMSYMBOLS    (1),
		.ST_CHANNEL_W     (1),
		.ST_ERROR_W       (2),
		.ST_EMPTY_W       (1),
		.ST_READY_LATENCY (0),
		.ST_BEATSPERCYCLE (1),
		.ST_MAX_CHANNELS  (0),
		.VHDL_ID          (0)
	) cic_ii_0_example_design_inst_core_av_st_in_bfm (
		.clk               (cic_ii_0_example_design_inst_core_clock_bfm_clk_clk),      //       clk.clk
		.reset             (~cic_ii_0_example_design_inst_core_reset_bfm_reset_reset), // clk_reset.reset
		.src_data          (cic_ii_0_example_design_inst_core_av_st_in_bfm_src_data),  //       src.data
		.src_valid         (cic_ii_0_example_design_inst_core_av_st_in_bfm_src_valid), //          .valid
		.src_ready         (cic_ii_0_example_design_inst_core_av_st_in_bfm_src_ready), //          .ready
		.src_error         (cic_ii_0_example_design_inst_core_av_st_in_bfm_src_error), //          .error
		.src_startofpacket (),                                                         // (terminated)
		.src_endofpacket   (),                                                         // (terminated)
		.src_empty         (),                                                         // (terminated)
		.src_channel       ()                                                          // (terminated)
	);

	altera_avalon_st_sink_bfm #(
		.USE_PACKET       (0),
		.USE_CHANNEL      (0),
		.USE_ERROR        (1),
		.USE_READY        (1),
		.USE_VALID        (1),
		.USE_EMPTY        (0),
		.ST_SYMBOL_W      (41),
		.ST_NUMSYMBOLS    (1),
		.ST_CHANNEL_W     (1),
		.ST_ERROR_W       (2),
		.ST_EMPTY_W       (1),
		.ST_READY_LATENCY (0),
		.ST_BEATSPERCYCLE (1),
		.ST_MAX_CHANNELS  (0),
		.VHDL_ID          (0)
	) cic_ii_0_example_design_inst_core_av_st_out_bfm (
		.clk                (cic_ii_0_example_design_inst_core_clock_bfm_clk_clk),      //       clk.clk
		.reset              (~cic_ii_0_example_design_inst_core_reset_bfm_reset_reset), // clk_reset.reset
		.sink_data          (cic_ii_0_example_design_inst_core_av_st_out_data),         //      sink.data
		.sink_valid         (cic_ii_0_example_design_inst_core_av_st_out_valid),        //          .valid
		.sink_ready         (cic_ii_0_example_design_inst_core_av_st_out_ready),        //          .ready
		.sink_error         (cic_ii_0_example_design_inst_core_av_st_out_error),        //          .error
		.sink_startofpacket (1'b0),                                                     // (terminated)
		.sink_endofpacket   (1'b0),                                                     // (terminated)
		.sink_empty         (1'b0),                                                     // (terminated)
		.sink_channel       (1'b0)                                                      // (terminated)
	);

	altera_avalon_clock_source #(
		.CLOCK_RATE (50000000),
		.CLOCK_UNIT (1)
	) cic_ii_0_example_design_inst_core_clock_bfm (
		.clk (cic_ii_0_example_design_inst_core_clock_bfm_clk_clk)  // clk.clk
	);

	altera_avalon_reset_source #(
		.ASSERT_HIGH_RESET    (0),
		.INITIAL_RESET_CYCLES (50)
	) cic_ii_0_example_design_inst_core_reset_bfm (
		.reset (cic_ii_0_example_design_inst_core_reset_bfm_reset_reset), // reset.reset_n
		.clk   (cic_ii_0_example_design_inst_core_clock_bfm_clk_clk)      //   clk.clk
	);

endmodule
