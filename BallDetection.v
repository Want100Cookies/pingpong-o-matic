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
	output [12:0] debug
);
	`include "V/VGA_Param.h"

	parameter BLUR_SIZE = 3;

	// Byte length * line width * 3 lines
	reg [7:0] BUF_R_IN[0:VGA_WIDTH*VGA_HEIGHT-1];
	reg [7:0] BUF_G_IN[0:VGA_WIDTH*VGA_HEIGHT-1];
	reg [7:0] BUF_B_IN[0:VGA_WIDTH*VGA_HEIGHT-1];

	reg [7:0] BUF_R_OUT[0:VGA_WIDTH*VGA_HEIGHT-1];
	reg [7:0] BUF_G_OUT[0:VGA_WIDTH*VGA_HEIGHT-1];
	reg [7:0] BUF_B_OUT[0:VGA_WIDTH*VGA_HEIGHT-1];

	integer x;
	integer y;


	// integer hue       ;
	// integer lightness ;
	// integer saturation;

	// integer R;
	// integer G;
	// integer B;

	always @(posedge CLK) begin
		if (~ENABLE) begin
			R_OUT = R_IN;
			G_OUT = G_IN;
			B_OUT = B_IN;
		end else begin
			if (VGA_H_CNT > X_START && (VGA_H_CNT - X_START) < VGA_WIDTH &&
				VGA_V_CNT > Y_START && (VGA_V_CNT - Y_START) < VGA_HEIGHT) begin

				x = VGA_H_CNT - X_START;
				y = VGA_V_CNT - Y_START;

				BUF_R_IN[x+y*VGA_WIDTH] = R_IN;
				BUF_G_IN[x+y*VGA_WIDTH] = G_IN;
				BUF_B_IN[x+y*VGA_WIDTH] = B_IN;

				R_OUT = BUF_R_OUT[x + y * VGA_WIDTH];
				G_OUT = BUF_G_OUT[x + y * VGA_WIDTH];
				B_OUT = BUF_B_OUT[x + y * VGA_WIDTH];

				if (y == VGA_HEIGHT - 1) begin
					for (int buf_y = 0; buf_y < VGA_HEIGHT; buf_y = buf_y + BLUR_SIZE) begin
						for (int buf_x = 0; buf_x < VGA_WIDTH; buf_x = buf_x + BLUR_SIZE) begin
							integer r = 0;
							integer g = 0;
							integer b = 0;

							for (int blur_y = 0; blur_y < BLUR_SIZE; blur_y++) begin
								for (int blur_x = 0; blur_x < BLUR_SIZE; blur_x++) begin
									integer new_y = (buf_y + blur_y) * 8 * VGA_WIDTH;
									integer new_x = (buf_x + blur_x) * 8;

									r <= r + BUF_R_IN[new_x + new_y];
									g <= g + BUF_G_IN[new_x + new_y];
									b <= b + BUF_B_IN[new_x + new_y];
								end
							end

							r <= r / BLUR_SIZE;
							g <= g / BLUR_SIZE;
							b <= b / BLUR_SIZE;

							for (int blur_y = 0; blur_y < BLUR_SIZE; blur_y++) begin
								for (int blur_x = 0; blur_x < BLUR_SIZE; blur_x++) begin
									y = (buf_y + blur_y) * 8 * VGA_WIDTH;
									x = (buf_x + blur_x) * 8;

									BUF_R_OUT[x+y] = r;
									BUF_G_OUT[x+y] = g;
									BUF_B_OUT[x+y] = b;
								end
							end

						end
					end
				end
			end


			// tmp vars for RGBtoHSL
			// integer max;
			// integer min;
			// integer delta;

			// tmp vars for HSLtoRGB
//		integer p;
//		integer q;

			// RGB to HSL
			// R = R_IN * 100 / 255; // convert 0-255 to 0-100 (normally 0-1 but no floats bruh)
			// G = G_IN * 100 / 255;
			// B = B_IN * 100 / 255;

			// max = (R > G) ? (R > B ? R : B) : (G > B ? G : B);
			// min = (R < G) ? (R < B ? R : B) : (G < B ? G : B);

			// delta = max - min;

			// lightness  = (max + min) / 2;
			// saturation = (lightness > 50) ? (delta * 100) / (200 - max - min) : (delta * 100) / (max + min);

			// if (max == R) hue = 60 * ((G - B) / delta % 6);
			// if (max == G) hue = 60 * ((B - R) / delta + 2);
			// if (max == B) hue = 60 * ((R - G) / delta + 4);

			// if (max == min) begin // achromatic
			// 	hue        = 0;
			// 	saturation = 0;
			// end

			// if (hue > 360) hue = hue - 360;
			// if (hue < 0) hue = hue + 360;

			// if (hue > 100 && hue < 130) begin
			// 	R_OUT = R_IN;
			// 	G_OUT = G_IN;
			// 	B_OUT = B_IN;
			// end else begin
			// 	R_OUT = 0;
			// 	G_OUT = 0;
			// 	B_OUT = 0;
			// end


			// HSL to RGB
//		if (saturation == 0) begin
//			R_OUT = lightness * 255 / 100;
//			G_OUT = R_OUT;
//			B_OUT = R_OUT;
//		end else begin
//
//			p = lightness < 50
//					? lightness * (1 + saturation / 100)
//					: lightness + saturation - lightness * saturation / 100;
//
//			q = 2 * lightness - p;
//
//			R = (hue + 120) / 60 % 6;
//			G = hue / 60;
//			B = (hue + 240) / 60 % 6;
//
//			// R
//				if (R < 1) begin
//					R = q + (p - q) * R;
//				end else if (R < 3) begin
//					R = p;
//				end else if (R < 4) begin
//					R = q + (p - q) * (4 - R);
//				end else begin
//					R = q;
//				end
//
//				R_OUT = R * 255 / 100;
//
//			// G
//				if (G < 1) begin
//					G = q + (p - q) * G;
//				end else if (G < 3) begin
//					G = p;
//				end else if (G < 4) begin
//					G = q + (p - q) * (4 - G);
//				end else begin
//					G = q;
//				end
//
//				G_OUT = G * 255 / 100;
//
//			// B
//				if (B < 1) begin
//					B = q + (p - q) * B;
//				end else if (B < 3) begin
//					B = p;
//				end else if (B < 4) begin
//					B = q + (p - q) * (4 - B);
//				end else begin
//					B = q;
//				end
//
//				B_OUT = B * 255 / 100;
//		end
		end
	end

endmodule 