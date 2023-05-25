// ------------------------ Seven Segments decoder --------------------------- //
module sevenSegments (bcd,dec);
// -------------------------- Inputs Declarations ---------------------------- //
input [3:0]bcd;
// ------------------------- Outputs Declarations ---------------------------- //
output reg [6:0] dec;
always@(bcd)
		begin 
			case(bcd)

				4'b0000 : dec = ~7'b1111110 ; // 0
				4'b0001 : dec = ~7'b0110000 ; // 1
				4'b0010 : dec = ~7'b1101101 ; // 2
				4'b0011 : dec = ~7'b1111001 ; // 3
				4'b0100 : dec = ~7'b0110011 ; // 4
				4'b0101 : dec = ~7'b1011011 ; // 5
				4'b0110 : dec = ~7'b1011111 ; // 6
				4'b0111 : dec = ~7'b1110000 ; // 7
				4'b1000 : dec = ~7'b1111111 ; // 8
				4'b1001 : dec = ~7'b1111011 ; // 9


			default : dec = ~7'b1111110 ; //0 default  
			endcase 
		end

		
endmodule
// ----------------------------- End of File --------------------------------- //
// --------------------------------------------------------------------------- //
module sevenSegments_DUT();
  reg [3:0]bcd;
  wire [6:0] dec;
  initial
  begin
    bcd <=0;#100;
    bcd <=1;#100;
    bcd <=2;#100;
    bcd <=3;#100;
    bcd <=4;#100;
    bcd <=5;#100;
    bcd <=6;#100;
    bcd <=7;#100;
    bcd <=8;#100;
    bcd <=9;#100;

  end
  
  sevenSegments ss(bcd,dec);
endmodule
