// ex1_random_intro.sv
// 

// Comment #1: 
//      CPU instruction Stimulus
module tb;
   typedef enum bit [2:0] {
       ADDI, SUBI, ANDI, XORI, 
       JMP, JPMC, CALL } op_t;
   typedef enum bit [1:0] { 
       REG0, REG1, REG2, REG3} regs_t;

   op_t opc;
   regs_t regs;
   logic [7:0] data;

   initial begin
      // generate stimulus
      opc= ADDI;
      regs= REG0;
      data= 5;
      // drive into DUT

   end
endmodule
