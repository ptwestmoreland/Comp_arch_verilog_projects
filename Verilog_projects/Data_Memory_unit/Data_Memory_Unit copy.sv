module DataMemory(ReadData, Address, WriteData,
                  MemoryRead, MemoryWrite, Clock);
     input [63:0] Address, WriteData;
     input MemoryRead, MemoryWrite, Clock;
  
     output reg [63:0] ReadData;
     reg [63:0] mem [63:0]; //internal memory blocks for reads and writes
  
  always@(negedge Clock) begin //memory write occurs here only
    if(MemoryWrite == 1'b1 && MemoryRead == 1'b0) begin
      mem[Address] <= WriteData;
    end
  end
  
  always@(posedge Clock) begin //Memory reads can happen here
    //MemoryRead must be high and MemWrite must be low
    if(MemoryRead == 1'b1 && MemoryWrite == 1'b0) begin
      ReadData <= mem[Address];  //output is value stored at this address
    end
  end
endmodule 



