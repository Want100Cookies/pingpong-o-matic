module BallDetection (
	input         CLK      ,
	input         ENABLE   ,
	input  [ 7:0] R_IN     ,
	input  [ 7:0] G_IN     ,
	input  [ 7:0] B_IN     ,
	input  [12:0] VGA_V_CNT,
	input  [12:0] VGA_H_CNT,
	input         VGA_HS   ,
	input         VGA_VS   ,
	output [ 7:0] R_OUT    ,
	output [ 7:0] G_OUT    ,
	output [ 7:0] B_OUT    ,
	output [12:0] debug
);
	`include "V/VGA_Param.h"

	parameter rows = 40;
	parameter cols = 30;
	parameter block_size = 16; // 640/40=16 480/30=16 so blocksize = 16x16

	integer grid[rows][cols];

	integer x;
	integer y;

	integer x_grid;
	integer y_grid;

	integer x_ball;
	integer y_ball;

	reg reset = 1;

	integer hue       ;
	integer lightness ;
	integer saturation;

	integer max  ;
	integer min  ;
	integer delta;

	integer R;
	integer G;
	integer B;

	always @(posedge CLK) begin
		if (~ENABLE) begin
			R_OUT <= R_IN;
			G_OUT <= G_IN;
			B_OUT <= B_IN;
		end else begin
			if(reset) begin
				for(int for_y = 0; for_y < rows; for_y++) begin
					for (int for_x = 0; for_x < cols; for_x++) begin
						grid[for_y][for_x] = 0;
					end
				end
			end

			if (VGA_H_CNT > X_START - 1 && (VGA_H_CNT - X_START) < VGA_WIDTH &&
				VGA_V_CNT > Y_START - 1 && (VGA_V_CNT - Y_START) < VGA_HEIGHT) begin

				x = VGA_H_CNT - X_START;
				y = VGA_V_CNT - Y_START;

				x_grid = x / block_size;
				y_grid = y / block_size;

				R = R_IN * 100 / 255; // convert 0-255 to 0-100 (normally 0-1 but no floats bruh)
				G = G_IN * 100 / 255;
				B = B_IN * 100 / 255;

				max = (R > G) ? (R > B ? R : B) : (G > B ? G : B);
				min = (R < G) ? (R < B ? R : B) : (G < B ? G : B);

				delta = max - min;

				lightness  = (max + min) / 2;
				saturation = (lightness > 50) ? (delta * 100) / (200 - max - min) : (delta * 100) / (max + min);

				if (max == R) hue = 60 * ((G - B) / delta % 6);
				if (max == G) hue = 60 * ((B - R) / delta + 2);
				if (max == B) hue = 60 * ((R - G) / delta + 4);

				if (max == min) begin // achromatic
					hue        = 0;
					saturation = 0;
				end

				if (hue > 360) hue = hue - 360;
				if (hue < 0) hue = hue + 360;


				if (hue > 100 && hue < 140) begin
					grid[y_grid][x_grid] = grid[y_grid][x_grid] + 1;
				end

				if(x_ball == x_grid && y_ball == y_grid) begin
					R_OUT <= 0;
					G_OUT <= 0;
					B_OUT <= 0;
				end else begin
					R_OUT <= R_IN;
					G_OUT <= G_IN;
					B_OUT <= B_IN;
				end
			end else begin
				R_OUT <= R_IN;
				G_OUT <= G_IN;
				B_OUT <= B_IN;
			end
		end
	end

	always @(posedge VGA_VS) begin
		integer max_count = 0;
		integer max_x;
		integer max_y;

		for(int for_y = 0; for_y < rows; for_y++) begin
			for (int for_x = 0; for_x < cols; for_x++) begin
				if (grid[for_y][for_x] > 8 && grid[for_y][for_x] > max_count) begin
					max_count = grid[for_y][for_x];
					max_x     = for_x;
					max_y     = for_y;
				end
			end
		end

		x_ball = max_x;
		y_ball = max_y;

		reset <= 1;
	end
endmodule 