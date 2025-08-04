// ex10_userdefined_struct_intro.sv
//

module tb;

   typedef struct {
       logic         id, par ; 
       logic [3:0]   addr;
       logic [7:0]   data; 
   } frame_t;

   frame_t f1, two_frame[1:0]; 
   logic [7:0] data_in;

   initial begin
      // Comment #1, individual field access
      f1.id= 1'b1;
      data_in= f1.data;                                  $display("#1, %d, %d",f1.id, data_in);

      // Comment #2, ordered assignment pattern
      f1= '{1'b1, 1'b1, 4'h0, 8'hff};                    $display("#2, %d, %d",f1.id, f1.data);

      // Comment #3, named assignment pattern
      f1= '{id:0, par:1, addr:0, data:0};                $display("#3, %d, %d",f1.id, f1.data);

      // Comment #4, nested ordered assignment pattern
      two_frame = '{'{0,0,0,255}, '{1,1,1,0} };          $display("#4, %d, %d", two_frame[1].id, two_frame[1].data);

   end

endmodule

