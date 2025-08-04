// ex9_interface_modport_instance.sv
//

// Comment #1 : modport list creation
interface mod_if;
   logic a, b, c, d;
   modport master (input a,b, output c, d);
   modport slave  (output a,b, input c, d);
   modport subset (output a, input b);
endinterface

// Comment #2 : mod_if.master
module busmaster (mod_if.master mbus);

endmodule

// Comment #3 : mod_if.slave
module busslave (mod_if.slave sbus);

endmodule

// Comment #4 : instantiates interface and modules 
//    as before
module tb;
   mod_if busa();
   busmaster M1 (.mbus(busa));
   busslave  S1 (.sbus(busa));
endmodule