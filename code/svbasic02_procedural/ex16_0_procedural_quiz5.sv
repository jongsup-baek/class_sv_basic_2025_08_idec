// ex16_procedural_quiz5.sv
//

//`define QUIZ5;
`define QUIZ5_SOLUTION;

// ///////////////////////////////////// 
// What is wrong with these examples?
// How could you correct them?
`ifdef QUIZ5
module block1( input bit [2:0] data);
   always @(data)
      priority casez (data)
         3'b00? : $display("0 or 1");
         3'b0?? : $display("2 or 3");
      endcase
endmodule
`endif

// ------------------------------------------
// SOLUTION : Runtime warning when data= 4 to 7 
// or any data bit is unknown
`ifdef QUIZ5_SOLUTION
module block1( input bit [2:0] data);
   always @(data)
      priority casez (data)
         3'b00? : $display("0 or 1");
         3'b0?? : $display("2 or 3");
         3'b??? : $display("others");
      endcase
endmodule
`endif

module tb();

   logic       clk=0, rstn;
   logic       sel, sel2;
   logic [7:0] a, b, c, d, y1, y2, y3, y4;
   initial forever #50 clk= ~clk;

   block1 u_block1( a );

   initial begin
      rstn=0; a= 1; sel=0; 
      @(negedge clk) ;
      @(negedge clk) ;
      #1 rstn= 1;
      repeat(8) begin
         @(posedge clk) ;
         #1; a= a+1;
         #1; sel= 1;
      end
      #10 $finish;
   end

endmodule : tb