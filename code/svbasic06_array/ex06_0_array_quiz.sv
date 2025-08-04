// ex6_array_quiz.sv
//

module tb1;

   //Question-1
   logic [3:0][7:0]  parr;

   initial begin
      parr[0]= 6;
      parr[1]= 7;
      parr[8]= 8;
      parr[9]= 9;
      $display("%h",parr);          // xxxx0706
      $display("%h",parr[0]);       // 6
      $display("%h",parr[0][5]);    // 0
   end

endmodule

module tb2;

   //Question-2
   typedef enum bit [1:0]  {A,B,C,D}  mytype;
   mytype [6:0] pnum;
   initial begin
      pnum= {D,D,C,C,B,B,A};
      $display("%h    ",pnum);                     // 3e49, DDCCBBAA
      $display("%h, %s",pnum[2], pnum[2].name());  // 1, B
      $display("%h    ",pnum[4:3]);                // a, CC
      $display("%h    ",pnum[5][1]);               // 1, n/a
    end

endmodule
