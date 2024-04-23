`timescale 1ns / 1ps

module counter(
    input upBttn,
    input dwnBttn,
    input CLOCK, 
    input Rst,
    output [3:0] LEDS
    );
    
    // divide 125 MHz clock so that changes to LEDS are visible to the human eye 
    // it would be better to define a seperate clock divider module and use that but this will work  
    reg [26:0] counterClk; // Fcount = F/2^n ~ 1 Hz  
    wire clkOut;
    always@(posedge CLOCK or posedge Rst) 
    begin 
      if(Rst) 
      begin
       counterClk <= 0;
      end
      else if(counterClk == 27'd134217727) 
      begin
       counterClk <= 0;
      end 
      else 
      begin
        counterClk <= counterClk + 1;
      end
    end
    
    assign clkOut = counterClk[26]; // assign with MSB of counter driven by fast clock 
    // clkOut is our divded clock based on bit toggling 
    
    // now drive 4 bit counter with clkOut 
    reg[3:0] counter; 
    always@(posedge clkOut or posedge Rst)
     begin
     if(Rst) // not really necessary 
      begin
      counter <= 0;
      end
     else if(upBttn) 
     begin
      counter <= counter + 1;
     end
     else if(dwnBttn) 
     begin
      counter <= counter - 1; 
     end 
     else 
     begin
       counter <= counter; ;
     end
     end // end always block 
     
     assign LEDS[3:0] = counter[3:0];
endmodule
