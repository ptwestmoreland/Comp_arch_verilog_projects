`timescale 1ns / 1ps
/*////////////////////////////////////////////////////////////////////////////////
This is an 8:3 priority encoder for my flash ADC. My ADC is designed as follows:
sample and hold stage 
comparator array and resistor ladder, 7 logical outputs 
8 inputs into encoder stage, the LSB is set to constant logic 1 
3 digital output signals shown in onboard LEDS 
ADC was designed to have:
decent DNL ~.4 LSB/CODE
small offset error
low linear gain error  
Vfs = 0.8 V 
1 LSB = 0.1 V 
NOTE VIP: If you reproduce this circuit, level shift the 5 V digital input 
signals down to, at most, 3.4 V. The zybo pins will be damaged at any higher of 
a logic level. Level shifting can be done with transistors, specialized ICs, 
attenuating noninverting op amps,  
or even a voltage divider provided that current flowing in to the pins (input impedance) 
of the next stage is accounted for. 
//////////////////////////////////////////////////////////////////////////////////*/


module priorityEncoderADC(
    input [7:0] data, // GPIO ports on my board connected to wires from circuit board 
    output [2:0] LEDS // onboard LEDS 
    );
    reg [2:0] tempOut;
    always@(*) 
    begin
      casez(data) 
      8'b1???????: tempOut = 3'b111;
      8'b01??????: tempOut = 3'b110;
      8'b001?????: tempOut = 3'b101;
      8'b0001????: tempOut = 3'b100;
      8'b00001???: tempOut = 3'b011;
      8'b000001??: tempOut = 3'b010;
      8'b0000001?: tempOut = 3'b001; // 00000001 is the only other possible case bc LSB is always hot 
      default: tempOut = 3'b000; // covers case where only LSB is 1, cant all be 0 because of wiring 
      endcase
    end // end always 
    
    assign LEDS = tempOut; // needed bc LEDS arent type reg so cant be assigned in above block 
    
endmodule
