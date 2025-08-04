// ex5_taskfunc_functionoutput.sv
//

module tb;

   // Comment #1 : function with output
   function [7:0] addcarry ( 
            input [7:0] a, b,
            output   carry );
      {carry, addcarry} = a + b;
   endfunction : addcarry

   logic [7:0] a, b, sum;
   logic       cry;

   // Comment #2 :
   //    cry is an output
   initial begin
      a=1; b=2;
      sum= addcarry(a,b,cry);
      #0 $display("%d %d %d %d,",a,b,cry,sum);
   end

   // Comment #3 : default input
   //    a and b default to inputs
   function void add ( 
            integer a, b,
            output integer c );
      c= a + b;
   endfunction : add

   // Comment #4 : void function call
   integer c;
   always @(a or b )
      add(a,b,c);

   initial begin
      #10; a=2; b=5;
      #0 $display("%d %d %d",a,b,c);
   end

endmodule