// ex3_operator_wildcard_equivalence.sv
//

module tb;
   logic [3:0] a, b;
   logic       c;

   initial begin

      a= 4'b0101;
      b= 4'b01XZ;

      // Comment #1 : wildcard equivalance
      //    x, y, ? treated as don't care
      c= ( a ==? b);       // 1 
                                                $display("a= %b ==? b= %b, c= %b",a,b,c);
      c= ( a ==? 4'b?1?1); // 1
                                                $display("a= %b ==? b= ?1?1, c= %b",a,c);
      // Comment #2 : wildcard inequivalance
      //    opposite of ==?
      c= ( a !=? b);       // 0
                                                $display("a= %b !=? b= %b, c= %b",a,b,c);
      // Comment #3 : logical equivalance
      //    any bit has x, z, result will be x
      c= ( a == b);        // X 
                                                $display("a= %b ==  b= %b, c= %b",a,b,c);
      // Comment #4 : identity equivalance
      // e  very bits must be same, even x, z
      c= ( a === b);       // 0
                                                $display("a= %b === b= %b, c= %b",a,b,c);

   end

endmodule
