module freqs_display(bin1_in, bin2_in, bin3_in, bin4_in, bin5_in, bin6_in, bin7_in, bin8_in, bin9_in, bin10_in, posx, vga_clk, sample_clk, prescaler, set_values_flag, val_out, freq_pos_needed);
/* Este modulo se encarga de mostrar un boometro en representacion de la FFT.
    Recibe un valor de energía de la FFT para un bin de frecuencias dado y lo muestra en 
    la pantalla.
    Recibe la posicion en X de la pantalla que se esta dibujando para poder saber 
    que frecuencia pedir para dibujar
*/
    input [11:0] bin1_in;                // input value bin1
    input [11:0] bin2_in;                // input value bin1
    input [11:0] bin3_in;                // input value bin1
    input [11:0] bin4_in;                // input value bin1
    input [11:0] bin5_in;                // input value bin1
    input [11:0] bin6_in;                // input value bin1
    input [11:0] bin7_in;                // input value bin1
    input [11:0] bin8_in;                // input value bin1
    input [11:0] bin9_in;                // input value bin1
    input [11:0] bin10_in;                // input value bin1
    input [9:0] posx;                    // Posicion horizontal de la pantalla
    input vga_clk;                           // Clock
	 input sample_clk;                           // Clock
    output reg [15:0] prescaler;              // prescaler para ajustar cada cuantas muestras se calcula la potencia de cada banda

    output reg set_values_flag;          // Flag para mandarle al calculador de potencia que actualize los valores de potencia
    output reg [11:0] val_out;           // output value
    output reg [7:0] freq_pos_needed;    // Que bin de frecuencia se necesita mostrar en la proxima muestra

    reg [15:0] counter;                 // Contador para el prescaler

    localparam screen_width = 800;      // Ancho de la pantalla
    localparam screen_height = 600;     // Altura de la pantalla
    localparam amount_of_bins = 10;     // Cantidad de bins de frecuencias
    localparam bin_width = screen_width / amount_of_bins; // Ancho de cada bin de frecuencias
	 
	localparam num_samples = 200;

    initial begin
        set_values_flag <= 0;           // inicializamos el flag en 0
        counter <= 0;                   // inicializamos el contador
		  prescaler <= num_samples;
	end

	always @(posx) begin
        // Asumo que hay solo 10 bines de frecuencias
        if (posx < bin_width) begin
            freq_pos_needed <= 0;
            val_out <= bin1_in;
        end
        else if (posx < bin_width * 2) begin
            freq_pos_needed <= 1;
            val_out <= bin2_in;
        end
        else if (posx < bin_width * 3) begin
            freq_pos_needed <= 2;
            val_out <= bin3_in;
        end
        else if (posx < bin_width * 4) begin
            freq_pos_needed <= 3;
            val_out <= bin4_in;
        end
        else if (posx < bin_width * 5) begin
            freq_pos_needed <= 4;
            val_out <= bin5_in;
        end
        else if (posx < bin_width * 6) begin
            freq_pos_needed <= 5;
            val_out <= bin6_in;
        end
        else if (posx < bin_width * 7) begin
            freq_pos_needed <= 6;
            val_out <= bin7_in;
        end
        else if (posx < bin_width * 8) begin
            freq_pos_needed <= 7;
            val_out <= bin8_in;
        end
        else if (posx < bin_width * 9) begin
            freq_pos_needed <= 8;
            val_out <= bin9_in;
        end
        else if (posx < bin_width * 10) begin
            freq_pos_needed <= 9;
            val_out <= bin10_in;
        end
        else begin
            freq_pos_needed <= 0;
            val_out <= bin1_in;
        end
	end
	
	always @(posedge sample_clk) begin
		if (counter == prescaler) begin // si el contador llega al valor del prescaler
            set_values_flag <= 1;       // mandamos el flag
            counter <= 0;               // reiniciamos el contador
        end
        else begin                      // si no
            counter <= counter + 1;     // incrementamos el contador
            set_values_flag <= 0;       // no mandamos el flag
        end
	end
endmodule