object frChild: TfrChild
  Left = 0
  Top = 0
  Width = 925
  Height = 726
  AutoScroll = True
  Caption = 'frChild'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 345
    Width = 909
    Height = 342
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 0
    ExplicitTop = 432
    ExplicitHeight = 255
    object DBGrid1: TDBGrid
      Left = 1
      Top = 19
      Width = 907
      Height = 322
      Align = alClient
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'id_ref'
          Title.Caption = #1085#1086#1084'. '#1089#1087#1088#1072#1074'.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ref_name'
          Title.Caption = #1053#1072#1079#1074#1072#1085'. '#1089#1087#1088#1072#1074#1082'.'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ref_date'
          Title.Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hum_id'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'text'
          Title.Caption = #1058#1077#1082#1089#1090' '#1089#1087#1088#1072#1074#1082#1080
          Width = 600
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 907
      Height = 18
      Align = alTop
      Caption = #1057#1087#1088#1072#1074#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitTop = 24
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 113
    Width = 909
    Height = 232
    Align = alTop
    TabOrder = 1
    inline Frame21: TFrame2
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 990
      Height = 199
      TabOrder = 0
      ExplicitWidth = 990
      ExplicitHeight = 199
      inherited Panel1: TPanel
        Width = 990
        ExplicitWidth = 907
        inherited DateTimePicker1: TDateTimePicker
          Date = 44811.000000000000000000
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 990
        Height = 150
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Caption = #1053#1086#1084#1077#1088
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fio'
            Title.Caption = #1060#1048#1054
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_b'
            Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'mD'
            Title.Caption = #1055#1086#1089#1083#1077#1076'. '#1080#1079#1084#1077#1085#1077#1085'.'
            Width = 90
            Visible = True
          end>
      end
      inherited DataSource1: TDataSource
        OnDataChange = Frame21DataSource1DataChange
      end
    end
  end
  inline Frame11: TFrame1
    Left = 0
    Top = 0
    Width = 909
    Height = 113
    Align = alTop
    TabOrder = 2
    Visible = False
    ExplicitLeft = 1
    ExplicitTop = 19
    ExplicitWidth = 907
    inherited BitBtn1: TBitBtn
      OnClick = Frame11BitBtn1Click
    end
    inherited BitBtn2: TBitBtn
      OnClick = Frame11BitBtn2Click
    end
    inherited Panel1: TPanel
      Width = 909
      ExplicitWidth = 909
    end
    inherited FDQuery1: TFDQuery
      Left = 560
      Top = 32
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 360
    Top = 465
  end
  object FDQuery1: TFDQuery
    Connection = MainForm.FDConnection1
    SQL.Strings = (
      'SELECT * FROM reference'
      'where hum_id=:id')
    Left = 512
    Top = 457
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
  end
end
