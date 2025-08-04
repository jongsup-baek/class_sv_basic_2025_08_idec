// ex6_class_externalmethod.sv
//

module tb;

   class myclass;
      int number;

      task set (input int i);
         number= i;
      endtask
      
      // Comment #1 : function prototype
      //    using extern
      extern function int get();

   endclass

   // Comment #2 : Implement the method
   //    outside of class, but in same scope
   //    Link to prototype using the
   //    scope resolution operator (::)
   function int myclass::get();
      return number;
   endfunction

   // Comment #3 : 
   //    same usage of class method
   myclass c2= new;

   initial begin
      c2.set(3);
      $display("c2: %0d", c2.get());
   end

endmodule

