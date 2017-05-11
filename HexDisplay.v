module HexDisplay(
	input		[15:0]	binary,
	output	[6:0]		DIG0,
	output	[6:0]		DIG1,
	output	[6:0]		DIG2,
	output	[6:0]		DIG3
);

reg	[3:0]	sevseg_0_binary;
reg	[3:0]	sevseg_1_binary;
reg	[3:0]	sevseg_2_binary;
reg	[3:0]	sevseg_3_binary;

SevSeg SevSeg_0_inst (
	.binary		(sevseg_0_binary),
	.segments	(DIG0)
);

SevSeg SevSeg_1_inst (
	.binary		(sevseg_1_binary),
	.segments	(DIG1)
);

SevSeg SevSeg_2_inst (
	.binary		(sevseg_2_binary),
	.segments	(DIG2)
);

SevSeg SevSeg_3_inst (
	.binary		(sevseg_3_binary),
	.segments	(DIG3)
);

always @* begin
	reg [4:0]	tmp = 0;
	reg [15:0]	remainder = 0;
	
	remainder = binary;
	
	//if(remainder > 1000) begin
		tmp = remainder / 'hF000;
		sevseg_3_binary = tmp;
		remainder = remainder - tmp * 'hF000;
	//end
	
	//if(remainder > 100) begin
		tmp = remainder / 'hF00;
		sevseg_2_binary = tmp;
		remainder = remainder - tmp * 'hF00;
	//end
	
	//if(remainder > 10) begin
		tmp = remainder / 'hF0;
		sevseg_1_binary = tmp;
		remainder = remainder - tmp * 'hF0;
	//end
	
	sevseg_0_binary = remainder;	
end
	
endmodule
