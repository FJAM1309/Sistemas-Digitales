module JRC (
input iClk, //reloj
output reg [3:0]oQ = 4'b0000 //salida empezando del último estado
);

//registros declarados
reg [2:0] rCounter_Q = 3'b111;
reg [2:0] rCounter_S = 3'b000;
reg [2:0] rClear_S = 3'b000;
reg [2:0] rClear_Q = 3'b000;

//bloque secuencial
always @ (posedge iClk)
begin
	rCounter_Q <= rCounter_S;	// contador no bloqueante
	rClear_S <= rClear_Q;		// reset del contador
end

//bloque combinacional
always @ *
begin
	rCounter_S = rCounter_Q + 1'b1;
	case ( rCounter_Q )
		3'd0 : oQ = 4'd0; //estado actual (0) - estado siguiente (1)
		3'd1 : oQ = 4'd8; //estado actual (1) - estado siguiente (2)
		3'd2 : oQ = 4'd12; //estado actual (2) - estado siguiente (3)
		3'd3 : oQ = 4'd14; //estado actual (3) - estado siguiente (4)
		3'd4 : oQ = 4'd15; //estado actual (4) - estado siguiente (5)
		3'd5 : oQ = 4'd7; //estado actual (5) - estado siguiente (6)
		3'd6 : oQ = 4'd3; //estado actual (6) - estado siguiente (7)
		3'd7 : oQ = 4'd1; //estado actual (7) - estado siguiente (0)
	endcase
end

endmodule 