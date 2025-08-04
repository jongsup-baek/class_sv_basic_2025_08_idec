// ex6_polymor_virtualmethod.sv
//

module tb;
   // Comment #1 : Base class
   class base;
      virtual function void iam();
         $display("i am base");
      endfunction
   endclass
   // Comment #2 : Sub class
   //    virtual keyword optional
   class parent extends base;
      virtual function void iam();
         $display("i am Parent");
      endfunction
   endclass
   // Comment #3 : Sub-Sub class
   //    virtual keyword optional
   class child extends parent;
      virtual function void iam();
         $display("i am Child");
      endfunction
   endclass

   base b1;
   parent p1= new();
   child c1= new();

   initial begin
      b1= p1;
      // Handle type= parent
      b1.iam();   // "i am parent"

      p1= c1;
      // Handle type= child
      p1.iam();   // "i am child"

   end

endmodule
