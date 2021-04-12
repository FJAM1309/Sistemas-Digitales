module JRC (
	input iClk, //reloj
	output reg [3:0]oQ = 4'b1000 //salida empezando del último estado
	);

	//registros declarados
	reg [3:0] rCounter_Q = 4'b0;
	reg [3:0] rCounter_S = 4'b0;
	reg [3:0] rClear_S = 4'b0;
	reg [3:0] rClear_Q = 4'b0;
	
	//bloque secuencial
always @ (posedge iClk)
begin
	rCounter_Q <= rCounter_S; // contador no bloqueante
	rClear_S <= rClear_Q; // reset del contador
end

//bloque combinacional
always @ *
begin
	rCounter_S = rCounter_Q + 1'b1;
	
		case ( rCounter_Q )
	4'd1 : oQ = 4'd2; //estado actual (1) - estado siguiente (2)
	4'd2 : oQ = 4'd4; //estado actual (2) - estado siguiente (3)
	4'd4 : oQ = 4'd8; //estado actual (3) - estado siguiente (4)
	4'd8 : oQ = 4'd1; //estado actual (4) - estado siguiente (1)
		endcase
	end
	
endmodule

