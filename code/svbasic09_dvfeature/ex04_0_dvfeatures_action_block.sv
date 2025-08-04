// ex4_dvfeatures_action_block.sv

module tb;

   logic clk=0;
   initial forever #5 clk= ~clk;

   logic wr_en, rd_en, valid;
   event rw_err_event;
   integer err_count=0;

   // Comment #1 : rwchk assert with else
   //    %m : assertion label
   always @(negedge clk)
      rwchk: assert( ~(wr_en && rd_en) )
         $display("%m: success");
      else
      begin
         $display("read/write fail");
         err_count++;
         -> rw_err_event;
      end

   // Comment #2 : valchk assert with else
   //    pass block omitted
   always @(negedge clk)
      valchk: assert (valid)
      else $display("valid inactive");

   // Comment #3 : limit_check assert with else
   //    expression
   always @(posedge clk)
      limit_check: assert (err_count < 14)
      else $display("error >= 15");

   initial begin
      wr_en= 0; rd_en= 0; valid= 1;
      @(posedge clk) #0;
      wr_en= 0; rd_en= 0; valid= 1;
      @(posedge clk) #0;
      wr_en= 0; rd_en= 1; valid= 1;
      @(posedge clk) #0;
      wr_en= 1; rd_en= 0; valid= 1;
      repeat(20) begin
         @(posedge clk) #0;
         wr_en= 1; rd_en= 1; valid= 0;
      end
      @(posedge clk) #0;
      $display("Err= %d",err_count);
      $finish;
   end

endmodule : tb