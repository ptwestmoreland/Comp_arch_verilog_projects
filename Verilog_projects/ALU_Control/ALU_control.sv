module ALUControl(ALUCtrl, ALUop, Opcode);

  input [10:0] Opcode; // The opcode used in control unit
  input [1:0] ALUop; //This is an internal control structure
  output reg [3:0] ALUCtrl; //4bit output that determines ALU OP 
     
     always @(*) begin
     	if(ALUop == 2'b00) begin // for LDUR and STUR
     		ALUCtrl <= #2 4'b0010; //opcode doesnt matter
     	end
       else if(ALUop == 2'b01) begin // Conditional branch 
     		ALUCtrl <= #2 4'b0111; // pass input b setting, no opcode
     	end
       else if(ALUop == 2'b10) begin //start R type
         if(Opcode == 11'b10001011000) begin //ADD opcode
     			ALUCtrl <= #2 4'b0010;
     		end
        else if(Opcode == 11'b11001011000) begin // SUB opcode 
     			ALUCtrl <= #2 4'b0110;
     		end
         else if(Opcode == 11'b10001010000) begin // AND opcode 
     			ALUCtrl <= #2 4'b0000;
     		end
         else if(Opcode == 11'b10101010000) begin // SUB opcode  
     			ALUCtrl <= #2 4'b0001;
     		end
     	end
     end 
  
  //ALUOP = 11 isnt needed or defined 

endmodule
