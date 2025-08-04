// ex9_clocking_hierarchical_signal.sv
//

//`define PROBLEM
`define SOLUTION

module mone();
    logic [7:0] data;
endmodule

module tb;
   bit clk1=0; initial forever #50 clk1= ~clk1;

   bit[7:0] rdata, data, dreg;

   mone dut();

   `ifdef PROBLEM 
   // Comment #1 : Error 
   // direct hierarchical expression is illegal
   default clocking cb1 @(posedge clk1);
      default output #3;
      output tb.dut.data;
   endclocking
   `endif

   `ifdef SOLUTION
   // Comment #2 : Corrrect 
   // data associatd with hierarchical expression
   default clocking cb1 @(posedge clk1);
      default output #3;
      output data= tb.dut.data;
   endclocking
   `endif

   initial begin
      repeat (2) @(cb1);
      ##2;
      ##1 cb1.data <= 2'b01;
      ##1; cb1.data <= 2'b10;
      cb1.data <= ##3 dreg;
      ##5 $finish;
   end

endmodule