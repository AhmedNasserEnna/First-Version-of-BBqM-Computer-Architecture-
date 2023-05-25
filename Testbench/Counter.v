// ---------------------------     Counter     ------------------------------- //
module Counter ( Up , Down , CLK , reset  , Pcount , Empty_Flag , Full_Flag , Alarm_Flag ) ;
// -------------------------- Inputs Declarations ---------------------------- //
input CLK , reset , Up , Down ;
// ------------------------- Outputs Declarations ---------------------------- //
output  [2:0]Pcount ;
output  Full_Flag , Empty_Flag , Alarm_Flag ; 
// --------------------------- Wire Declarations ----------------------------- // 
wire [2:0]Pcount ;
wire CLK5Hz ;
wire Q_UP , Q_DOWN ;
// Adjusting clock to be suitable for project  
//clock_divider clk ( CLK , reset , CLK5Hz ) ;
// Solving problem of debouncing using flip flop
//FF FF_UP ( CLK5Hz , reset , Up , Q_UP ) ; // Synchronous UP Push button
//FF FF_DOWN (CLK5Hz , reset , Down , Q_DOWN ) ; // Synchronous DOWN Push button
// Adding the Clock after dividing and synchronous UP and DOWN Push buttons to the UpDown counter 
UpDown_Counter_FSM UpDown( CLK , reset , Up , Down ,Pcount , Full_Flag , Empty_Flag , Alarm_Flag ) ;

endmodule
// ----------------------------- End of File --------------------------------- //
// --------------------------------------------------------------------------- //
module Counter_DUT();
  
reg CLK , reset , Up , Down ;
wire  [2:0]Pcount ;
wire  Full_Flag , Empty_Flag , Alarm_Flag ;   
 initial 
   begin
     reset<=1;
     #5 reset<=0;
     CLK<=0;
     Up<=0; Down<=0; #800; 
     Up<=1; Down<=0; #800; 
     Up<=0; Down<=1; #800; 
     Up<=1; Down<=1; #800; 
   end
 always 
  begin
    CLK=~CLK;#50;
  end
   Counter c( Up , Down , CLK , reset , Pcount , Empty_Flag , Full_Flag , Alarm_Flag ) ;

endmodule