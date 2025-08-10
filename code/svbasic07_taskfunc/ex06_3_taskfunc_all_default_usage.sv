class MyClass;
  function void greet(string name = "Guest");
    $display("Hello, %s!", name);
  endfunction

  function void welcome;
    greet;  // == this.greet()  (괄호 생략 가능)
  endfunction
endclass

initial begin
  MyClass obj = new();
  obj.welcome();  // "Hello, Guest!"
end
