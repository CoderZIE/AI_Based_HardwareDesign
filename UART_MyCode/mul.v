`timescale 1ns / 1ps
module mul(
		out, a_in, b_in, clk, start, reset, finish
	);
	
parameter N = 8;

// Outputs
output[(N*2)-1:0] out;
output finish;

// Inputs
input start;
input clk;
input reset;
input [N-1:0] a_in;
input [N-1:0] b_in;

// Reference registers
reg[(N*2)-1:0] out_reg;
reg finish_reg = 0;
reg [(N*2)-1:0] a_in_reg;
reg [(N*2)-1:0] b_in_reg;
reg [8:0] bits;

// Continuous assignment

assign out = out_reg;
assign finish = finish_reg;

integer i, j;  

// Reset clk and inputs
always @(negedge reset)
begin
	out_reg = 0;
	a_in_reg = 0;
	b_in_reg = 0;
end

always @(posedge clk)
begin
	if(!reset)
	begin
		case(start)
			1'b0: begin
				a_in_reg = a_in;
				b_in_reg = b_in;
				bits = N;
				finish_reg = 0;
				out_reg = 0;

				
			end
			
			1'b1: begin
				if(b_in_reg[0]==1)
				begin
					out_reg = out_reg + a_in_reg;
				end
				bits = bits - 1;
				a_in_reg = a_in_reg<<1;
				b_in_reg = b_in_reg>>1;				
			end
		endcase
		if(bits==0)
		begin
			
			finish_reg = 1'b1;
			
			//----------------------------------------------------------------------
			
		end
	end
end
endmodule