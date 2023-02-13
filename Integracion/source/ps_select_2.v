module ps_select_2 (
    in,
    out
);
    
    input in;
    output reg [15:0] out;
    
    localparam ps1 = 1000;
    localparam ps2 = 5000;
    initial begin
        out=ps1;
    end

    always @(*) begin
        if (in == 0) begin
            out = ps1;
        end
        else begin
            out = ps2;
        end
    end
endmodule