// ex6_operator_array_assignment_pattern.sv
//

module tb;
   int a[3:0];
   int b[3:0];

   // Comment #3 :
   //    initialize mem to 0
   reg [15:0] mem[0:1023] = '{default:0};

   initial begin
      // Comment #1 : equivalent to
      //    a[3]= 0;
      //    a[2]= 1;
      //    a[1]= 2;
      //    a[0]= 3;
      a= '{0,1,2,3};

      foreach(a[i])
         $display("a= %d", a[i]);

      // Comment #2 : equivalent to
      //    b[3]= 1;
      //    b[2]= 0;
      //    b[1]= 0;
      //    b[0]= 0;
      b= '{ 3:1, default:0};

      foreach(b[i])
         $display("b= %d", b[i]);

   end
endmodule