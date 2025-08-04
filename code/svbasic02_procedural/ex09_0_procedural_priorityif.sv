// ex9_procedural_priorityif.sv
//

module tb();
	logic       en_a, en_b, en_c;
	logic [1:0] fullc;
	logic [2:0] pri;
	logic [7:0] a, b, c, y1, y2;
	
	// Comment #1:
	//    Runtime warning if one enable not active
	always @(*)
	    priority if(en_a)
	      y1= a;
	    else if(en_b)
	      y2= a;
	    else if(en_c)
	      y2= a;
	
	initial begin
	   //Initialization
	   a=8'd1; b=8'd2; c= 8'd3;
	   en_a= 1; en_b=0; en_c=0;
	   //Test : en_a, en_b, en_c
	   #10; en_a= 1; en_b=1; en_c=0;
	   #10; en_a= 0; en_b=0; en_c=0;
	   #10; en_a= 1; en_b=0; en_c=0;
	   //End-of-Simulation
	   #10 $finish;
	end
	
endmodule : tb
