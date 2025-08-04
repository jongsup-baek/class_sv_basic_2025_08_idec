// ex16_procedural_quiz2.sv
//

//`define QUIZ2
`define QUIZ2_SOLUTION

module tb();

   parameter period = 50;
   logic clock;

   // ///////////////////////////////////// 
   // What is wrong with these examples?
   // How could you correct them?
   `ifdef QUIZ2
   always_ff
      begin
         #(period/2) clock <= 0;
         #(period/2) clock <= 1;
      end
   `endif

   // ------------------------------------------
   // SOLUTION : always instead of always_ff
   `ifdef QUIZ2_SOLUTION
   always
      begin
         #(period/2) clock <= 0;
         #(period/2) clock <= 1;
      end
   `endif

   initial begin
      #20 $finish;
   end

endmodule : tb
