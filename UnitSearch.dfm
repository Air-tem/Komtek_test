object Frame2: TFrame2
  Left = 0
  Top = 0
  Width = 932
  Height = 274
  AutoScroll = True
  AutoSize = True
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 932
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 92
      Height = 13
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080
    end
    object Label3: TLabel
      Left = 790
      Top = 18
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object Label2: TLabel
      Left = 416
      Top = 18
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object Edit1: TEdit
      Left = 106
      Top = 15
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object DateTimePicker1: TDateTimePicker
      Left = 329
      Top = 15
      Width = 81
      Height = 21
      Date = 44812.000000000000000000
      Time = 0.534404004632961000
      Enabled = False
      ParseInput = True
      TabOrder = 1
      OnChange = DateTimePicker1Change
    end
    object CheckBox1: TCheckBox
      Left = 536
      Top = 17
      Width = 161
      Height = 17
      Caption = #1087#1077#1088#1080#1086#1076#1099' '#1074#1085#1077#1089#1077#1085#1080#1103' '#1076#1072#1085#1085#1099#1093' c'
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object DateTimePicker2: TDateTimePicker
      Left = 703
      Top = 15
      Width = 81
      Height = 21
      Date = 44811.000000000000000000
      Time = 0.534404004632961000
      Enabled = False
      ParseInput = True
      TabOrder = 3
      OnChange = CheckBox1Click
    end
    object DateTimePicker3: TDateTimePicker
      Left = 808
      Top = 15
      Width = 81
      Height = 21
      Date = 44811.000000000000000000
      Time = 0.534404004632961000
      Enabled = False
      ParseInput = True
      TabOrder = 4
      OnChange = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 233
      Top = 17
      Width = 90
      Height = 17
      Caption = #1087#1086' '#1076#1072#1090#1077' '#1088#1086#1078#1076'.'
      TabOrder = 5
      OnClick = CheckBox2Click
    end
    object DateTimePicker4: TDateTimePicker
      Left = 430
      Top = 15
      Width = 81
      Height = 21
      Date = 44811.000000000000000000
      Time = 0.534404004632961000
      Enabled = False
      ParseInput = True
      TabOrder = 6
      OnChange = DateTimePicker4Change
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 932
    Height = 225
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = #1053#1086#1084'.'
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
        Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mD'
        Title.Caption = #1055#1086#1089#1083'. '#1080#1079#1084#1077#1085#1077#1085
        Width = 84
        Visible = True
      end>
  end
  object FDQuery1: TFDQuery
    Connection = MainForm.FDConnection1
    SQL.Strings = (
      'set @f=:f, @dbS=:db,@dbE=:dbE, @des=:des, @def=:def;'
      'select h.id,h.fio,h.date_b,t1.mD'
      'from human h'
      'left join '
      '  (SELECT MAX(`ref_date`) as mD,`hum_id` FROM `reference` '
      
        '-- wr WHERE `ref_date`BETWEEN @des and @def     -- '#1091#1089#1083#1086#1074#1080#1077' '#1076#1083#1103' '#1087 +
        #1086#1080#1089#1082#1072' '#1087#1086' '#1076#1072#1090#1077' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      'GROUP by `hum_id`)t1 on t1.hum_id=h.id'
      'where'
      ' fio LIKE @f'
      
        '-- db and date_b BETWEEN  @dbS AND @dbE       -- '#1091#1089#1083#1086#1074#1080#1077' '#1076#1083#1103' '#1087#1086#1080 +
        #1089#1082#1072' '#1087#1086' '#1076#1072#1090#1077' '#1088#1086#1078#1076#1077#1085#1080#1103
      
        '-- de and mD IS NOT NULL                   -- '#1091#1089#1083#1086#1074#1080#1077' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072 +
        ' '#1087#1086' '#1076#1072#1090#1077' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      ''
      'ORDER by mD DESC;')
    Left = 472
    Top = 72
    ParamData = <
      item
        Name = 'F'
        DataType = ftString
        ParamType = ptInput
        Value = '%'
      end
      item
        Name = 'DB'
        DataType = ftDate
        ParamType = ptInput
        Value = 21153d
      end
      item
        Name = 'DBE'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DES'
        DataType = ftDate
        ParamType = ptInput
        Value = 34283d
      end
      item
        Name = 'DEF'
        DataType = ftDate
        ParamType = ptInput
        Value = 35379d
      end>
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 400
    Top = 72
  end
end
