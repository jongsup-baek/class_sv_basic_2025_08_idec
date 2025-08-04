// ex4_taskfunc_void_function.sv
//

module tb;

   // Comment #1 :
   //    function void printerr
   function void printerr ( input int errs );
      if(errs == 0)
         $display("No Erros");
      else
         $display("%0d Errors",errs);
   endfunction : printerr

   initial begin
      printerr(3);
   end

   // Comment #2 : Simple function
   function [7:0] flip ( input [7:0] word );
      flip= word;
      $display("%d word",word);
   endfunction

   // Comment #3 :
   //    void type cast
   initial begin
      void'(flip(8'h01));
   end

endmodule
