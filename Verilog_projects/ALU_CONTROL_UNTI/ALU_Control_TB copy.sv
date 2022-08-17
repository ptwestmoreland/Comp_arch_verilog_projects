module ALUControlTest();

task passTest;
  input [3:0] expectedC, outputC;
	
		if(outputC == expectedC) begin 
          $display ("Passed, %d gives %d", ALUop, outputC);
		end

	endtask

reg [1:0] ALUop;
reg [10:0] Opcode;


  wire [3:0] outputC;

ALUControl uut(.ALUCtrl(outputC), .ALUop(ALUop), .Opcode(Opcode));

initial begin
	ALUop = 0;
	Opcode = 0;

	ALUop = 2'b00; Opcode = 11'bXXXXXXXXXXX; //Data transfer instructions
	#90 passTest(outputC, 4'b0010);
    ALUop = 2'b01; Opcode = 11'bXXXXXXXXXXX; //Conditional Branch
	#90 passTest(outputC, 4'b0111);
    ALUop = 2'b10; Opcode = 11'b11001011000; //SUB 
	#90 passTest(outputC, 4'b0110);
    ALUop = 2'b10; Opcode = 11'b10101010000; //ORR
	#90 passTest(outputC, 4'b0001);
    ALUop = 2'b10; Opcode = 11'b10001010000; //AND
	#90 passTest(outputC, 4'b0000);
    ALUop = 2'b10; Opcode = 11'b10001011000; //ADD 
	#90 passTest(outputC, 4'b0010);
    ALUop = 2'b10; Opcode = 11'b10101010000; //AND
	#90 passTest(outputC, 4'b0001);
    ALUop = 2'b10; Opcode = 11'b 10001011000; //ADD
	#90 passTest(outputC, 4'b0010);
    ALUop = 2'b10; Opcode = 11'b11001011000; //SUB
	#90 passTest(outputC, 4'b0110);

end

endmodule 