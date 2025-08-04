// ex16_procedural_quiz4.sv
//

`define QUIZ4;
//`define QUIZ4_SOLUTION;

module tb();

   //Net,Variable Declaration
   logic       clk=0 , rstn;
   logic       sel;
   logic [7:0] d1, d2, d3, d4;
   logic [7:0] y1, y2, y3, y4;
   initial forever #50 clk= ~clk;

   // ///////////////////////////////////// 
   // What is wrong with these examples?
   // How could you correct them?
   `ifdef QUIZ4
   always_comb
      if( sel == 1 ) 
         y2<= d2 ;
   `endif

   // ------------------------------------------
   // SOLUTION : Does not infer combinational logic
   `ifdef QUIZ4_SOLUTION
   always_comb
      if( sel == 1 ) 
         y2<= d2 ;
      else
         y2<= 0 ;
   `endif

   initial begin
      rstn=0; d2= 0; sel=0; 
      @(negedge clk) ;
      @(negedge clk) ;
      #1 rstn= 1; 
      repeat(8) begin
         @(posedge clk) ;
         #1; d2= d2+1;
         #1; sel= 1;
      end
      #10 $finish;
   end

endmodule : tb
