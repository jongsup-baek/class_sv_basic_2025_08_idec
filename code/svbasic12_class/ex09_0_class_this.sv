// ex9_class_this.sv
//

module tb;
   bit clk= 0; initial forever #50 clk= ~clk;

   class frame;
      logic [4:0] addr;
      logic [7:0] payload;
      logic parity;

      function new( input int addr, dat );
         // Comment #1 : 
         //    Here, this.addr is used to access 
         //    the class property addr
         //    otherwise, it is hidden by 
         //    the function argument addr
         this.addr= addr;
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
         return({parity,addr,payload});
      endfunction

   endclass

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


