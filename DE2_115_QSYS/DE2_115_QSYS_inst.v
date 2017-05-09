	DE2_115_QSYS u0 (
		.clk_clk                                (<connected-to-clk_clk>),                                //                         clk.clk
		.led_external_connection_export         (<connected-to-led_external_connection_export>),         //     led_external_connection.export
		.reset_reset_n                          (<connected-to-reset_reset_n>),                          //                       reset.reset_n
		.sdram_clk_clk                          (<connected-to-sdram_clk_clk>),                          //                   sdram_clk.clk
		.vga_clk_clk                            (<connected-to-vga_clk_clk>),                            //                     vga_clk.clk
		.d8m_clk_clk                            (<connected-to-d8m_clk_clk>),                            //                     d8m_clk.clk
		.altpll_0_areset_conduit_export         (<connected-to-altpll_0_areset_conduit_export>),         //     altpll_0_areset_conduit.export
		.altpll_0_locked_conduit_export         (<connected-to-altpll_0_locked_conduit_export>),         //     altpll_0_locked_conduit.export
		.i2c_opencores_mipi_export_scl_pad_io   (<connected-to-i2c_opencores_mipi_export_scl_pad_io>),   //   i2c_opencores_mipi_export.scl_pad_io
		.i2c_opencores_mipi_export_sda_pad_io   (<connected-to-i2c_opencores_mipi_export_sda_pad_io>),   //                            .sda_pad_io
		.i2c_opencores_camera_export_scl_pad_io (<connected-to-i2c_opencores_camera_export_scl_pad_io>), // i2c_opencores_camera_export.scl_pad_io
		.i2c_opencores_camera_export_sda_pad_io (<connected-to-i2c_opencores_camera_export_sda_pad_io>)  //                            .sda_pad_io
	);

