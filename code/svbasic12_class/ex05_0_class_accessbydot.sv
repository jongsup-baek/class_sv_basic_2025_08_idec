// ex5_class_accessbydot.sv
//

module tb;

   // Comment 1 : Class Example
   //    - properties : number
   //    - methods : set, get
   class myclass;

      int number;

      task set (input int i);
         number= i;
      endtask

      function int get();
         return number;
      endfunction

   endclass

   // Comment 2 : direct access by dot
   //    - c1.number
   myclass c1= new;

   // Instance
   initial begin
      c1.number= 4;
      $display("c1: %0d", c1.number);
   end

   // Comment 3 : access by method
   //    - c2.set(3)
   //    - c2.get()
   myclass c2= new;

   initial begin
      c2.set(3);
      $display("c2: %0d", c2.get());
   end

endmodule

