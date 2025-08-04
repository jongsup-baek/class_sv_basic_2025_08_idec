// ex6_taskfunc_default_argu.sv
//

//`define PROBLEM
`define SOLUTION

module tb;
   int val= 21;
   // Comment #1 :
   //    default argument values in task definition
   //    ANSI C Style
   task read (int j=0, int k, int data = 1);
      $display("j= %d, k= %d, data= %d",j,k,data);
   endtask

   initial begin
      // Comment #2
      //    Invocation of task with default arguments
      read ( ,5);    // equivalent to (0, 5, 1)
      read (2,val);  // equivalent to (0, 21, 1)
      read ( ,5,7);  // equivalent to (0, 5, 7)

      `ifdef PROBLEM
      // Comment #3 : Error 
      //    'j' gets value of 2 and 
      //    'k' is not defined
      read (2); 
      `endif
      
      `ifdef SOLUTION
      read (2,5); 
      `endif
   end

endmodule

