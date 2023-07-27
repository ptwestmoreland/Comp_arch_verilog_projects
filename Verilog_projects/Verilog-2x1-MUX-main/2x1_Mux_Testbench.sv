//testbench for 2x1 Mux:

`define STRLEN 15
module Mux21Test_v;

	task passTest;
		input actualOut, expectedOut;
		input [`STRLEN*8:0] testType;
		inout [7:0] passed;
	
		if(actualOut == expectedOut) begin $display ("%s passed", testType); passed = passed + 1; end
		else $display ("%s failed: %d should be %d", testType, actualOut, expectedOut);
	endtask
	
	task allPassed;
		input [7:0] passed;
		input [7:0] numTests;
		
		if(passed == numTests) $display ("All tests passed");
		else $display("Some tests failed");
	endtask
	
	task stim;
		input [1:0] newIn;
		input newSel;
		output [1:0] setIn;
		output setSel;
		
		begin
			#90;
			setIn = newIn;
			setSel = newSel;
		end
	endtask
	
	// Inputs
	reg [1:0] in;
	reg sel;
	reg [7:0] passed;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	Mux21 uut (
		.out(out), 
		.in(in), 
		.sel(sel)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		sel = 0;
		passed = 0;
		
		stim(0, 0, in, sel); #10; passTest(out, 0, "Select First 0", passed);
		stim(1, 0, in, sel); #10; passTest(out, 1, "Select First 1", passed);
		stim(2, 0, in, sel); #10; passTest(out, 0, "Select First 2", passed);
		stim(3, 0, in, sel); #10; passTest(out, 1, "Select First 3", passed);
		stim(0, 1, in, sel); #10; passTest(out, 0, "Select Second 0", passed);
		stim(1, 1, in, sel); #10; passTest(out, 0, "Select Second 1", passed);
		stim(2, 1, in, sel); #10; passTest(out, 1, "Select Second 2", passed);
		stim(3, 1, in, sel); #10; passTest(out, 1, "Select Second 3", passed);
		#10;
		
		allPassed(passed, 8);
	end
      
endmodule


