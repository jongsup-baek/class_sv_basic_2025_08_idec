// ex4_1_datatype_relaxedexam.sv
//

// Comment #1:
//    y is "logic" in ablock, 
//       assigned in a procedural block
//    a, b are "logic" module input
module ablock (
   output logic y,
   input  logic a, b );

   always @(*)
      y<= a && b;
endmodule

// Comment #2:
//    y is "logic" in bblock, 
//       assigned by a continuous assignment
//    a, b are "logic" module input
module bblock (
   output logic y, 
   input  logic a, b );

   assign y= a || b;
endmodule

module tb();

	// Comment #3:
	//    and_out, or_out are "logic" in module tb, 
   //    instance output
	logic  a_in, b_in;
	logic  and_out, or_out;
	
	ablock u1( .y(and_out), .a(a_in), .b(b_in));
	bblock u2( .y(or_out), .a(a_in), .b(b_in));
	
	// Comment #4:
	//    a_in, b_in are "logic" in the module tb,
	//    assigned in an initial procedual block
	initial begin
	   a_in = 0;
	   b_in = 0; #10;
	   a_in = 0;
	   b_in = 1; #10;
	   a_in = 1;
	   b_in = 0; #10;
	   a_in = 1;
	   b_in = 1; #10;
	end
	
endmodule

