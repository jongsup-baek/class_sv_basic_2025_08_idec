// ex5_connect_explicit_import.sv
//

`define PROBLEM
//`define SOLUTION

// Comment #0 : Package
package P1;
   localparam int c1= 10;
   typedef enum {start, stop} mode_t;
endpackage : P1

`ifdef PROBLEM
module mone( );
   import P1::c1;
   import P1::mode_t;

   // Comment #1 : ERROR
   //    local c1 clashes with P1::c1
   logic [7:0] c1; 
   mode_t mode;

   initial begin
      // Comment #2 : ERROR
      //    Unknown identifier stop 
      //    use P1::stop
      if( mode==stop)                   $display("stop");
   end

endmodule : mone
`endif

`ifdef SOLUTION
module mone( );
   import P1::c1;
   import P1::mode_t;
   mode_t mode;
   initial begin
      if( mode==P1::stop)                   $display("stop");
   end
endmodule : mone
`endif

// Comment #3 : CUS import
import P1::c1;
module mtwo( );

   // Comment #4 :
   //    Local c1 take precedence
   logic [7:0] c1;

endmodule : mtwo
