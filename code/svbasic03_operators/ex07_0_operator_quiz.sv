// ex7_operator_quiz.sv
//

module tb;
   logic [3:0] a, b, c;

   // Problem #1 :
   //    What is the value of each expression or
   //    the output of each conditional branch?
   initial begin
      a= 4'b00xx;
      b= 4'b0001;
      c= 4'b0100;

      b++;     // b= 0010
      c += b;  // c= 0110
      c >>= b; // c= 0001

      $display("a= %b, b= %b", a, b);
      if( b ==? a )
         $display("branch one");
      else
         $display("branch two");

                                                   // Solution -------------
                                                   //             // a= 00xx
                                                   //    b++;     // b= 0010
                                                   // Solution : branch one

      $display("c= %b", c);
      if( c inside {4'b0110, 4'b0010} )
         $display("branch three");
      else
         $display("branch four");

                                                   // Solution -------------
                                                   //    b++;     // b= 0010
                                                   //    c += b;  // c= 0110
                                                   //    c >>= b; // c= 0001
                                                   // Solution : branch four

   end
endmodule

