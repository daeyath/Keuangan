object FormLogin: TFormLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Logon ...'
  ClientHeight = 196
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 64
    Height = 19
    Caption = 'Logon ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 96
    Width = 36
    Height = 13
    Caption = '&User ID'
    FocusControl = UserID
  end
  object Label3: TLabel
    Left = 16
    Top = 142
    Width = 36
    Height = 13
    Caption = '&Passwd'
    FocusControl = Passwd
  end
  object Label4: TLabel
    Left = 410
    Top = 176
    Width = 10
    Height = 13
    Caption = #174
  end
  object UserID: TEdit
    Left = 16
    Top = 115
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Passwd: TEdit
    Left = 16
    Top = 161
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 344
    Top = 16
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 344
    Top = 48
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
end
