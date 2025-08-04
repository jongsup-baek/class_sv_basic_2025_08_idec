// ex8_taskfunc_passing_by_values.sv
//

module tb;
   logic req;
   logic ack;
   logic [7:0] data;
   
   task cpu_drive_bad (
           input  logic [7:0] write_data,
           input  logic data_valid,
           output logic data_read,
           output logic [7:0] cpu_data);

      #5 data_read= 1;
      // Comment #1 : Input
      //    Input changes not detected
      wait (data_valid ==1);     
      #20 cpu_data= write_data;
      wait (data_valid ==0);
      #20 cpu_data= 8'hzz;       

      // Comment #2 : Output
      //    Output, only last update are seen
      data_read= 0;

   endtask : cpu_drive_bad

   initial begin
      $display("Start");
      fork
         begin
            // Comment #3 : Bad Call
            cpu_drive_bad(8'hff, ack, req, data);
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
