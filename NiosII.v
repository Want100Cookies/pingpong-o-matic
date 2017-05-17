module NiosII (
    //////////// CLOCK //////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK_50,

	//////////// Sma //////////
	input 		          		SMA_CLKIN,
	output		          		SMA_CLKOUT,

	//////////// LED //////////
	output		     [8:0]		LEDG,
	output		    [17:0]		LEDR,

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// EX_IO //////////
	inout 		     [6:0]		EX_IO,

	//////////// SW //////////
	input 		    [17:0]		SW,

	//////////// SEG7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,
	output		     [6:0]		HEX6,
	output		     [6:0]		HEX7,

	//////////// LCD //////////
	output		          		LCD_BLON,
	inout 		     [7:0]		LCD_DATA,
	output		          		LCD_EN,
	output		          		LCD_ON,
	output		          		LCD_RS,
	output		          		LCD_RW,

	//////////// RS232 //////////
	input 		          		UART_CTS,
	output		          		UART_RTS,
	input 		          		UART_RXD,
	output		          		UART_TXD,

	//////////// PS2 for Keyboard and Mouse //////////
	inout 		          		PS2_CLK,
	inout 		          		PS2_CLK2,
	inout 		          		PS2_DAT,
	inout 		          		PS2_DAT2,

	//////////// SDCARD //////////
	output		          		SD_CLK,
	inout 		          		SD_CMD,
	inout 		     [3:0]		SD_DAT,
	input 		          		SD_WP_N,

	//////////// VGA //////////
	output		          		VGA_BLANK_N,
	output		     [7:0]		VGA_B,
	output		          		VGA_CLK,
	output		     [7:0]		VGA_G,
	output		          		VGA_HS,
	output		     [7:0]		VGA_R,
	output		          		VGA_SYNC_N,
	output		          		VGA_VS,

	//////////// Audio //////////
	input 		          		AUD_ADCDAT,
	inout 		          		AUD_ADCLRCK,
	inout 		          		AUD_BCLK,
	output		          		AUD_DACDAT,
	inout 		          		AUD_DACLRCK,
	output		          		AUD_XCK,

	//////////// I2C for EEPROM //////////
	output		          		EEP_I2C_SCLK,
	inout 		          		EEP_I2C_SDAT,

	//////////// I2C for Audio Tv-Decoder  //////////
	output		          		I2C_SCLK,
	inout 		          		I2C_SDAT,

	//////////// Ethernet 0 //////////
	output		          		ENET0_GTX_CLK,
	input 		          		ENET0_INT_N,
	input 		          		ENET0_LINK100,
	output		          		ENET0_MDC,
	inout 		          		ENET0_MDIO,
	output		          		ENET0_RST_N,
	input 		          		ENET0_RX_CLK,
	input 		          		ENET0_RX_COL,
	input 		          		ENET0_RX_CRS,
	input 		     [3:0]		ENET0_RX_DATA,
	input 		          		ENET0_RX_DV,
	input 		          		ENET0_RX_ER,
	input 		          		ENET0_TX_CLK,
	output		     [3:0]		ENET0_TX_DATA,
	output		          		ENET0_TX_EN,
	output		          		ENET0_TX_ER,
	input 		          		ENETCLK_25,

	//////////// Ethernet 1 //////////
	output		          		ENET1_GTX_CLK,
	input 		          		ENET1_INT_N,
	input 		          		ENET1_LINK100,
	output		          		ENET1_MDC,
	inout 		          		ENET1_MDIO,
	output		          		ENET1_RST_N,
	input 		          		ENET1_RX_CLK,
	input 		          		ENET1_RX_COL,
	input 		          		ENET1_RX_CRS,
	input 		     [3:0]		ENET1_RX_DATA,
	input 		          		ENET1_RX_DV,
	input 		          		ENET1_RX_ER,
	input 		          		ENET1_TX_CLK,
	output		     [3:0]		ENET1_TX_DATA,
	output		          		ENET1_TX_EN,
	output		          		ENET1_TX_ER,

	//////////// TV Decoder //////////
	input 		          		TD_CLK27,
	input 		     [7:0]		TD_DATA,
	input 		          		TD_HS,
	output		          		TD_RESET_N,
	input 		          		TD_VS,

	//////////// USB 2.0 OTG (Cypress CY7C67200) //////////
	output		     [1:0]		OTG_ADDR,
	output		          		OTG_CS_N,
	inout 		    [15:0]		OTG_DATA,
	input 		          		OTG_INT,
	output		          		OTG_RD_N,
	output		          		OTG_RST_N,
	output		          		OTG_WE_N,

	//////////// IR Receiver //////////
	input 		          		IRDA_RXD,

	//////////// SDRAM //////////
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [31:0]		DRAM_DQ,
	output		     [3:0]		DRAM_DQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_WE_N,

	//////////// SRAM //////////
	output		    [19:0]		SRAM_ADDR,
	output		          		SRAM_CE_N,
	inout 		    [15:0]		SRAM_DQ,
	output		          		SRAM_LB_N,
	output		          		SRAM_OE_N,
	output		          		SRAM_UB_N,
	output		          		SRAM_WE_N,

	//////////// Flash //////////
	output		    [22:0]		FL_ADDR,
	output		          		FL_CE_N,
	inout 		     [7:0]		FL_DQ,
	output		          		FL_OE_N,
	output		          		FL_RST_N,
	input 		          		FL_RY,
	output		          		FL_WE_N,
	output		          		FL_WP_N,

	//////////// GPIO, GPIO connect to D8M-GPIO //////////
	inout 		          		CAMERA_I2C_SCL,
	inout 		          		CAMERA_I2C_SDA,
	output		          		CAMERA_PWDN_n,
	output		          		MIPI_CS_n,
	inout 		          		MIPI_I2C_SCL,
	inout 		          		MIPI_I2C_SDA,
	output		          		MIPI_MCLK,
	input 		          		MIPI_PIXEL_CLK,
	input 		     [9:0]		MIPI_PIXEL_D,
	input 		          		MIPI_PIXEL_HS,
	input 		          		MIPI_PIXEL_VS,
	output		          		MIPI_REFCLK,
	output		          		MIPI_RESET_n
);


