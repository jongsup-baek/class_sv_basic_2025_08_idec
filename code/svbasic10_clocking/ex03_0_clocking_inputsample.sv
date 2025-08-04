// ex3_clocking_inputsample.sv
//
module tb;
   bit clk= 0; initial forever #50 clk= ~clk;

   logic enab;
   logic [7:0] data;
   bit[7:0] dreg, dout;

   clocking cb @(posedge clk);
      default  input #1ns output #3ns;
      input dout;
      output data;
      output #5ns enab;
   endclocking

   initial begin
      @(cb);          
      // Comment #1 :
      // read last sample
      dreg <= cb.dout; 
      #20 $finish;
   end

endmodule