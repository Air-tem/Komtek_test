object Frame3: TFrame3
  Left = 0
  Top = 0
  Width = 657
  Height = 165
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 257
    Height = 165
    Align = alLeft
    TabOrder = 0
    ExplicitLeft = -5
    ExplicitHeight = 261
    object Label1: TLabel
      Left = 19
      Top = 16
      Width = 57
      Height = 16
      Caption = #1042#1099#1076#1072#1085#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 21
      Top = 49
      Width = 76
      Height = 16
      Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 4
      Top = 75
      Width = 93
      Height = 16
      Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 82
      Top = 16
      Width = 95
      Height = 16
      Caption = #1050#1086#1084#1091' '#1074#1099#1076#1072#1085#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DateTimePicker1: TDateTimePicker
      Left = 103
      Top = 75
      Width = 148
      Height = 21
      Date = 44812.000000000000000000
      Time = 0.679210034722928000
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 103
      Top = 48
      Width = 148
      Height = 21
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 1
      Top = 123
      Width = 255
      Height = 41
      Align = alBottom
      TabOrder = 2
      ExplicitLeft = 112
      ExplicitTop = 200
      ExplicitWidth = 185
      object Button1: TButton
        Left = 18
        Top = 8
        Width = 75
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 0
      end
      object Button2: TButton
        Left = 165
        Top = 8
        Width = 75
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 1
        OnClick = Button2Click
      end
    end
  end
  object Panel2: TPanel
    Left = 257
    Top = 0
    Width = 400
    Height = 165
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    ExplicitLeft = 432
    ExplicitTop = 136
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Memo1: TMemo
      Left = 1
      Top = 36
      Width = 398
      Height = 128
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 257
      ExplicitTop = 0
      ExplicitWidth = 400
      ExplicitHeight = 261
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 398
      Height = 35
      Align = alTop
      TabOrder = 1
      object Label3: TLabel
        Left = 19
        Top = 12
        Width = 67
        Height = 16
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object FDQuery1: TFDQuery
    SQL.Strings = (
      
        'INSERT INTO `reference` (`id_ref`, `ref_name`, `ref_date`, `hum_' +
        'id`, `text`) VALUES (NULL, :Rname, :DatReg,:iduser, :text);')
    Left = 345
    Top = 104
    ParamData = <
      item
        Name = 'RNAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATREG'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDUSER'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TEXT'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
