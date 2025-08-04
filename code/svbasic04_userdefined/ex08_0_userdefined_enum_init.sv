// ex8_userdefined_enum_init.sv
//

`define CASE1
//`define CASE2
//`define CASE3

module tb;

   `ifdef CASE1
   // Comment #1 :
   //    Initial value of enum, explicit 2-state
   enum bit[2:0] {BONE, BTWO} var_b;

   initial begin
      $display("value %b", var_b);        // value 000
      $display("name %s", var_b.name() ); // name BONE
   end
   `endif

   `ifdef CASE2
   // Comment #2 :
   //    Initial value of enum, explicit 4-state
   enum logic[2:0] {LONE, LTWO} var_l;

   initial begin
      $display("value %b", var_l);        // value xxx
      $display("name %s", var_l.name() ); // name <empty>
   end
   `endif

   `ifdef CASE3
   // Comment #3 :
   //    Initial value of enum, when encode value has X 
   enum logic[2:0] {LX= 3'bx, LONE=3'b001, LTWO=3'b010} var_l;

   initial begin
      $display("value %b", var_l);        // value xxx
      $display("name %s", var_l.name() ); // name LX
   end
   `endif

endmodule
