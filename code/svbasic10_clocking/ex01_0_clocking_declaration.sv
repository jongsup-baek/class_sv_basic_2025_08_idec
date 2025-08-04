// ex1_clocking_declaration.sv
//

module tb;

   logic dout;
   logic data;
   logic enab;
   logic clk;

   // Comment #1 :
   //    cb : identifier
   //    posedge clk : clocking block event
   clocking cb @(posedge clk);

      // Comment #2 :
      //    default skew for inputs & output
      default  input #1ns
               output #3ns;

      // Comment #3 :
      input dout;       // clocking block input
      output data;      // clocking block output
      output #5ns enab; // output with explicit skew

   endclocking

endmodule