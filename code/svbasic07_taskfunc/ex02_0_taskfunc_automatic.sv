// ex2_taskfunc_automatic.sv
// 

module tb;

   logic clk=0;
   logic trig;
   initial forever #5 clk = ~clk;

   // Comment #1 : Verilog 2001 function
   function automatic [7:0] factorial; 
      input [7:0] n;
      begin
         if( n == 1 )
            factorial = 1;
         else
            factorial = n * factorial(n-1);
      end
   endfunction

   // Comment #2 : Verilog 2001 task
   //    task argument may be over-written 
   //    if static called
   task automatic count_clocks ;
      input [31:0] edges;
      begin
         repeat (edges)
            @(posedge clk);
      end
   endtask

   always @(posedge trig)
      begin
         count_clocks(6);
      end

   initial begin
            trig= 0;
            @(negedge clk);
            trig= 1;
            count_clocks(10);
      #100  $finish;
   end

endmodule
