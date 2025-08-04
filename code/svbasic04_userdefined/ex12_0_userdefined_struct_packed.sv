// ex12_userdefined_struct_packed.sv
//

module tb;

   // Comment #1 :
   //    All fields are 4-state type
   typedef struct packed {
       logic         id, par ; 
       logic [3:0]   addr;
       logic [7:0]   data; 
   } frame_t;

   frame_t f1, f2;

   logic [3:0] addrbuf;
   initial begin
      f1= '{0,1,2,3};

      // Comment #2 :
      //    Same field
      addrbuf= f1.addr;
      addrbuf= f1[11:8];
      f2= f1 >>2;

      // Comment #3 :
      //    padding & truncation
      f1= 8'haa;        // 14'h00aa (padding)
      f1= 16'h5555;     // 14'h1555 (truncation)

   end

endmodule


// TO BE DELETED
//      addrbuf= f1.addr;
//      $display("#1, addrbuf= %d",addrbuf);
//      addrbuf= f1[11:8];
//      $display("#2, addrbuf= %d",addrbuf);
//      f2= f1 >>2;
//      $display("#3, f1= %d, %d, %d, %d",f1.id, f1.par, f1.addr, f1.data);
//      $display("#4, f2= %d, %d, %d, %d",f2.id, f2.par, f2.addr, f2.data);
//      f1= 8'haa;
//      $display("#5, %d, %d, %d, %h",f1.id, f1.par, f1.addr, f1.data);
//      f1= 16'h5555;
//      $display("#6, %d, %d, %d, %h",f1.id, f1.par, f1.addr, f1.data);


