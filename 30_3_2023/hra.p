// Documentation for the GTM Simulator: a game emulating the life of a student in high school

Program GTMSimulator;
uses
  crt, Math;

function SineValue(x: Integer): Integer;
var
  A, B, C, D: Double;
  maxValue, minValue: Integer;
begin
  minValue := 13;
  maxValue := 30;
  A := (maxValue - minValue) / 2;
  B := 2 * Pi / 196;
  C := 0;
  D := (maxValue + minValue) / 2;

  SineValue := Round(A * sin(B * (x - C)) + D);
end;

type
  TBoosts = record
    Tech: Integer;
    GeneralSmarts: Integer;
    Attractiveness: Integer;
    Survival: Integer;
  end;

  TSubject = object
    SubjectName: String;
    TeacherName: String;
    Boost: TBoosts;
    EnergyCost: Integer;
    procedure SetData(ASubjectName, ATeacherName: String; ABoost: TBoosts; AEnergyCost: Integer);
    procedure DisplayData;
  end;

procedure TSubject.SetData(ASubjectName, ATeacherName: String; ABoost: TBoosts; AEnergyCost: Integer);
begin
  SubjectName := ASubjectName;
  TeacherName := ATeacherName;
  Boost := ABoost;
  EnergyCost := AEnergyCost;
end;

procedure TSubject.DisplayData;
begin
  WriteLn('Subject: ', SubjectName, ' | Teacher: ', TeacherName);
  WriteLn('Boosts: Tech(', Boost.Tech, '), General Smarts(', Boost.GeneralSmarts, '), Attractiveness(', Boost.Attractiveness, '), Survival(', Boost.Survival, ')');
  WriteLn('Energy Cost: ', EnergyCost);
end;

type
  TSubjectArray = array[1..5] of TSubject;

var
  Subjects: TSubjectArray;
  SelectedSubjects: array[1..3] of TSubject;
  i: Integer;
  BoostData: TBoosts;
  DaysEnergyLeft: Integer;
  DayNow: Integer;
  ClassesToday: Integer;
  CurrentSubject: TSubject;
  Selection: Integer;
begin
    // Set data for the subjects (name, teacher, boost, energy cost)
    BoostData.Tech := 10;
    BoostData.GeneralSmarts := 5;
    BoostData.Attractiveness := -3;
    BoostData.Survival := -2;

    Subjects[0].SetData('ICT', 'Martin Jelínek', BoostData, 5);

    BoostData.Tech := 3;
    BoostData.GeneralSmarts := 10;
    BoostData.Attractiveness := -2;
    BoostData.Survival := -1;

    Subjects[1].SetData('Matematika', 'Lucie Smolková', BoostData, 4);

    BoostData.Tech := 5;
    BoostData.GeneralSmarts := 5;
    BoostData.Attractiveness := -1;
    BoostData.Survival := 1;

    Subjects[2].SetData('Fyzika', 'Adrian Majoros', BoostData, 3);

    BoostData.Tech := 2;
    BoostData.GeneralSmarts := 3;
    BoostData.Attractiveness := 2;
    BoostData.Survival := 2;

    Subjects[3].SetData('Chemie', 'Libuše Svobodová', BoostData, 3);

    BoostData.Tech := 0;
    BoostData.GeneralSmarts := 1;
    BoostData.Attractiveness := 5;
    BoostData.Survival := 0;
    Subjects[4].SetData('Angličtina', 'Jindra Glogrová', BoostData, 2);


    WriteLn('Available Subjects:');
    for i := 0 to 4 do
    begin
      Write(i, '. ');
      Subjects[i].DisplayData;
    end;

    for i := 0 to 2 do
    begin
      WriteLn('Select subject ', i, ' by entering the corresponding number (0-4):');
      ReadLn(Selection);
      SelectedSubjects[i] := Subjects[Selection];
    end;

    // Day 1:
    DayNow := 1;
    DaysEnergyLeft := 30;

    while (DaysEnergyLeft > 0) and (DayNow <= 196) do
    begin
      DaysEnergyLeft := SineValue(DayNow);
      WriteLn('Day ', DayNow, ':');
      WriteLn('Energy left: ', DaysEnergyLeft);

      // We select how many classes we have today. It can be between 4 and 8.
      Randomize;
      ClassesToday := 4 + Random(5);

      // For every class today, select a subject at random. Then subtract the energy cost of the selected subject from the energy left.
      for i := 1 to ClassesToday do
      begin
          CurrentSubject := SelectedSubjects[Random(3)];
          WriteLn('Class ', i, ': ', CurrentSubject.SubjectName , ' | Energy cost: ', CurrentSubject.EnergyCost);
          DaysEnergyLeft := DaysEnergyLeft - CurrentSubject.EnergyCost;

          if (DaysEnergyLeft < 0) then
            break;
      end;
      DayNow := DayNow + 1;
    end;

    if (DaysEnergyLeft <= 0) then
      WriteLn('You died!')
    else
      WriteLn('You survived GTM!');

    ReadLn;
end.


