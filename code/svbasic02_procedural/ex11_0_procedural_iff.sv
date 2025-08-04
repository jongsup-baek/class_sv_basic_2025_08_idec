// ex11_procedural_iff.sv
//

module tb();
	bit clk=0; initial forever #50 clk= ~clk;
	
	logic       rstn, enable, s_wait;
	logic [2:0] cnt;
	logic [7:0] a, b, c, y1, y2, y3, y4;
	logic [7:0] arr2d[0:15];
	
	// Comment #1: 
	//    Creates Latch in Synthesis
	always @( a iff enable == 1 )
	   y1 <= a;
	
	// Comment #2: 
	//    HW equivalent Method
	always @( a )
	   if( enable )
	      y2 <= a;
	   
	// Comment #3: 
	//    Typical RTL Usage
	always @( posedge clk iff (enable == 1 ) or negedge rstn )
	    if( !rstn )
	      y3 <= 8'd0;
	    else
	      y3 <= a;
	
	initial begin
	   int j=0;
	   foreach(arr2d[i]) begin
	      arr2d[i]= j;
	      j= j+1;
	   end
	end
	
	// Comment #4: 
	//    Typical TB Usage
	initial begin
	   foreach (arr2d[i])
	      // send arr2d when not s_wait
	      @(negedge clk iff(!s_wait))
	         y4 <= arr2d[i];
	end
	
	initial begin
	   a=0; rstn=0; enable=0; s_wait=1;
	   @(negedge clk) rstn= 1;
	   repeat(8) begin
	      @(posedge clk) ;
	      #1; a= a+1;
	      #1; enable= 1;
	          s_wait= 0;
	   end
	   #100 $finish;
	end
	
endmodule : tb
