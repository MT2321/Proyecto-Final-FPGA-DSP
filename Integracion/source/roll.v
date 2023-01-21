module roll(value, clk, val_out, w_clk, one);
/* Este modulo se encarga de mandar mas lentamente a la pantalla una señal en modo roll
*/
	input [11:0] value;			        // input value
    input clk;                          // clock
    //input [15:0] prescaler;             // prescaler para ajustar el tiempo de roll desde real-time a 1/2^15 de real-time
    output reg [11:0] val_out;          // output value
    output reg w_clk;                   // clock de escritura en la pantalla
	 output reg one;
    reg [15:0] counter;
	 
	 localparam prescaler = 1;

	initial begin
        counter <= 0;                   // inicializamos el contador
        w_clk <= 0;                     // inicializamos el clock de escritura
		  one <=1;
	end

	always @(posedge clk) begin
        if (counter == prescaler) begin // si el contador llega al valor del prescaler
            val_out <= value;           // mandamos el valor de entrada
            w_clk <= 1;                 // mandamos el clock de escritura
            counter <= 0;               // reiniciamos el contador
        end
        else begin                      // si no
            counter <= counter + 1;     // incrementamos el contador
            w_clk <= 0;                 // no mandamos el clock de escritura
        end
	end
endmodule