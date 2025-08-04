// ex16_procedural_quiz3.sv
//

`define QUIZ3
//`define QUIZ3_SOLUTION

module tb();
   bit clk=0; initial forever #50 clk= ~clk;

   logic       rstn;
   logic [7:0] d1;
   logic [7:0] y1;

   // ///////////////////////////////////// 
   // What is wrong with these examples?
   // How could you correct them?
   `ifdef QUIZ3
   always_ff @(posedge clk iff rstn == 0 )
      if( rstn ) 
         y1<= 8'd0;
      else 
         y1<= d1;
   `endif

   // ------------------------------------------
   // SOLUTION : procedure never triggered when rst=1 so never reset
   `ifdef QUIZ3_SOLUTION
   always_ff @(posedge clk iff rstn == 0 )
      if( !rstn )  begin
         y1<= 8'd0;
         $display("Reset Triggered");
      end
      else 
         y1<= d1;
   `endif

   // Sequences
   initial begin
      rstn=0;
      d1= 1;
      @(negedge clk) ;
      @(negedge clk) ;
      #1 rstn= 1;
      repeat(8) begin
         @(posedge clk) ;
         #1; d1= d1+1;
      end
      #10 $finish;
   end

endmodule : tb
