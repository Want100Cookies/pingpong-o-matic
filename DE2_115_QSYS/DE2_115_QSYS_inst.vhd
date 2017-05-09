	component DE2_115_QSYS is
		port (
			clk_clk                                : in    std_logic                    := 'X'; -- clk
			led_external_connection_export         : out   std_logic_vector(7 downto 0);        -- export
			reset_reset_n                          : in    std_logic                    := 'X'; -- reset_n
			sdram_clk_clk                          : out   std_logic;                           -- clk
			vga_clk_clk                            : out   std_logic;                           -- clk
			d8m_clk_clk                            : out   std_logic;                           -- clk
			altpll_0_areset_conduit_export         : in    std_logic                    := 'X'; -- export
			altpll_0_locked_conduit_export         : out   std_logic;                           -- export
			i2c_opencores_mipi_export_scl_pad_io   : inout std_logic                    := 'X'; -- scl_pad_io
			i2c_opencores_mipi_export_sda_pad_io   : inout std_logic                    := 'X'; -- sda_pad_io
			i2c_opencores_camera_export_scl_pad_io : inout std_logic                    := 'X'; -- scl_pad_io
			i2c_opencores_camera_export_sda_pad_io : inout std_logic                    := 'X'  -- sda_pad_io
		);
	end component DE2_115_QSYS;

	u0 : component DE2_115_QSYS
		port map (
			clk_clk                                => CONNECTED_TO_clk_clk,                                --                         clk.clk
			led_external_connection_export         => CONNECTED_TO_led_external_connection_export,         --     led_external_connection.export
			reset_reset_n                          => CONNECTED_TO_reset_reset_n,                          --                       reset.reset_n
			sdram_clk_clk                          => CONNECTED_TO_sdram_clk_clk,                          --                   sdram_clk.clk
			vga_clk_clk                            => CONNECTED_TO_vga_clk_clk,                            --                     vga_clk.clk
			d8m_clk_clk                            => CONNECTED_TO_d8m_clk_clk,                            --                     d8m_clk.clk
			altpll_0_areset_conduit_export         => CONNECTED_TO_altpll_0_areset_conduit_export,         --     altpll_0_areset_conduit.export
			altpll_0_locked_conduit_export         => CONNECTED_TO_altpll_0_locked_conduit_export,         --     altpll_0_locked_conduit.export
			i2c_opencores_mipi_export_scl_pad_io   => CONNECTED_TO_i2c_opencores_mipi_export_scl_pad_io,   --   i2c_opencores_mipi_export.scl_pad_io
			i2c_opencores_mipi_export_sda_pad_io   => CONNECTED_TO_i2c_opencores_mipi_export_sda_pad_io,   --                            .sda_pad_io
			i2c_opencores_camera_export_scl_pad_io => CONNECTED_TO_i2c_opencores_camera_export_scl_pad_io, -- i2c_opencores_camera_export.scl_pad_io
			i2c_opencores_camera_export_sda_pad_io => CONNECTED_TO_i2c_opencores_camera_export_sda_pad_io  --                            .sda_pad_io
		);

