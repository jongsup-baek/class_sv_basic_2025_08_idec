// ex4_connect_package.sv
//

// Comment #1 : Package
package mytypes;
   typedef enum {start, done} mode_t;
endpackage : mytypes

// Comment #2 : Explicit import into CUS
import mytypes::mode_t;
module mone( 
        input mode_t mode,
        output logic [7:0] out);

endmodule : mone

// Comment #3 : Wildcard import
module mtwo( 
        output logic [7:0] out);

   import mytypes::*;
   mode_t mode;

endmodule : mtwo

// Comment #4 : Resolved name
module mthree( output logic [7:0] out);

   mytypes::mode_t mode;

endmodule : mthree


