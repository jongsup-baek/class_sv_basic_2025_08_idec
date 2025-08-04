// ex7_taskfunc_function_return.sv
//

module tb;
   
   // Comment #1 : function with return
   //    return - immediate exit
   function integer mult ( input integer num1, num2);
      if( (num1==0) || (num2==0)) begin
         $display("Zero multiply");
         return 0;
      end
      else 
         mult= num1*num2;
   endfunction

   // Comment #2 : task with return
   //    return - immediate exit
   task printstatus (input int errs);
      if(errs == 0 ) begin
         $display("Zero Errors");
         return;
      end
      else begin
         $display("%d Errors",errs);
         case (errs)
            1 : $display("Error Code: %d",errs);
         endcase
      end
   endtask

   initial begin
      mult(0,0);
      printstatus(0);
   end

endmodule
