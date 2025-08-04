// ex6_userdefined_enum_name_sequence.sv
//

module tb;

   // Comment #1 :  Name Sequence
   //    equivalent to : typedef enum {S0, S1} seqa_t;
   typedef enum {S[2]} seqa_t;

   // Comment #2 :  Mixed name Sequence
   //    equivalent to : typedef enum {go, R3, R4, R5, stop} seqb_t;
   typedef enum {go, R[3:5], stop} seqb_t;

endmodule
