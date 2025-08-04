// ex10_clocking_quiz.sv
//
module tb;

   bit clk=0; initial forever #50 clk= ~clk;
   bit reset;

   clocking cb @(posedge clk);
      default input #1step output #5;
      output reset;
   endclocking

   initial begin
      cb.reset <= 0;     // at first posedge clk + 5ns
      ##2 cb.reset <= 1; // wait 2x poseddge clk then drive @ +5ns
      ##3 cb.reset <= 0; // wait 3x poseddge clk then drive @ +5ns
      #200 $finish;
   end
   
endmodule