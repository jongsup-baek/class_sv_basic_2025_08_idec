// ex5_datatype_alwayscomb.sv
//

//`define PROBLEM
`define SOLUTION

module ablock (
   output logic y,
   input  logic sel, sel2,
   input  logic a, b, c, d );

   `ifdef SOLUTION
   // Comment #1 : Verilog-Style
   //    a variable to multiple procedures
   logic out;

   always @(sel, a, b)
      if( sel )
         out= a;
      else
         out= b;

   always @(sel, c, b)
      if( sel2 )
         out= c;
      else
         out= d;
   `endif

   `ifdef PROBLEM
   // Comment #2 : Compilation Error
   //    always_comb allows 
   //    only a single driver on logic op

   logic out;

   always_comb
      if( sel )
         out= a;
      else
         out= b;

   always_comb
      if( sel2 )
         out= c;
      else
         out= d;
   `endif


endmodule

module tb();
	
	logic a_in, b_in, c_in, d_in;
	logic sel, sel2;
	logic y_out;
	
	ablock u_duta( 
	        .y(y_out), .sel(sel), .sel2(sel2), 
	        .a(a_in), .b(b_in), .c(c_in), .d(d_in));
	
	initial begin
	   a_in = 0;
	   b_in = 0; 
	   c_in = 0;
	   d_in = 0; 
	   sel  = 0;
	   sel2 = 0;
	#10;
	   a_in = 0;
	   b_in = 1; 
	   c_in = 0;
	   d_in = 0; 
	   sel  = 0;
	   sel2 = 0;
	#10;
	   a_in = 1;
	   b_in = 0; 
	   c_in = 0;
	   d_in = 0; 
	   sel  = 0;
	   sel2 = 0;
	#10;
	   a_in = 1;
	   b_in = 1; 
	   c_in = 0;
	   d_in = 0; 
	   sel  = 0;
	   sel2 = 0;
	#10;
	   $finish;
	end
	
endmodule

