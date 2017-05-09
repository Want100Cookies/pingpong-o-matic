
module DE2_115_QSYS (
	clk_clk,
	led_external_connection_export,
	reset_reset_n,
	sdram_clk_clk,
	vga_clk_clk,
	d8m_clk_clk,
	altpll_0_areset_conduit_export,
	altpll_0_locked_conduit_export,
	i2c_opencores_mipi_export_scl_pad_io,
	i2c_opencores_mipi_export_sda_pad_io,
	i2c_opencores_camera_export_scl_pad_io,
	i2c_opencores_camera_export_sda_pad_io);	

	input		clk_clk;
	output	[7:0]	led_external_connection_export;
	input		reset_reset_n;
	output		sdram_clk_clk;
	output		vga_clk_clk;
	output		d8m_clk_clk;
	input		altpll_0_areset_conduit_export;
	output		altpll_0_locked_conduit_export;
	inout		i2c_opencores_mipi_export_scl_pad_io;
	inout		i2c_opencores_mipi_export_sda_pad_io;
	inout		i2c_opencores_camera_export_scl_pad_io;
	inout		i2c_opencores_camera_export_sda_pad_io;
endmodule
