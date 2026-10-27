program Keuangan;

uses
  Forms,
  uDebetKredit in 'uDebetKredit.pas' {FormDebetKredit},
  uFormLogIn in 'uFormLogIn.pas' {FormLogin},
  uPassword in 'uPassword.pas',
  uLogIn in 'uLogIn.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Keuangan';
  Application.CreateForm(TFormDebetKredit, FormDebetKredit);
  Application.Run;
end.
