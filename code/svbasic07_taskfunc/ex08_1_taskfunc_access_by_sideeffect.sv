// ex8_1_taskfunc_access_by_sideeffect.sv
//

module tb;
   logic req;
   logic ack;
   logic [7:0] data;

   task cpu_drive_side (
      input  logic [7:0] write_data);

      // Comment #1 :
      //    ouput driven directly
      #5 req= 1;              
      wait (ack ==1);

      // Comment #2 :
      //    Input read directly
      #20 data= write_data;   

      wait (ack ==0);
      #20 data= 8'hzz;        
      req= 0;                 

   endtask : cpu_drive_side

   initial begin
      $display("Start");
      fork
         begin
            // Comment #3:  
            //    Only literals in call
            cpu_drive_side(8'hff);
         end
         begin
            ack=0;
            wait(req==1);
            ack=1;
            #25;
            $display("data= %h",data);
            ack=0;
            wait(req==1);
            $display("data= %h",data);
         end
      join
      $display("%d",ack);
      $display("End");
   end
endmodule
