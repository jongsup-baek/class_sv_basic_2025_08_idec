// ex16_procedural_quiz.sv
//

`define QUIZ1;
//`define QUIZ1_SOLUTION;

module tb();
   bit clk=0 ; initial forever #50 clk= ~clk;
   logic [2:0] a, b;

   // ///////////////////////////////////// 
   // What is wrong with these examples?
   // How could you correct them?
   `ifdef QUIZ1
   always @(a) begin
      b = a >> 1;
      unique case (b)
         3'b000 : $display("zero");
         3'b001 : $display("one");
         3'b010 : $display("two");
      endcase
   end
   `endif

   // ------------------------------------------
   // SOLUTION : No case branch for tmp = 3'b011
   `ifdef QUIZ1_SOLUTION
   always @(a) begin
      b = a >> 1;
      unique case (b)
         3'b000 : $display("zero");
         3'b001 : $display("one");
         3'b010 : $display("two");
         3'b011 : $display("onetwo"); // Solution
      endcase
   end
   `endif

   initial begin
      a= 1;
      @(negedge clk) ;
      @(negedge clk) ;
      repeat(8) begin
         @(posedge clk) ;
         #1;
         a= a+1;
      end
      #20 $finish;
   end

endmodule : tb
