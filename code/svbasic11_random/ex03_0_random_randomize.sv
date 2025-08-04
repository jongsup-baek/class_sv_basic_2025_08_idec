// ex3_random_randomize.sv
// 
module tb;
   bit clk=0; initial forever #5 clk = ~clk;
   typedef enum bit [2:0] {
       ADDI, SUBI, ANDI, XORI, 
       JMP, JPMC, CALL } op_t;
   typedef enum bit [1:0] { 
       REG0, REG1, REG2, REG3} regs_t;

   // Comment #1 :
   //    type declarations as before
   op_t opc;
   regs_t regs;
   logic [7:0] data;

   int ok;

   initial begin
      repeat(7168) begin
         // Comment #2 :
         //    Function randomizes variables 
         //    passed as arguments
         ok= randomize(opc, regs, data);
                                             A1 : assert(ok);
                                             $display("%s %s %h",opc.name(),regs.name(),data);
         @(posedge clk);
      end
      $finish;
   end
endmodule