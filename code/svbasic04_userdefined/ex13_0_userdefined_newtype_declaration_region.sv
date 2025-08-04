// ex13_userdefined_newtype_declaration_region.sv
//

//`define REGION_PACKAGE
`define REGION_CUS

`ifdef REGION_PACKAGE
// Comment #1 : package declaration
package mytypes;
   typedef enum { start, done} mode_t;
endpackage : mytypes

// Comment #2 : package imported in module header
module mtwo import mytypes::*; (
        input logic [7:0]  out,
        output mode_t mode);
   always_comb begin
      if(out == 8'h0)
         mode= start;
      else
         mode= done;
   end
endmodule : mtwo

module tb ;
   import mytypes::*;
   logic [7:0] out;
   mode_t mode;
   mtwo u_mtwo( out, mode );
   initial begin
      out= 8'h0;
      #0; $display(" %d", mode);
      out= 8'h1;
      #0; $display(" %d", mode);
   end
endmodule
`endif

`ifdef REGION_CUS
// Comment #3 : Declaration in CUS
//    CUS - Compilation Unit Scope
//    ** NOT Recommended *8
typedef enum { start, done} mode_t;

module mtwo (
   input logic [7:0]  out,
   output mode_t mode);
   always_comb begin
      if(out == 8'h0)
         mode= start;
      else
         mode= done;
   end
endmodule : mtwo

module tb ;
   logic [7:0] out;
   mode_t mode;
   mtwo u_mtwo( out, mode );
   initial begin
      out= 8'h0;
      #0; $display(" %d", mode);
      out= 8'h1;
      #0; $display(" %d", mode);
   end
endmodule
`endif
