//this module structurally describes a resettable flip flop

module JK( out, j, k, clk, reset);
input j,k,clk, reset;
output out;
wire wire1,wire2,qbar,notr,outwire, outq, reset_condition;
  
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end
  
  //reset button structural solution
  nand nand5(outq,reset,1); //when reset == 0 outq is 1
  
  and and1(out,outwire,outq); //outq is 0 -> rst is 1, out=0
  
  //2 sec delays 
  nand #2 nand1(wire1, j, qbar, clk); //instantatiating gates
  nand #2 nand2(wire2, k, outwire, clk);
  nand #2 nand3(outwire, wire1, qbar);
  not #2 notreset(notr, reset);
  nand #2 nand4(qbar, out, wire2, notr);
  
  
endmodule