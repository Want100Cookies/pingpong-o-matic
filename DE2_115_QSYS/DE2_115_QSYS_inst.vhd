	component DE2_115_QSYS is
		port (
			clk_clk                                    : in    std_logic                     := 'X';             -- clk
			key_external_connection_export             : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			lcd_external_connection_RS                 : out   std_logic;                                        -- RS
			lcd_external_connection_RW                 : out   std_logic;                                        -- RW
			lcd_external_connection_data               : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- data
			lcd_external_connection_E                  : out   std_logic;                                        -- E
			ledg_external_connection_export            : out   std_logic_vector(8 downto 0);                     -- export
			ledr_external_connection_export            : out   std_logic_vector(17 downto 0);                    -- export
			reset_reset_n                              : in    std_logic                     := 'X';             -- reset_n
			sevseg_0_external_connection_export        : out   std_logic_vector(7 downto 0);                     -- export
			sevseg_1_external_connection_export        : out   std_logic_vector(7 downto 0);                     -- export
			sevseg_2_external_connection_export        : out   std_logic_vector(15 downto 0);                    -- export
			sw_external_connection_export              : in    std_logic_vector(9 downto 0)  := (others => 'X'); -- export
			camera_red_in_external_connection_export   : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			camera_green_in_external_connection_export : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			camera_blue_in_external_connection_export  : in    std_logic_vector(7 downto 0)  := (others => 'X')  -- export
		);
	end component DE2_115_QSYS;

	u0 : component DE2_115_QSYS
		port map (
			clk_clk                                    => CONNECTED_TO_clk_clk,                                    --                                 clk.clk
			key_external_connection_export             => CONNECTED_TO_key_external_connection_export,             --             key_external_connection.export
			lcd_external_connection_RS                 => CONNECTED_TO_lcd_external_connection_RS,                 --             lcd_external_connection.RS
			lcd_external_connection_RW                 => CONNECTED_TO_lcd_external_connection_RW,                 --                                    .RW
			lcd_external_connection_data               => CONNECTED_TO_lcd_external_connection_data,               --                                    .data
			lcd_external_connection_E                  => CONNECTED_TO_lcd_external_connection_E,                  --                                    .E
			ledg_external_connection_export            => CONNECTED_TO_ledg_external_connection_export,            --            ledg_external_connection.export
			ledr_external_connection_export            => CONNECTED_TO_ledr_external_connection_export,            --            ledr_external_connection.export
			reset_reset_n                              => CONNECTED_TO_reset_reset_n,                              --                               reset.reset_n
			sevseg_0_external_connection_export        => CONNECTED_TO_sevseg_0_external_connection_export,        --        sevseg_0_external_connection.export
			sevseg_1_external_connection_export        => CONNECTED_TO_sevseg_1_external_connection_export,        --        sevseg_1_external_connection.export
			sevseg_2_external_connection_export        => CONNECTED_TO_sevseg_2_external_connection_export,        --        sevseg_2_external_connection.export
			sw_external_connection_export              => CONNECTED_TO_sw_external_connection_export,              --              sw_external_connection.export
			camera_red_in_external_connection_export   => CONNECTED_TO_camera_red_in_external_connection_export,   --   camera_red_in_external_connection.export
			camera_green_in_external_connection_export => CONNECTED_TO_camera_green_in_external_connection_export, -- camera_green_in_external_connection.export
			camera_blue_in_external_connection_export  => CONNECTED_TO_camera_blue_in_external_connection_export   --  camera_blue_in_external_connection.export
		);

