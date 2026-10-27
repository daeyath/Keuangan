object FormDebetKredit: TFormDebetKredit
  Left = 0
  Top = 0
  Caption = 'Balance'
  ClientHeight = 258
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  DesignSize = (
    534
    258)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 187
    Width = 31
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '&Nomor'
    FocusControl = DBEdit1
    ExplicitTop = 144
  end
  object Label2: TLabel
    Left = 80
    Top = 187
    Width = 38
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '&Tanggal'
    FocusControl = DBEdit2
    ExplicitTop = 144
  end
  object Label3: TLabel
    Left = 160
    Top = 187
    Width = 29
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '&Debet'
    FocusControl = DBEdit3
    ExplicitTop = 144
  end
  object Label4: TLabel
    Left = 271
    Top = 187
    Width = 28
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '&Kredit'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 376
    Top = 187
    Width = 28
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '&Memo'
    FocusControl = DBEdit5
  end
  object LabelBalance: TLabel
    Left = 8
    Top = 8
    Width = 9
    Height = 19
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BtnHelp: TSpeedButton
    Left = 498
    Top = 8
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    Caption = '?'
    OnClick = BtnHelpClick
    ExplicitLeft = 496
  end
  object Label6: TLabel
    Left = 8
    Top = 37
    Width = 24
    Height = 13
    Caption = '&Filter'
    FocusControl = FilterNomor
  end
  object Label7: TLabel
    Left = 435
    Top = 237
    Width = 91
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Copyright Hidayat.'
    ExplicitLeft = 428
    ExplicitTop = 235
  end
  object LabelFilter: TLabel
    Left = 136
    Top = 232
    Width = 47
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Unfiltered'
  end
  object Label8: TLabel
    Left = 515
    Top = 36
    Width = 6
    Height = 13
    Anchors = [akTop, akRight]
    Caption = '6'
    ExplicitLeft = 513
  end
  object Label9: TLabel
    Left = 288
    Top = 36
    Width = 220
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'D93C687E-FADE-40B7-AA84-CDCC0D2662CB'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BtnRahasia: TSpeedButton
    Left = 469
    Top = 8
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    Caption = '...'
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 56
    Width = 518
    Height = 122
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 203
    Width = 65
    Height = 21
    Anchors = [akLeft, akBottom]
    DataField = 'Nomor'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 79
    Top = 203
    Width = 74
    Height = 21
    Anchors = [akLeft, akBottom]
    DataField = 'Tanggal'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 159
    Top = 203
    Width = 106
    Height = 21
    Anchors = [akLeft, akBottom]
    DataField = 'Debet'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 271
    Top = 203
    Width = 99
    Height = 21
    Anchors = [akLeft, akBottom]
    DataField = 'Kredit'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 376
    Top = 203
    Width = 150
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    DataField = 'Memo'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBNavigator1: TDBNavigator
    Left = 193
    Top = 230
    Width = 234
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel, nbRefresh]
    Anchors = [akLeft, akBottom]
    TabOrder = 6
    OnClick = DBNavigator1Click
  end
  object BtnHitung: TButton
    Left = 8
    Top = 230
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Hitung Ulang'
    TabOrder = 7
    OnClick = BtnHitungClick
  end
  object FilterNomor: TEdit
    Left = 45
    Top = 34
    Width = 220
    Height = 21
    TabOrder = 8
    OnKeyPress = FilterNomorKeyPress
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Nomor'
        DataType = ftInteger
      end
      item
        Name = 'Tanggal'
        DataType = ftDate
      end
      item
        Name = 'Debet'
        DataType = ftCurrency
      end
      item
        Name = 'Kredit'
        DataType = ftCurrency
      end
      item
        Name = 'Memo'
        DataType = ftString
        Size = 114
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = ClientDataSet1AfterOpen
    AfterPost = ClientDataSet1AfterPost
    AfterDelete = ClientDataSet1AfterPost
    Left = 456
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 424
    Top = 40
  end
  object User: TClientDataSet
    Aggregates = <>
    FileName = 'users'
    FieldDefs = <
      item
        Name = 'UserID'
        DataType = ftString
        Size = 21
      end
      item
        Name = 'Passwd'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 328
    Top = 112
  end
  object PopupMenu1: TPopupMenu
    Left = 296
    Top = 112
    object Copy1: TMenuItem
      Action = EditCopy1
    end
    object Cut1: TMenuItem
      Action = EditCut1
    end
    object Paste1: TMenuItem
      Action = EditPaste1
    end
  end
  object Waktu: TTimer
    Enabled = False
    Interval = 1001
    OnTimer = WaktuTimer
    Left = 360
    Top = 112
  end
  object ActionList1: TActionList
    Left = 392
    Top = 112
    object EditCut1: TEditCut
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
      ImageIndex = 0
      ShortCut = 16472
    end
    object EditCopy1: TEditCopy
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      ImageIndex = 1
      ShortCut = 16451
    end
    object EditPaste1: TEditPaste
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste|Inserts Clipboard contents'
      ImageIndex = 2
      ShortCut = 16470
    end
    object New: TAction
      Category = 'DataOperation'
      Caption = 'New ..'
      ShortCut = 16462
      OnExecute = NewExecute
    end
    object Save: TAction
      Category = 'DataOperation'
      Caption = 'Save'
      ShortCut = 16464
      OnExecute = SaveExecute
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'xml'
    Filter = 'XML|*.xml|Semua file|*.*'
    Options = [ofHideReadOnly, ofOldStyleDialog, ofEnableSizing]
    Left = 424
    Top = 112
  end
end
