// ex7_dvfeatures_assertion_comparison.sv
//

//`define IMMEDIATE
`define CONCURRENT

module tb;
   logic clk=0; initial forever #5 clk= ~clk;

   logic ce;

   `ifdef IMMEDIATE
   // Comment #1 : immediate assertion
   always begin : CHECK
      @(posedge ce);
      repeat (16) begin
         @( posedge clk or negedge ce);
         SP : assert (ce)
         else begin //short pulse
            $error("short ce pulse");
            disable CHECK;
         end
      end
      @( posedge clk or negedge ce);
      LP : assert (!ce)
      else // long pulse
         $error("long ce pulse");
   end
   `endif

   `ifdef CONCURRENT
   // Comment #2 : Concurrent assertion
   //    can span multiple cycles
   SPI1 : assert property (
      @(posedge clk)
      !ce ##1 ce |-> ce[*16] ##1 !ce );
   `endif

   initial begin
      ce= 0;
      repeat(16) begin
         @(posedge clk) #0;
         ce=1;
      end
      @(posedge clk) #0;
      ce= 0;
      @(posedge clk) #0;
      ce= 1;
      $finish;
   end

endmodule : tb