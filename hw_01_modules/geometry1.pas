program geometry1;

uses Geometry;

var Tr:Triangle;
L:line;

begin

Tr := CreateTriangle;
L:= CrLine;

if CrossOrNot (L,Tr) then
WriteLn('pereseklo')
else
WriteLn('ne pereseklo');

WriteLn('AB = ', GetDistance(Tr.A, Tr.B):0:6);
WriteLn('BC = ', GetDistance(Tr.B, Tr.C):0:6);
WriteLn('AC = ', GetDistance(Tr.A, Tr.C):0:6);

WriteLn('Per = ', GetTrPer(Tr):0:6);
WriteLn('Sqr = ', GetTrSq(Tr):0:6);

ReadLn();
end.

