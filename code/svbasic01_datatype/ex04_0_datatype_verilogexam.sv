// ex4_datatype_examples.sv
//

// Comment #1:
//    y is "reg" in ablock, 
//       assigned in a procedural block
//    a, b are "wire" module input
module ablock (
   output reg y, 
   input  wire a, b);

   always @(*)
      y<= a && b;
endmodule

// Comment #2:
//    y is "wire" in bblock 
//       assigned by a continuous assignment
//    a, b are "wire" module input
module bblock (
   output wire y,
   input  wire a, b);

   assign y= a || b;
endmodule

module tb();
   // Comment #3:
   //    and_out, or_out are wire in module tb, 
   //    instance output
   reg a_in, b_in;
   wire  and_out, or_out;
   ablock u1( .y(and_out), .a(a_in), .b(b_in));
   bblock u2( .y(or_out), .a(a_in), .b(b_in));

   // Comment #4:
   //    a_in, b_in are reg in the module tb,
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
      $finish;
   end

endmodule

