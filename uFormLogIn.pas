unit uFormLogIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    UserID: TEdit;
    Label3: TLabel;
    Passwd: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
  private

  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

end.
