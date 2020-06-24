program dinamic_array_verification;
var M: array of Real;
i, N: Integer;

begin
  Write('Enter N: ');
  ReadLn(N);
  SetLength(M,N);
  for i:=0 to Length(M)-1 do
  Read (M[i]);
  ReadLn;
  N:=0;
  for i:=0 to Length(M)-1 do
  begin
    if M[i]>=0 then
    begin
      M[N]:=M[i];
      N:=N+1;
    end;
  end;
  SetLength (M,N);
  for i:=0 to Length(M)-1 do
  Write (M[i]:0:6, ' ');
  WriteLn;
  ReadLn;
end.
