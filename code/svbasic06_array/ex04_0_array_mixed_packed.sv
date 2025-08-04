// ex4_array_mixed_packed.sv
//

module tb;

   // Comment #1 :
   //    Verilog memory - unpacked array of packed bytes
   reg [7:0] mem [0:255];
   
   // Comment #2 :
   //    mem_t = 256 array of 8 bit vector
   typedef logic [7:0]  mem_t [0:255];
   mem_t mem1;


   // Comment #3 : indexing order 
   //   - 1st indexing : [7:0]
   //   - 2nd indexing : [3:0]
   //   - 3rd indexing : [5:1]
   bit [3:0][5:1] v1 [7:0];

   // Comment #4 : meaning of variable
   //    v1          = array of 2D packed arrays
   //    v1[3]       = 2D packed array [3:0][5:1]
   //    v1[3][2]    = 1D packed array[5:1]
   //    v1[3][2][1] = scalar bit
   // /////////////////////////////////////////

endmodule
