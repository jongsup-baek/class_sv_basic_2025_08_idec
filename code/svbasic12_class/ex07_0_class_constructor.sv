// ex7_class_constructor.sv
//

module tb;

   // Comment #1 : 
   //    Default constructor
   //    c1.number = x
   class defcon;
      int number;
   endclass

   defcon c1= new;

   // Comment #2 : 
   //    Explicit constructor
   //    c2.number = 5
   class expcon;
      int number;
      function new();
         number= 5;
      endfunction
   endclass

   expcon c2= new;

   // Comment #3 : 
   //    Explicit constructor with arguments
   //    c3.number = 3
   class argcon;
      int number;
      function new(input int ai);
         number= ai;
      endfunction
   endclass

   argcon c3= new(3);

   initial begin
      $display("c1: %0d", c1.number);
      $display("c2: %0d", c2.number);
      $display("c3: %0d", c3.number);
   end

endmodule


