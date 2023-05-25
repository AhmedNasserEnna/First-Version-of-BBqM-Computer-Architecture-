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

