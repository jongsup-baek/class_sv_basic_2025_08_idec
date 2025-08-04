// ex10_2_interface_methodtaskmodport.sv
//

// Comment #1 : interface has method
interface ifa( input clk);
   logic req, start, gnt, rdy;
   logic [1:0] mode;
   logic [7:0] addr;
   logic [7:0] data;

   modport cif(
      input clk, gnt, rdy, 
      output start, req, mode, addr,
      inout  data,
      import read);

   task read (input byte raddr,
              output byte rdata);
      @(posedge clk);
      addr= raddr;
      data= 8'hFF;
      rdata= data;
   endtask

endinterface : ifa

// Comment #2 : 
//    module uses interface.modport method
module cpucore( ifa.cif bus );
   logic [7:0] addr, data;

   initial begin
      addr=8'hAA;
      data=8'hFF;
      bus.read(addr,data);
   end

endmodule


