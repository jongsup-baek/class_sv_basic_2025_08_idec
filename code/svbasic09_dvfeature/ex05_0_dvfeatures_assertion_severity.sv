// ex5_dvfeatures_assertion_severity.sv
//

module tb;
   bit clk=0; initial forever #5 clk= ~clk;

   logic wr_en, rd_en, valid;
   event rw_err_event;
   integer err_count=0;

   // Comment #1 : Warninng w/ assert failure
   always @(negedge clk)
      valchk: assert (valid)
      else 
      begin
         $warning("invalid enable");
         err_count++;
      end

    // Comment #2 : Error w/ assert failure
   always @(negedge clk)
      rwchk: assert( ~(wr_en && rd_en) )
      else
         $error("wr_en && rd_en");

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