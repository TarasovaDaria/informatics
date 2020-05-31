program geometry1;

uses Geometry;

var Tr:Triangle;
L:line;
C1, C2:Circle;
arr: array [1..20] of Point;
i: Integer;
N:Integer;

begin

Tr := CreateTriangle;
L:= CrLine;
C1:= CreateCircle;
C2:= CreateCircle;

readln(N);
for i:=1 to N do
arr[i]:=CreatePoint();

if CrossOrNot (L,Tr) then
WriteLn('pereseklo')
else
WriteLn('ne pereseklo');

for i:= 1 to N do
begin
if IsPointInsideCircle(arr[i], C1) and IsPointInsideCircle(arr[i], C2) then
writeln (i);
end;

WriteLn('AB = ', GetDistance(Tr.A, Tr.B):0:6);
WriteLn('BC = ', GetDistance(Tr.B, Tr.C):0:6);
WriteLn('AC = ', GetDistance(Tr.A, Tr.C):0:6);

WriteLn('Per = ', GetTrPer(Tr):0:6);
WriteLn('Sqr = ', GetTrSq(Tr):0:6);
Writeln('Is Crossed');



ReadLn();
end.

