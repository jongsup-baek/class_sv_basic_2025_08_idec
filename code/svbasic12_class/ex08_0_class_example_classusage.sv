// ex8_class_example_classuage.sv
//

module tb;
   bit clk= 0; initial forever #50 clk= ~clk;

   class frame;
      logic [4:0] addr;
      logic [7:0] payload;

      // Comment #1 : Initial property value
      logic parity= 0;

      function new( input int add, dat );
         // Comment #2 : constructor arguments
         //    are assigned to properties
         addr= add;
         payload= dat;
         genpar();
      endfunction

      function void genpar();
         parity = ^{addr,payload};
      endfunction

      function void incdata();
         addr= addr+1;
         payload= payload+1;
         genpar();
      endfunction

      function logic [13:0]   getframe();
         return({addr,payload,parity});
      endfunction

   endclass

   // Comment #3 : constructor calls
   //    method to get updated parity value
   logic [13:0] framedata;
   frame one = new(3,16);

   initial begin
      @(negedge clk);
      framedata= one.getframe();

      $display("%h",framedata);
      repeat(8) begin
         @(negedge clk);
         one.incdata();
         framedata= one.getframe();
         $display("%h",framedata);
      end
      $finish;
   end

endmodule
