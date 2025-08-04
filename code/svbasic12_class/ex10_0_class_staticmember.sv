// ex10_class_staticmember.sv
//

module tb;
   bit clk= 0; initial forever #50 clk= ~clk;

   class frame;
      // Comment #1 : static class property
      //    keyword with static
      static int frmcount;

      int tag;
      logic [4:0] addr;
      logic [7:0] payload;
      logic parity;

      function new( input int add, dat );
         addr= add;
         payload= dat;
         genpar();

         // Comment #2 : it is used to
         //    Count the number of frames created
         //    Create a unique identity for each
         frmcount++;
         tag= frmcount;
      endfunction

      function void genpar();
         parity = ^{addr,payload};
      endfunction

      function void incdata();
         addr= addr+1;
         payload= payload+1;
         genpar();
      endfunction

      function logic [63:0]   getframe();
         return({tag,2'd0,addr,payload,parity});
      endfunction

   endclass


   logic [63:0] framedata;

   frame f1 = new(1,0);

   frame f2 = new(3,2);

   initial begin
      @(negedge clk);
      framedata= f1.getframe();
      $display("%h",framedata);
      framedata= f2.getframe();
      $display("%h",framedata);
      $finish;
   end

endmodule


