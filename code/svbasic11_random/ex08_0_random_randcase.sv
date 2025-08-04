// ex7_random_conditional_constraint.sv
//

`define CONSTANT_WEIGHT
//`define VARIABLE_WEIGHT

module tb;
   bit clk=0; initial forever #5 clk = ~clk;

   typedef enum bit [1:0] { SMALL, MEDIUM, LARGE, XL} mode_t; 
   mode_t      mode;

   function void gen_atm(); $display("gen_atm"); endfunction
   function void gen_ethernet(); $display("gen_ethernet"); endfunction
   function void gen_ip4(); $display("gen_ip4"); endfunction
   function void gen_crc_error(); $display("gen_crc_error"); endfunction

   int ok;

   int a=10, b=10;

   initial begin
      $display("Constant Weight=============");
      repeat (10) begin
         // Comment #1 : constant weight
         //    20/65 = 30.7%
         //    30/65 = 46.1%
         //    10/65 = 15.4%
         //     5/65 =  7.7%
         randcase
            20 : gen_atm();
            30 : gen_ethernet();
            10 : gen_ip4();
             5 : gen_crc_error();
         endcase
      end
      $display("Variable Weight=============");
      repeat (10) begin
         // Comment #2 : variable weight
         //    10/40 : 25% 
         //    20/40 : 50%
         //     0/40 :  0%
         //    10/40 : 25%
         randcase
            a     : gen_atm();
            a + b : gen_ethernet();
            a - b : gen_ip4();
            b     : gen_crc_error();
         endcase
      end
      #0 $finish;
   end
endmodule