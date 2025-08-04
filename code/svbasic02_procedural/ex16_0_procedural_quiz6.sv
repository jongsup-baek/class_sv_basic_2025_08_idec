// ex16_procedural_quiz6.sv
//

//`define QUIZ6;
`define QUIZ6_SOLUTION;

// ///////////////////////////////////// 
// What is wrong with these examples?
// How could you correct them?
`ifdef QUIZ6
module block2( input bit [2:0] data);
   always @(data)
      unique case (data)
         0,1 : $display("Block2: 0 or 1");
         2,3 : $display("Block2: 2 or 3");
         4,5 : $display("Block2: 2 or 3");
      endcase
endmodule
`endif

// ------------------------------------------
// SOLUTION : Runtime warnings when data= 6 to 7
// or any data bit is unknown
`ifdef QUIZ6_SOLUTION
module block2( input bit [2:0] data);
   always @(data)
      unique case (data)
         0,1 : $display("Block2: 0 or 1");
         2,3 : $display("Block2: 2 or 3");
         4,5 : $display("Block2: 2 or 3");
         default : $display("Block2 : default");
      endcase
endmodule
`endif

module tb();

   logic       clk= 0, rstn;
   logic       sel, sel2;
   logic [2:0] a;
   initial forever #50 clk= ~clk;

   block2 u_block2( a );

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

