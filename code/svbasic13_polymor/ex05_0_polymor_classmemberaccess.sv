// ex5_polymor_classmemberaccess.sv
//

module tb;

   // Comment #1 : base class
   class base;
      function void iam();
         $display("i am base");
      endfunction
   endclass
   // Comment #2 : parent class
   class parent extends base;
      function void iam();
         $display("i am Parent");
      endfunction
   endclass
   // Comment #3 : child class
   class child extends parent;
      function void iam();
         $display("i am Child");
      endfunction
   endclass

   base b1;
   parent p1= new();
   child c1= new();

   initial begin

      b1= p1;
      // Comment #4 : 
      //    Handle type= base
      b1.iam();   // "i am base"

      p1= c1;
      // Comment #5 : 
      //    Handle type= parent
      p1.iam();   // "i am parent"

   end

endmodule
