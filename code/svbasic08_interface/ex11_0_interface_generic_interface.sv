// ex11_interface_generic_interface.sv
//

interface ifa( input clk);
   logic req, start, gnt, rdy;
   logic [1:0] mode;
   logic [7:0] addr;
   logic [7:0] data;
endinterface : ifa

// Comment #1 :
//    Use a generic interface port in module definition
module memory(interface bus);
endmodule : memory

module cpucore(interface bus);
endmodule : cpucore

module top;

   ifa busa();

   // Comment #2 :
   //    Map Specific interface during instantiation 
   memory  mem ( .bus(busa) );
   cpucore cpu ( .bus(busa) );

endmodule : top
