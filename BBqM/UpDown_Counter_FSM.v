// --------------------------- Up Down Counter ------------------------------- //
module UpDown_Counter_FSM ( clk , reset , up , down ,Pcount , Full_Flag , Empty_Flag , Alarm_Flag ) ;
// -------------------------- Inputs Declarations ---------------------------- //
input clk , reset , up , down;
// ------------------------- Outputs Declarations ---------------------------- //
output [2:0] Pcount ;
output Full_Flag , Empty_Flag , Alarm_Flag ;
// ---------------------- Parameters Declarations ---------------------------- // 
parameter 
      S0 = 3'b000 , // initial state ( empty state )
		S1 = 3'b001 , 
		S2 = 3'b010 , 
		S3 = 3'b011 , 
      S4 = 3'b100 , 
      S5 = 3'b101 , 
      S6 = 3'b110 , 
      S7 = 3'b111 ; // last state ( full state )		 
// ---------------------------- Reg Declarations ----------------------------- //
reg [2:0] Pcount;
reg [2:0] State;
reg Full_Flag , Empty_Flag , Alarm_Flag ;
always @( posedge clk or posedge reset )
	begin

		 if( reset ) // reset the state to initial state and output to zeros
			 begin
				State <= S0 ;
				Pcount <= 3'b000 ;
				Full_Flag  <= 1'b0 ;
				Empty_Flag <= 1'b1 ;
				Alarm_Flag <= 1'b0 ;
			 end
		 else
		   begin
			   case(State) // state transitions  
				  
				  S0: // state 0
				      if( up )
				       begin
				        State <= S1 ;
				        Pcount <= 3'b001 ;
				        Full_Flag  <= 1'b0 ;
				        Empty_Flag <= 1'b0 ;
				        Alarm_Flag <= 1'b0 ;  
				       end
				      else if( down )
				       begin
				        State <= S0 ;
				        Pcount <= 3'b000 ;
				        Full_Flag  <= 1'b0 ;
				        Empty_Flag <= 1'b1 ;
				        Alarm_Flag <= 1'b1 ;  
				       end
				  
				  S1: // state 1
				      if( up )
				       begin
				        State <= S2 ;
				        Pcount <= 3'b010 ;
				        Full_Flag  <= 1'b0 ;
				        Empty_Flag <= 1'b0 ;
				        Alarm_Flag <= 1'b0 ;  
				       end
				      else if( down )
				       begin
				        State <= S0 ;
				        Pcount <= 3'b000 ;
				        Full_Flag  <= 1'b0 ;
				        Empty_Flag <= 1'b1 ;
				        Alarm_Flag <= 1'b0 ;  
				       end
				  
				  S2:  // state 2
				      if( up )
				       begin
				        State <= S3 ;
				        Pcount <= 3'b011 ;
				        Full_Flag  <= 1'b0 ;
				        Empty_Flag <= 1'b0 ;
				        Alarm_Flag <= 1'b0 ;  
				       end
				      else if( down )
				       begin
				        State <= S1 ;
				        Pcount <= 3'b001 ;
				        Full_Flag  <= 1'b0 ;
				        Empty_Flag <= 1'b0 ;
				        Alarm_Flag <= 1'b0 ;  
				       end
				      
				  S3: // state 3
				      if( up )
				       begin
				        State <= S4 ;
				        Pcount <= 3'b100 ;
				        Full_Flag  <= 1'b0 ;
				        Empty_Flag <= 1'b0 ;
				        Alarm_Flag <= 1'b0 ;  
				       end
				      else if( down )
				       begin
				        State <= S2 ;
				        Pcount <= 3'b010 ;
				        Full_Flag  <= 1'b0 ;
				        Empty_Flag <= 1'b0 ;
				        Alarm_Flag <= 1'b0 ;  
			         end
			    S4:  // state 4
			       if( up )
				      begin
				        State <= S5 ;
				        Pcount <= 3'b101 ;
				        Full_Flag  <= 1'b0 ;
				        Empty_Flag <= 1'b0 ;
				        Alarm_Flag <= 1'b0 ;  
				      end
				      else if( down )
				       begin
				        State <= S3 ;
				        Pcount <= 3'b011 ;
				        Full_Flag  <= 1'b0 ;
				        Empty_Flag <= 1'b0 ;
				        Alarm_Flag <= 1'b0 ;
				       end   
		    
		      S5:  // state 5  
			        if( up )
				       begin
				        State <= S6 ;
				        Pcount <= 3'b110 ;
				        Full_Flag  <= 1'b0 ;
				        Empty_Flag <= 1'b0 ;
				        Alarm_Flag <= 1'b0 ;  
				       end
				      else if( down )
				       begin
				        State <= S4 ;
				        Pcount <= 3'b100 ;
				        Full_Flag  <= 1'b0 ;
				        Empty_Flag <= 1'b0 ;
				        Alarm_Flag <= 1'b0 ; 
				       end 
		    
		      S6:   // state 6
			        if( up )
				       begin
				        State <= S7 ;
				        Pcount <= 3'b111 ;
				        Full_Flag  <= 1'b1 ;
				        Empty_Flag <= 1'b0 ;
				        Alarm_Flag <= 1'b0 ;  
				       end
				      else if( down )
				       begin
				        State <= S5 ;
				        Pcount <= 3'b101 ;
				        Full_Flag  <= 1'b0 ;
				        Empty_Flag <= 1'b0 ;
				        Alarm_Flag <= 1'b0 ;  
				       end
		    
		      S7:    // state 7
			        if( up )
				       begin
				        State <= S7 ;
				        Pcount <= 3'b111 ;
				        Full_Flag  <= 1'b1 ;
				        Empty_Flag <= 1'b0 ;
				        Alarm_Flag <= 1'b1 ;  
				       end
				      else if( down )
				       begin
				        State <= S6 ;
				        Pcount <= 3'b110 ;
				        Full_Flag  <= 1'b0 ;
				        Empty_Flag <= 1'b0 ;
				        Alarm_Flag <= 1'b0 ;  
				       end 
			endcase
		 end 
	end
// --------------------------------------------------------------------------- //
endmodule
// ----------------------------- End of File --------------------------------- //
// --------------------------------------------------------------------------- //
