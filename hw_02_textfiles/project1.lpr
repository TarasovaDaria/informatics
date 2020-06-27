program project1;

type
  Data = record
  Time: Integer;
  ID: Integer;
  Enters: Integer;
  end;

var
  FileName: String;
  F: array [1..10] of TextFile;
  Active: array [1..10] of Boolean;
  Values: array [1..10] of Data;
  N, I, IMax: Integer;
  ReadingEnd: Boolean;
  FF : TextFile ;
begin
  Write ('Input files count: ');
  ReadLn(N);
  for I:=1 to N do
  begin
    Write('File name #', I, ': ');
    ReadLn (FileName);
    Assign (F[I], FileName);
    ReSet(F[I]);

    Active[I]:= not EOF(F[I]);
    if Active[I] then
    begin
      ReadLn(F[I], Values[I].Time, Values[I].ID, Values[I].Enters);
    end;
  end;

  Assign (FF, 'Result.txt');
  ReWrite(FF);

  while True do
  begin
    ReadingEnd:=True;
    IMax:=-1;
    for I:=1 to N do
    if Active[I] then
    begin
      if (IMax = -1) or (Values[I].Enters>Values[Imax].Enters) then
      IMax:=I;
      ReadingEnd:=False;
    end;
    if ReadingEnd then
    break;

    WriteLn(Values[IMax].Enters);
    WriteLn(FF, Values[IMax].Time, ' ', Values[IMax].ID, ' ', Values[IMax].Enters);

    Active[IMax]:=not EOF(F[IMax]);
    if Active[IMax] then
    begin
      ReadLn(F[IMax], Values[I].Time, Values[I].ID, Values[I].Enters);
    end;
  end;
  for I:=1 to N do
    CloseFile(F[I]);

  CloseFile(FF);

  Writeln('Finished');
  ReadLn;



end.

