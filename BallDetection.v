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

	parameter rows       = 30;
	parameter cols       = 40;
	parameter block_size = 16; // 640/40=16 480/30=16 so blocksize = 16x16

	shortint unsigned row[cols]; // Store the count of green pixels of a single row

	// Current x/y
	shortint unsigned x, y;

	// Current x/y on the grid
	shortint unsigned x_grid, y_grid;
	shortint unsigned prev_y_grid = rows; // Previous y on the grid
	// (default = imposible so first clock tick the array is reset)

	// Tmp x/y of the ball (calculated per row for each frame)
	// including the count of green pixels to compare width
	shortint unsigned tmp_x = 0, tmp_y = 0, ball_count = 0;

	// Definitive x/y of the ball
	shortint unsigned x_ball = 0, y_ball = 0;

	// HSL values
	shortint unsigned hue, lightness, saturation;

	// HSL tmp values
	shortint unsigned max, min, delta, R, G, B;

	always @(posedge CLK) begin
		if (~ENABLE || 
			VGA_H_CNT < X_START || (VGA_H_CNT - X_START) > VGA_WIDTH ||
			VGA_V_CNT < Y_START || (VGA_V_CNT - Y_START) > VGA_HEIGHT) begin
			R_OUT <= R_IN;
			G_OUT <= G_IN;
			B_OUT <= B_IN;
		end else begin
			// Calculate the real x/y values
			x = VGA_H_CNT - X_START;
			y = VGA_V_CNT - Y_START;

			// Calculate the x/y on the grid
			x_grid = x / block_size;
			y_grid = y / block_size;

			// Reset the grid to zero's
			if(y_grid != prev_y_grid) begin
				prev_y_grid = y_grid;
				for (int for_x = 0; for_x < cols; for_x++) begin
					row[for_x] = 0;
				end
			end

			// convert 0-255 to 0-100 (normally 0-1 but no floats bruh)
			R = R_IN * 100 / 255;
			G = G_IN * 100 / 255;
			B = B_IN * 100 / 255;

			// Calculate max/min (without helper functions, say whut)
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

			// If hue is green
			if (hue > 100 && hue < 140) begin
				// And value is still valid
				if(row[x_grid] < 255) begin
					// Increase by one
					row[x_grid] = row[x_grid] + 1;
				end
			end

			if(x % block_size == 0 && y % block_size == 0) begin
				// Show the points of the grid
				R_OUT <= 0;
				G_OUT <= 0;
				B_OUT <= 255;
			end else if(x_ball == x_grid && y_ball == y_grid) begin
				// Show the hotbox
				R_OUT <= 255;
				G_OUT <= 0;
				B_OUT <= 0;
			end else if(hue > 100 && hue < 140) begin
				// Show all the greens with hue 100 > hue < 140
				R_OUT <= 0;
				G_OUT <= 255;
				B_OUT <= 0;
			end else begin
				// Else jus black
				R_OUT <= 0;
				G_OUT <= 0;
				B_OUT <= 0;
			end

			// If this pixel is the last of the row
			// (x == max of screen and y == on last pixel of row)
			if(x == VGA_WIDTH - 1 && y % block_size == block_size - 1) begin
				shortint unsigned count, max_x, max_count = 0;

				// For every value in the row
				for (int for_x = 0; for_x < cols; for_x++) begin
					count      = row[for_x]; // Store the cell count
					row[for_x] = 0; // Always reset the cell

					// If it's bigger than the previous found one
					if(count > max_count) begin
						// Store it
						max_count = count;
						max_x     = for_x;
					end
				end

				// If the new hotbox is bigger than the old one
				if(max_count > ball_count) begin
					// Replace the old one
					tmp_x      = max_x;
					tmp_y      = y_grid;
					ball_count = max_count;
				end

				// On the last row
				if(y_grid == rows - 1) begin
					// Set the new hotbox for the ball
					x_ball = tmp_x;
					y_ball = tmp_y;

					debug      <= ball_count;
					// And reset the ball_count for the new frame
					ball_count = 0;
				end
			end
		end
	end
endmodule 