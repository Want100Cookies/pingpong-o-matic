
module DE2_115_QSYS (
	clk_clk,
	key_external_connection_export,
	lcd_external_connection_RS,
	lcd_external_connection_RW,
	lcd_external_connection_data,
	lcd_external_connection_E,
	ledg_external_connection_export,
	ledr_external_connection_export,
	reset_reset_n,
	sevseg_0_external_connection_export,
	sevseg_1_external_connection_export,
	sevseg_2_external_connection_export,
	sw_external_connection_export,
	framebuffer_data_external_connection_export,
	framebuffer_clk_external_connection_export,
	framebuffer_addr_external_connection_export);	

	input		clk_clk;
	input	[3:0]	key_external_connection_export;
	output		lcd_external_connection_RS;
	output		lcd_external_connection_RW;
	inout	[7:0]	lcd_external_connection_data;
	output		lcd_external_connection_E;
	output	[8:0]	ledg_external_connection_export;
	output	[17:0]	ledr_external_connection_export;
	input		reset_reset_n;
	output	[7:0]	sevseg_0_external_connection_export;
	output	[7:0]	sevseg_1_external_connection_export;
	output	[15:0]	sevseg_2_external_connection_export;
	input	[9:0]	sw_external_connection_export;
	output	[18:0]	framebuffer_data_external_connection_export;
	output		framebuffer_clk_external_connection_export;
	output	[23:0]	framebuffer_addr_external_connection_export;
endmodule
