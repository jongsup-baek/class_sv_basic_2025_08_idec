// ex5_userdefined_enum_encoding.sv
//

//`define PROBLEM

module tb;

   // Comment #1 :
   // 0 :
   // 1 : idle
   // 2 : start
   // 3 :
   // 4 : pause
   // 5 : 
   // ...
   // 8 : done
   // ...
   typedef enum { idle  =1, 
                  start =2, 
                  pause =4, 
                  done  =8} state_t ;

   // Comment #2 :
   // 0 : S0 
   // 1 : S1 
   // ...
   // 6 : S2
   // 7 : S3
   // ...
   enum {S0=0, S1, S2=6, S3} encs ;

   `ifdef PROBLEM
   // Comment #3 : ERROR
   // 0 : P0
   // 1 : P1, P2 [Overlap]
   // 2 : P3
   enum {P0=0, P1, P2=1, P3} bad_encs ;
   `endif

endmodule
