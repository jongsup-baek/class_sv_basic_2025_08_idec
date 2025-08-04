// ex2_operator_prepost_incdec_ops.sv
//

module tb;

   //Declaration
   logic [7:0] a, b;
   logic [7:0] c[0:3];

   initial begin

      // Comment #1 : Statement
      b= 2;
      --b;

      $display("b= %d",b);

      // Comment #2 : As Statement
      for (int i=0;i<4;i++)
         c[i]= i;

      foreach(c[i])
         $display("c[%d]= %d",i,c[i]);

      // Comment #3:  As Expression
      b= 1;
      a= b++;  // post a=1, b=2
                                    $display("a= %d, b= %d",a,b);
      a= ++b;  // pre  a=3, b=3
                                    $display("a= %d, b= %d",a,b);
      a= b--;  // post a=3, b=2
                                    $display("a= %d, b= %d",a,b);
      a= --b;  // pre  a=1, b=1
                                    $display("a= %d, b= %d",a,b);
   end

endmodule


