module tb;

   // Comment #1:
   //    primitive data types usage
   logic [7:0] a;
   bit         b;
   int         c;

   // Comment #2:
   //    typedef is used to give a user-defined name
   //    to existing 'logic' data type
   typedef logic [7:0] vec8_t;

   // Comment #3:
   //    The named data type can be used now to declare other variables
   vec8_t d, e;

   initial begin
      a= 8'd0;
      b= 1'b1;
      c= 32;
      d= 8'd1;
      e= 8'd2;
   end

endmodule
