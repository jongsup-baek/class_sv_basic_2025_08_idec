// ex8_interface_port_parameter.sv
//

// Comment #1 :
//    you can define them as part of interface header
interface fastbus #(DBUS =32, ABUS=8) (input clk);
   logic [ABUS-1:0] address;
   logic [DBUS-1:0] data;
endinterface

// Comment #2 :
//    you can also define them inside interface 
//    with 'parameter' type
interface slowbus (input clk);
   parameter WIDTH = 16;
   logic [WIDTH-1:0] a, b;
endinterface

module top;
   logic clk;

   // Comment #3 :
   //    you can override parameters 
   //    during interface instantiation
   fastbus #(8,5) bus8x5(clk); //8-bit DBUS, 5-bit ABUS
   fastbus #(8)   bus8x8(clk); //8-bit DBUS, 8-bit ABUS
   slowbus #(.WIDTH(8)) bus2(); // 8-bit a, b variables

endmodule : top