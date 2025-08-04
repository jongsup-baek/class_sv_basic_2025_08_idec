// ex2_clocking_outputdrive.sv
//
module tb;
   bit clk= 0; initial forever #50 clk= ~clk;

   bit dout;
   bit data;
   bit enab;

   clocking cb @(posedge clk);
      default  input #1ns output #3ns;
      input dout;
      output data;
      output #5ns enab;
   endclocking

   initial begin
      // Comment #1:
      @(cb);          // sync to clocking event
      cb.data <=1'b1; // clocking block drives
      cb.enab <=1'b1; // clocking block drives
      #20 $finish;
   end
endmodule