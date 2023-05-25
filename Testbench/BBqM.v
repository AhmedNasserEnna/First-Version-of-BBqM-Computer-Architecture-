// --------------------------       BBqM       ------------------------------- //
module BBqM ( Up , Down , CLK , reset , Tcount , Empty_Flag , Full_Flag , Alarm_Flag , led0_Pcount , led1_Pcount , led0_Wtime , led1_Wtime ) ;
// -------------------------- Inputs Declarations ---------------------------- //
input Up , Down , CLK , reset ;
input [1:0] Tcount ; 
// ------------------------- Outputs Declarations ---------------------------- //
output Empty_Flag , Full_Flag , Alarm_Flag ;
output [6:0]led0_Pcount , led1_Pcount ;
output [6:0]led0_Wtime , led1_Wtime ;
// --------------------------- Wire Declarations ----------------------------- //
wire [2:0] Pcount;
wire [4:0]address ;
wire [4:0] wtime;
//Counter takes the input from Push buttons to calculate Pcount and Handling flags 
Counter COUNTER ( Up , Down , CLK , reset , Pcount , Empty_Flag , Full_Flag , Alarm_Flag ) ;
//ROM is a storage full of all Wtime in 32 (possible) cases 
assign address={ Tcount , Pcount };
ROM Rom (  address  , wtime ) ;
//Display Takes Pcount and Wtime and Convert them from BCD to 7Seg.code 
Display DISPLAY ( Pcount , wtime , led0_Pcount , led1_Pcount , led0_Wtime , led1_Wtime ) ;

endmodule
// ----------------------------- End of File --------------------------------- //
// --------------------------------------------------------------------------- //
module BBqM_DUT();
  
  reg Up , Down , CLK , reset ;
reg [1:0] Tcount ; 
// ------------------------- Outputs Declarations ---------------------------- //
wire Empty_Flag , Full_Flag , Alarm_Flag ;
wire [6:0]led0_Pcount , led1_Pcount ;
wire [6:0]led0_Wtime , led1_Wtime ;
  initial 
   begin
     reset<=1;
     #5 reset<=0;
     CLK<=0;
     Tcount<=0; Up<=0; Down<=0; #800; 
     Tcount<=0; Up<=1; Down<=0; #800; 
     Tcount<=0; Up<=0; Down<=1; #800; 
     Tcount<=0; Up<=1; Down<=1; #800; 
   
     Tcount<=1; Up<=0; Down<=0; #800; 
     Tcount<=1; Up<=1; Down<=0; #800; 
     Tcount<=1; Up<=0; Down<=1; #800; 
     Tcount<=1; Up<=1; Down<=1; #800;
   
     Tcount<=2; Up<=0; Down<=0; #800; 
     Tcount<=2; Up<=1; Down<=0; #800; 
     Tcount<=2; Up<=0; Down<=1; #800; 
     Tcount<=2; Up<=1; Down<=1; #800;
     
     Tcount<=3; Up<=0; Down<=0; #800; 
     Tcount<=3; Up<=1; Down<=0; #800; 
     Tcount<=3; Up<=0; Down<=1; #800; 
     Tcount<=3; Up<=1; Down<=1; #800;
   end
 always 
  begin
    CLK=~CLK;#50;
  end

  
  BBqM bb( Up , Down , CLK , reset , Tcount , Empty_Flag , Full_Flag , Alarm_Flag , led0_Pcount , led1_Pcount , led0_Wtime , led1_Wtime ) ;
endmodule