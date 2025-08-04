// ex10_procedural_uniqueif.sv
//

module tb();
	logic [2:0] cnt;
	logic [7:0] a, c, y1;
	
	// Comment #1: unique if
	//    Runtime warning if ctrl == 3'b100
	always @(*)
		unique if(cnt >= 3'b100)
		  y1= a;
		else if(cnt <= 3'b100)
		  y1= a;
		else
		  y1= c;
	
	initial begin
	   //Initialization
	   a=8'd1; c= 8'd3;
	   cnt = 3'b000;
	   //Test : en_a, en_b, en_c
	   #10; cnt = 3'b100;
	   #10; cnt = 3'b110;
	   #10 $finish;
	end
	
endmodule : tb
