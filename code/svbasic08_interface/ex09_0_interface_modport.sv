// ex9_interface_modport.sv
//

// Comment #1 : modport list creation
interface mod_if;
   logic a, b, c, d;
   modport master (input a,b, output c, d);
   modport slave  (output a,b, input c, d);
   modport subset (output a, input b);
endinterface
