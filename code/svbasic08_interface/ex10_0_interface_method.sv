// ex10_interface_method.sv
//

interface ifa( input clk);
   logic req, start, gnt, rdy;
   logic [1:0] mode;
   logic [7:0] addr;
   logic [7:0] data;
endinterface : ifa

// Comment #1: module has "task"
//    But, every module must contain
//    copies of the tasks
module cpucore( ifa bus );
   logic clk;
   task read (input address);
      @(posedge clk);
      bus.addr= address;
   endtask
   initial begin
      read(8'hFF);
   end
endmodule

