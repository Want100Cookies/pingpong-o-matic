module FreezeFrame(
	input		Enabled,
	
	input			CLK_IN,
	output		CLK_OUT
);

always @* begin
	if (Enabled) begin
		CLK_OUT <= CLK_IN;
	end
end

endmodule
