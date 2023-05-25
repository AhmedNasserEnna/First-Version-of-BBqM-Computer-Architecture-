// --------------------------      Display     ------------------------------- //
module Display( Pcount , Wtime , led0_Pcount , led1_Pcount , led0_Wtime , led1_Wtime ) ;
// -------------------------- Inputs Declarations ---------------------------- //
input [2:0]Pcount ;
input [4:0]Wtime ;
// ------------------------- Outputs Declarations ---------------------------- //
output [6:0]led0_Pcount , led1_Pcount ;
output [6:0]led0_Wtime , led1_Wtime ;
// --------------------------- Wire Declarations ----------------------------- //
wire [3:0]Digit0_Wtime = Wtime % 10 ;
wire [3:0]Digit1_Wtime = Wtime / 10 ;
//Pcount BCD to 7 segment
sevenSegments Digit0_Pcount ( { 1'b0 , Pcount } , led0_Pcount ) ;
sevenSegments Digit1_Pcount ( 4'b0000 , led1_Pcount ) ;
//Wtime BCD to 7 segment
sevenSegments Digit0_wtime ( Digit0_Wtime , led0_Wtime ) ;
sevenSegments Digit1_wtime ( Digit1_Wtime , led1_Wtime ) ;

endmodule
// ----------------------------- End of File --------------------------------- //
// --------------------------------------------------------------------------- //
module Display_DUT();
reg [2:0]Pcount ;
reg [4:0]Wtime ;

wire [6:0]led0_Pcount , led1_Pcount ;
wire [6:0]led0_Wtime , led1_Wtime ;
  initial
  begin
   Pcount<=0; Wtime<=0;#100;
   
   Pcount<=1; Wtime<=0;#100;
   Pcount<=1; Wtime<=3;#100;
 
   Pcount<=2; Wtime<=0;#100; 
   Pcount<=2; Wtime<=6;#100; 
   Pcount<=2; Wtime<=4;#100;
   
   Pcount<=3; Wtime<=0;#100; 
   Pcount<=3; Wtime<=9;#100; 
   Pcount<=3; Wtime<=6;#100;
   Pcount<=3; Wtime<=5;#100;
   
   Pcount<=4; Wtime<=0;#100; 
   Pcount<=4; Wtime<=12;#100; 
   Pcount<=4; Wtime<=7;#100;
   Pcount<=4; Wtime<=6;#100;
   
   Pcount<=5; Wtime<=0;#100; 
   Pcount<=5; Wtime<=15;#100; 
   Pcount<=5; Wtime<=9;#100;
   Pcount<=5; Wtime<=7;#100;
   
   Pcount<=6; Wtime<=0;#100; 
   Pcount<=6; Wtime<=18;#100; 
   Pcount<=6; Wtime<=10;#100;
   Pcount<=6; Wtime<=8;#100;
   
   Pcount<=7; Wtime<=0;#100; 
   Pcount<=7; Wtime<=21;#100; 
   Pcount<=7; Wtime<=12;#100;
   Pcount<=7; Wtime<=9;#100;
     
  end
  
  
  Display d( Pcount , Wtime , led0_Pcount , led1_Pcount , led0_Wtime , led1_Wtime ) ;
endmodule