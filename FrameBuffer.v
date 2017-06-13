module FrameBuffer (
	input             VGA_CLK   ,
	input      [ 7:0] VGA_R_IN  ,
	input      [ 7:0] VGA_G_IN  ,
	input      [ 7:0] VGA_B_IN  ,
	input      [12:0] H_CNT     ,
	input      [12:0] V_CNT     ,
	input             WRITE_CLK ,
	input      [18:0] WRITE_ADDR,
	input      [23:0] WRITE_DATA,
	output reg [ 7:0] VGA_R_OUT ,
	output reg [ 7:0] VGA_G_OUT ,
	output reg [ 7:0] VGA_B_OUT
);

	`include "V/VGA_Param.h"

	reg [18:0] read_addr;
	reg        read_clk ;
	reg [ 1:0] val      ;

	simple_dual_port_ram_dual_clock FrameBuffer_ram_inst (
		.data       (WRITE_DATA[1:0]),
		.read_addr  (read_addr      ),
		.write_addr (WRITE_ADDR     ),
		.we         (1              ),
		.read_clock (read_clk       ),
		.write_clock(WRITE_CLK      ),
		.q          (val            )
	);

	assign read_clk = ~VGA_CLK;

	assign VGA_R_OUT = val ? 255 : VGA_R_IN;
	assign VGA_G_OUT = val ? 0 : VGA_G_IN;
	assign VGA_B_OUT = val ? 255 : VGA_B_IN;

	assign read_addr = (H_CNT > X_START ? ((H_CNT - X_START) > VGA_WIDTH ? VGA_WIDTH : (H_CNT - X_START)) : 0) + // x
		(V_CNT > Y_START ? ((V_CNT - Y_START) > VGA_HEIGHT ? VGA_HEIGHT : (V_CNT - Y_START)) : 0) * VGA_WIDTH; // y

endmodule
