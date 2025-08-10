// ex4_1_polymor_advantage_extra.sv
//

module tb;

   // Comment #1 : Base Class
   class frame;
      virtual function void send();
         $display("[frame] default frame");
      endfunction
   endclass
   
   // Comment #2 : Sub Class
   class tagframe extends frame;
      int tag = 7;
      function void send();
         $display("[tagframe] tag = %0d", tag);
      endfunction
   endclass
   // Comment #3 : Sub-Sub Class
   class errframe extends tagframe;
      bit has_error = 1;
      function void send();
         if (has_error)
            $display("[errframe] tag = %0d, ERROR detected!", tag);
         else
            $display("[errframe] tag = %0d, No error", tag);
      endfunction
   endclass

   // Comment #4 : Array of base Class
   //    base class used 
   //       for a handle array declaration
   frame framearr[8];
   tagframe tf;
   errframe ef;

   initial begin
      // Comment 5 : randomly fill framearr 
      //       with tagframe or errframe instance
      foreach (framearr[i]) begin
         if ($urandom_range(0,2) == 2) begin
            ef = new();
            ef.tag = i;
            ef.has_error = (i % 2); // Some has error
            framearr[i] = ef;
         end else begin
            tf = new();
            tf.tag = i;
            framearr[i] = tf;
         end
      end
      // Comment 6 : all frame exectuted 
      //       with parent hanle
      $display("\n=== Send all frames ===");
      foreach (framearr[i]) begin
         framearr[i].send(); // By using overriden method
      end
   end
endmodule
