// ex16_class_inheritance_multilayer.sv
//

module tb;

   // Comment #1 : Base
   //    Base class
   class frame;
      logic [4:0] addr;
      logic [7:0] payload;
      bit parity;
      function new (input int add, dat);
         addr= add;
         payload= dat;
         genpar();
      endfunction

      function void genpar();
         parity = ^{addr,payload};
      endfunction
   endclass

   // Comment #2 : Sub 
   //    extended from frame
   class tagframe extends frame;
      static int frmcount;
      int tag;
      function new(int add,dat);
         super.new(add,dat);
         frmcount++;
         tag= frmcount;
      endfunction
   endclass

   // Comment #3 : Sub-Sub
   //    extended from tagframe
   class errframe extends tagframe;
      static int errcount;
      function new(int add,dat);
         super.new(add,dat);
         errcount++;
      endfunction
   endclass

   errframe one = new(3,5);

   initial begin
      one.addr= 0;
      $display("addr %d",one.addr);
      $finish;
   end

endmodule

