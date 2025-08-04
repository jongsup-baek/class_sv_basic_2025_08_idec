// ex2_procedural_unnamedblocks.sv
//

module tb();
	
	// Comment #1 : SystemVerilog
	//    local declaration in unnamed block
   	//    verilog-2001, only in named block
	initial begin           //unnamed block
	   integer i;           // local declaration
	   i= 0;
	   while (i<=10) begin  // unnamed block
	      $display("i:%d",i);
	      if( i<5) begin    // unnamed block
	         $display("Number is:%d", i);
	      end
	      i=i+1;
	      #10;
	   end
	end
	
endmodule : tb

