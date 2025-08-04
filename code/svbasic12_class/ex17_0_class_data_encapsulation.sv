// ex17_class_data_encapsulation.sv
//

module tb;

   // Comment #1 : Base class
   class frame;
      local logic [4:0] addr;
      local logic [7:0] payload;
      protected bit parity;
      function new (input int add, dat);
         addr= add;
         payload= dat;
         genpar();
      endfunction

      function void genpar();
         parity = ^{addr,payload};
      endfunction
   endclass

   // Comment #2 : Sub-class
   class tagframe extends frame;
      local static int frmcount;
      int tag;
      function new(int add,dat);
         super.new(add,dat);
         frmcount++;
         tag= frmcount;
      endfunction
   endclass

   // Comment #3 : Sub-Sub-class
   class errframe extends tagframe;
      local static int errcount;
      function new(int add,dat);
         super.new(add,dat);
      endfunction

      function void add_error();
         parity= ~parity;
         errcount++;
      endfunction

      static function int geterr();
         return(errcount);
      endfunction
   endclass

   int add1=3;
   int data1= 10;
   int no_errs;

   // Comment #4 : 
   //    Which of the lines above generate errors?
   errframe one = new(add1,data1);
   initial begin
      one.errcount= 0;               // ERROR
      one.parity= 1;                 // ERROR
      one.add_error();               // OK
      no_errs= one.errcount;         // ERROR
      no_errs= errframe::geterr();   // OK
      $finish;
   end

endmodule

