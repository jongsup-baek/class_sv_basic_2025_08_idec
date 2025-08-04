// ex3_datatype_logicrelaxation.sv
//

module tb();
	
	logic a_in, b_in;
	wire y_out1, y_out2;
	
	ablock         u_dut_verilog( 
	        .y(y_out1), 
	        .a(a_in), 
	        .b(b_in));
	ablock_logic   u_dut_sverilog( 
	        .y(y_out2), 
	        .a(a_in), 
	        .b(b_in));
	
	// Sequence
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

// Comment #1 :
//    Verilog Declaration
module ablock (
   output reg y,     // reg
   input  wire a,    // wire
   input  wire b );  // wire

   always @(*)
      y<= a && b;

endmodule

// Comment #2 :
//    SystemVerilog Declaration
module ablock_logic (
   output logic y,   // logic
   input  logic a,   // logic
   input  logic b ); // logic

   always @(*) y<= a && b;

endmodule

