Program MoneyMachine;
uses crt;

var pinAttempts : integer;
    pin : integer;
    pinInput : integer;
    balance : real;
    withdraw : real;
    option : integer;
    withdrawalIncrement : real;

function moduloReal(a, b : real) : real;
begin
    moduloReal := a - (b * trunc(a / b));
end;

begin

    writeln('Welcome to the ATM');
    writeln('Please enter your pin');

    pinAttempts := 0;
    pin := 1234;
    balance := 5000;
    withdrawalIncrement := 100;

    repeat
        readln(pinInput);
        if pinInput = pin then
        begin
            repeat
                writeln('Please select an option');
                writeln('1. Balance');
                writeln('2. Withdraw');
                writeln('3. Exit');
                readln(option);

                if option = 1 then
                begin
                    writeln('Your balance is ', balance:0:2, ' CZK');
                end
                else if option = 2 then
                begin

                    if balance <= 0 then begin
                        writeln('Cannot withdraw: insufficient funds');
                        continue;
                    end;

                    writeln('Please enter the amount you wish to withdraw');
                    readln(withdraw);

                    if withdraw > balance then
                    begin
                        writeln('Insufficient funds');
                    end
                    else if withdraw < 200 then
                    begin
                        writeln('Minimum withdrawal is 200 CZK');
                    end
                    else if moduloReal(withdraw, withdrawalIncrement) <> 0 then
                    begin
                        writeln('Withdrawals must be in ', withdrawalIncrement:0:2 ,' CZK increments');
                    end
                    else
                    begin
                        writeln('Please take your cash');
                        balance := balance - withdraw;
                        writeln('Your balance is ', balance:0:2, ' CZK');
                    end;
                end
                else if option = 3 then
                begin
                    writeln('Thank you for using the ATM');
                end
                else
                if option <> 3 then writeln('Invalid option');
            until (option = 3);
        end
        else
        begin
            writeln('Invalid pin');
            pinAttempts := pinAttempts + 1;
        end;
    until (pinAttempts = 3) or (pinInput = pin);

    if pinAttempts = 3 then writeln('Too many pin attempts. Your account is locked.');
    end.