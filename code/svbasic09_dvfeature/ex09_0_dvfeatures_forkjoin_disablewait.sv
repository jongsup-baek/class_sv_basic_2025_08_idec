// ex8_dvfeatures_forkjoin_intro.sv
//

//`define DISABLE
`define WAIT

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
      #20; $display("d works at %0t",$time);
   endtask
   task e;
      #25; $display("e works at %0t",$time);
   endtask
   task f;
      #30; $display("f works at %0t",$time);
   endtask

   initial begin

      `ifdef DISABLE
      $display("---Now %0t",$time);

      // Comment #1 : disable fork
      fork
         a; b; c;
      join_any
      disable fork;
      d;
      `endif

      `ifdef WAIT
      $display("---Now %0t",$time);

      // Comment #2 : wait fork
      fork
         a; b; c;
      join_any
      fork
         d;
      join_none
      e;
      wait fork;
      f;
      `endif

   end

endmodule
