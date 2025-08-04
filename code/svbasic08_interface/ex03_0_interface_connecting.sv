// ex3_interface_connecting.sv
//

// interface declaration
interface ifa;
   logic gnt, rdy, req, start;
   wire  [7:0] data;
   logic [7:0] addr;
   logic [1:0] mode;

endinterface : ifa

// Comment #1 : modone
module modone (
   input  bit clk,
   ifa busa);

endmodule

// Comment #2 : modtwo
module modtwo (
   input  bit clk,
   ifa busb);

endmodule

module top;
   logic clk;

   // Comment #3 :
   //    Interface Instantiated
   ifa oneif(), twoif(), busa(), busb() ;

   // Comment #4 :
   //    Binding Interface Instances
   //    Positional
   modone   mem_pos( clk, oneif);

   // Named
   modone   mem_nam( .clk(clk), .busa(twoif));

   // dot-name
   modone   mem_dotnam( .clk, .busa);

   // dot-star
   modtwo   mem_dotstr(.*);

endmodule
