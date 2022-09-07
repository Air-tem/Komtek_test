object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 518
  Height = 113
  TabOrder = 0
  object Label1: TLabel
    Left = 24
    Top = 27
    Width = 74
    Height = 13
    Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 80
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
  end
  object Edit1: TEdit
    Left = 121
    Top = 24
    Width = 376
    Height = 21
    TabOrder = 0
  end
  object DateTimePicker1: TDateTimePicker
    Left = 121
    Top = 56
    Width = 186
    Height = 21
    Date = 44811.000000000000000000
    Time = 0.503584652775316500
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 328
    Top = 59
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 422
    Top = 59
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
  end
  object FDQuery1: TFDQuery
    Connection = MainForm.FDConnection1
    SQL.Strings = (
      'INSERT '
      'INTO `human` (`id`, `fio`, `date_b`) '
      'VALUES (NULL, :FIO, :D);')
    Left = 296
    Top = 64
    ParamData = <
      item
        Name = 'FIO'
        DataType = ftString
        ParamType = ptInput
        Value = 'Uhtxrf'
      end
      item
        Name = 'D'
        DataType = ftDate
        ParamType = ptInput
        Value = 21153d
      end>
  end
end
