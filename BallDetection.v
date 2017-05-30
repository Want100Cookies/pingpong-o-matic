module BallDetection (
	input CLK,
	input ENABLE,

	input [7:0] R_IN,
	input [7:0] G_IN,
	input [7:0] B_IN,
	
	input [12:0] VGA_V_CNT,
	input [12:0] VGA_H_CNT,
	
	output [7:0] R_OUT,
	output [7:0] G_OUT,
	output [7:0] B_OUT,
	output [12:0] debug
);

integer hue;
integer lightness;
integer saturation;

integer R;
integer G;
integer B;

integer max_v = 0;
integer count_v = 0;

integer found_v = 0;

integer prev_v = 0;
integer prev_h = 0;

always @(posedge CLK) begin
	if (~ENABLE) begin
		R_OUT = R_IN;
		G_OUT = G_IN;
		B_OUT = B_IN;
	end else begin
		// tmp vars for RGBtoHSL
		integer max;
		integer min;
		integer delta;
		
		// tmp vars for HSLtoRGB
		integer p;
		integer q;
		
		// RGB to HSL
		R = R_IN * 100 / 255; // convert 0-255 to 0-100 (normally 0-1 but no floats bruh)
		G = G_IN * 100 / 255;
		B = B_IN * 100 / 255;

		max = (R > G) ? (R > B ? R : B) : (G > B ? G : B);
		min = (R < G) ? (R < B ? R : B) : (G < B ? G : B);
		
		delta = max - min;

		lightness = (max + min) / 2;
		saturation = (lightness > 50) ? (delta * 100) / (200 - max - min) : (delta * 100) / (max + min);
		
		if (max == R) hue = 60 * ((G - B) / delta % 6);
		if (max == G) hue = 60 * ((B - R) / delta + 2);
		if (max == B) hue = 60 * ((R - G) / delta + 4);
		
		if (max == min) begin // achromatic
			hue = 0;
			saturation = 0;
		end

		if (hue > 360) hue = hue - 360;
		if (hue < 0) hue = hue + 360;
		
		if (hue > 100 && hue < 140 
			&& lightness > 20 && lightness < 80 
			&& saturation > 50
			&& VGA_H_CNT > 10) begin
			count_v = count_v + 1;
			R_OUT = 255;
			G_OUT = 0;
			B_OUT = 0;
		end else begin
			R_OUT = R_IN;
			G_OUT = (found_v < VGA_H_CNT - 5 || found_v > VGA_H_CNT + 5) ? 255 : G_IN;
			B_OUT = B_IN;
		end
		
		if (VGA_H_CNT == 1) max_v = 0;
		
		if (VGA_V_CNT == 0) count_v = 0;
		
		if (VGA_V_CNT > 640 && count_v > max_v) found_v = VGA_H_CNT; max_v = count_v;
		
		
		prev_v = VGA_V_CNT;
		prev_h = VGA_H_CNT;
			
		
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