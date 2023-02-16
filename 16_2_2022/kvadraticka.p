Program QuadraticFunction(output);
uses crt;

var a, b, c: int64;
    x1, x2: real;
    D: real;

begin

    clrscr;
    writeln('==== Program na počítání kvadratických rovnic ====');

    write('Zadejte hodnotu a: ');
    readln(a);
    write('Zadejte hodnotu b: ');
    readln(b);
    write('Zadejte hodnotu c: ');
    readln(c);

    D := sqr(b) - 4 * a * c;

    if D < 0 then
    begin
        writeln('Diskriminant je: ', D:0:2);
        writeln('Rovnice nemá řešení');
        exit;
    end;

    writeln('Diskriminant je: ', D:0:2);
    x1 := (-b + sqrt(D)) / (2 * a);
    x2 := (-b - sqrt(D)) / (2 * a);

    if x1 = x2 then
        writeln('Rovnice má jedno řešení: ', x1:0:2)
    else
        writeln('Rovnice má dva řešení: x1=', x1:0:2, ' a x2=', x2:0:2);

end.