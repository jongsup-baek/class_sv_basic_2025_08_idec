// ex7_datatype_timeliterals.sv
//

// Comment #1 :
//    42ns
//    3.14ps
//    1step
//

// Comment #2:
//    You can use a time literal or 1step 
//    anywhere you would use a delay
//
// Comment #3:
//    time unit 1ns 
//    precision 100ps
`timescale 1ns / 100 ps 
module tb();
   logic clk, rstn, enable, cnt;

   initial begin
      rstn= 0; enable= 0; cnt= 0; clk= 0;

      // Comment #4:
      //    blocking assign
      #10ns rstn= 1;     //blocking assign
      #2.32ns enable= 1; //rounded to 2.3ns

      // Comment #5:
      // #1step advances simulation for 100 ps
      clk= #1step ~clk;  // blocking assign using 1step

      #10ns; $finish;
   end

   // Comment #6:
   //    nonblocking assign
   always @(posedge clk or negedge rstn)
      if(~rstn)
         cnt <= 0;
      else 
         #5.1ns cnt <= cnt + 1; // nonblocking assign

endmodule

