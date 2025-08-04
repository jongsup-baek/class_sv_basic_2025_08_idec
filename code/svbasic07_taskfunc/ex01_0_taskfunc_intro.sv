// ex1_taskfunc_intro.sv
//

module tb;

   logic [7:0] indata;
   logic [7:0] addr;
   logic       write;

   // Comment #1 : task Definition
   task write_mem (
      input [7:0]   waddr, wdata,
      output [7:0] indata, addr);

      begin
            indata   <= wdata;
            addr     <= waddr;
            write    <= 1'b0;
         #5  write    <= 1'b1;
         #10 write    <= 1'b0;
      end
   endtask

   // Comment #2 : function Definition
   function [7:0] flip (
      input [7:0] word );

      reg   [7:0] tempword;
      integer i;

      begin
         for (i=7; i>0; i=i-1)
            tempword[i]= word[7-i];
         flip= tempword;
      end
   endfunction

endmodule
