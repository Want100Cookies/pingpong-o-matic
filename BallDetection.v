module BallDetection (
	input         CLK      ,
	input         ENABLE   ,
	input  [ 7:0] R_IN     ,
	input  [ 7:0] G_IN     ,
	input  [ 7:0] B_IN     ,
	input  [12:0] VGA_V_CNT,
	input  [12:0] VGA_H_CNT,
	output [ 7:0] R_OUT    ,
	output [ 7:0] G_OUT    ,
	output [ 7:0] B_OUT    ,
	output [5:0] BALL_X,
	output [5:0] BALL_Y
);

	parameter MARGIN      = 1;
	parameter FONT_WIDTH  = 3;
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
				0  : font_pixel = font[0][x_pos + y_pos * FONT_WIDTH];
				1  : font_pixel = font[1][x_pos + y_pos * FONT_WIDTH];
				2  : font_pixel = font[2][x_pos + y_pos * FONT_WIDTH];
				3  : font_pixel = font[3][x_pos + y_pos * FONT_WIDTH];
				4  : font_pixel = font[4][x_pos + y_pos * FONT_WIDTH];
				5  : font_pixel = font[5][x_pos + y_pos * FONT_WIDTH];
				6  : font_pixel = font[6][x_pos + y_pos * FONT_WIDTH];
				7  : font_pixel = font[7][x_pos + y_pos * FONT_WIDTH];
				8  : font_pixel = font[8][x_pos + y_pos * FONT_WIDTH];
				9  : font_pixel = font[9][x_pos + y_pos * FONT_WIDTH];
				10 : font_pixel = font[10][x_pos + y_pos * FONT_WIDTH];
			endcase
		end
	endfunction

	parameter rows       = 30;
	parameter cols       = 40;
	parameter block_size = 16; // 640/40=16 480/30=16 so block_size = 16x16

	byte unsigned row[cols]; // Store the count of green pixels of a single row
	byte unsigned max_count_per_row[rows]; // Store the max green count per row
	byte unsigned max_x_per_row[rows]; // Store the x of the max green per row

	// The max x/y/count so far in for loops for getting the max of the array above
	shortint unsigned max_x, max_y, max_count = 0;

	// Current x/y
	shortint unsigned x, y;

	// Current x/y on the grid
	shortint unsigned x_grid, y_grid;
	shortint unsigned prev_y_grid = rows; // Previous y on the grid
	// (default = imposible so first clock tick the array is reset)

	// HSL values
	shortint unsigned hue, lightness, saturation;

	// HSL tmp values
	shortint unsigned max, min, delta, R, G, B;

	always @(posedge CLK) begin
		if (VGA_H_CNT < X_START || (VGA_H_CNT - X_START) > VGA_WIDTH ||
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
					row[x_grid]++;
				end
			end

			R_OUT <= R_IN;
			G_OUT <= G_IN;
			B_OUT <= B_IN;

			if(ENABLE && y % block_size < FONT_HEIGHT && x_grid > 0 && x_grid < cols - 1) begin
				shortint unsigned x_tgt, block_x, block_y, dig, x_pos, y_pos;

				// Calculate the start x/y of the block
				block_x = x_grid * block_size + 1;
				block_y = y_grid * block_size;

				for (int i = 0; i < 3; i++) begin
					x_tgt = block_x + i * (FONT_WIDTH + MARGIN);
					if (x >= x_tgt && x < (x_tgt + FONT_WIDTH)) begin
						byte unsigned x_pos, y_pos;

						x_pos = (x - x_tgt);
						y_pos = (y - block_y);

						case (i)
							0 : dig = row[x_grid] % 1000 / 100;
							1 : dig = row[x_grid] % 100 / 10;
							2 : dig = row[x_grid] % 10;
						endcase

						if (font_pixel(dig, FONT_WIDTH - 1 - x_pos, FONT_HEIGHT - 1 - y_pos)) begin
							R_OUT <= 255;
							G_OUT <= 255;
							B_OUT <= 255;
						end
					end
				end
			end else if(BALL_X == x_grid && BALL_Y == y_grid) begin
				// Show the hotbox
				R_OUT <= R_IN - 255;
				G_OUT <= G_IN - 255;
				B_OUT <= B_IN - 255;
			end else if(ENABLE && hue > 100 && hue < 140) begin
				// Show all the greens with hue 100 > hue < 140
				R_OUT <= 0;
				G_OUT <= 255;
				B_OUT <= 0;
			end else if(ENABLE) begin
				R_OUT <= 0;
				G_OUT <= 0;
				B_OUT <= 0;
			end

			
			// If this pixel is the last of the row
			// (x == max of screen and y == on last pixel of row)
			if(x == VGA_WIDTH - 1 && y % block_size == block_size - 1) begin
				max_count = 0;

				// For every value in the row
				for (int for_x = 0; for_x < cols; for_x++) begin
					// If it's bigger than the previous found one
					if(row[for_x] > max_count) begin
						// Store it
						max_count = row[for_x];
						max_x     = for_x;
					end

					row[for_x] = 0; // Always reset the cell
				end

				max_count_per_row[y_grid] = max_count;
				max_x_per_row[y_grid] = max_x;

				// On the last row
				if(y_grid == rows - 1) begin
					max_count = 0;

					for (int for_y = 0; for_y < rows; for_y++) begin
						if(max_count_per_row[for_y] > max_count) begin
							max_count = max_count_per_row[for_y];
							max_y = for_y;
							max_x = max_x_per_row[for_y];
						end
					end

					// Set the new hotbox for the ball
					BALL_X = max_x;
					BALL_Y = max_y;
				end
			end
		end
	end
endmodule 