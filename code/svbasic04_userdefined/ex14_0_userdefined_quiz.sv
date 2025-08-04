// ex14_userdefined_quiz.sv
//

//`define PROBLEM
`define SOLUTION

`ifdef PROBLEM
module tb;

   typedef enum logic[1:0] { 
       up=2'b00, stay=2'b01, down=2'b11
   } cstate_t;
   cstate_t cstate;

   typedef struct { 
       int tag;
       cstate_t mode;
       logic [7:0]   data;
   } tagdata_t;
   tagdata_t tdata;

   typedef enum { idle, go, stop, stay, reset } mechstate_t;

   logic [7:0] slice;

   initial begin
      tdata.mode = reset;
      tdata = '{tag:4, data:4, default:4};
      slice = tdata[7:0];
      cstate= cstate + 1;
      cstate= cstate_t'(2'b10);
      slice= cstate+1;
   end

endmodule : tb
`endif

//////////////////////////////////////////////////////////

`ifdef SOLUTION
module tb;
   typedef enum logic[1:0] { 
       up=2'b00, stay=2'b01, down=2'b11
   } cstate_t;
   cstate_t cstate;

   typedef struct { 
       int tag;
       cstate_t mode;
       logic [7:0]   data;
   } tagdata_t;
   tagdata_t tdata;

   typedef enum {
       // Solution, duplicated definition for stay
       // idle, go, stop, stay, reset
       idle, go, stop, stay1, reset
   } mechstate_t;

   logic [7:0] slice;

   initial begin
      // Solution, unknown value reset in cstate_t
      // tdata.mode = reset;                 
      tdata.mode = up;

      // Solution, Invalid value 4 for mode field
      // tdata = '{tag:4, data:4, default:4};
      tdata = '{tag:4, data:4, mode:up};

      // Solution, Cannot slice unpacked structure
      // slice = tdata[7:0];                 
      slice = tdata.tag;

      // Solution, Cannot assign int to cstate_t
      // cstate= cstate + 1;                 
      cstate= cstate.next();
      cstate= cstate_t'(2'b10);
      slice= cstate+1;
   end
endmodule : tb
`endif
