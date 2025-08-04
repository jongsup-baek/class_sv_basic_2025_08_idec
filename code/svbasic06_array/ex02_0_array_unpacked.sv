// ex2_array_unpacked.sv
//

module tb;

   // Comment #1 : "2D array" of int
   //    dimension 3x2, 3x2, 16x256
   int inta [2:0][0:1];
   int intb [1:3][2:1];
   int intc [15:0][0:255];

   initial begin

      $display("%0d x %0d",$size(inta,1),$size(inta,2)); // 3 x 2
      $display("%0d x %0d",$size(intb,1),$size(intb,2)); // 3 x 2
      $display("%0d x %0d",$size(intc,1),$size(intc,2)); // 16 x 256

      // Comment #4 : 
      //    Nested ordered assignment patern
	   inta= '{'{2,1}, '{5,4}, '{3,2}}; 

      $display("%d",inta[2][0]); // 2
      $display("%d",inta[2][1]); // 1
      $display("%d",inta[1][0]); // 5

      // Comment #5 : 
      //    Pattern expression
	   intb= '{3{'{2,1}}}; 

      $display("%d",intb[1][2]); // 2
      $display("%d",intb[1][1]); // 1
      $display("%d",intb[2][2]); // 2
	
      // Comment #6 : 
      //    keyed assignment
	   intc= '{default:100}; 

      $display("%d",intc[15][0]); // 0
      $display("%d",intc[15][1]); // 0
      $display("%d",intc[15][2]); // 0

      // Comment #2 : 
      //    both 3x2 arrays of int
      inta= intb;

      // Comment #3 : 
      //    both 2x arrays of int
      inta[2] = intb[3]; 

      $display("%d",inta[2][0]); // 2
      $display("%d",inta[2][1]); // 1
      $display("%d",inta[1][0]); // 2

	end
	
endmodule
