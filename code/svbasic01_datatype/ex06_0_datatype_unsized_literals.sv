// ex6_datatype_unsized_literals.sv
//

module tb();
	
	// Comment #1: Verilog-Style
	//    Sized literals
	//    <size>'<base><value>
	logic [5:0] data_s;
	initial begin
	   data_s= 6'b0; #10; //000000
	   data_s= 6'b1; #10; //000001
	   data_s= 6'bz; #10; //zzzzzz
	   data_s= 6'bx; #10; //xxxxxx
	   data_s= 4'bx; #10; //00xxxx
	end
	
	// Comment #2: SystemVerilog
	//    Unsized literals
	//    '<value>
	logic [5:0] data_u;
	initial begin
	   data_u= '0; #10; //000000
	   data_u= '1; #10; //111111
	   data_u= 'z; #10; //zzzzzz
	   data_u= 'x; #10; //xxxxxx
	   #100; $finish;
	end
	
endmodule

