module pixel_discriminator(value, pixel_y, out_pixel);
	input [11:0] value;
	input [9:0] pixel_y;
	output reg out_pixel;
	reg signed[9:0] y_value;
	initial begin
		out_pixel <= 0;
		y_value <= 0;
	end
	localparam division_const = 7;
	localparam signed screen_height = 500;
	localparam signed trace_width = 5;
	always @(*) begin
	
		y_value = screen_height - pixel_y;
		
		if((value / division_const) > y_value && (value / division_const) < y_value + 5 ) begin
			out_pixel = 1;
		end
		else begin
			out_pixel = 0;
		end
	end
endmodule