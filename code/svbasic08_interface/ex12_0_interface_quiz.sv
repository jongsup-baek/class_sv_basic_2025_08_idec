// ex12_interface_quiz.sv
//

// Solution
interface quizif (input clk, rst);
   logic as, rw, ds, da;
   logic [7:0] addr;
   logic [7:0] data;
   modport RD  ( input clk, rst, da, 
           data, output addr, as, rw, ds);
   modport MGR ( input clk, rst, addr, as, 
           rw, ds, output da, data);
endinterface : quizif

module testbench;
   logic clk= 0;
   logic rst= 0;
   quizif busa(clk, rst);
   busread U1(busa.RD);
   busmgr  U2(busa.MGR);
endmodule

module busread( interface bus);
endmodule
module busmgr( interface bus);
endmodule
