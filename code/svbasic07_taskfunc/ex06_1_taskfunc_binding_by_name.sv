// ex6_1_taskfunc_binding_by_name.sv
//

module tb;

   int val= 21;

   task read (int j=0, int k, int data = 1);
      $display("j= %d, k= %d, data= %d",j,k,data);
   endtask

   initial begin
      // Comment #1 : Argument Binding by Name
      //    invovation of task with default arguments and name passing
      read ( .j(4) , .k(val), .data(7));  // call by name 
      read ( .j(2) , .k(val));            // equivalent to (2, 21, 1) 
      read ( .k(3) );                     // equivalent to (0, 3, 1)
      read ( .data(7), .j(4), .k(3) );    // Position doesn't matter
   end

endmodule

