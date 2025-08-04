// ex5_random_seed.sv
//

// Comment #1 : Most Upper RNG
//    RNG: 1, 5, 56, 3, 42, ...
module tb;
   bit clk=0; initial forever #5 clk = ~clk;

   int a,b,c;
   int ok;


   always @(posedge clk)
      begin : P1
      // Comment #2 : Manually seed P1 RNG
      //    RNG: 10, 8, 4, ...
         repeat(4) begin
            process::self.srandom(10);
            ok= randomize(a);                $display("a= %d",a);
         end
      end

   always @(a)
      begin : P2
         // Comment #3 : RNG of P2 reseeded 
         //    during execution
         //    RNG: 56, 4, 20, 6...
         repeat(4) begin
            ok= randomize(b);
            process::self.srandom(20);       $display("b= %d",b);
         end
      end

   initial begin : P3
         // Comment #4 : The same as before
         repeat(4) begin
            ok= randomize(c);
            $display("c= %d",c);
         end
   end

   initial begin
      repeat(1) begin
         @(posedge clk);
      end
      #0 $finish;
   end
endmodule