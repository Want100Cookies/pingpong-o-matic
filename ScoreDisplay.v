module ScoreDisplay(
	input		[6:0]	ScoreA,
	input		[6:0]	ScoreB,
	
	input						VGA_CLK,
	input			[7:0]		VGA_R_IN,
	input			[7:0]		VGA_G_IN,
	input			[7:0]		VGA_B_IN,
	input			[12:0]	H_CNT,
	input			[12:0]	V_CNT,
	
	output reg		[7:0]		VGA_R_OUT,
	output reg		[7:0]		VGA_G_OUT,
	output reg		[7:0]		VGA_B_OUT
);

parameter SCORE_Y = 250;
parameter SCORE_X = 40;

parameter BLOCK_SIZE = 35;
parameter MARGIN = 10;
parameter FONT_WIDTH = 3;
parameter FONT_HEIGHT = 5;

reg [14:0] font[0:10] = '{
	15'b111_101_101_101_111, // 0
	15'b110_010_010_010_111, // 1
	15'b111_001_111_100_111, // 2
	15'b111_001_111_001_111, // 3
	15'b101_101_111_001_001, // 4
	15'b111_100_111_001_111, // 5
	15'b111_100_111_101_111, // 6
	15'b111_001_001_001_001, // 7
	15'b111_101_111_101_111, // 8
	15'b111_101_111_001_111, // 9
	15'b000_000_111_000_000  // -
};

function font_pixel;
input [3:0] digit;
input [15:0] x_pos;
input [15:0] y_pos;
begin
	case (digit)
		0: font_pixel = font[0][x_pos + y_pos * FONT_WIDTH];
		1: font_pixel = font[1][x_pos + y_pos * FONT_WIDTH];
		2:	font_pixel = font[2][x_pos + y_pos * FONT_WIDTH];
		3: font_pixel = font[3][x_pos + y_pos * FONT_WIDTH];
		4: font_pixel = font[4][x_pos + y_pos * FONT_WIDTH];
		5: font_pixel = font[5][x_pos + y_pos * FONT_WIDTH];
		6: font_pixel = font[6][x_pos + y_pos * FONT_WIDTH];
		7: font_pixel = font[7][x_pos + y_pos * FONT_WIDTH];
		8: font_pixel = font[8][x_pos + y_pos * FONT_WIDTH];
		9:	font_pixel = font[9][x_pos + y_pos * FONT_WIDTH];
		10: font_pixel = font[10][x_pos + y_pos * FONT_WIDTH];
	endcase
end
endfunction

/*
function draw_digit;
input [3:0] digit;
input [15:0] x;
input [15:0] y;
input [15:0] x_tgt;
begin
	if (x > x_tgt && x < (x_tgt + BLOCK_SIZE * FONT_WIDTH) && y > SCORE_Y && y < (SCORE_Y + BLOCK_SIZE * FONT_HEIGHT)) begin
		byte unsigned x_pos, y_pos;
	end
end
endfunction
*/

/*
parameter FONT = {
	15'b111_101_101_101_111, // 0
	15'b110_010_010_010_111, // 1
	15'b111_001_111_100_111, // 2
	15'b111_001_111_001_111, // 3
	15'b101_101_111_001_001, // 4
	15'b111_100_111_001_111, // 5
	15'b111_100_111_101_111, // 6
	15'b111_001_001_001_001, // 7
	15'b111_101_111_101_111, // 8
	15'b111_101_111_001_111, // 9
	15'b000_000_111_000_000  // -
};

parameter FONT_N = 10;
*/

/*
function [14:0] font([3:0] digit);
	case (digit)
		0: font = 15'b111_101_101_101_111;
		1: font = 15'b110_010_010_010_111;
		2:	font = 15'b111_001_111_100_111;
		3: font = 15'b111_001_111_001_111;
		4: font = 15'b101_101_111_001_001;
		5: font = 15'b111_100_111_001_111;
		6: font = 15'b111_100_111_101_111;
		7: font = 15'b111_001_001_001_001;
		8: font = 15'b111_101_111_101_111;
		9:	font = 15'b111_101_111_001_111;
		15: font = 15'b000_000_111_000_000;
	endcase
endfunction
*/

/*
initial begin
	font[0] = 15'b111_101_101_101_111;
	font[1] = 15'b110_010_010_010_111;
	font[2] = 15'b111_001_111_100_111;
	font[3] = 15'b111_001_111_001_111;
	font[4] = 15'b101_101_111_001_001;
	font[5] = 15'b111_100_111_001_111;
	font[6] = 15'b111_100_111_101_111;
	font[7] = 15'b111_001_001_001_001;
	font[8] = 15'b111_101_111_101_111;
	font[9] = 15'b111_101_111_001_111;
	font[15] = 15'b000_000_111_000_000;
end
*/

always @(posedge VGA_CLK) begin
	byte unsigned a, b, i, dig;
	shortint unsigned x, y, x_tgt;
	
	x = H_CNT - X_START;
	y = V_CNT - Y_START;
	
	a = ScoreA > 99 ? 99 : ScoreA;
	b = ScoreB > 99 ? 99 : ScoreB;
	
	//draw_digit(0, x, y, SCORE_X + 0 * (BLOCK_SIZE * FONT_WIDTH + MARGIN));
	
	VGA_R_OUT <= VGA_R_IN;
	VGA_G_OUT <= VGA_G_IN;
	VGA_B_OUT <= VGA_B_IN;
	
	if (y > SCORE_Y && y < (SCORE_Y + BLOCK_SIZE * FONT_HEIGHT)) begin
		for(i = 0; i < 5; i = i+1) begin
			x_tgt = SCORE_X + i * (BLOCK_SIZE * FONT_WIDTH + MARGIN);
		
			if (x > x_tgt && x < (x_tgt + BLOCK_SIZE * FONT_WIDTH)) begin
				byte unsigned x_pos, y_pos;
				
				x_pos = (x - x_tgt) / BLOCK_SIZE;
				y_pos = (y - SCORE_Y) / BLOCK_SIZE;
				
				case (i)
					0: dig = a / 10;
					1: dig = a - (a / 10 * 10);
					2: dig = 10;
					3: dig = b / 10;
					4: dig = b - (b / 10 * 10);
				endcase
				
				//if (font[i][x_pos + y_pos * FONT_WIDTH] == 1'b1) begin
				if (font_pixel(dig, FONT_WIDTH - 1 - x_pos, FONT_HEIGHT - 1 - y_pos)) begin
					VGA_R_OUT <= 255;
					VGA_G_OUT <= 255;
					VGA_B_OUT <= 255;
				end
			end
		end
	end
end

endmodule
