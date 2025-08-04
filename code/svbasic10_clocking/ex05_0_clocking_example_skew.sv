// ex5_clocking_example_skew.sv
//
module tb;
   bit clk=0; initial forever #50 clk= ~clk;

   logic dreg, dout;
   bit reset, data, enab;

   clocking cb @(posedge clk);
      default  input #1step output #3;
      input dout;
      output reset, data;
      output negedge enab;
   endclocking

   initial begin
      dreg=0; dout=0;
      reset=0; data=0; enab=0;
      @(cb);    
      dout<=1;
      cb.reset<=1; cb.data<=1; cb.enab<=1;
      @(cb);    
      dreg <= cb.dout; // read last sample
      @(cb); 
      $finish;
   end

endmodule

