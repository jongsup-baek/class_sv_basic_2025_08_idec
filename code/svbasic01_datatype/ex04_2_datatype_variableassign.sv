// ex4_2_datatype_variableassign.sv
//

//`define PROBLEM
`define SOLUTION

module ablock (
   output logic y,
   input  logic a, b );

   always @(*)
      y<= a && b;
endmodule

module bblock (
   output logic y, 
   input  logic a, b );

   assign y= a || b;
endmodule

module tb();
	`ifdef PROBLEM
	// Comment #1: Compilation Error, 
   //    Mutliple drivers on logic op_out
	logic  a_in, b_in;
	logic  op_out; 
	 
	ablock u1( .y(op_out), .a(a_in), .b(b_in));
	bblock u2( .y(op_out), .a(a_in), .b(b_in));
	`endif
	
   `ifdef SOLUTION
	// Comment #2: OK
	//    net declaration (wire) of op_out
	logic  a_in, b_in;
	wire  op_out;
	
	ablock u1( .y(op_out), .a(a_in), .b(b_in));
	bblock u2( .y(op_out), .a(a_in), .b(b_in));
   `endif
	
	initial begin
	   a_in = 0;
	   b_in = 0; #10;
	   a_in = 0;
	   b_in = 1; #10;
	   a_in = 1;
	   b_in = 0; #10;
	   a_in = 1;
	   b_in = 1; #10;
	   $finish;
	end
endmodule

