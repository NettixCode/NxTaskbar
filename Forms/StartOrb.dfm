object StartOrbForm: TStartOrbForm
  Left = 0
  Top = 0
  Hint = 'Start'
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Start'
  ClientHeight = 60
  ClientWidth = 45
  Color = clNone
  TransparentColorValue = clDefault
  Ctl3D = False
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnContextPopup = FormContextPopup
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StartOrbs: TImage
    Left = 8
    Top = 8
    Width = 25
    Height = 41
    Hint = 'Start'
    IncrementalDisplay = True
    Proportional = True
    Stretch = True
    Transparent = True
  end
end
