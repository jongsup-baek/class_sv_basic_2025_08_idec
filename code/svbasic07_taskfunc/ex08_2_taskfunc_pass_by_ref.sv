// ex8_2_taskfunc_pass_by_ref.sv
//

module tb;
   logic req;
   logic ack;
   logic [7:0] data;

   // Comment #1 :
   //    task must be declared as automatic
   task automatic cpu_drive_ref (
           input  logic [7:0] write_data,
           ref logic data_valid,
           ref logic data_read,
           ref logic [7:0] cpu_data);

      // Comment #2 :
      //    All output updates seen
      #5 data_read= 1;        

      // Comment #3 :
      //    Input changes detected
      wait (data_valid ==1);
      #20 cpu_data= write_data;
      wait (data_valid ==0);
      #20 cpu_data= 8'hzz;
      data_read= 0;

   endtask : cpu_drive_ref

   initial begin
      $display("Start");
      fork
         begin
            // Comment #4 :
            //    formal arguments mapped to actuals in call
            cpu_drive_ref(8'hff, ack, req, data);
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
