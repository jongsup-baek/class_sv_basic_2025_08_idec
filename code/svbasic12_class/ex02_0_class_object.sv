// ex2_class_object.sv
//

module tb;

   // Comment #3 : Class include
   //       data item : properties, fields
   //       method : tasks, functions
   class myclass;

      // Comment #4 : data item
      //    Class Property/Field
      int number;

      // Comment #5 : Class method
      //    task set
      task set ( input int i);
         number= i;
      endtask

      // Comment #6 : Class method
      //    function get
      function int get();
         return number;
      endfunction

   endclass

   // Comment #1 : Declaring a variable of class "myclass".
   //    c1 is called "handle"
   myclass c1;

   // Comment #2 : Creating an instance of "myclass" with "new".
   //    Now, c1 is inferred as "instance" or "object"
   initial begin
      c1= new;
   end
  
endmodule

