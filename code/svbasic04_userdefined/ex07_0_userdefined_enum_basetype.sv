// ex7_userdefined_enum_basetype.sv
//

module tb;

   // Comment #1 : Enum Declaration 
   //    with "explicit" base type and 
   //       "implicit" encoding
   //    2'b00 : idle
   //    2'b01 : start
   //    2'b10 : pause
   //    2'b11 : done
   typedef enum bit[1:0] 
      {idle, start, pause, done} base_t;

   // Comment #2 : Enum Declaration 
   //    with "explicit" base type and 
   //       "explicit" encoding
   //    3'b000 : idle
   //    3'b001 : start
   //    3'b010 : pause
   //    3'b011 :
   //    3'b100 : done0
   //    ...
   typedef enum bit[2:0] 
      {idle0= 3'b000, 
       start0=3'b001, 
       pause0=3'b010, 
       done0= 3'b100} onehot0_t;

   onehot0_t state;

   initial begin
      state <= onehot0_t'(3'b001);
   end

endmodule
