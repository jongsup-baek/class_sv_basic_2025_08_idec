// ex10_1_interface_methodtask.sv
//

// Comment #1 : interface has method
interface ifa( input clk);
   logic req, start, gnt, rdy;
   logic [1:0] mode;
   logic [7:0] addr;
   logic [7:0] data;

   task read (input byte raddr,
              output byte rdata);
      @(posedge clk);
      addr= raddr;
      data= 8'hFF;
      rdata= data;
   endtask

endinterface : ifa

// Comment #2 : 
//    module uses interface method
module cpucore( ifa bus );
   logic [7:0] addr, data;

   initial begin
      addr=8'hAA;
      data=8'hBB;
      #10
      bus.read(addr,data);
   end

endmodule

module top;
   logic clk;
   ifa bus( clk );

   cpucore core( bus );

   initial begin
      clk=0;
      forever #5 clk=~clk;
   end

   initial begin
      #100;
      $finish;
   end
endmodule