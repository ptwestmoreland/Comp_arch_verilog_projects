//this module behaviorally describes a 2x4 decoder:

//the module receives a 2 bit input and outputs a 4 bit //number that is encoded as the 2 bit number

module Decode24(out, in);
input [1:0] in;
output reg [3:0] out;
  
//to get waveforms
  
initial begin 
  $dumpfile("dump.vcd");
  $dumpvars(1);
end
  
// binary 00 is encoded to represent binary 1
//this happens for all input combos
 
  always@(*) //triggers at any change in input
    case(in) //compares values of input
      2'b00:  out = 4'b0001; //decodes given inputs
      2'b01:  out = 4'b0010;
      2'b10:  out = 4'b0100; 
      default: out = 4'b1000; //for when in = "11"
    endcase
endmodule
            




