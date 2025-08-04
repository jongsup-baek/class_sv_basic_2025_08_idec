// ex12_procedural_hwmodeling.sv
//

module tb();
   	bit clk=0; initial forever #50 clk= ~clk;
	
	logic       rstn, sel, sel2;
	logic [2:0] cnt;
	logic [7:0] a, b, c, d, y1, y2, y3, y4;
	logic [7:0] arr2d[0:15];
	
	// Comment #1 : Combinational Logic
	always @( a or b or sel )
	   if( sel == 1 )
	      y1= a;
	   else
	      y1= b;
	
	// Comment #2 : Latch
	//    "else" is not defined
	always @( a or sel )
	   if( sel )
	      y2 <= a;
	   
	// Comment #3 : Register
	always @( posedge clk or negedge rstn )
	    if( !rstn )
	      y3 <= 8'd0;
	    else
	      y3 <= a;
	
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
