unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }
  MyPoint=record
    x, y: Real;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function GetDistance (L, N:TPoint):Real;
begin
  GetDistance:=sqrt(sqr(L.x-N.x)+sqr(L.y-N.y));
end;

function Intersection(P1, P2, P3, P4: MyPoint): MyPoint;
var t: Real;
begin
 t:=((P1.x-P3.x)*(P3.y-P4.y)-(P1.y-P3.y)*(P3.x-P4.x))/((P1.x-P2.x)*(P3.y-P4.y)-(P1.y-P2.y)*(P3.x-P4.x));
 Intersection.x:=P1.x+t*(P2.x-P1.x);
 Intersection.y:=P1.y+t*(P2.y-P1.y);
end;

procedure TForm1.Button1Click(Sender: TObject);
var A, B, C: TPoint;
  O1, O2: TPoint;
  R1, R2: Real;
  AB, BC, AC: Real;
  P, S: Real;
  V1, V2, V3, V4, V5: MyPoint;
  V3L: Real;
  Am, Bm, O: MyPoint;
begin
  A.x:=StrToInt(Edit1.text);
  A.y:=StrToInt(Edit2.text);
  B.x:=StrToInt(Edit3.text);
  B.y:=StrToInt(Edit4.text);
  C.x:=StrToInt(Edit5.text);
  C.y:=StrToInt(Edit6.text);
  AB:=GetDistance(A, B);
  BC:=GetDistance(B, C);
  AC:=GetDistance(A, C);
  P:=(AB+BC+AC)/2;
  S:=sqrt(P*(P-AB)*(P-BC)*(P-AC));
  R1:=S/P;
  R2:=(AB*BC*AC)/(4*S);

  V1.x:=(B.x-A.x)/AB;
  V1.y:=(B.y-A.y)/AB;
  V2.x:=(C.x-A.x)/AC;
  V2.y:=(C.y-A.y)/AC;
  V3.x:=(V1.x+V2.x)/2+A.x;
  V3.y:=(V1.y+V2.y)/2+A.y;
  V4.x:=(C.x-B.x)/BC;
  V4.y:=(C.y-B.y)/BC;
  V1.x:=-V1.x;
  V1.y:=-V1.y;
  V5.x:=(V1.x+V4.x)/2+B.x;
  V5.y:=(V1.y+V4.y)/2+B.y;

  Am.x:=A.x;
  Am.y:=A.y;
  Bm.x:=B.x;
  Bm.y:=B.y;

  O:=Intersection(Am, V3, Bm, V5);
  O1.x:=Round(O.x);
  O1.y:=Round(O.y);

  V3.x:=-V2.y;
  V3.y:=V2.x;
  V5.x:=-V1.y;
  V5.y:=V1.x;
  V1.x:=(A.x+C.x)/2;
  V1.y:=(A.y+C.y)/2;
  V2.x:=(A.x+B.x)/2;
  V2.y:=(A.y+B.y)/2;
  V3.x:=V3.x+V1.x;
  V3.y:=V3.y+V1.y;
  V5.x:=V5.x+V2.x;
  V5.y:=V5.y+V2.y;
  O:=Intersection(V1, V3, V2, V5);
  O2.x:=Round(O.x);
  O2.y:=Round(O.y);

  Image1.Canvas.Brush.Style:=BsSolid;
  Image1.Canvas.Pen.Style:=PsSolid;
  Image1.Canvas.Brush.Color:=ClWhite;
  Image1.Canvas.Pen.Color:=ClWhite;
  Image1.Canvas.Pen.Width:=1;
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
  Image1.Canvas.Brush.Style:=BsClear;
  Image1.Canvas.Pen.Color:=ClGreen;
  Image1.Canvas.Polygon([A,B,C]);
  Image1.Canvas.Pen.Color:=ClRed;
  Image1.Canvas.Ellipse(O1.x-Round(R1), O1.y-Round(R1), O1.x+Round(R1), O1.y+Round(R1));
  Image1.Canvas.Pen.Color:=ClBlue;
  Image1.Canvas.Ellipse(O2.x-Round(R2), O2.y-Round(R2), O2.x+Round(R2), O2.y+Round(R2));
end;

end.

