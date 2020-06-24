program DinamicArray;

Type
Matrix = array of array of Integer;

var
M : Matrix;
P, Q : Integer;
i, j, Dy, Dx, x, y : Integer;
NewValue : Integer;
IsNewValue : Boolean;

function IncDec() : Integer;
begin
IncDec := NewValue;
if NewValue = 1 then
IsNewValue := true;
if NewValue = 9 then
IsNewValue := false;

if IsNewValue then
NewValue := NewValue + 1
else
NewValue := NewValue -1 ;

end;

begin
Write('Enter P, Q: ');
ReadLn(P, Q);

SetLength(M, Q);

for i := 0 to Q - 1 do
SetLength(M[i], P);

Dx := P;
Dy := Q - 1;
x := 0;
y := 0;
NewValue := 1;

while (Dx + Dy) > 0 do
begin
for i := 0 to Dx - 1 do
begin
M[y][x + i] := IncDec();
end;
if Dy = 0 then
break;
Dx := Dx - 1;
x := x + i;
y := y + 1;

for i := 0 to Dy - 1 do
begin
M[y + i][x] := IncDec();
end;
if Dx = 0 then
break;
Dy := Dy - 1;
x := x - 1;
y := y + i;

for i := 0 to Dx - 1 do
begin
M[y][x - i] := IncDec();
end;
if Dy = 0 then
break;
Dx := Dx - 1;
x := x - i;
y := y - 1;

for i := 0 to Dy - 1 do
begin
M[y - i][x] := IncDec();
end;
if Dx = 0 then
break;
Dy := Dy - 1;
x := x + 1;
y := y - i;

end;

for i := 0 to Q - 1 do
begin
for j := 0 to P - 1 do
begin
Write(M[i][j]:3);
end;
WriteLn();
end;

ReadLn();
end.
