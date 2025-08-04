// ex1_array_intro.sv
//

module tb;

   // Comment #1 :
   //    "2D array" of int
   int inta [2:0][1:0];

   // Comment #2 :
   // enum "array"
   typedef enum bit [1:0]
      {S0, S1, S2, S3} seq_t;
	seq_t seq5 [4:0];
	
	
   // Comment #3 : Unpacked array of bytes
	//    unpackarr[1] --> logic[7:0][1]
	//    unpackarr[0] --> logic[7:0][0]
	logic [7:0] unpackarr [1:0]; 
	                             
	initial begin
      // Comment #4 : array assignment
      //    array assign by "assignment pattern"
	   unpackarr= '{default:8'h00};
	   unpackarr= '{8'h00, 8'hff};

      $display("%h",unpackarr[1]); // 00
      #0;
      $display("%h",unpackarr[0]); // ff
	end
	
endmodule
