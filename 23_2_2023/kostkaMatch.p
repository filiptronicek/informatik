// A game for two players, competing in a dice rolling contest. Each player has 3 turns to have the most points at the end.

Program DiceRollGame;
uses crt;

var randomNumHost, randomNumOponent: integer;

var turns : int64;
var totalRounds : int64;

var hostPoints, oponentPoints : int64;

begin
clrscr;

randomize;

turns := 3000000;
totalRounds := 0;

hostPoints := 0;
oponentPoints := 0;

while turns > 0 do
begin
randomNumHost := random(6) + 1;
randomNumOponent := random(6) + 1;

writeln('Host rolled: ', randomNumHost);
writeln('Oponent rolled: ', randomNumOponent);

if randomNumHost > randomNumOponent then
begin
hostPoints := hostPoints + 1;
end
else if randomNumHost < randomNumOponent then
begin
oponentPoints := oponentPoints + 1;
end
else
begin
// A tie, no points are awarded and the turn is repeated.
writeln('Tie! No points awarded.');
turns := turns + 1;
end;

turns := turns - 1;
totalRounds := totalRounds + 1;
end;

if hostPoints > oponentPoints then
begin
writeln('Host wins in ', totalRounds, ' rounds with ', hostPoints, ' points!');
end
else if hostPoints < oponentPoints then
begin
writeln('Opponent wins in ', totalRounds, ' rounds with ', oponentPoints, ' points!');
end
else
begin
writeln('Tie! No winner. Both players have ', hostPoints, ' points.');
end;

end.