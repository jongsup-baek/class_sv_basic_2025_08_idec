// ex3_userdefined_enum_definition.sv
//

module tb;

   // Comment #1: named enum type 
   typedef enum {idle, start, pause, done} state_t ;
   state_t state, next_state;

   // Comment #2: anonymous enum type
   enum {aidle, astart, apause, adone} astate;
   
   initial begin
      // Comment #3 : Assigning enum values
      state= start;        // A name value of the type
      state= next_state;   // A variable of the same type
      state= state_t'(1);  // typecast (integer to num type)

       // Comment #4: Compilation Warning!!
       //   Not Legal Direct Assignment of Integral value 
       //   to enum variable is not allowed
       state= 2'b00; 
       state= 2;     
   end

endmodule
