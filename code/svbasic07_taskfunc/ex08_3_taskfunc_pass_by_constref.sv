// ex8_3_taskfunc_pass_by_constref.sv
//

//`define PROBLEM
`define SOLUTION

module tb;
   logic req;
   logic ack;
   logic [7:0] data;

   // Comment #1 : Input
   //    const ref instead of ref 
   task automatic cpu_drive_const_ref (
           input  logic [7:0] write_data,
           const ref logic data_valid,
           ref logic data_read,
           ref logic [7:0] cpu_data);

      #5 data_read= 1;        
      wait (data_valid ==1);  
      #20 cpu_data= write_data;
      wait (data_valid ==0);
      #20 cpu_data= 8'hzz;
      data_read= 0;

      `ifdef PROBLEM
      // Comment #2 :
      //    const argument cannot be modified
      data_valid= 0;          
      `endif

      `ifdef SOLUTION
      // Comment #3 :
      //    const argument cannot be modified
      `endif

   endtask : cpu_drive_const_ref

   initial begin
      $display("Start");
      fork
         begin
            cpu_drive_const_ref(8'hff, ack, req, data);
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
