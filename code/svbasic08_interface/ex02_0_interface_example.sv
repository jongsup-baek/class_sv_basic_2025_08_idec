// ex2_interface_example.sv
//

// Comment #1:
//    interface declaration
interface ifa;
   logic gnt, rdy, req, start;
   wire  [7:0] data;
   logic [7:0] addr;
   logic [1:0] mode;

endinterface : ifa

// Comment #2:
//    Interface used as directionless port 
//    type in module declarations
module memory (
   input  bit clk,
   ifa bus);

endmodule

module cpucore (
   input  bit clk,
   ifa bus);

endmodule

module top;
   logic clk;

   // Comment #3:
   //    Interface Instantiated
   ifa busa();

   // Comment #4:
   //    Interface instantiation mapped
   //    to module ports
   memory   u_memory( clk,busa);
   cpucore  u_cpu( clk, busa );

endmodule
