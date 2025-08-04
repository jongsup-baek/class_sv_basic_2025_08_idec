// ex3_dvfeatures_immediate_assertion.sv
//

module tb;

   logic wr_en, rd_en;
   logic clk=0;

   initial begin
      forever #5 clk= ~clk;
   end

   // Comment #1 :
   //    Immediate assertion
   always @(negedge clk)
      A1: assert( ~(wr_en && rd_en) );

   // Comment #2 :
   //    Verilog Equivalent
   always @(negedge clk)
      if( wr_en && rd_en )
         $display("error");

   initial begin
      wr_en= 0; rd_en= 0;
      @(posedge clk) #0;
      wr_en= 0; rd_en= 0;
      @(posedge clk) #0;
      wr_en= 0; rd_en= 1;
      @(posedge clk) #0;
      wr_en= 1; rd_en= 0;
      @(posedge clk) #0;
      wr_en= 1; rd_en= 1;
      @(posedge clk) #0;
      $finish;
   end

endmodule : tb