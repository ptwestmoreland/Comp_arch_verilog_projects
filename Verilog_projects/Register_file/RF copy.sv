module RegisterFile(BusA, BusB, BusW, RA,RB,RW,RegWr,Clk);
  input RegWr, Clk;
  input [63:0] BusW;
  input[4:0] RA,RB,RW;
  output [63:0] BusA, BusB;
  
    
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end
  
  reg [63:0] registers[31:0]; //32 - 64 bit registers
  
  //initializes all registers to 0 and allows some to be altered
  //X31 will always be 0
  
  integer k = 0;
  
  initial begin 
  while(k < 32) begin
    registers[k] = 0;
    k = k + 1;
  end
  end
  
  assign #2 BusA = registers[RA];
  assign #2 BusB = registers[RB];
  
  always@(negedge Clk) begin //registers updated on falling edge
    if(RegWr == 1) begin  
      if(RW != 31) begin
        registers[RW] = #3 BusW; //register 31 cant be made to != 0
      end
    end
  end
endmodule

  
  