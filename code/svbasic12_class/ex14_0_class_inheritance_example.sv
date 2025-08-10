// ex14_class_inheritance_example.sv
//

//`define PROBLEM

module tb;

   // Comment #1 : Base-class
   //    constructor has two arguments
   //       add, dat
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

  `ifdef PROBLEM   
  // Comment #2 : Sub-class Error
  //    Automatically inserted "super.new();"
  //    at the first line of constructor
  //    which has no arguments
   class badtagframe extends frame;
      static int frmcount;
      int tag;
      function new();
         frmcount++;
         tag= frmcount;
      endfunction

   endclass
   badtagframe one = new();
   `endif

   frame one = new(3,16);
   initial begin
      one.addr= 0;
      $display("addr %d",one.addr);
      $finish;
   end

endmodule


