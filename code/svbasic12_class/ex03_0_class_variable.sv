// ex3_class_variable.sv
//

module tb;

   class myclass;
      int number;
   endclass

   // Comment #1 : Handle
   //    c1, declaration
   myclass c1;

   initial begin
      // Comment #2 : Instance
      //    c1, after new
      c1= new;
   end

   // Comment #3 : Handle & Instance
   //    c2
   myclass c2 = new;

endmodule

