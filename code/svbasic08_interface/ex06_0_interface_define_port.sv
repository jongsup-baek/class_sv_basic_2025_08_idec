// ex6_interface_define_port.sv
//

// Comment #1 : 
//    Define "clk" port in
//    Interface declaration
interface ifa (input clk);
   logic gnt, rdy, req, start;
   wire  [7:0] data;
   logic [7:0] addr;
   logic [1:0] mode;

endinterface : ifa

module memory ( ifa bus);

endmodule

module cpucore ( ifa bus);

endmodule

module top;
   logic clk;

   // Comment 2 : 
   //    Connect "clk" port of "top" module
   //    to interface port during instantiation
   ifa busa(clk);

   memory   u_memory( busa);
   cpucore  u_cpu( busa );

endmodule : top
