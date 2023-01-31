module mul_temp(n1, n2, ans);
	input [12:0]n1;
	input [12:0]n2;
	output reg [24:0]ans;

	always @(*) begin
        ans = n1 * n2;
	end
endmodule