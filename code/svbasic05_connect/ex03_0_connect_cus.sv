// ex3_connect_cus.sv
//

// Comment #1: CUS 
//      Warning : Scope of compilation unit 
//      is tool-specific and can change 
//      between compile sessions. 
//      Local declarations
//      override CUS declartions

typedef enum {start, done} mode_t;
localparam eseg = 7'b1111100;

module mone( 
        input mode_t mode,
        output logic [7:0] out);

endmodule : mone

module mtwo( 
        input logic [7:0]   out,
        output mode_t mode,
        output [6:0] oa, ob);
   localparam eseg = 7'b0011111;

   assign oa= eseg;        // local
   assign ob= $unit::eseg; // CUS
endmodule