// ex5_interface_instance_identifier.sv
//

// Comment #0 :
// interface declaration
interface ifa;
   logic gnt, rdy, req, start;
   wire  [7:0] data;
   logic [7:0] addr;
   logic [1:0] mode;

endinterface : ifa

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

   // Comment #1. 
   //    Declare Interface instance busa
   ifa busa();

   memory   u_memory( clk, busa);
   cpucore  u_cpu( clk, busa );

   // Comment #2. Access interface signal
   //    using instance name
   always @(busa.rdy)
      if(busa.mode == 0)
         $display("Memory Read");

endmodule : top
