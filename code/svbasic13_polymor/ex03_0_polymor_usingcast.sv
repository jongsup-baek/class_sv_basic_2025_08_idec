// ex3_polymor_usingcast.sv
//

module tb;
   class base;
      function void iam(); $display("i am base"); endfunction
   endclass
   class sub1 extends base;
      function void iam(); $display("i am sub1"); endfunction
   endclass
   class sub2 extends base;
      function void iam(); $display("i am sub2"); endfunction
   endclass

   base b1;
   sub1 s1;
   sub2 s2;

   initial begin

      // Comment #1 : Sender
      //    random selection of instance b1
      //    assgined to base resource
      int mode= $urandom_range(0,2);                  
      mode= 2;
      if(mode == 1) begin
         // Comment #2 : 
         //    Copy s1 instance to b1 handle
         s1= new();
         b1= s1;
      end else if(mode == 2) begin
         // Comment #3 : 
         //    Copy s2 instance to b1 handle
         s2= new();
         b1= s2;
      end
      else begin
         // Comment #4 : 
         //    Create b1 instance using constructor
         b1= new();
      end

      // Comment #5 : Receiver
      //    Successful cast identifies contents
      if($cast(s1,b1))
         s1.iam();   //i am sub1
      else if($cast(s2,b1))
         s2.iam();   // i am sub2
      else
         b1.iam();   // i am base

   end
endmodule
