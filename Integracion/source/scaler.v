module scaler(value, prescaler, val_out);
/* Este modulo se encarga de mandar mas lentamente a la pantalla una señal en modo roll
*/
	input [41:0] value;			        // input value
    input [15:0] prescaler;             // prescaler para ajustar el tiempo de roll desde real-time a 1/2^15 de real-time
    output reg [11:0] val_out;          // output value

	always @(*) begin
		val_out = value / prescaler;
	end
endmodule