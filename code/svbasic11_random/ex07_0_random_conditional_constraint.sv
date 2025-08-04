// ex7_random_conditional_constraint.sv
//

module tb;
   bit clk=0; initial forever #5 clk = ~clk;

   logic[7:0]  data;
   typedef enum bit [1:0] { SMALL, MEDIUM, LARGE, XL} mode_t; 
   mode_t      mode;

   int ok;
   initial begin
      repeat (10) begin

         // Comment #1 : without conditional constraints
         ok = randomize(mode);

         // Comment #2 : Implication conditional constraint
         //    if mode is SMALL, data constraint is <100
         //    if mode is LARGE, data constraint is >200
         //    if mode is neither SMALL nor LARGE, data is unconstrained
         ok = randomize(data) with { 
            mode == SMALL -> data < 100 ; 
            mode == LARGE -> data > 200 ; };                                  $display("implication -> \t\t%d %s",data,mode.name());

         // Comment #3 : if-else conditional constraint
         //    if/else : the same as above implication
         ok = randomize(data) with { 
            if (mode == SMALL) 
               data < 100 ; 
            else if (mode == LARGE) 
               data > 200 ; 
            };                                                                   $display("if-else \t\t\t\t%d %s",data,mode.name());
      end
      #0 $finish;
   end
endmodule


