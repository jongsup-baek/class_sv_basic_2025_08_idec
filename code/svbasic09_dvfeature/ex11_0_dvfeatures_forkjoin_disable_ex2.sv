// ex11_dvfeatures_forkjoin_disable_ex2.sv
//
module tb;

   task t1();
      fork
         begin : a1
            #1 $display("get_preamble");
         end
         begin : a2
            #2 $display("get_header");
         end
      join_none
      fork
         begin : a3
            #5 $display("get_payload");
         end
         begin : a4
            #6 $display("get_timeout");
         end
      join_any

      // Comment #1 : disable t1
      //    Terminates all active executions of task and tasks called from it
      //    Does not terminate subprocesses of the task
      disable t1;
      $display("Processing packet");
   endtask

   initial begin : i1
      fork : f1
         #10 $display("pkt_interrupt_handler");
      join_none
      $display("Getting the packet");
      t1();
   end

endmodule

