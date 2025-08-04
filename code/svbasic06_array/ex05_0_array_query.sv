// ex5_array_query.sv
//

module tb;

   typedef logic [7:0]  mem_t [1:1024];
   mem_t mem;

   // Comment #1 : Usage of array query
   initial begin
      $display($dimensions(mem_t));           //2
      $display($unpacked_dimensions(mem_t));  //1
      $display($left(mem));                   //1
      $display($right(mem));                  //1024
      $display($left(mem,2));                 //7
      $display($right(mem,2));                //0
      $display($high(mem_t,2));               //7
      $display($low(mem_t,2));                //0
      $display($increment(mem_t));            //-1
   end

endmodule

