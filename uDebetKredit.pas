unit uDebetKredit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, ExtCtrls, DBCtrls, StdCtrls, Mask, Grids, DBGrids,
  Buttons, Menus, StdActns, ActnList, uLogIn, uPassword;

type
  {$IFDEF MSWINDOWS} // <-- perjanjian nanti kamu ingat jika lupa, jangan dihapus
  TLogin=class(TInterfacedObject, ILogIn)
  private
    FPasswd: TPasswd;
    function DoLogin: Word;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  {$ENDIF}
  
  TFormDebetKredit = class(TForm)
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBNavigator1: TDBNavigator;
    LabelBalance: TLabel;
    BtnHitung: TButton;
    User: TClientDataSet;
    BtnHelp: TSpeedButton;
    FilterNomor: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    PopupMenu1: TPopupMenu;
    LabelFilter: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ActionList1: TActionList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    Paste1: TMenuItem;
    BtnRahasia: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Waktu: TTimer;
    New: TAction;
    Save: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientDataSet1AfterPost(DataSet: TDataSet);
    procedure BtnHitungClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FilterNomorKeyPress(Sender: TObject; var Key: Char);
    procedure BtnHelpClick(Sender: TObject);
    procedure WaktuTimer(Sender: TObject);
    procedure ClientDataSet1AfterOpen(DataSet: TDataSet);
    procedure NewExecute(Sender: TObject);
    procedure SaveExecute(Sender: TObject);
  private
    FRegist: string;
    FEdited: Boolean;
    FXmlOpen: TStringList;
    procedure ProcRahasia(Sender: TObject);
    const DispAccount: string = '#,##0.00;(#,##0.00)';
  end;

var
  FormDebetKredit: TFormDebetKredit;

implementation

uses uFormLogIn;

destructor TLogin.Destroy;
begin
  FPasswd.Free;
  FPasswd:=nil;
  inherited;
end;

constructor TLogin.Create;
begin
  FPasswd:=TPasswd.Create;
end;

{$R *.dfm}

procedure TFormDebetKredit.ProcRahasia(Sender: TObject);
var
  Obj: TObject;
begin
  try

  except

  end;
end;

procedure TFormDebetKredit.SaveExecute(Sender: TObject);
begin
  ClientDataSet1.Post;
end;

procedure TFormDebetKredit.BtnHelpClick(Sender: TObject);
begin
  ShowMessage('Bismillahirrahmanirrahim.');
end;

procedure TFormDebetKredit.BtnHitungClick(Sender: TObject);
var
  Balance, Debet, Kredit: Currency;
  Bookmark: Pointer;
begin
  Balance:=0;Debet:=0;Kredit:=0;
  Bookmark:=ClientDataSet1.GetBookmark;
  if not ClientDataSet1.Eof then
    ClientDataSet1.Last;
  while not ClientDataSet1.Bof do
  begin
    Debet:=Debet+ClientDataSet1.FieldByName('Debet').AsCurrency;
    Kredit:=Kredit+ClientDataSet1.FieldByName('Kredit').AsCurrency;
    ClientDataSet1.Prior;
  end;
  ClientDataSet1.GotoBookmark(Bookmark);
  Balance:=Debet-Kredit;
  LabelBalance.Caption:=FormatCurr(DispAccount,Balance);
end;

function TLogin.DoLogin;
var
  FormLogin: TFormLogin;
  KataSandi, Tmp: string;
begin
  Result:=mrNone;
  FormLogin:=TFormLogin.Create(FormDebetKredit);
  if FormLogin.ShowModal=mrOk then
  begin
    // cari userid di database
    KataSandi:=FormLogin.Passwd.Text;
    Tmp:=FormLogin.Passwd.Text;
    try
      Tmp[1]:=' '; {untuk menghancurkan pengkhianat}
      Tmp[Length(Tmp)]:=' '; {untuk menghancurkan pengkhianat yang lain}
    except
      on E: Exception do
      begin
        MessageDlg(E.Message,mtError,[mbOk],0);
        Result:=mrAbort;
        Exit;
      end;
    end;
    FormLogin.Passwd.Text:=Tmp;
    FPasswd.Balik(KataSandi);
    FormDebetKredit.User.Filter:='UserID='+QuotedStr(FormLogin.UserID.Text)
      +' and Passwd='+QuotedStr(KataSandi);
    FPasswd.Balik(KataSandi);
    Tmp:=FormLogin.UserID.Text;
    FPasswd.Balik(Tmp);
    FormLogin.UserID.Text:=Tmp;
    KataSandi:=#0;
    if not FormDebetKredit.User.Filtered then
      FormDebetKredit.User.Filtered:=True;
    FormLogin.UserID.Clear;
    FormLogin.Passwd.Text:='';
    FormDebetKredit.User.Open;
    // if berhasil login, user dan password sama
    if not FormDebetKredit.User.Eof then
      Result:=mrOk;
    FormDebetKredit.User.Close;
  end
  else
    Result:=mrCancel;
  FormLogin.Free;
end;

