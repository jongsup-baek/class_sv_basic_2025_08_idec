// ex2_userdefined_examples.sv
//

module tb;

   // Comment #1 :
   typedef logic [7:0] vec8_t;
   vec8_t a, b, c;
   function vec8_t test_func;
      input vec8_t a;
      input vec8_t b;

      return( a + b ) ;
   endfunction

   // Comment #2 :
   //    typed (named) type
   typedef logic [15:0] vec16_t;
   vec16_t d;

   // Comment #3 :
   //    anonymous (un-named) type
   logic [15:0] e;

   initial begin
      a= 8'd9;
      b= 8'b1;
      c= test_func(a,b);
      $display("a= %d, b= %d, c= %d",a,b,c);
   end

endmodule
