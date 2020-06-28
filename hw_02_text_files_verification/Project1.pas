program Project1;
var
  F, Result: TextFile;
  A: array [1..100] of Integer;
  N, R, S, I: Integer;
  FileName: String;
begin
  Write ('File name: ');
  ReadLn(FileName);
  Assign(F, FileName);
  ReSet(F);
  N:=0;
  while not EOF(F) do
  begin
    N+=1;
    Read(F, A[N]);
  end;
  R:=Round(sqrt(N));
  S:=0;
  for I:=1 to R do
  begin
    S+=A[I+R*(I-1)];
  end;
  Assign(Result, 'ResultFile.txt');
  ReWrite (Result);
  for I:=1 to N do
  begin
   if (I mod R) = 0 then
     WriteLn (Result, A[I])
   else
     Write (Result, A[I], ' ');
  end;
  WriteLn(Result, S);
  CloseFile(F);
  CloseFile(Result);
end.

