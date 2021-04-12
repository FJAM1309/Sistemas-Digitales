module StateMachine (
input iClk,
input iForward,
input iReset,
input iBack,
output [1:0] oStateValue
);

reg [1:0] rStateValue_D;
reg [1:0] rStateValue_Q;

reg [1:0] rState_D;
reg [1:0] rState_Q;

assign oStateValue = rStateValue_Q;

always @ (posedge iClk)
begin	
	rStateValue_Q <= rStateValue_D;
	rState_Q <= rState_D;
end

always @ *
begin
case(rState_Q)
2'd0: //A  
begin
	if(iForward)
	begin
		rState_D = 2'd1;
	end
	else if(iReset | iBack)
	begin
		rState_D = 2'd0;
	end
	else
	begin
		rState_D = rState_Q;
	end
	rStateValue_D = 2'd0;
end 
2'd1: //B 
begin
	if(iForward)
		rState_D = 2'd2;
	else if(iReset | iBack)
	begin
		rState_D = 2'd0;
	end
	else
	begin
		rState_D = rState_Q;
	end
	rStateValue_D = 2'd1;	
end 
2'd2: //C 
begin
	if(iForward)
	begin
		rState_D = 2'd3;
	end
	else if(iReset)
	begin
		rState_D = 2'd0;
	end
	else if(iBack)
	begin
		rState_D = 2'd1;
	end
	else
	begin
		rState_D = rState_Q;
	end
	rStateValue_D = 2'd2;
end
2'd3: //D  
begin
	if(iForward)
	begin
		rState_D = 2'd3;
	end
	else if(iReset)
	begin
		rState_D = 2'd0;
	end
	else if(iBack)
	begin
		rState_D = 2'd2;
	end
	else
	begin
		rState_D = rState_Q;
	end
	rStateValue_D = 2'd3;
end 
default:
	begin
		rStateValue_D = 2'd0;
		rState_D = 2'd0;
	end
endcase
end
endmodule

/*begin
	if(iForward)
	begin
		rState_D = rState_D + 2'd1;
	end
	else if(iBack)
	begin
		rState_D = rState_D - 2'd1;
	end
	else if(iReset)
	begin
		rState_D = 2'd0;
	end
end*/

