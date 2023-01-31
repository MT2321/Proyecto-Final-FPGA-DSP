module twoc(n1, out);
/* Este modulo se encarga de calcular el complemento a 2 de un valor
*/
    input [11:0] n1;
    output [11:0] out;

	always @(posedge clk) begin
        if (n1[11] == 1) begin  // Si el bit mas significativo es 1, se hace el complemento a 1 y se le suma 1
            out = ~n1 + 1;      // Se hace el complemento a 1
        end
        else begin              // Si el bit mas significativo es 0, se retorna el mismo valor
            out = n1;           // Se retorna el mismo valor
        end
	end
endmodule