// ex1_interface_intro.sv
//

module memory (
   // Comment #1 :
   input  logic clk, req, start,
          logic [1:0] mode,
          logic [7:0] addr,
   inout  wire  [7:0] data,
   output logic gnt, rdy);
endmodule

module cpucore (
   // Comment #2 :
   input  logic clk, gnt, rdy,
   inout  wire  [7:0] data,
   output logic req, start,
          logic [7:0] addr,
          logic [1:0] mode);
endmodule

module top;
   // Comment #3 :
   logic clk, gnt, rdy;
   wire  [7:0] data;
   logic req, start;
   logic [7:0] addr;
   logic [1:0] mode;
   // Comment #4 :
   memory u_memory(
      .clk, .req, .start, .mode, 
      .addr, .data, .gnt, .rdy);
   // Comment #5 :
   cpucore u_cpu(
      .clk, .gnt, .rdy, .data, 
      .req, .start, .addr, .mode);
endmodule
