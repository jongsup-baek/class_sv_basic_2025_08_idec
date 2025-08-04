// ex10_class_staticmember.sv
//

module tb;

   class frame;
      static int frmcount;
      int tag;
      logic [4:0] addr;
      logic [7:0] payload;
      logic parity;

      function new( input int add, dat );
         addr= add;
         payload= dat;
         genpar();
         frmcount++;
         tag= frmcount;
      endfunction

      // Comment #1 : static class method
      //    keyword static
      static function int getcount();
         return(frmcount);
      endfunction

      function void genpar();
         parity = ^{addr,payload};
      endfunction

      function logic [63:0]   getframe();
         return({tag,2'd0,addr,payload,parity});
      endfunction

   endclass

   frame f1, f2;
   int frames;
   initial begin
      // Comment #2 : called without Instance
      //    Resolution operator access
      frames= frame::getcount(); // 0
                                                         $display("%h",frames);
      // Comment #3 : called without Instance
      //    Handle access
      frames= f2.getcount();     // 0
                                                         $display("%h",frames);
      f1= new(3,4);
      f2= new(5,6);

      // Comment #4 : from any class handle
      // Handle access
      frames= f2.getcount();     // 2
                                                         $display("%h",frames);
      $finish;
   end

endmodule


