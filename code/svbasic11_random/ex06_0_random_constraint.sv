// ex6_random_constraint.sv
//

module tb;
   bit clk=0; initial forever #5 clk = ~clk;

   typedef enum bit [2:0] { ADDI, SUBI, ANDI, XORI, JMP, JMPC, CALL } op_t;
   typedef enum bit [1:0] { REG0, REG1, REG2, REG3} regs_t; 

   op_t        opc;
   regs_t      regs;
   logic[7:0]  data;

   int ok;

   initial begin                                                                                      
      repeat (10) begin
         // Comment #1 : Relational
         //    data between 32 and 126
         ok = randomize(data) with { data >= 32; data <= 126; };

         // Comment #2 : List
         //    opc in range ADDI to ANDI or JMP or JMPC
         ok = randomize(opc) with { opc inside {[ADDI:ANDI],JMP,JMPC}; };

         // Comment #3 : Distribution
         //    REG0~REG1 twice as likely as REG~REG3
         ok = randomize(regs) with { regs dist { [REG0:REG1]:=2, [REG2:REG3]:=1}; };
                                                                                       
         $display("%d %s %s",data,opc.name(), regs.name());
      end
      #0 $finish;
   end
endmodule


