// ex5_1_connect_wildcard_import.sv
//

// Comment #0 : Package
package P1;
   localparam int c1= 10;
   typedef enum {start, stop} mode_t;
endpackage : P1

module mthree();
   import P1::*;

   // Comment #1 :
   //    Local c1 take precedence
   logic [7:0] c1; 
   mode_t mode;

   initial begin
      // Comment #2 :
      //    All Package declarations visible
      if(mode==stop)            
         // Comment #3 : 
         //    Resolved name to access package declaration
         $display("%h",P1::c1); 
   end
endmodule


