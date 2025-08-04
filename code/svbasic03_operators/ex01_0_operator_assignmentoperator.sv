// ex1_operator_assignmentoperator.sv
//

module tb;

   logic [7:0] a, b;

   // Comment #1 : assignment operator
   initial begin
      a= 1;
      b= 2;
      a += b ;  // same as a=a+b, so a= 3

      $display("a= %d",a);
   end

endmodule

