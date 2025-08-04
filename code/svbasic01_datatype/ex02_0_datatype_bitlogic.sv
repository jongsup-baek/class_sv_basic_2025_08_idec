// ex2_datatype_bitlogic.sv
//

module tb();
	
	// Comment #1 : 2-State variables
	// initialize to 0
	// hides failure to initialize design
	bit   [7:0]   twostate;
	
	// Comment #2 : 4-State variable
	// initialize to x
	// exposes failure to initialize design
	logic [7:0]   fourstate;
	
	// fourstate, twostate
	// 0        , 0
	// 1        , 1
	// z        , 0
	// x        , 0
	always @(*)
	    twostate<= fourstate;
	
	initial begin
	   fourstate =8'hz; #10;
	   fourstate =8'hx; #10;
	   fourstate =8'h0; #10;
	   fourstate =8'h1; #10;
	end
	
	// Comment #3
	// Usage of 2 State types in Testbench
	bit [7:0]   test_number;
	bit [7:0]   mem8x32 [0:31];
	int i;
	
	initial begin
	   test_number= 1; 
	   i= 2; 
	   #10;
	   mem8x32[0]= test_number;
	   mem8x32[1]= i;
	   #60; $finish;
	end
	
endmodule

