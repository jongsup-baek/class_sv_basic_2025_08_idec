// ex8_datatype_timeunit.sv
//

`define USAGE1
//`define USAGE2

module tb();

   `ifdef USAGE1
   // Comment #1: Usage Case-1
   timeunit 1ns;
   timeprecision 100ps;
   logic data;
   initial begin
      #10ns data = 1'b1;
      #10 data = 1'b0;
      #10ns $finish;
   end
   `endif

   `ifdef USAGE2
   // Comment #2: Usage Case-2
   timeunit 1ns/100ps;
   logic data;
   initial begin
      #10ns data = 1'b1;
      #10 data = 1'b0;
      #10ns $finish;
   end
   `endif

endmodule



