// ex5_procedural_dowhile.sv
//

module tb();
	bit clk= 0; initial forever #5 clk= ~clk; 

	bit [2:0] cnt= 0;
	wire enable= (cnt < 3'd4);
	
	initial begin
	
	   cnt=0;
	   @(posedge clk)
	
	   // Comment #1: Verilog-Style
	   //    if enable false on loop entry
	   //    count not incremented
	   while (enable) begin
	      $display("DEBUG FIRST %d",cnt);
	      @(posedge clk)
	         cnt= cnt +1;
	   end
	
	   cnt=0;

	   // Comment #2: SystemVerilog-Style
	   //    if enable false on loop entry
	   //    count incremented once
	   do begin
	      $display("DEBUG SECOND %d",cnt);
	      @(posedge clk)
	         cnt= cnt +1;
	   end while (enable) ;
	
      #10; $finish;
	end
	
endmodule : tb
