// ex1_procedural_identifier.sv
//

//`define VERILOG
`define SYSTEMVERILOG

module tb();
	
	logic a, b, c, d;
	
	`ifdef VERILOG
	// Comment #1 : Verilog-1995
   	//    - no end keyword
	initial begin
	   #10;
	   a= 0;
	   begin : blocka
	      #10;
	      b= 0;
	      begin : blockb
	         #10;
	         c= 0;
	      end
	   end
	end
	`endif
	
	`ifdef SYSTEMVERILOG
	// Comment #2 : SystemVerilog
   	//    - end keyword
	initial begin 
	   #10;
	   a= 0;
	   begin : blocka
	      #10;
	      b= 0;
	      begin : blockb
	         #10;
	         c= 0;
	      end : blockb
	   end : blocka
	end
	`endif
	
endmodule : tb
