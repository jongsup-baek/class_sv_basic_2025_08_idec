// ex3_array_packed.sv
//

module tb;

   // Comment #1 : packarr
   //    Packed array of bytes
   //    {logic[7:0][1],logic[7:0][0]}
   logic [1:0][7:0] packarr;
   logic [7:0] short= 8'hAA;
   logic [23:0] long= 24'h555555;

   initial begin

      packarr= 16'h0;
      packarr= packarr <<1;
      packarr= ~packarr ;
      packarr= short ;  // 16'h00aa
                                       $display("%h",packarr);
      packarr= long ;   // 16'h5555
                                       $display("%h",packarr);

	end
	
endmodule
