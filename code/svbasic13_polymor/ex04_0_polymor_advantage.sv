// ex4_polymor_advantage.sv
//

module tb;

   // Comment #1 : Base Class
   class frame;
      logic [4:0] addr;
      logic [7:0] payload;
      bit parity;
      function new (input int add, dat);
         addr= add;
         payload= dat;
         genpar();
      endfunction
      function void genpar();
         parity = ^{addr,payload};
      endfunction
      function void iam();
         $display("frame");
      endfunction
   endclass

   // Comment #2 : Sub Class
   class tagframe extends frame;
      static int frmcount;
      int tag;
      function new(int add,dat);
         super.new(add,dat);
         frmcount++;
         tag= frmcount;
      endfunction
      function void iam();
         $display("tagframe");
      endfunction
   endclass

   // Comment #3 : Sub-Sub Class
   class errframe extends tagframe;
      static int errcount;
      function new(int add,dat);
         super.new(add,dat);
         errcount++;
      endfunction
      function void iam();
         $display("errframe");
      endfunction
   endclass

   // Comment #4 : Array of base Class
   //    base class used 
   //       for a handle array declaration
   frame framearr[7:0];
   tagframe tf;
   errframe ef;

   initial begin
      // Comment #5 :
      //    different sub-class instances 
      //       are then assigned to array element
      //    dynamically select which sub-class 
      //       instance to load into an array
      foreach (framearr[i])
         randcase
            2: begin
               tf = new(0,0);
               framearr[i] = tf;
               end
            1: begin
               ef = new(0,0);
               framearr[i] = ef;
               end
        endcase
   end

endmodule
