Program Factorial(output);
uses crt;

var input: int64;

function factorial(n: int64): int64;
begin
    if n = 0 then
        factorial := 1;
    else
        factorial := n * factorial(n - 1);
end;

begin

    clrscr;
    writeln('==== Counting factorials ====');

    write('Enter a value for the factorial: ');
    readln(input);

    writeln('Factorial of ', input, ' is ', factorial(input));


end.