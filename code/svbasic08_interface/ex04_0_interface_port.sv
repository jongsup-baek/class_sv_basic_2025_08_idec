// ex4_interface_port.sv
//

// Comment #0 :
//    interface declaration
interface ifa;
   logic gnt, rdy, req, start;
   wire  [7:0] data;
   logic [7:0] addr;
   logic [1:0] mode;

endinterface : ifa

// Comment #1 :
//    Pass the interface(ifa) as port "bus"
module memory ( input bit clk, ifa bus );
   reg [31:0]  mem [0:31];
   logic read, write;

   // Comment #2 :
   //    Access the iterface item using module "port" name
   //    bus.gnt, bus.mode
   assign read  = (bus.gnt && (bus.mode == 0) );
   assign write = (bus.gnt && (bus.mode == 1) );
   always @(posedge clk)
      if(write)
         mem[bus.addr]= bus.data;
   assign bus.data = read ? mem[bus.addr] : 'z;
endmodule
