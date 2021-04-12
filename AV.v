module AV (
	input iClk,
	input iSignal,
	output [7:0]oVector
);

reg [7:0]rVector_D = 8'd0;
reg [7:0]rVector_Q = 8'd0;

reg [3:0]rCount_D;
reg [3:0]rCount_Q;

assign oVector = rVector_Q;

always @ (posedge iClk)
begin
	rVector_Q <= rVector_D;
	rCount_Q <= rCount_D;
end

always @ *
begin
	if(rCount_Q < 4'd8)
	begin
		rVector_D[rCount_Q] = iSignal;
		rCount_D = rCount_Q + 4'd1;
	end
	else
	begin
		rCount_D = 4'd0;
	end
end

endmodule
