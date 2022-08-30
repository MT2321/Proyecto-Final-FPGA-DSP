module adc_logic(clk, cs_adc, dout_adc, adc_out, out_ready);
	input clk;
	input cs_adc;
	input dout_adc;
	output reg [12:0] adc_out;
	output reg out_ready;
	reg [7:0] counter;

	initial begin
		counter <= 0;
		out_ready <= 0;
	end
	
	always @(posedge clk) begin
		if (cs_adc == 0) begin
			if (counter != 16) begin

				if (counter == 5) begin
					adc_out[11] <= dout_adc;
				end
				if (counter == 6) begin
					adc_out[10] <= dout_adc;
				end
				if (counter == 7) begin
					adc_out[9] <= dout_adc;
				end
				if (counter == 8) begin
					adc_out[8] <= dout_adc;
				end
				if (counter == 9) begin
					adc_out[7] <= dout_adc;
				end
				if (counter == 10) begin
					adc_out[6] <= dout_adc;
				end
				if (counter == 11) begin
					adc_out[5] <= dout_adc;
				end
				if (counter == 12) begin
					adc_out[4] <= dout_adc;
				end
				if (counter == 13) begin
					adc_out[3] <= dout_adc;
				end
				if (counter == 14) begin
					adc_out[2] <= dout_adc;
				end
				if (counter == 15) begin
					adc_out[1] <= dout_adc;
				end
				if (counter == 16) begin
					adc_out[0] <= dout_adc;
					out_ready = 1;
				end
			end
		end
		if (cs_adc == 1) begin
			counter = 0;
			out_ready = 0;
		end
	end
endmodule