// ex15_procedural_always_ff.sv
//

`define PROBLEM

module tb();
   bit clk=0; initial forever #50 clk= ~clk;

   logic       rstn, sel, sel2;
   logic [2:0] cnt;
   logic [7:0] a, b, c, d, y1, y2, y3, y4;
   logic [7:0] arr2d[0:15];

   // Comment #1 : typical always_ff
   always_ff @(posedge clk or negedge rstn)
      if( !rstn )
         y1<= 8'd0;
      else
         y1<= a;

   `ifdef PROBLEM
   // Comment #2 : Compilation Error
   //    multip event control
   always_ff begin
      @(posedge clk);
         y1<= a +1;
      @(posedge clk);
         y1<= a -1;
   end
   `endif

   initial begin
      rstn=0; a= 1; b=2; sel=0; 
      @(negedge clk) rstn= 1;
      repeat(8) begin
         @(posedge clk) ;
         #1; a= a+1;
         #1; sel= 1;
      end
      #10 $finish;
   end

endmodule : tb
