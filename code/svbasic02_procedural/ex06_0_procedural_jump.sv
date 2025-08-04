// ex6_procedural_jump.sv
//

module tb();
	
	logic [2:0] cnt;
	logic [7:0] data;
	
	initial begin
	   cnt=0; data= 1;
	
	   // Comment #1 : 
	   //    break, terminate loop immediately
	   repeat (8) begin
	      $display("DEBUG FIRST %d",data);
	      data= {data[6:0],data[7]};
	      if(data[7])
	         break; // JUMP, out from loop
	   end
	
	   // Comment #2 : 
	   //    continue,jump to next iteration of loop
	   foreach (data[i]) begin
	      if(data[i])
	         continue; // JUMP, forward to next loop
	      cnt= cnt +1;
	      $display("DEBUG SECOND %d %d",data[i], cnt);
	   end
	end
	
endmodule : tb

