// ex7_procedural_verilogcase.sv
//

module tb();
	
	logic [1:0] parc, fullc;
	logic [7:0] a=1, b=2, c=3, y1, y2;
	
	// Comment #1 : parallel_case
	always @(*)
	    (* synthesis, parallel_case *)
	    case(parc)
	      0:    y1= a;
	      1,2 : y1= b;
	      3:    y1= c;
	    endcase
	
	// Comment #2 : full_case
	always @(*)
	    (* synthesis, full_case *)
	    case(fullc)
	      0:       y2= a;
	      1,2 :    y2= b;
	      default: y2= c;
	    endcase
	
	initial begin
	   parc=  5; fullc=  5;
	   #10; parc=  0; fullc=  0; #10;
	   $display("parallel case %d",y1);
	   $display("full case %d",y2);
	   #10; parc=  1; fullc=  1; #10;
	   $display("parallel case %d",y1);
	   $display("full case %d",y2);
	   #10; parc=  2; fullc=  2; #10;
	   $display("parallel case %d",y1);
	   $display("full case %d",y2);
	   #10; parc=  3; fullc=  3; #10;
	   $display("parallel case %d",y1);
	   $display("full case %d",y2);
	   #10;
	end
	
endmodule : tb


