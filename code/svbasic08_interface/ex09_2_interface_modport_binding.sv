// ex9_2_interface_modport_binding.sv
//

// Comment #1 : modport list creation
interface mod_if;
   logic a, b, c, d;
   modport master (input a,b, output c, d);
   modport slave  (output a,b, input c, d);
   modport subset (output a, input b);
endinterface

// Comment #2 : mod_if
module busmaster (mod_if mbus);
endmodule

// Comment #3 : mod_if
module busslave (mod_if sbus);
endmodule

// Comment #4 : interface modport selection
//    during the port mapping of module instantiation
module tb;
   mod_if busb();
   busmaster M1 (.mbus(busb.master));
   busslave  S1 (.sbus(busb.slave));
endmodule