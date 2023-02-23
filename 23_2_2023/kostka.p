Program DiceRoll;
uses crt;

var randomNum, x: integer;

begin
clrscr;

randomize;

randomNum := random(6)+1;
repeat

writeln('For a dice roll, press 1');
readln(x);
if x = 1 then write('Dice rolled a ', randomNum)
else writeln('You did not press 1');
until x = 1;

end.

end.