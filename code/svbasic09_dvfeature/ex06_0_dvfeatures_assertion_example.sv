// ex6_dvfeatures_assertion_example.sv
//

module tb;
   bit clk=0; initial forever #5 clk= ~clk;

   logic ce;

   // Comment #1 : immediate assertion example
   always begin : CHECK
      //sync to start of frame
      @(posedge ce);
      repeat (16) begin
         // for 16 cycles, find next rising edge on clk
         // or falling edge on ce
         @( posedge clk or negedge ce);
         SP : assert (ce)
         else begin //short pulse
            $error("short ce pulse");
            disable CHECK;
         end
      end
      // find next rising edge on clk
      // or falling edge on ce
      @( posedge clk or negedge ce);
      LP : assert (!ce)
      else // long pulse
         $error("long ce pulse");
   end

   initial begin
      ce= 0;
      repeat(16) begin
         @(posedge clk) #0;
         ce=1;
      end
      @(posedge clk) #0;
      ce=0;
      @(posedge clk) #0;
      ce=1;
      $finish;
   end

endmodule : tb

