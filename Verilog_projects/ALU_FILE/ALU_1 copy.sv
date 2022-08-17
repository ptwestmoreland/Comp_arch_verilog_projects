
module ALU(BusW, Zero , BusA , BusB , ALUCtrl ) ;
  
  input [63:0] BusA;
  input [63:0] BusB; //input ports
  input [3:0] ALUCtrl; //4 bit bus controls alu operation
  output reg [63:0] BusW; //output register
  output Zero; //zero output for branch
  
//condition that zero = 1 when busW is 0 taken care of below
  
  assign #1 Zero = (BusW) ? 0 : 1;
  
  
/*  for instance in a CBNZ instruction BusW = busA - Bus B = 0 -> zero = 1 */

  
 //non blocking assignments in always block
 //ALU control code determines operations on input busses/registers
  
  always@(BusA or BusB or ALUCtrl) begin
    if(ALUCtrl == 4'b0000) begin  //Logical and operation
      BusW <=  BusA & BusB; end
    else if(ALUCtrl == 4'b0001) begin //logical OR
      BusW <=  BusA | BusB;
    end
    else if(ALUCtrl == 4'b0010) begin //Addition
    BusW <=  BusA + BusB;
    end
    else if(ALUCtrl == 4'b0011) begin
      BusW <=  BusA << BusB;
    end
    else if(ALUCtrl == 4'b0100) begin
      BusW <=   BusA >> BusB;
    end
    else if(ALUCtrl == 4'b0110) begin
      BusW <= BusA - BusB;
    end
    else if(ALUCtrl == 4'b0111) begin
      BusW <=   BusB;
    end
  end
    
//end always block
  
//for EDA Waveforms:
  
    initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end
  
  
endmodule 