//=======================================================
//  REG/WIRE declarations
//=======================================================

// 7 Seg
wire	[7:0]		sevseg_0_binary;
wire	[7:0]		sevseg_1_binary;
wire	[15:0]	sevseg_2_binary;


//=======================================================
//  Structural coding
//=======================================================


assign LCD_ON						= 1'b1;

//NumberDisplay NumberDisplay_0_inst (
//	.binary	(sevseg_0_binary),
//	.DIG0		(HEX6),
//	.DIG1		(HEX7),
//	.DIG2 	(),
//	.DIG3 	()
//);

NumberDisplay NumberDisplay_1_inst (
	.binary	(sevseg_1_binary),
	.DIG0		(HEX4),
	.DIG1		(HEX5),
	.DIG2 	(),
	.DIG3 	()
);

NumberDisplay NumberDisplay_2_inst (
	.binary	(sevseg_2_binary),
	.DIG0		(HEX0),
	.DIG1		(HEX1),
	.DIG2 	(HEX2),
	.DIG3 	(HEX3)
);

DE2_115_QSYS DE2_115_QSYS_inst (
	.clk_clk                                      (CLOCK2_50),								// clk.clk
	.reset_reset_n                                (1'b1),										// reset.reset_n
	
	.key_external_connection_export              (KEY),										// key_external_connection.export
	.sw_external_connection_export               (SW),										// sw_external_connection.export
	
	.ledg_external_connection_export					(LEDG),           //         ledg_external_connection.export
	.ledr_external_connection_export					(LEDR),           //         ledr_external_connection.export

	
	.sevseg_0_external_connection_export			(sevseg_0_binary),
	.sevseg_1_external_connection_export			(sevseg_1_binary),
	.sevseg_2_external_connection_export			(),
	
	.lcd_external_connection_RS                	(LCD_RS),                //          lcd_external_connection.RS
	.lcd_external_connection_RW						(LCD_RW),                //                                 .RW
	.lcd_external_connection_data              	(LCD_DATA),              //                                 .data
   .lcd_external_connection_E							(LCD_EN),                  //                                 .E
	
	.camera_blue_in_external_connection_export  (), //(VGA_B),  //  camera_blue_in_external_connection.export
	.camera_green_in_external_connection_export (), //(VGA_G), // camera_green_in_external_connection.export
	.camera_red_in_external_connection_export   (), //(VGA_R)   //   camera_red_in_external_connection.export
);

// CAMERA SHIZZLE

//=============================================================================
// REG/WIRE declarations
//=============================================================================


wire	[15:0]SDRAM_RD_DATA;
wire			DLY_RST_0;
wire			DLY_RST_1;
wire			DLY_RST_2;

wire			SDRAM_CTRL_CLK;
wire        D8M_CK_HZ ; 
wire        D8M_CK_HZ2 ; 
wire        D8M_CK_HZ3 ; 

wire [11:0] RED   ; 
wire [11:0] GREEN  ; 
wire [11:0] BLUE 		 ; 
wire [12:0] VGA_H_CNT;			
wire [12:0] VGA_V_CNT;	

assign sevseg_2_binary = VGA_V_CNT;

wire        READ_Request ;
wire 	[7:0] B_AUTO;
wire 	[7:0] G_AUTO;
wire 	[7:0] R_AUTO;
wire        RESET_N  ; 

wire        I2C_RELEASE ;  
wire        AUTO_FOC ; 
wire        CAMERA_I2C_SCL_MIPI ; 
wire        CAMERA_I2C_SCL_AF;
wire        CAMERA_MIPI_RELEASE ;
wire        MIPI_BRIDGE_RELEASE ; 
  wire   [9:0]MIPI_PIXEL_D_ ;
  wire        MIPI_PIXEL_VS_; 
  wire        MIPI_PIXEL_HS_;  
 
//=============================================================================
// Structural coding
//=============================================================================
assign UART_RTS =0; 
assign UART_TXD =0; 
//------HEX OFF --
//assign HEX2           = 7'h7F;
//assign HEX3           = 7'h7F;
//assign HEX4           = 7'h7F;
//assign HEX5           = 7'h7F;
//assign HEX6           = 7'h7F;
//assign HEX7           = 7'h7F;

//------ MIPI BRIGE & CAMERA RESET  --
assign CAMERA_PWDN_n  = 1; 
assign MIPI_CS_n      = 0; 
assign MIPI_RESET_n   = RESET_N ;

//------ CAMERA MODULE I2C SWITCH  --
assign I2C_RELEASE    = CAMERA_MIPI_RELEASE & MIPI_BRIDGE_RELEASE; 
assign CAMERA_I2C_SCL =( I2C_RELEASE  )?  CAMERA_I2C_SCL_AF  : CAMERA_I2C_SCL_MIPI ;   
 

//----- RESET RELAY  --		
RESET_DELAY			u2	(	
							.iRST  ( KEY[0] ),
                     .iCLK  ( CLOCK2_50 ),
							.oRST_0( DLY_RST_0 ),
							.oRST_1( DLY_RST_1 ),
							.oRST_2( DLY_RST_2 ),					
						   .oREADY( RESET_N)  
							
						);
 
//------ MIPI BRIGE & CAMERA SETTING  --  
MIPI_BRIDGE_CAMERA_Config    cfin(
                      .RESET_N           ( RESET_N ), 
                      .CLK_50            ( CLOCK2_50 ), 
                      .MIPI_I2C_SCL      ( MIPI_I2C_SCL ), 
                      .MIPI_I2C_SDA      ( MIPI_I2C_SDA ), 
                      .MIPI_I2C_RELEASE  ( MIPI_BRIDGE_RELEASE ),  
                      .CAMERA_I2C_SCL    ( CAMERA_I2C_SCL_MIPI ),
                      .CAMERA_I2C_SDA    ( CAMERA_I2C_SDA ),
                      .CAMERA_I2C_RELAESE( CAMERA_MIPI_RELEASE )
             );
				 
//------MIPI / VGA REF CLOCK  --
pll_test pll_ref(
	                   .inclk0 ( CLOCK2_50 ),
	                   .areset ( ~KEY[0] ),
	                   .c0( MIPI_REFCLK ), //20Mhz
	                   .c1( VGA_CLK )      //25.18Mhz	
    );
	 
	 

//---RE-TRIGGER ---
RE_TRIGGER  tr( 
       .iCLK (MIPI_PIXEL_CLK ), 
       .iD   (MIPI_PIXEL_D   ), 
       .iHS  (MIPI_PIXEL_HS  ),
       .iVS  (MIPI_PIXEL_VS  ),	
		 
       .oD   (MIPI_PIXEL_D_  ), 
       .oHS  (MIPI_PIXEL_HS_ ),
       .oVS  (MIPI_PIXEL_VS_ )
);	 
	 
//------AOTO FOCUS ENABLE  --
AUTO_FOCUS_ON  vd( 
                      .CLK_50      ( CLOCK2_50 ), 
                      .I2C_RELEASE ( I2C_RELEASE ), 
                      .AUTO_FOC    ( AUTO_FOC )
               ) ;
					

//------AOTO FOCUS ADJ  --
FOCUS_ADJ adl(
                      .CLK_50        ( CLOCK2_50 ) , 
                      .RESET_N       ( I2C_RELEASE ), 
                      .RESET_SUB_N   ( I2C_RELEASE ), 
                      .AUTO_FOC      ( KEY[3] & AUTO_FOC ), 
                      .SW_Y          ( 0 ),
                      .SW_H_FREQ     ( 0 ),   
                      .SW_FUC_LINE   ( SW[3] ),   
                      .SW_FUC_ALL_CEN( 0 ),
                      .VIDEO_HS      ( VGA_HS ),
                      .VIDEO_VS      ( VGA_VS ),
                      .VIDEO_CLK     ( VGA_CLK ),
		                .VIDEO_DE      (READ_Request) ,
                      .iR            ( R_AUTO ), 
                      .iG            ( G_AUTO ), 
                      .iB            ( B_AUTO ), 
                      .oR            ( VGA_R ) , 
                      .oG            ( VGA_G ) , 
                      .oB            ( VGA_B ) , 
                      
                      .READY         ( READY ),
                      .SCL           ( CAMERA_I2C_SCL_AF ), 
                      .SDA           ( CAMERA_I2C_SDA )
);

//------VGA Controller  --

VGA_Controller		u1	(	//	Host Side
							 .oRequest( READ_Request ),
							 .iRed    ( RED   [11:4] ),
							 .iGreen  ( GREEN [11:4] ),
							 .iBlue   ( BLUE  [11:4] ),
							 
							 //	VGA Side
							 .oVGA_R  ( R_AUTO[7:0] ),
							 .oVGA_G  ( G_AUTO[7:0] ),
							 .oVGA_B  ( B_AUTO[7:0] ),
							 .oVGA_H_SYNC( VGA_HS ),
							 .oVGA_V_SYNC( VGA_VS ),
							 .oVGA_SYNC  ( VGA_SYNC_N ),
							 .oVGA_BLANK ( VGA_BLANK_N ),
							 //	Control Signal
							 .iCLK       ( VGA_CLK ),
							 .iRST_N     ( DLY_RST_2 ),
							 .H_Cont     ( VGA_H_CNT ),						
						    .V_Cont     ( VGA_V_CNT )								
						);	



//------SDRAM CLOCK GENNERATER  --
sdram_pll u6(
		               .areset( 0 ) ,     
		               .inclk0( CLOCK2_50  ),              
		               .c1    ( DRAM_CLK ),       //100MHZ   -90 degree
		               .c0    ( SDRAM_CTRL_CLK )  //100MHZ     0 degree 							
		              
	               );	
		
//------SDRAM CONTROLLER --

Sdram_Control	   u7	(	//	HOST Side						
						   .RESET_N     ( KEY[0] ),
							.CLK         ( SDRAM_CTRL_CLK ) , 
							//	FIFO Write Side 1
							.WR1_DATA    ( MIPI_PIXEL_D[9:0] ),
							.WR1         ( MIPI_PIXEL_HS & MIPI_PIXEL_VS ) ,
							
							.WR1_ADDR    ( 0 ),
                     .WR1_MAX_ADDR( 640*480 ),
						   .WR1_LENGTH  ( 256 ) , 
		               .WR1_LOAD    ( !DLY_RST_0 ),
							.WR1_CLK     ( MIPI_PIXEL_CLK ),

                     //	FIFO Read Side 1
						   .RD1_DATA    ( SDRAM_RD_DATA[9:0] ),
				        	.RD1         ( READ_Request ),
				        	.RD1_ADDR    (0 ),
                     .RD1_MAX_ADDR( 640*480 ),
							.RD1_LENGTH  ( 256  ),
							.RD1_LOAD    ( !DLY_RST_1 ),
							.RD1_CLK     ( VGA_CLK ),
											
							//	SDRAM Side
						   .SA          ( DRAM_ADDR ),
							.BA          ( DRAM_BA ),
							.CS_N        ( DRAM_CS_N ),
							.CKE         ( DRAM_CKE ),
							.RAS_N       ( DRAM_RAS_N ),
							.CAS_N       ( DRAM_CAS_N ),
							.WE_N        ( DRAM_WE_N ),
							.DQ          ( DRAM_DQ ),
							.DQM         ( DRAM_DQM  )
						   );

													
		
//------ CMOS CCD_DATA TO RGB_DATA -- 

RAW2RGB_J				u4	(	
							.RST          ( VGA_VS ),
                     .CCD_PIXCLK   ( VGA_CLK ),
							.mCCD_DATA    ( {SDRAM_RD_DATA[9:0] ,2'b00  }  ),
							.CCD_FVAL     ( VGA_VS ),
							.CCD_LVAL     ( VGA_HS ),

							//-----------------------------------
                     .VGA_CLK      ( VGA_CLK ),
                     .READ_Request ( READ_Request ),
                     .VGA_VS       ( VGA_VS ),	
							.VGA_HS       ( VGA_HS ) , 
	                  .READ_Cont    ( READ_Cont ) , 
	                  .V_Cont       (), 
	                  			
							.oRed         ( RED  [11:0] ),
							.oGreen       ( GREEN[11:0] ),
							.oBlue        ( BLUE [11:0] ),
							.oDVAL        ( )

							);

//------VS FREQUENCY TEST = 60HZ --
							
FpsMonitor uFps( 
	/*input					  */     .clk50    ( CLOCK2_50 ),
	/*input     			  */     .vs       ( MIPI_PIXEL_VS_ ),
	
	/*output reg [7:0]		*/    .fps      (),
	/*output reg [6:0]		*/    .hex_fps_h( HEX7 ),
	/*output reg [6:0]		*/    .hex_fps_l( HEX6 )
);


//--LED DISPLAY--
CLOCKMEM  ck1 ( .CLK(VGA_CLK )   ,.CLK_FREQ  (25000000  ) , . CK_1HZ (D8M_CK_HZ   )  )        ;//25MHZ
CLOCKMEM  ck2 ( .CLK(MIPI_REFCLK   )   ,.CLK_FREQ  (20000000   ) , . CK_1HZ (D8M_CK_HZ2  )  ) ;//20MHZ
CLOCKMEM  ck3 ( .CLK(MIPI_PIXEL_CLK)   ,.CLK_FREQ  (25000000  ) , . CK_1HZ (D8M_CK_HZ3  )  )  ;//25MHZ

endmodule 