// ex8_clocking_cycledelay.sv
//
module tb;
   bit clk=0; initial forever #50 clk= ~clk;

   bit reset, enab;
   bit [7:0] data, rdata, dreg=8'h01;

   // Comment #1 : default clocking cb1
   default clocking cb1 @(posedge clk1);
      input #2 dout;
      output #3 reset, data;
   endclocking

   // Comment #2 : nedgedge trigger
   clocking cb4 @(negedge clk);
      output #3 ena, rdata;
   endclocking

   initial begin
      // Comment 3: Wait 2 cb1 cycles
      //    cb1 clocking called 2 times
      repeat (2)
         @(cb1);

      // Comment 4 : Wait 2 cb1 cycles
      //    cb1 is default clocking
      ##2;

      // Comment 5 : 
      //    Drive data after 1 cb cycle
      ##1 cb1.data <= 2'b01;
      ##1; cb1.data <= 2'b10;

      // Comment 6 : 
      //    Drive rdata  with current dreg
      //    value after 3 cb4 cycles
      cb4.rdata <= ##3 dreg;
   end

endmodule