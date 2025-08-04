// ex8_procedural_prioritycase.sv
//

module tb();
	
	logic       en_a, en_b, en_c;
	logic [1:0] fullc;
	logic [2:0] pri;
	logic [7:0] a, b, c, y1, y2;
	
	// Comment #1: priority case
	always @(*)
	    priority case(fullc)
	      0     : y1= a;
	      1,2,3 : y1= b;
	      3     : y1= c;
	    endcase
	
	// Comment #2: priority case
	//    Runtime warning if one enable not active
	always @(*)
	    priority case(1'b1)
	      en_a : y2= a;
	      en_b : y2= b;
	      en_c : y2= c;
	    endcase
	
	// Comment #3: priority casez
	//    Runtime warning if pri=0 or pri=x
	always @(*)
	    priority casez(pri)
	      3'b1?? : y2= a;
	      3'b?1? : y2= b;
	      3'b??1 : y2= c;
	    endcase
	
	initial begin
	   //Initialization
	   a=8'd1; b=8'd2; c= 8'd3;
	   en_a= 1; en_b=0; en_c=0;
	   fullc= 0; pri= 3'b100;
	   //Test : fullc
	   #10; fullc=  3;
	   #10; fullc=  0;
	   //Test : en_a, en_b, en_c
	   #10; en_a= 1; en_b=1; en_c=0;
	   #10; en_a= 0; en_b=0; en_c=0;
	   #10; en_a= 1; en_b=0; en_c=0;
	   //Test : pri
	   #10; pri=  3'b110;
	   #10; pri=  3'b000;
	   #10; pri=  3'b100;
	   #10 $finish;
	end
	
endmodule : tb
