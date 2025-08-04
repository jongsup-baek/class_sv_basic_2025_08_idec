// ex1_class_intro.sv
//

module cmod;
   // Comment #1 : 
   //    Class declaration in a module
   class myclass;
      int number;
   endclass
endmodule

package myclasses;
   // Comment #2 : 
   //    Class declaration in a package
   class frame;
      logic [4:0] addr;
      logic [7:0] payload;
      bit   parity;
   endclass
endpackage

