object frmMainForm: TfrmMainForm
  Left = -8
  Top = -8
  AutoScroll = False
  Caption = 'QuestGame'
  ClientHeight = 705
  ClientWidth = 1366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object imgLocation: TImage
    Left = 0
    Top = 0
    Width = 1000
    Height = 540
    Align = alCustom
    Constraints.MaxHeight = 540
    Constraints.MaxWidth = 1000
    Constraints.MinHeight = 540
    Constraints.MinWidth = 1000
  end
  object imgPerson: TImage
    Left = 10
    Top = 10
    Width = 10
    Height = 10
  end
  object pnlMenu: TPanel
    Left = 1000
    Top = 0
    Width = 366
    Height = 706
    Caption = 'pnlMenu'
    TabOrder = 0
  end
  object pnlLog: TPanel
    Left = 0
    Top = 540
    Width = 1000
    Height = 165
    Caption = 'pnlLog'
    TabOrder = 1
  end
end
