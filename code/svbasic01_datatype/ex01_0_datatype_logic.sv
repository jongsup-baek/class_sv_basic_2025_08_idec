// ex1_datatype_logic.sv
//

`define VERILOG
//`define SYSTEMVERILOG

module tb();

   `ifdef VERILOG
   // Comment #1 :
   // Verilog Syntax
   reg [15:0]  b_reg;
   reg [7:0]   mem8x32 [0:31];
   reg clk;
   initial begin
      clk= 0;
      forever #50 clk= ~clk;
   end
   `endif

   `ifdef SYSTEMVERILOG
   // Comment #2 :
   //    SystemVerilog Syntax
   logic [15:0]  b_reg;
   logic [7:0]   mem8x32 [0:31];
   logic clk;
   initial begin
      clk= 0;
      forever #50 clk= ~clk;
   end
   `endif

   initial begin
      #1000;
      $finish;
   end

endmodule

