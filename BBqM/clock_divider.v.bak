// ---------------------------  clock divider  ------------------------------- //
module clock_divider ( clk , reset , CLK5Hz ) ;
// -------------------------- Inputs Declarations ---------------------------- //
input clk, reset ;
// ------------------------- Outputs Declarations ---------------------------- //
output CLK5Hz ;
// ---------------------------- Reg Declarations ----------------------------- //
reg CLK5Hz ;
reg [22:0] count ;// log2(5_000_000)=23 bit
always @( posedge clk or posedge reset )
	begin
		if( reset ) // reset the counter circuit to initial (zero)
			begin
				count <= 0;
				CLK5Hz <= 0;
			end
		else
			begin
				if( count < 5_000_000 )
					count <= count + 1 ; // count 5 million 
				else 
					begin
						CLK5Hz = ~CLK5Hz ; // toggle the clk high\low
						count <= 0 ;
					end
			end
	end		

endmodule
// ----------------------------- End of File --------------------------------- //
// --------------------------------------------------------------------------- //
