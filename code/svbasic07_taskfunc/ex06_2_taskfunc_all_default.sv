// ex6_2_taskfunc_all_default.sv
//

module tb;

   int val= 21;

   // Comment #1 :
   // default for every argument
   task read_a (int j=0, int k= 2, int data = 1);
      $display("j= %d, k= %d, data= %d",j,k,data);
   endtask

   initial begin
      // Comment #2
      // Invocation of task with default arguments 
      read_a ();  // equivalent to (0,2,1)
      read_a;     // also legal in SystemVerilog
   end

endmodule
