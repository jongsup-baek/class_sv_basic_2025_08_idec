// ex16_procedural_quiz7.sv
//

//`define QUIZ7;
`define QUIZ7_SOLUTION;

// ///////////////////////////////////// 
// What is wrong with these examples?
// How could you correct them?
`ifdef QUIZ7
module block3( input clk, rstn, en, 
               output reg [7:0] y);
   always @(posedge clk or negedge rstn)
      unique if (!rstn)
         y <= 0;
      else if (en)
         y <= y + 1;
endmodule
`endif

// ------------------------------------------
// SOLUTION : Runtime warnings when 
// - incomplete (rst==1 or en==0)
// - incomplete (rst==x or en==x)
// - overlap (rst==0 or en==1)
`ifdef QUIZ7_SOLUTION
module block3( input clk, rstn, en, 
               output reg [7:0] y);
   always @(posedge clk or negedge rstn)
      if (!rstn)
         y <= 0;
      else if (en)
         y <= y + 1;
endmodule
`endif


module tb();
   logic       clk=0, rstn;
   logic       sel, en;
   logic [7:0] y4;
   initial forever #50 clk= ~clk;

   block3 u_block3( clk, rstn, en, y4);

   initial begin
      rstn=0; en=0; 
      @(negedge clk) ;
      @(negedge clk) ;
      #1 rstn= 1;
      repeat(8) begin
         @(posedge clk) ;
         #1; en= 1;
      end
      #10 $finish;
   end

endmodule : tb

