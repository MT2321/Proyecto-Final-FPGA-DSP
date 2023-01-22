module scaler(value, prescaler, val_out);
/* Este modulo se encarga de mandar mas lentamente a la pantalla una señal en modo roll
*/
	input [41:0] value;			        // input value
    input [15:0] prescaler;             // prescaler para ajustar el tiempo de roll desde real-time a 1/2^15 de real-time
    output reg [11:0] val_out;          // output value

	always @(*) begin
      if (prescaler <= 2) begin
        val_out = value[24:13];
      end
      else if (prescaler<=4)begin
        val_out = value[25:14];
      end
      else if (prescaler<=8)begin
        val_out = value[26:15];
      end
      else if (prescaler<=16)begin
        val_out = value[27:16];
      end
      else if (prescaler<=32)begin
        val_out = value[28:17];
      end
      else if (prescaler<=64)begin
        val_out = value[29:18];
      end
      else if (prescaler<=128)begin
        val_out = value[30:19];
      end
      else if (prescaler<=256)begin
        val_out = value[31:20];
      end
      else if (prescaler<=512)begin
        val_out = value[32:21];
      end
      else if (prescaler<=1024)begin
        val_out = value[33:22];
      end
      else if (prescaler<=2048)begin
        val_out = value[34:23];
      end
      else if (prescaler<=4096)begin
        val_out = value[35:24];
      end
      else if (prescaler<=8192)begin
        val_out = value[36:25];
      end
      else if (prescaler<=16384)begin
        val_out = value[37:26];
      end
      else if (prescaler<=32768)begin
        val_out = value[38:27];
      end
      else if (prescaler<=65536)begin
        val_out = value[39:28];
      end
		else begin
		  val_out = value[24:13];
		end
	end
endmodule