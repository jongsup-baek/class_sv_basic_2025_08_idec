// ex6_clocking_example_outputskew_sync.sv
//
module tb;
   bit clk=0; initial forever #50 clk= ~clk;

   integer done, dtwo;
   clocking cb @(posedge clk);
      output #3ns done;
      output negedge dtwo;
   endclocking

   initial begin
      done=0; dtwo=0;
      @(cb);   //sync to cb event
      cb.done <= 1;
      cb.dtwo <= 1;
      @(cb);   
      #1ns;    // cb event + 1ns
      cb.done <= 2;
      cb.dtwo <= 2;
      @(cb);   
      @(negedge clk);
      #1ns;    // cb negedge + 1ns
      cb.done <= 3;
      cb.dtwo <= 3;
      @(cb);
      #100 $finish;
   end

endmodule

