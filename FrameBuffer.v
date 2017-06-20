`include "V/VGA_Param.h"

parameter VGA_WIDTH = 640;
parameter VGA_HEIGHT = 480;

parameter DATA_WIDTH = 2;
parameter ADDR_WIDTH = 2;

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

/*
reg	[18:0]	read_addr;
reg				read_clk;
reg	[1:0]	val;
*/

reg [DATA_WIDTH-1:0] ram[ADDR_WIDTH-1:0];

/*
simple_dual_port_ram_dual_clock FrameBuffer_ram_inst (
	.data				(WRITE_DATA[1:0]),
	.read_addr		(read_addr),
	.write_addr		(WRITE_ADDR),
	.we				(1),
	.read_clock		(read_clk),
	.write_clock	(WRITE_CLK),
	.q					(val)
);
*/

/*
assign read_clk = ~VGA_CLK;

assign VGA_R_OUT = val > 0 ? 255 : VGA_R_IN;
assign VGA_G_OUT = val > 0 ? 0 : VGA_G_IN;
assign VGA_B_OUT = val > 0 ? 255 : VGA_B_IN;

assign read_addr =  (H_CNT > X_START ? ((H_CNT - X_START) > VGA_WIDTH ? VGA_WIDTH : (H_CNT - X_START)) : 0) + // x
							(V_CNT > Y_START ? ((V_CNT - Y_START) > VGA_HEIGHT ? VGA_HEIGHT : (V_CNT - Y_START)) : 0) * VGA_WIDTH; // y
*/


always @(posedge WRITE_CLK) begin
	ram[WRITE_ADDR[1:0]] <= WRITE_DATA[1:0];
end

always @(posedge VGA_CLK) begin
	reg [7:0] x;
	reg [7:0] y;
	reg [7:0] val;
	//reg [DATA_WIDTH-1:0] val;
	
	x <= H_CNT > X_START ? H_CNT - X_START : 0;
	y <= V_CNT > Y_START ? V_CNT - Y_START : 0;
	
	if (x > VGA_WIDTH) x <= VGA_WIDTH;
	if (y > VGA_HEIGHT) y <= VGA_HEIGHT;
	
	/*
	if (x < (VGA_WIDTH / 2)) begin
		x <= 0;
	end else begin
		x <= 1;
	end
	
	if (y < (VGA_HEIGHT / 2)) begin
		y <= 0;
	end else begin
		y <= 1;
	end
	*/
	
	/*
	x <= x / (VGA_WIDTH / 2);
	y <= y / (VGA_HEIGHT / 2);
	*/
	
	//val <= ram[x + y * 2];
	
	//if (val == 0) begin
	/*
	if ((x + y * 2) == 0) begin
		VGA_R_OUT = 255;
		VGA_G_OUT = 0;
		VGA_B_OUT = 255;
	end else begin
		VGA_R_OUT = VGA_R_IN;
		VGA_G_OUT = VGA_G_IN;
		VGA_B_OUT = VGA_B_IN;
	end
	*/

	/*
	if (y < 120) begin
		val = 0;
	end else if (y < 240) begin
		val = 64;
	end else if (y < 360) begin
		val = 128;
	end else if (y < 480) begin
		val = 196;
	end
	*/
	
	VGA_R_OUT <= x;
	VGA_R_OUT <= 0;
	VGA_B_OUT <= y;
	
	/*
	if (x < 160) begin
		VGA_R_OUT <= 255;
		VGA_G_OUT <= 0;
		VGA_B_OUT <= 0;
	end else if (x < 320) begin
		VGA_R_OUT <= 0;
		VGA_G_OUT <= 255;
		VGA_B_OUT <= 0;
	end else if (x < 480) begin
		VGA_R_OUT <= 0;
		VGA_G_OUT <= 0;
		VGA_B_OUT <= 255;
	end else if (x < 640) begin
		VGA_R_OUT <= 255;
		VGA_G_OUT <= 255;
		VGA_B_OUT <= 0;
	end
	*/
end

endmodule
