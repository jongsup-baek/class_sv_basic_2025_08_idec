// ex8_polymor_purevirtual.sv
//

`define PROBLEM
//`define SOLUTION

module tb;

   // Comment #1 : virtual class
   //    only has pure virtual method
   //    prototype only
   virtual class base;
      pure virtual function void iam();
   endclass

   // Comment #2 : Sub-class implementation
   //    sub-classes must provide implementation
   class parent extends base;
      virtual function void iam();
         $display("i am Parent");
      endfunction
   endclass

   // Comment #3 : Sub-Sub class 
   //    may include implementation
   class child extends parent;
      virtual function void iam();
         $display("i am Child");
      endfunction
   endclass

   `ifdef PROBLEM
   // Comment #4 : Compilation Error
   //    virtual class instance illegal
   base b1= new(); 
   `endif

   `ifdef SOLUTION
   base b1;      
   parent p1= new();
   child c1= new();

   initial begin
      // Comment #5 : polymorphism 
      //    sub class copied to base class
      b1= p1;
      b1.iam();  // "i am parent"
      b1= c1;
      b1.iam();  // "i am child"
   end
   `endif

endmodule
