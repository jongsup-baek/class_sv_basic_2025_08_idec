// ex10_class_staticmember.sv
//

module tb;

   // Comment #0 : typical class definition
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

   // Comment #1 : class aggregation
   class twoframe;
      frame f1;
      frame f2;

      function new(input int basea, d1, d2);
         // Comment #2 : 
         //    "new" explicitly called
         f1= new(basea, d1);
         f2= new(basea+1,d2);
      endfunction
   endclass

   // Comment #3 :
   //    instance handles must be chained
   //    to reach into hierarchy
   twoframe tf1= new(2,3,4);

   initial begin
      tf1.f2.addr= 4;
      $display("base1 %h",tf1.f1.addr);                 

      $display("base2 %h",tf1.f2.addr);
      $finish;
   end

endmodule

