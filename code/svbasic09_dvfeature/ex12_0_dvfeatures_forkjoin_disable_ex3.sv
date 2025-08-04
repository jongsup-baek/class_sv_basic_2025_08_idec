// ex12_dvfeatures_forkjoin_disable_ex3.sv
//

module tb;
   initial begin
      $display("%0t: Initial block",$time);
      fork: f1
         #300 $display("%0t: this is thread 1",$time);
         #350 $display("%0t: this is thread 2",$time);
         // Comment #1 :
         //    Proper Encapsulation with begin-end is required to
         //    disable child processes of the process that spawned it.
         begin // Encapsulating begin-end
            fork: f2
               #350 $display("%0t: this is thread 3",$time);
               #200 $display("%0t: this is thread 4",$time);
            join_none
            #171 
            begin 
               disable fork; 
               $display("%0t: disable fork",$time); 
            end // disable fork
         end // Encapsulating begin-end

         #300 $display("%0t: this is thread 5", $time);
      join_none
   end
endmodule