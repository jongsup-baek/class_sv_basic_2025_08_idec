// ex2_random_looped.sv
//

module tb;
   bit clk=0; initial forever #5 clk = ~clk;

   typedef enum bit [2:0] {
       ADDI, SUBI, ANDI, XORI, 
       JMP, JPMC, CALL } op_t;
   typedef enum bit [1:0] { 
       REG0, REG1, REG2, REG3} regs_t;

   op_t opc;
   regs_t regs;
   logic [7:0] data;

   initial begin
      opc= opc.first();
      regs= regs.first();
      repeat(opc.num()) begin
         repeat(regs.num()) begin
            for(data=0;data<255;++data) begin
               //Use nested loops to index through 7168 combinations
               $display("%s %s %h",opc.name(),regs.name(),data);
               @(posedge clk);
            end
            regs= regs.next();
         end
         opc= opc.next();
      end
      $finish;
   end
endmodule