// ex2_dvfeatures_string_method.sv
//

module tb;

   integer abin,aoct,aint,ahex;
   real areal;
   byte abyte;
   integer acomp;
   string mystr;
   string str;

   initial begin

      // Comment #1 : String methods(1)
      //    .len(), .putc(), .getc(), 
      //    .compare(), .icompare(), .substr()
      str = "test";
      aint= str.len();              $display("%d",aint);    // 4 
      str.putc(3,"w");              $display("%s",str);     // "tesw"   
      abyte= str.getc(3);           $display("%c",abyte);   // "w"
      acomp= str.compare("tesa");   $display("%d",acomp);   // 1
      acomp= str.icompare("tesa");  $display("%d",acomp);   // 1
      mystr= str.substr(2,3);       $display("%s",mystr);   // "sw"

      // Comment #2 : String methods(2)
      //    .toupper, .tolower,
      //    .atobin, .atooct, .atoi, .atohex, .atoreal,
      //    .bintoa, .octtoa, .itoa, .hextoa, .realtoa
      str= "test";
      str= str.toupper();     $display("%s",str);  
                              // "TEST"
      str= str.tolower();     $display("%s",str);  
                              // "test"
      str= "11012";
      abin= str.atobin();     $display("%b",abin);    
                              // 6'b11001
      str= "67012";
      aoct= str.atooct();     $display("%b",aoct);    
                              // `b110111000001010
      str= "213A3";
      aint= str.atoi();       $display("%d",aint);    
                              // 213
      str= "11A12";
      ahex= str.atohex();     $display("%h",ahex);    
                              // 11a12
      str= "3.14";
      areal= str.atoreal();   $display("%f",areal);   
                              // 3.14
      str.bintoa(4'b1101);    $display("%s",str);  
                              // 1101
      str.octtoa('o7561);     $display("%s",str);  
                              // 7561
      str.itoa(345);          $display("%s",str);  
                              // 345
      str.hextoa('hf0e);      $display("%s",str);  
                              // f0e
      str.realtoa(6.17);      $display("%s",str);  
                              // 6.17

   end

endmodule : tb

