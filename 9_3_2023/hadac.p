Program NumberGuesser(output);

uses crt;

var number, guess, tries: integer;

begin

    randomize;
    clrscr;


    number := random(100)+1;
    tries := 0;

    repeat
        writeln('Your guess:');
        readln(guess);
        tries := tries + 1;

        if guess > number then writeln('Your guess is way too high')
        else if guess < number then writeln('Your guess is way too low')
    until number = guess;

    if tries > 1 then writeln('You got it in ', tries,' tries')
    else writeln('You got it, 1 try! 🎉');

end.
    