// ex13_class_inheritance.sv
//

module tb;

   // Comment #1 : Base Class
   //    b1, m1 definition
   class base;
      int b1;
      function void m1;
      endfunction
   endclass

   // Comment #2 : derived class
   //    b1, m1 included 
   //       (base data, function)
   //    b2, m2 added
   class derived extends base;
      int b2;
      function void m2;
      endfunction
   endclass

   base base_c= new;
   derived derived_c= new;

   initial begin
      $display("base b1 %d",base_c.b1);
      $display("derived b1 %d",derived_c.b1);
      $finish;
   end

endmodule


