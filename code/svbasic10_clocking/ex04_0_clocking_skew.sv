// ex4_clocking_skew.sv
//
module tb;
   bit clk= 0; initial forever #50 clk= ~clk;

   logic sout, ain, bin, cin;

   // Comment #1 :
   //    edge can be skew
   clocking defio @(posedge clk);
      default  input #1step output #3;
      input sout;
      output ain, bin;
      output negedge cin;  
   endclocking

   // Comment #2 :
   //    default, not-specified input #1step
   clocking defop @(posedge clk);
      default  output #3; 
      input #1step sout;
      output ain, bin;
      output negedge cin;
   endclocking

   // Comment #3 :
   //    without default, input #1step output #0
   clocking exp @(posedge clk);
      input #1step sout;
      output #3ns ain, bin;
      output negedge cin;
   endclocking

   initial #10 $finish;

endmodule

