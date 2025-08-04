// ex7_clocking_multiple_default.sv
//
`define STYLE1
//`define STYLE2

module tb;
   timeunit 1ns;
   timeprecision 100ps;

   bit clk1=0; initial forever #50 clk1= ~clk1;
   bit clk2=0; initial forever #100 clk2= ~clk2;

   bit ip1, op1;
   bit ip2, op2;
   bit ip3, op3;

   // Comment #1 :
   clocking cb1 @(posedge clk1);
      default input #2 output #3;
      input ip1;
      output op1;
   endclocking

   // Comment #2 :
   clocking si1 @(posedge clk2);
      input #2 ip2;
      output #1 op2;
   endclocking

   `ifdef STYLE1
   // Comment #3 :
   // default keyword to the existing clocking block
   default clocking si2 @(posedge clk2);
      input #2 ip3;
      output #2 op3;
   endclocking
   `endif

   `ifdef STYLE2
   // Comment #4 :
   // In its own declaration
   clocking si2 @(posedge clk2);
      input #2 ip3;
      output #2 op3;
   endclocking

   default clocking si2;
   `endif

   initial begin
      @(cb1);           //sync to cb event
      cb1.op1 <= 1;
      @(cb1);           //sync to cb event
      #4ns;             // cb event + 4ns
      op3<=1;
      @(si1);              //sync to cb event
      si1.op2 <= 1;
      ##1;                 // move to next clk2 rise edge
      si2.op3 <= 1;         // default clocking impact
      #200ns $finish;
   end

endmodule