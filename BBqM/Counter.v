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
clock_divider clk ( CLK , reset , CLK5Hz ) ;
// Solving problem of debouncing using flip flop
FF FF_UP ( CLK5Hz , reset , Up , Q_UP ) ; // Synchronous UP Push button
FF FF_DOWN (CLK5Hz , reset , Down , Q_DOWN ) ; // Synchronous DOWN Push button
// Adding the Clock after dividing and synchronous UP and DOWN Push buttons to the UpDown counter 
UpDown_Counter_FSM UpDown( CLK5Hz , reset , Q_UP , Q_DOWN ,Pcount , Full_Flag , Empty_Flag , Alarm_Flag ) ;

endmodule
// ----------------------------- End of File --------------------------------- //
// --------------------------------------------------------------------------- //
