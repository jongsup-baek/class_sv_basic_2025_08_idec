// ex4_procedural_foreach.sv
//

module tb();
	
	int intarr [7:0];
	int arr2d [7:0][2:0];
	
	initial begin
	   // Comment #1 :
	   //    iterates left bound to right bound
	   //    - Equivalent code ----------------
	   //       for (int i=7;i>=0; i=i-1)
	   foreach (intarr[i]) 
	   begin
	      intarr[i]= 7-i;
	      $display("Number i= %d",i);
	      #10;
	   end
	
	   // Comment #2 :
	   //    Two loop variables for a 2D array creates nested loops
	   //    - Equivalent code ----------------
	   //       for (int k=7;k>=0; k=k-1) 
	   //       begin
	   //          for( int l=2;l>=0; l=l-1) 
	   //             arr2d[k][l]= k*l;
	   //             $display("array k= %d, l= %d",k,l);
	   //             #10;
	   //          end
	   //       end
	   foreach (arr2d[k,l]) 
	   begin
	      arr2d[k][l]= k*l;
	      $display("array k= %d, l= %d",k,l);
	      #10;
	   end
	
	end
	
endmodule : tb
