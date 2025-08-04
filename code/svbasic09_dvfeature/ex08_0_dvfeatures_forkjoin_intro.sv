// ex8_dvfeatures_forkjoin_intro.sv
//

module tb;

   task a;
      #5; $display("a works at %0t",$time);
   endtask
   task b;
      #10; $display("b works at %0t",$time);
   endtask
   task c;
      #15; $display("c works at %0t",$time);
   endtask
   task d;
      #50; $display("d works at %0t",$time);
   endtask

   initial begin

      // Comment #1 : fork...join
      fork
         a; b; c;
      join
      d;

      $display("---Now %0t",$time);

      // Comment #2 : fork...join_any
      fork
         a; b; c;
      join_any
      d;

      $display("---Now %0t",$time);

      // Comment #3 : fork...join_none
      fork
         a; b; c;
      join_none
      d;

      $display("---Now %0t",$time);

   end

endmodule
