// ex6_1_polymor_virtualmethod_extra.sv
//

//`define PROBLEM
`define SOLUTION

module tb;
   // Comment #1 : base class
   //    virtual function get_error_code
   //       default, -1
   class base;
      virtual function int get_error_code();
         return -1; // Default, error return
      endfunction
   endclass

   // Comment #2 : child class
   //    error_code
   //    virtual function get_error_code
   class child extends base;
      int error_code;
      function new(int code);
         error_code = code;
      endfunction
      // child class overried the function
      virtual function int get_error_code();
         return error_code;
      endfunction
   endclass

   base b;
   child c;

   initial begin
      // Comment #3 :
      //    child instance, assign to parent handle
      c = new(42);
      b = c;

      `ifdef PROBLEM
      // Comment #4 : Compilation Error
      //    Not allowed to access error_code(child member)
      $display("Error code = %0d", b.error_code);
      `endif

      `ifdef SOLUTION
      // Comment #5 : 
      //    access via virtual method
      $display("Error code = %0d", b.get_error_code());
      `endif
   end
endmodule

