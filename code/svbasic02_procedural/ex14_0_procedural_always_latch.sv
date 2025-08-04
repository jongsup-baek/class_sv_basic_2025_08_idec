// ex14_procedural_always_latch.sv
//

//`define PROBLEM

module tb();
	bit clk=0; initial forever #50 clk= ~clk;
	
	logic       rstn, sel, sel2;
	logic [2:0] cnt;
	logic [7:0] a, b, c, d, y1, y2, y3, y4;
	logic [7:0] arr2d[0:15];
	
	// Comment #1 : Latch
	always_latch
	   if( sel == 1 )
	      y1<= a;

	`ifdef PROBLEM
	// Comment #2 : Compilation Error
	//		Multiple Driver
	always_latch
	   if( sel == 1 )
	      y2<= c;
	
	always_latch
	   if( sel == 1 )
	      y2<= c;
	`endif
	
	
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
