// ex18_class_parameterized.sv
//

module tb;

   // Comment #1 : parameterized class
   class stack #(parameter type sign = int);
      local sign data[100];
      static int depth;

      task push(input sign indat);
      endtask

      task pop(output sign outdat);
      endtask
   endclass

   // Comment #2 : default
   //    int stack
   stack instack = new;

   // Comment #3 : logic [7:0]
   //    8-bit vector stack
   stack #(logic [7:0]) bytestack = new;

endmodule

