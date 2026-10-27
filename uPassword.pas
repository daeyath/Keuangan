unit uPassword;

{Tujuan password dibuat adalah melindungi sistem dari pencuri}

interface

type
  TPasswd=class(TObject)
    procedure Balik(var data: string);
  end;

implementation

procedure TPasswd.Balik(var data: string);
var
  a,b: word;
  tmp: string;
begin
  tmp:=data;
  b:=1;
  for a:=length(tmp) downto 1 do
  begin
    data[b]:=tmp[a];
    b:=b+1;
  end;
  tmp:=#0;
end;

end.
