// ex13_1_procedural_always_comb_comparision.sv
//
module tb();
   bit clk= 0; initial forever #50 clk= ~clk;
   
   logic       rstn, sel, sel2;
   logic [2:0] cnt;
   logic [7:0] a, b, c, d, y1, y2, y3, y4;
   logic [7:0] arr2d[0:15];

   // Comment #1 : always @*
   always @(*)
      if( sel == 1 )
         y2= a;
      else
         y2= b;

   // Comment #2 : alway_comb
   always_comb
      if( sel == 1 )
         y1= a;
      else
         y1= b;

   initial begin
      rstn=0; a= 1; b=2; sel=0; 
      @(negedge clk) rstn= 1;
      repeat(8) begin
         @(posedge clk) ;
         #1; a= a+1;
         #1; sel= 1;
      end
      #10 $finish;
end

endmodule : tb

module func_side_effect;
   logic [1:0] sel;
   logic a, b, y; 
   // Comment #3 :
   //    mux_func uses "ctrl"
   //    @(*) function call, not triggerred
   logic ctrl; 

   // Comment #3 :
   //    mux_func uses "ctrl" variable
   function logic mux_func (logic in1, logic in2);
      if(ctrl)
         mux_func = in1;
      else
         mux_func = in2;
   endfunction

   // Comment #4 :
   //    mux_func triggerred by "a, b" changes
   always @* begin
      y= mux_func(a,b);
   end

endmodule
