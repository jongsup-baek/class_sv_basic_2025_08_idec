// ex1_polymor_intro.sv
//

`define PROBLEM
//`define SOLUTION

module tb;

   // Comment #1 : base class
   class frame;
      function void iam();
         $display("frame");
      endfunction
   endclass

   // Comment #2 : derived class
   class tagframe extends frame;
      int tag;
      function void iam();
         $display("tagframe");
      endfunction
   endclass

   // Comment #3 : Parent Handle
   frame f1;

   // Comment #4 : Subclass instance
   //    - Create an instance of sub-class
   tagframe t1 = new();

   initial begin
      // Comment #5 : Copy "Sub-Class instance" to "parent handle"
      //    copy "tagframe instance" to "frame handle"
      f1= t1;

      // Comment #6 : Only parent class members are accessible from the handle
      //    only parent(frame) method visible
      f1.iam();         // frame

      `ifdef PROBLEM
      // Comment #7 : Only parent class members are accessible from the handle
      //    sub-class(tagframe) property not visible
      //    Compilation Error
      f1.tag= 5;
      `endif

      `ifdef SOLUTION
      // Comment #8 : Only parent class members are accessible from the handle
      t1.iam();               // tagframe
      $display("%d",t1.tag);  // 0
      `endif
   end
endmodule
