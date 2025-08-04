// ex4_userdefined_enum_values.sv
//
module tb;

   // Comment #1 :
   // idle=0, start=1, pause=2, done=3
   typedef enum {idle, start, pause, done} state_t ;

   // Comment #2 :
   // Utilizing typecast using integer
   state_t state;
   int aint;

   initial begin
      state= state_t'(2); // pause, 2
      state= state_t'(8); // no name, 8
      aint= state*2;      // 16

      $display("state= %d",state);
      $display("state= %d",state);
      $display("aint= %d",aint);

   end

endmodule