procedure TFormDebetKredit.ClientDataSet1AfterOpen(DataSet: TDataSet);
begin
  TCurrencyField(DataSet.FieldByName('Debet')).DisplayFormat:=DispAccount;
  TCurrencyField(DataSet.FieldByName('Kredit')).DisplayFormat:=DispAccount;
end;

procedure TFormDebetKredit.ClientDataSet1AfterPost(DataSet: TDataSet);
begin
  FEdited:=True;
end;

procedure TFormDebetKredit.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  if Button=nbInsert then
    NewExecute(Sender);
end;

procedure TFormDebetKredit.FilterNomorKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    if FilterNomor.Text<>'' then
      ClientDataSet1.Filter:=FilterNomor.Text;
    ClientDataSet1.Filtered:=not ClientDataSet1.Filtered;
    if ClientDataSet1.Filtered then
      LabelFilter.Caption:='Filtered'
    else
      LabelFilter.Caption:='';
  end;
end;

procedure TFormDebetKredit.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I: integer;
begin
  if ClientDataSet1.Active then
    ClientDataSet1.Close;
  if Assigned(FXmlOpen) then
  begin
    if FXmlOpen.Find(ClientDataSet1.FileName, I)then
    begin
      FXmlOpen.Delete(I);
      FXmlOpen.SaveToFile(FRegist);
    end;
    FXmlOpen.Destroy;
    FXmlOpen:=nil;
  end;
end;

procedure TFormDebetKredit.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if MessageDlg('Apakah anda benar-benar mau keluar?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    CanClose:=True
  else
    CanClose:=False;
end;

procedure TFormDebetKredit.FormCreate(Sender: TObject);
  procedure Tambah(var Angka: Shortint);
  begin
    Angka:=Angka+1;
  end;
var
  Login: ILogIn;
  MsgRes, LoginResult: Word;
  JumlahLogin: Shortint;
  Tmp: Integer;
  Hilang: boolean;
const
  BatasLogin=4;
label
  LihatBerkas;
begin
  JumlahLogin:=0;
  Login:=TLogin.Create;
  repeat
    LoginResult:=Login.DoLogin;
    if LoginResult=mrNone then
    begin
      Tambah(JumlahLogin);
      MessageDlg('Log-in anda tidak berhasil, anda tidak berhak memasuki area ini.'#13'Gagal '+IntToStr(JumlahLogin)+' kali.',mtInformation,[mbOK],0);
      Hilang:=(BatasLogin = JumlahLogin);
    end
    else
    begin
      JumlahLogin:=0;
      Break;
    end;
  until Hilang;
  if LoginResult=mrOk then
  begin
    // buka file dialog
    OpenDialog1.InitialDir:=GetCurrentDir;
    LihatBerkas:
    if OpenDialog1.Execute then
    begin
      FRegist:=Application.GetNamePath+'keuangan.txt';
      // jika file ada dalam file yang terbuka, batalkan
      FXmlOpen:=TStringList.Create;
      try
        FXmlOpen.LoadFromFile(FRegist);
      except
        MessageDlg('File "'+FRegist+'" belum ada, buatlah jika aplikasi belum membuatnya otomatis.',mtInformation,[mbOK],0);
        Waktu.Enabled:=True;
      end;
      if not FXmlOpen.Find(OpenDialog1.FileName, Tmp) then
      begin
        Tmp:=-1;
        if FileExists(OpenDialog1.FileName) then
        begin
          BtnRahasia.OnClick:=ProcRahasia;
          BtnRahasia.Visible:=True;
          ClientDataSet1.FileName:=OpenDialog1.FileName;
          ClientDataSet1.Open;
          Caption:=ExtractFileName(OpenDialog1.FileName);
          // insert ke daftar file yang terbuka
          FXmlOpen.Add(OpenDialog1.FileName);
          FXmlOpen.SaveToFile(FRegist);
        end
        else
        begin
          MsgRes:=MessageDlg('File tersebut tidak ada, apakah anda ingin membuatnya?',mtConfirmation,[mbYes,mbNo,mbCancel],0);
          case MsgRes of
            mrYes:
            begin
              ClientDataSet1.FileName:=OpenDialog1.FileName;
              Caption:='New Balance ['+ExtractFileName(OpenDialog1.FileName)+'*]';
              ClientDataSet1.CreateDataSet;
            end;
            mrNo: goto LihatBerkas;
            mrCancel: Waktu.Enabled:=True;
          end;
        end;
      end
      else
      begin
        FXmlOpen.Destroy;
        FXmlOpen:=nil;
        MessageDlg('File yang anda buka sedang dibuka aplikasi lain',mtError,[mbOk],0);
        Waktu.Enabled:=True;
      end;
    end
    else
      Waktu.Enabled:=True;
  end
  else
    Waktu.Enabled:=True;
  Login:=nil;
end;

procedure TFormDebetKredit.WaktuTimer(Sender: TObject);
begin
  OnCloseQuery:=nil;
  Close;
  Waktu.Enabled:=False;
end;

procedure TFormDebetKredit.NewExecute(Sender: TObject);
begin
  DBEdit1.SetFocus;
  ClientDataSet1.Insert;
end;

end.
