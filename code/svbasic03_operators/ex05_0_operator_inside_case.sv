// ex5_operator_inside_case.sv
//
module tb;
   bit [3:0] a= 4'b0001;
   bit [3:0] b= 4'd4;

   initial begin

      // Comment #1 : casez(a)
      //    casez can be used if range limits are on bit-bounary
      casez(a) // bit bounard
         4'b000? : $display("0 or 1");
         4'b00?? : $display("2 or 3");
      endcase

      // Comment #2 : case(b) inside
      //  - Non bit boundary 
      //  - Range
      //  - Can mix rnage and discrete value
      case(b) inside  
         0, 2     : $display("0 or 2");      // Non bit boundary
         [3:5]    : $display("3 or 4 or 5"); // Range
         1, [6:7] : $display("1 or 6 or 7"); // Mix
         default  : $display("value > 7 ");
      endcase
   end
endmodule

