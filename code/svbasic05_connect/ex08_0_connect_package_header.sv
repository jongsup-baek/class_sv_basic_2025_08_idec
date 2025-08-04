// ex8_connect_package_header.sv
//

`define PROBLEM
//`define SOLUTION

package P1;
   typedef enum {start, done } mode_t;
endpackage : P1

`ifdef PROBLEM
// Comment #1 : Error 
//    mode_t is not yet defined
module mone( input mode_t mode);
   import P1::*;

   // Place Holder

endmodule : mone
`endif

`ifdef SOLUTION
// Comment #2 : 
//    import in module header
//    import must include semicolon
module mone  
   import P1::*; 
   ( input mode_t mode);

   // Place Holder
   
endmodule : mone
`endif
