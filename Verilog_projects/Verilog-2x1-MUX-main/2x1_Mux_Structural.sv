//This module structurally describes a 2x1 multiplexor



module Mux21(out, in, sel);
input [1:0] in;
input sel;
output out;
  
//declaring internal variables:
wire in1_and_select, in0_and_notselect, not_select;

  
//for waveforms:
initial begin
$dumpfile("dump.vcd");
$dumpvars(1);
end
  
  not not_sel(not_select, sel); //creating not select
  
  //creates and of two inputs as internal wire:
  
  and in1_and_sel(in1_and_select, in[1], sel); 
  //creates second internal wire from 2 inputs
  and in0_and_not_sel(in0_and_notselect, in[0], not_select);
  
  //output is one bit out of 2 bit input
  //output is denoted as out
  //output is the logical OR of two internal wires
  or output_1(out, in0_and_notselect, in1_and_select);
  
endmodule
