// ex9_userdefined_enum_access.sv
//

//`define CASE1
`define CASE2

module tb;

   `ifdef CASE1
   // Comment #1 :
   //    Iterates over defined values only
   //    SA = 0
   //    SB = 1
   //    SC = 2
   //    SD = 3
   //    -----------
   //    SA = 0
   typedef enum {SA, SB, SC, SD} state_t;
   state_t st = st.first();

   initial begin
      repeat(5) begin
         $display("%s = %0d", st.name, st);
         if( st == st.last())
            $display("-------");
         st= st.next();
      end
   end
   `endif

   `ifdef CASE2
   // Comment #2 :
   //    Iterates over defined values only
   //    SA = 0
   //    SB = 1
   //    SC = 2
   //    SD = 3
   typedef enum {SA, SB, SC, SD} state_t;
   state_t op;

   initial begin
      op= op.first();
      repeat(op.num()) begin  // Iterate over every value of enum
         $display("%s = %0d", op.name, op);
         op= op.next();    
      end
   end
   `endif

endmodule

