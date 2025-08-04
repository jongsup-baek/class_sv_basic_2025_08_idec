// ex6_connect_import_export.sv
//

//`define PROBLEM
`define SOLUTION

// Comment #0 :
package P1;
   int c1= 10;
endpackage : P1

`ifdef PROBLEM
// Comment #1 :
//    Could add "export P1::*"
package P2;
   import P1::*;
   int c2= c1;
endpackage : P2

module mone( );
   // Comment #2 : Error
   //    c2 undefined
   logic [7:0] d= c2;

   import P2::*;
   initial begin
      $display("%0d",c2);

      // Comment #3 : Error
      //    c1 undefined
      //    Need to import P1::*
      $display("%0d",c1); 
   end
endmodule : mone
`endif

`ifdef SOLUTION
package P2;
   import P1::*;
   export P1::*;
   int c2= c1;
endpackage : P2

module mone( );
   import P2::*;
   initial begin
      $display("%0d",c2);
      $display("%0d",c1); 
   end
endmodule : mone
`endif
