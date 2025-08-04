// ex4_operator_inside.sv
//

module tb;

   logic [1:0] a;
   int b;
   int bar[1:0];
   logic [1:0] c;

   initial begin
      a= 2'b01;
      // Comment #1 :
      //    equivalent to : if( ( a == 2'b01 ) || ( a == 2'b10 ) )
      if( a inside {2'b01, 2'b10} )
         $display("%b is in {2'b01, 2'b10}",a);

      b= 5;
      bar[1:0]= '{5,6};
      // Comment #2 :
      //    equivalent to : if( b inside {bar[1], bar[0], 0, 1, 2 } ) 
      if( b inside {bar, [0:2]} )
         $display("%d is in {{5,6}, [0:2]}",b);

      c= 2'b01;
      // Comment #3 : 
      //    equivalent to : if( a inside {2'b00, 2'b01, 2'b0X, 2'b0Z} )
      if( c inside {2'b0?} )
         $display("%b is in {2'b0?}",c);
   end

endmodule