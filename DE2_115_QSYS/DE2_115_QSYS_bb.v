
module DE2_115_QSYS (
	ball_x_external_connection_export,
	ball_y_external_connection_export,
	clk_clk,
	key_external_connection_export,
	lcd_external_connection_RS,
	lcd_external_connection_RW,
	lcd_external_connection_data,
	lcd_external_connection_E,
	ledg_external_connection_export,
	ledr_external_connection_export,
	reset_reset_n,
	score_a_external_connection_export,
	score_b_external_connection_export,
	sevseg_0_external_connection_export,
	sevseg_1_external_connection_export,
	sevseg_2_external_connection_export,
	sw_external_connection_export);	

	input	[5:0]	ball_x_external_connection_export;
	input	[5:0]	ball_y_external_connection_export;
	input		clk_clk;
	input	[3:0]	key_external_connection_export;
	output		lcd_external_connection_RS;
	output		lcd_external_connection_RW;
	inout	[7:0]	lcd_external_connection_data;
	output		lcd_external_connection_E;
	output	[8:0]	ledg_external_connection_export;
	output	[17:0]	ledr_external_connection_export;
	input		reset_reset_n;
	output	[6:0]	score_a_external_connection_export;
	output	[6:0]	score_b_external_connection_export;
	output	[7:0]	sevseg_0_external_connection_export;
	output	[7:0]	sevseg_1_external_connection_export;
	output	[15:0]	sevseg_2_external_connection_export;
	input	[9:0]	sw_external_connection_export;
endmodule
