`include "V/VGA_Param.h"

parameter VGA_WIDTH = 640;
parameter VGA_HEIGHT = 480;

module FrameBuffer(
	input						VGA_CLK,
	input			[7:0]		VGA_R_IN,
	input			[7:0]		VGA_G_IN,
	input			[7:0]		VGA_B_IN,
	input			[12:0]	H_CNT,
	input			[12:0]	V_CNT,
	
	input						WRITE_CLK,
	input			[18:0]	WRITE_ADDR,
	input			[23:0]	WRITE_DATA,
	
	output reg		[7:0]		VGA_R_OUT,
	output reg		[7:0]		VGA_G_OUT,
	output reg		[7:0]		VGA_B_OUT
);

reg	[18:0]	read_addr;
reg				read_clk;
reg	[23:0]	val;

simple_dual_port_ram_dual_clock FrameBuffer_ram_inst (
	.data				(WRITE_DATA),
	.read_addr		(read_addr),
	.write_addr		(WRITE_ADDR),
	.we				(1),
	.read_clock		(read_clk),
	.write_clock	(WRITE_CLK),
	.q					(val)
);

always @(posedge VGA_CLK) begin
	reg [7:0] x;
	reg [7:0] y;
	
	x = H_CNT > X_START ? H_CNT - X_START : 0;
	y = V_CNT > Y_START ? V_CNT - Y_START : 0;
	
	if (x > VGA_WIDTH) x = VGA_WIDTH;
	if (y > VGA_HEIGHT) y = VGA_HEIGHT;
	
	read_addr = x + y * VGA_WIDTH;
	read_clk = 1;
	
	if (val > 0) begin
		VGA_R_OUT = val[7:0];
		VGA_G_OUT = val[15:8];
		VGA_B_OUT = val[23:16];
	end else begin
		VGA_R_OUT = VGA_R_IN;
		VGA_G_OUT = VGA_G_IN;
		VGA_B_OUT = VGA_B_IN;
	end
	
	read_clk = 0;

	/*
	if (H_CNT < X_START + 200 && V_CNT < Y_START + 200) begin
		VGA_R_OUT = 255;
		VGA_G_OUT = 0;
		VGA_B_OUT = 0;
	end else if (H_CNT < X_START + 200) begin
		VGA_R_OUT = 0;
		VGA_G_OUT = 255;
		VGA_B_OUT = 0;
	end else if (V_CNT < Y_START + 200) begin
		VGA_R_OUT = 0;
		VGA_G_OUT = 0;
		VGA_B_OUT = 255;
	end else begin
		VGA_R_OUT = VGA_R_IN;
		VGA_G_OUT = VGA_G_IN;
		VGA_B_OUT = VGA_B_IN;
	end
	*/
end

endmodule
