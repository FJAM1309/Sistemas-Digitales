module AV_tb ();

reg iClk;
reg iSignal;
wire [7:0]oVector;

AV uut(
.iClk (iClk),
.iSignal (iSignal),
.oVector (oVector)
);

initial
begin
	iClk = 0;
	iSignal = 0;
	#100;
	iSignal = 1;
	#100;
	iSignal = 1;
	#100;
	iSignal = 0;
	#100;
	iSignal = 1;
	#100;
	iSignal = 1;
	#100;
	iSignal = 1;
	#100;
	iSignal = 1;
	#100;
	iSignal = 0;
	#100;
	iSignal = 0;
	#100;
	iSignal = 1;
	#100;
	iSignal = 1;
	#100;
	iSignal = 1;
	#100;
	iSignal = 1;
	#100;
	iSignal = 0;
	#100;
	iSignal = 0;
	#100;
end

always
begin
forever
	begin
		iClk = ~iClk;
		#50;
	end
end

endmodule
