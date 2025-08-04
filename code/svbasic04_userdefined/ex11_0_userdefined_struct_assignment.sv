// ex11_userdefined_struct_assignment.sv
//
module tb;

   typedef struct {
       logic         id, par ; 
       logic [3:0]   addr;
       logic [7:0]   data; 
   } frame_t;
   frame_t f1;

   initial begin

      // Comment #1, 
      //    ordered assignment pattern
      f1= '{1'b1, 1'b1, 4'h0, 8'hff};              $display("#1, %d, %d, %d, %d",f1.id, f1.par, f1.addr, f1.data);

      // Comment #2, 
      //    named assignment pattern
      f1= '{id:0, par:1, addr:0, data:0};          $display("#2, %d, %d, %d, %d",f1.id, f1.par, f1.addr, f1.data);

      // Comment #3, 
      //    name and type assignment pattern
      f1= '{addr:12, data:8'hff, logic:0};         $display("#3, %d, %d, %d, %d",f1.id, f1.par, f1.addr, f1.data);

      // Comment #4, 
      //    name, type, default assignment pattern
      f1= '{addr:12, logic:1, default:0};          $display("#3, %d, %d, %d, %d",f1.id, f1.par, f1.addr, f1.data);
   end

endmodule




