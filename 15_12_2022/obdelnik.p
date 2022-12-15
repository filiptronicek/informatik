Program RectCalculator(output);
uses crt;

var programChoice, x, y: int64;

function obvod(a, b: int64): int64;
begin
  obvod := 2 * (a + b);
end;

function obsah(a, b: int64): int64;
begin
  obsah := a * b;
end;

function isInputValid(a, b: int64): Boolean;
begin
    if (a <= 0) or (b <= 0) then begin
        writeln('Neplatná hodnota');
        isInputValid := false;
    end else begin
        isInputValid := true;
    end;
end;

begin

    clrscr;
    writeln('==== Program na počítání různověcí o obdélnících ====');
    writeln('Možnosti:');
    writeln('(1): Obvod');
    writeln('(2): Obsah');

    // use a repeat-until loop to ask the user for input and check for validity
    repeat
        readln(programChoice); // ask the user for input
        if (programChoice <> 1) and (programChoice <> 2) then begin // check for validity
            writeln('Neplatná volba. Zadejte 1 nebo 2');
        end;
    until (programChoice = 1) or (programChoice = 2); // repeat until the input is valid

    // use a case statement to handle the different options in the program
    case programChoice of
        1: begin
            repeat
                writeln('Zadejte stranu a');
                readln(x);
                writeln('Zadejte stranu b');
                readln(y);
                writeln('Obvod je ', obvod(x, y));
                until isInputValid(x, y);
            end;
        2: begin
            repeat
                writeln('Zadejte stranu a');
                readln(x);
                writeln('Zadejte stranu b');
                readln(y);
                writeln('Obsah je ', obsah(x, y));
            until isInputValid(x, y);
        end;
    end;
end.