// ex2_connect_newtype.sv
//

// Comment #1 : Package
//    Using mode_t declaration of package in module
package mytypes;
   typedef enum {start, done} mode_t;
endpackage : mytypes

module mone( );
   import mytypes::*;
   mode_t mode;

endmodule

// Comment #2 : CUS
//    Using mode_t declaration of CUS in module
//    Not Recommended
typedef enum {start, done} mode_t;

module mtwo(
   input mode_t mode,
   output logic [7:0] out);

endmodule
