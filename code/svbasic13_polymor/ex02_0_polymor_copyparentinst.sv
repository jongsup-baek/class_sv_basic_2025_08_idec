// ex2_polymor_copyparentinst.sv
//

module tb;

   class frame;
      function void iam();
         $display("frame");
      endfunction
   endclass

   class tagframe extends frame;
      int tag;
      function void iam();
         $display("tagframe");
      endfunction
   endclass

   frame f1;
   tagframe t1 = new();

   int ok;
   // Comment #1 : Subclass handle
   //    - declare subclass handle(t2)
   tagframe t2;

   initial begin
      f1= t1;
      f1.iam();         // frame

      // Comment #2 : Copy from f1 to t2
      //    checking with $cast
      $cast(t2,f1);     

      // Comment #3 :
      //    Sub-class(tagframe) method now visible
      t2.iam();         // tagframe
      
   end

endmodule
