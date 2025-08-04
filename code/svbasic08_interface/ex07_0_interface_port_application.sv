// ex7_interface_port_application.sv
//

interface pds_if (input clk);
   logic [7:0] pds_address;
   wire  [7:0] pds_data;
endinterface : psd_if

interface hbus_if (input clk);
   logic [7:0] hbus_address;
   wire  [7:0] hbus_data;
endinterface : hbus_if

module mem_pds ( pds_if bus);
endmodule

module mem_hbus ( hbus_if bus);
endmodule

module cpu_pds ( pds_if bus);
endmodule

module cpu_hbus ( hbus_if bus);
endmodule

module top;
   logic clk, clk1;

   pds_if   bus1( clk);
   mem_pds  mem1( bus1 );
   cpu_pds  cpu1( bus1 );

   hbus_if  bus2( clk);
   mem_hbus mem2( bus2 );
   cpu_hbus cpu2( bus2 );

   hbus_if  bus3( clk1);
   mem_hbus mem3( bus3 );
   cpu_hbus cpu3( bus3 );

endmodule : top