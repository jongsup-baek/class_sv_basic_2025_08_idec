// ex1_dvfeatures_intro.sv
//

module tb;
   integer pass=1;

   // Comment #1: 
   //    sting is a new datatype
   string message = "test ";

   // Comment #2: 
   //    string is dynamic array of bytes
   initial begin
      if(pass)
         message = { message, "passed" };
      else
         message = { message, "failed" };
      $display("%s",message);
      $display("%c",message[0]); // "t"
   end

   // Comment #3: 
   //    indexed as normal aray
   //    concatenated, replicated, compared
   string repstr;
   initial begin
      repstr = {2{"go "}}; // "go go "
                                          $display("%s",repstr);
      repstr[2] = "t";     // "gotgo"
                                          $display("%s",repstr);
   end

   // Comment #4: 
   //    special characters
   string exstr;
   initial begin
      exstr= "test\ntest";
                              $display("%s",exstr);
      exstr= "test\ttest";
                              $display("%s",exstr);
      exstr= "test\\test";
                              $display("%s",exstr);
   end


endmodule : tb