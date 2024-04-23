`timescale 1ns / 1ps
/*/////////////////////////////////////////////////////////////////////////////////
This FSM is a sequence detector. It outputs logic 1 when a serial bit pattern has been recieved. If the FSM 
recieves 1101 it outputs high. This can also be done consecutively as the bits are tracked. For instance, if the 
data input(given via button) is 11011010 it will output high. I am dividing the clock to roughly 1 HZ to help with seeing 
everything.
/////////////////////////////////////////////////////////////////////////////////*/


module patternDetectorFSM(
    input CLOCK,
    input dataIn,
    input Rst,
    output LED
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
    
    // drive FSM with slower clock 
    reg [2:0] currentState, nextState; 
    wire tempOut; // drives LED on zybo 
    
    // state declarations and encodings a mealy machine version would require one less state 
    parameter S0 = 3'b000; // first state, some combinations are unused and invalid states (8 possible from 0 to 7)
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    parameter S4 = 3'b100;
    
    always@(posedge clkOut or posedge Rst)
    begin 
      if(Rst) 
      begin
        currentState <= S0; 
      end
      else 
      begin
        currentState <= nextState;
      end
    end // end state update always block 
    
    // next state combinational logic block controlled by current state and input dataIn 
    
    always@(*) // combinational logic 
    begin
      case(currentState)
        S0: if(dataIn) nextState = S1;
            else nextState = S0;
        S1: if(dataIn) nextState = S2;
            else nextState = S0;
        S2: if(dataIn) nextState = S2;
            else nextState = S3;
        S3: if(dataIn) nextState = S4; 
            else nextState = S0;
        S4: if(dataIn) nextState = S2; // when in S4, our output LED should be high and it shouldnt be high at any other time 
            else nextState = S0;
        default: nextState = S0; // blocking assignments 
       endcase 
    
    end // end next state combinational logic block 
    
    assign LED = (currentState == S4); 
    //assign LED = tempOut; // continous assignment 
    
endmodule
