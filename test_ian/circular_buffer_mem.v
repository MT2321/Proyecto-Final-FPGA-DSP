module circular_buffer_mem(w_val,w_clk,relative_addr,r_clk, r_addr, data, w_addr);
	input [11:0] w_val;
	input w_clk;
	input [9:0] relative_addr;
	input r_clk;
	output reg [11:0] data;
	output reg [19:0] r_addr;
	output reg [19:0] w_addr;

    reg [19:0] relative_addr_init;
	reg [19:0] next_available_addr;
    reg initial_sec;
	localparam buffer_len = 800;                            //Tamaño del buffer

	initial begin                                           // Inicializo variables en 0
		data <= 0;
		r_addr <= 0;
		w_addr <= 0;
        relative_addr_init <= 0;
        next_available_addr <= 0;
        initial_sec <= 1;
	end
	
	always @(posedge w_clk) begin                           // Clock de escritura
        w_addr = next_available_addr;                       // El addr de escritura es el siguiente disponible
        data = w_val;
        if((next_available_addr == relative_addr_init) && (initial_sec == 0)) begin // Si el siguiente disponible es el inicial
            relative_addr_init = relative_addr_init + 1;    // Incrementa el inicial
            if (relative_addr_init == buffer_len) begin     // Si el inicial es igual al tamaño del buffer
                relative_addr_init = 0;                     // Inicializa el inicial
            end
        end
        next_available_addr = next_available_addr + 1;      // Incrementa el siguiente disponible
        if (next_available_addr == buffer_len) begin        // Si el siguiente disponible es el final
            next_available_addr = 0;                        // El siguiente disponible es el 0
        end
        initial_sec = 0;
	end

    always @(posedge r_clk) begin                           // Clock de lectura
        r_addr = relative_addr_init + relative_addr + 3;    // El addr de lectura es el inicial + el relativo, se agrega un 3 por el defasaje del clock
        if (r_addr >= buffer_len) begin                     // Si el addr de lectura es mayor o igual al tamaño del buffer
            r_addr = r_addr - buffer_len;                   // El addr de lectura es el addr de lectura - el tamaño del buffer
        end
    end
endmodule