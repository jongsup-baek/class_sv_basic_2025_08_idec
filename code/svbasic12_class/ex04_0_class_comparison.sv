// ex4_class_comparison.sv
//

module tb;

   // Comment #1 :
   //    Class defines and entity type
   class StudentRecord;
      int number;
      string grade;
      string name;
      string surname;
      function new(i,str1,str2,str3);
         number= i;
         grade= str1;
         name= str2;
         surname= str3;
      endfunction
   endclass

   // Comment #2 : Hand, Instance
   //    An object is one instance of the class type
   // Handle
   StudentRecord Jeetae_c;
   StudentRecord Chulhee_c;
   StudentRecord Soobin_c;
   StudentRecord Jungwoo_c;

   // Instance
   initial begin
      Jeetae_c= new(1201,"A+","Jeetae","Kim");
      Chulhee_c= new(1202,"A+","Chulhee","Lee");
      Soobin_c= new(1203,"A+","Soobin","Park");
      Jungwoo_c= new(1204,"A+","jungwoo","Sa");
   end

endmodule

