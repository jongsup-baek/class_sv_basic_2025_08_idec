// ex3_procedural_variabls_forloops.sv
//

`define VERILOG
//`define SYSTEMVERILOG

module tb();
	
	`ifdef VERILOG
	// Comment #1 :  Verilog-Style
	//    loop variable declared outside loop
	//    two loops should use different variable 
	//    to avoid conflicts
	integer i, j;
	initial begin           
	   /////////////////////////////////
	   // this for-loop, i is used
	   for (i=0;i<10;i=i+1) begin  
	         $display("i:%d",i);
	         /////////////////////////////////
	         // this for-loop, j is used
	         for (j=0;j<8;j=j+1) begin  
	            $display("Number is:%d", j);
	            #10;
	         end
	   end
	end
	`endif
	
	`ifdef SYSTEMVERILOG
	// Comment #2 : SystemVerilog
	//    same variable "i" used even in nested loop
	//    two loops "i", are independent
	//    "int" : good use for 2-state types
	initial begin             
	   /////////////////////////////////
	   // i visible at this level
	   for (int i=0;i<10;i=i+1) begin
	         $display("i:%d",i);
	         /////////////////////////////////
	         // this for-loop i is different
	         for (int i=0;i<8;i=i+1) begin  
	            $display("Number is:%d", i);
	            #10;
	         end
	   end
	end
	`endif
	
endmodule : tb

