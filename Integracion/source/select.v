module select(in1, in2, sel, out);
/* Este modulo se encarga de mandar mas lentamente a la pantalla una señal en modo roll
*/
    input in1;                          // input value 1
    input in2;                          // input value 2
    input sel;                          // selector
    output reg out;                     // output value

	always @(*) begin
        if(sel == 1) begin              // si el selector es 1
            out <= in1;                 // mandamos el valor de entrada 1
        end
        else begin                      // si no
            out <= in2;                 // mandamos el valor de entrada 2
        end
	end
endmodule