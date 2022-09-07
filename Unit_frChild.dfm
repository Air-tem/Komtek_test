object frChild: TfrChild
  Left = 0
  Top = 0
  Width = 925
  Height = 313
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
  PixelsPerInch = 96
  TextHeight = 13
  inline Frame21: TFrame2
    Left = 0
    Top = 0
    Width = 909
    Height = 274
    AutoSize = True
    TabOrder = 0
    ExplicitWidth = 909
    inherited Panel1: TPanel
      Width = 909
      inherited DateTimePicker1: TDateTimePicker
        Date = 44811.000000000000000000
      end
    end
    inherited DBGrid1: TDBGrid
      Width = 909
    end
    inherited DBNavigator1: TDBNavigator
      Width = 909
      Hints.Strings = ()
      ExplicitLeft = 0
      ExplicitTop = 249
      ExplicitWidth = 932
    end
    inherited FDQuery1: TFDQuery
      Active = False
    end
  end
end
