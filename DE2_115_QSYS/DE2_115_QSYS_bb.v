
module DE2_115_QSYS (
	alt_vip_itc_0_clocked_video_vid_clk,
	alt_vip_itc_0_clocked_video_vid_data,
	alt_vip_itc_0_clocked_video_underflow,
	alt_vip_itc_0_clocked_video_vid_datavalid,
	alt_vip_itc_0_clocked_video_vid_v_sync,
	alt_vip_itc_0_clocked_video_vid_h_sync,
	alt_vip_itc_0_clocked_video_vid_f,
	alt_vip_itc_0_clocked_video_vid_h,
	alt_vip_itc_0_clocked_video_vid_v,
	altpll_0_areset_conduit_export,
	altpll_0_locked_conduit_export,
	clk_clk,
	d8m_clk_clk,
	i2c_opencores_camera_export_scl_pad_io,
	i2c_opencores_camera_export_sda_pad_io,
	i2c_opencores_mipi_export_scl_pad_io,
	i2c_opencores_mipi_export_sda_pad_io,
	key_external_connection_export,
	lcd_external_connection_RS,
	lcd_external_connection_RW,
	lcd_external_connection_data,
	lcd_external_connection_E,
	ledg_external_connection_export,
	mipi_pwdn_n_external_connection_export,
	mipi_reset_n_external_connection_export,
	reset_reset_n,
	sdram_clk_clk,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	sevseg_0_external_connection_export,
	sevseg_1_external_connection_export,
	sevseg_2_external_connection_export,
	sw_external_connection_export,
	terasic_auto_focus_0_conduit_vcm_i2c_scl,
	terasic_auto_focus_0_conduit_vcm_i2c_sda,
	terasic_auto_focus_0_conduit_clk50,
	terasic_camera_0_conduit_end_D,
	terasic_camera_0_conduit_end_FVAL,
	terasic_camera_0_conduit_end_LVAL,
	terasic_camera_0_conduit_end_PIXCLK,
	vga_clk_clk,
	ledr_external_connection_export);	

	input		alt_vip_itc_0_clocked_video_vid_clk;
	output	[23:0]	alt_vip_itc_0_clocked_video_vid_data;
	output		alt_vip_itc_0_clocked_video_underflow;
	output		alt_vip_itc_0_clocked_video_vid_datavalid;
	output		alt_vip_itc_0_clocked_video_vid_v_sync;
	output		alt_vip_itc_0_clocked_video_vid_h_sync;
	output		alt_vip_itc_0_clocked_video_vid_f;
	output		alt_vip_itc_0_clocked_video_vid_h;
	output		alt_vip_itc_0_clocked_video_vid_v;
	input		altpll_0_areset_conduit_export;
	output		altpll_0_locked_conduit_export;
	input		clk_clk;
	output		d8m_clk_clk;
	inout		i2c_opencores_camera_export_scl_pad_io;
	inout		i2c_opencores_camera_export_sda_pad_io;
	inout		i2c_opencores_mipi_export_scl_pad_io;
	inout		i2c_opencores_mipi_export_sda_pad_io;
	input	[3:0]	key_external_connection_export;
	output		lcd_external_connection_RS;
	output		lcd_external_connection_RW;
	inout	[7:0]	lcd_external_connection_data;
	output		lcd_external_connection_E;
	output	[8:0]	ledg_external_connection_export;
	output		mipi_pwdn_n_external_connection_export;
	output		mipi_reset_n_external_connection_export;
	input		reset_reset_n;
	output		sdram_clk_clk;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[31:0]	sdram_wire_dq;
	output	[3:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	output	[7:0]	sevseg_0_external_connection_export;
	output	[7:0]	sevseg_1_external_connection_export;
	output	[15:0]	sevseg_2_external_connection_export;
	input	[9:0]	sw_external_connection_export;
	inout		terasic_auto_focus_0_conduit_vcm_i2c_scl;
	inout		terasic_auto_focus_0_conduit_vcm_i2c_sda;
	input		terasic_auto_focus_0_conduit_clk50;
	input	[11:0]	terasic_camera_0_conduit_end_D;
	input		terasic_camera_0_conduit_end_FVAL;
	input		terasic_camera_0_conduit_end_LVAL;
	input		terasic_camera_0_conduit_end_PIXCLK;
	output		vga_clk_clk;
	output	[17:0]	ledr_external_connection_export;
endmodule
