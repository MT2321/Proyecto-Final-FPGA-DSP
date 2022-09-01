module pixel_discriminator(value, pixel_y, out_pixel);
	input [11:0] value;
	input [9:0] pixel_y;
	output reg out_pixel;
	initial begin
		out_pixel <= 0;
	end
	localparam division_const = 7;
	always @(*) begin
		if(((value/7)+300) > pixel_y && ((value/7)+298) < pixel_y) begin
			out_pixel = 1;
		end
		else begin
			out_pixel = 0;
		end
	end
endmodule