// ex6_polymor_virtualmethod.sv
//

module tb;
   // Comment #1 : base class
   //    method, iam_nvirt
   //    virtual method, iam_virt
   class base;
      function void iam_nvirt();
         $display("i am base");
      endfunction
      virtual function void iam_virt();
         $display("i am base");
      endfunction
   endclass
   // Comment #2 : sub class
   //    virtual method, iam_virt
   class parent extends base;
      virtual function void iam_virt();
         $display("i am Parent");
      endfunction
   endclass

   // Comment #3 :
   //    base class b1 (handle)
   //    sub class p1 (instance)
   base b1;
   parent p1= new();

   initial begin
      // Comment #4 : 
      //    copy sub-class instance to base-class handle
      b1= p1;

      // Comment #4 : 
      //    base class, method called
      b1.iam_nvirt();  // "i am base"

      // Comment #4 : virtual method
      //    child class, method called
      b1.iam_virt();   // "i am parent"
   end

endmodule
