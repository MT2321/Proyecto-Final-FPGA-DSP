module pixel_discriminator(value, pixel_y, out_pixel);
	input [11:0] value;			// input value
	input [9:0] pixel_y;		// Posicion vertical del pixel
	output reg out_pixel;		// output pixel
	reg signed[9:0] y_value;	// Valor de la posicion vertical del pixel
	initial begin
		out_pixel <= 0;
		y_value <= 0;
	end
	localparam division_const = 7;			// Constante de division surge
											// de la relacion entre el numero
											// de pixeles verticales en la imagen (600) y los 
											// valores máximos de entrada (12 bits = 4096)
											// 4096/600 = 6.82 -> 7
	localparam signed screen_height = 600; 	// Altura de la pantalla	
	localparam signed trace_width = 5;		// Ancho de la traza en la pantalla (para que no sea una linea de un pixel)
	always @(*) begin
	
		y_value = screen_height - pixel_y;	// Se invierte el valor de la posicion vertical del pixel
											// para que el pixel mas alto de la imagen tenga el valor 0
											// y el mas bajo el valor 600
		
		if((value / division_const) > y_value && (value / division_const) < y_value + 5 ) begin
			out_pixel = 1;				// Si el valor de entrada es mayor que el valor de la posicion vertical del pixel
											// y menor que el valor de la posicion vertical del pixel + 5, se activa el pixel
		end
		else begin
			out_pixel = 0;			// Si no, se desactiva el pixel
		end
	end
endmodule