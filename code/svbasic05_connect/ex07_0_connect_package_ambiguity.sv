// ex7_connect_package_ambiguity.sv
//

//`define PROBLEM
`define SOLUTION

package P1;
   typedef enum {start, done } mode_f;
   int c1= 5;
endpackage : P1

package P2;
   int c1= 8;
endpackage : P2

`ifdef PROBLEM
// Solution #1 :
//    Wildcard Import danager
module mone( );
   import P1::*;
   import P2::*;

   // Comment #1 : 
   //    c1 cause ambiguous error
   logic [7:0] d= c1;

   // Comment #2 :
   //    OK - resolved
   logic [7:0] e= P2::c1;
endmodule : mone
`endif

`ifdef SOLUTION
// Solution #2 :
// Explicitly Import
module mone( );
   import P1::*;
   import P2::*;
   // Comment #3 :
   //    Explicitly import C1 
   //    from package you want to always infer
   import P2::c1; 

   // Comment #4 :
   //    OK - resolved
   logic [7:0] e= c1;
endmodule : mone
`endif

