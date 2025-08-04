// ex9_connect_quiz.sv
//

//`define PROBLEM
`define SOLUTION

package P2;
   typedef logic [15:0] mytype2;
endpackage : P2
package P1;
   import P2::*;
   typedef enum {one, two} mytype1;
   localparam int load = 10 ;
endpackage : P1
module inc ( 
   input logic clk, rst, ld, 
   input logic [7:0] data, 
   output logic [7:0] cnt );
endmodule

`ifdef PROBLEM
import P1::load;   
module top;
   import P1::*;
   mytype2 data;
   logic [7:0] count, cnt;
   logic clk, rst, ld, load;
   typedef logic [7:0] mytype1;
   inc U1 ( clk, ld, rst, data[7:0], cnt);
   inc U2 ( .clk, .ld, .rst, .data, .cnt);
   inc U3 ( .* );
   inc U4 ( .*, .count );
   inc U5 ( .*, .data(data[7:0]) );
endmodule
`endif

`ifdef SOLUTION
// The following code has compilation errors. commented solution to the issues
import P1::load;    // Line 2, Redunant
module top;
   import P1::*;     // Line4, Import P2
   mytype2 data;
   logic [7:0] count, cnt;
   logic clk, rst, ld, load;
   typedef logic [7:0] mytype1;
   inc U1 ( clk, ld, rst, data[7:0], cnt); // Line 10, ld, rst swapped
   inc U2 ( .clk, .ld, .rst, .data, .cnt);
   inc U3 ( .* );
   inc U4 ( .*, .count );                  // No port, count
   inc U5 ( .*, .data(data[7:0]) );        // Line 11,12,14 data size mismatch
                                           // Line 10, 11, 12, 13, 14 Multiple drivers on cnt
endmodule
`endif
