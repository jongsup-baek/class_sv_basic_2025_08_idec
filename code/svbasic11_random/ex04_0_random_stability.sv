// ex4_random_stability.sv
//

// Comment #1 : Most Upper RNG
//    RNG: 1, 5, 56, 3, 42, ...
module tb;
   bit clk=0; initial forever #5 clk = ~clk;
   int a,b,c;
   int ok;

   // Comment #2:
   //    Process added here shifts seeds of P1~P3
   always @(posedge clk)
      begin : P1
      // Comment #3:
      //    RNG: 5,9,48, ...
                              repeat(4) begin ok= randomize(a); $display("a= %d",a); end
      end

   always @(*)
      begin : P2
      // Comment #4:
      //    RNG: 56,4,7, ...
                              repeat(4) begin ok= randomize(b); $display("b= %d",b); end
      end

   initial 
      begin : P3
      // Comment #5:
      //    RNG: 3,2,91, ...
                              repeat(4) begin ok= randomize(c); $display("c= %d",c); end
      end

   // Comment #6:
   //    Process added here keeps seeds of P1~P3

   initial begin
      repeat(1) begin
         @(posedge clk);
      end
      #0 $finish;
   end
endmodule