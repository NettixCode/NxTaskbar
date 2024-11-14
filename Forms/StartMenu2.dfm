object StartMenu2Form: TStartMenu2Form
  Left = 0
  Top = 30
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 458
  ClientWidth = 404
  Color = clSkyBlue
  Constraints.MinHeight = 350
  Constraints.MinWidth = 350
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesigned
  Touch.ParentTabletOptions = False
  Touch.TabletOptions = [toPressAndHold, toPenTapFeedback]
  StyleElements = [seFont]
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    404
    458)
  PixelsPerInch = 96
  TextHeight = 13
  object scPanel1: TscPanel
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 394
    Height = 438
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 0
    Align = alClient
    FluentUIOpaque = False
    TabOrder = 1
    CustomImageIndex = -1
    DragForm = False
    DragTopForm = True
    StyleKind = scpsTransparent
    ShowCaption = False
    BorderStyle = scpbsNone
    WallpaperIndex = -1
    LightBorderColor = clBtnHighlight
    ShadowBorderColor = clBtnShadow
    CaptionGlowEffect.Enabled = False
    CaptionGlowEffect.Color = clBtnShadow
    CaptionGlowEffect.AlphaValue = 255
    CaptionGlowEffect.GlowSize = 7
    CaptionGlowEffect.Offset = 0
    CaptionGlowEffect.Intensive = True
    CaptionGlowEffect.StyleColors = True
    Color = clBtnFace
    Caption = 'scPanel1'
    StorePaintBuffer = False
    WordWrap = False
    object AppList: TVirtualExplorerEasyListview
      Left = 0
      Top = 43
      Width = 394
      Height = 395
      Active = True
      Align = alClient
      BorderStyle = bsNone
      Color = clBlack
      CompressedFile.Color = clRed
      CompressedFile.Font.Charset = DEFAULT_CHARSET
      CompressedFile.Font.Color = clWindowText
      CompressedFile.Font.Height = -11
      CompressedFile.Font.Name = 'Tahoma'
      CompressedFile.Font.Style = []
      DefaultSortColumn = 0
      EditManager.Font.Charset = DEFAULT_CHARSET
      EditManager.Font.Color = clWindowText
      EditManager.Font.Height = -11
      EditManager.Font.Name = 'Tahoma'
      EditManager.Font.Style = []
      EncryptedFile.Color = 32832
      EncryptedFile.Font.Charset = DEFAULT_CHARSET
      EncryptedFile.Font.Color = clWindowText
      EncryptedFile.Font.Height = -11
      EncryptedFile.Font.Name = 'Tahoma'
      EncryptedFile.Font.Style = []
      FileSizeFormat = vfsfDefault
      Grouped = False
      GroupingColumn = 0
      Options = [eloBrowseExecuteFolder, eloBrowseExecuteFolderShortcut, eloBrowseExecuteZipFolder, eloExecuteOnDblClick, eloThreadedImages, eloThreadedDetails, eloShellContextMenus]
      PaintInfoGroup.MarginBottom.CaptionIndent = 4
      PaintInfoGroup.MarginTop.Visible = False
      RootFolder = rfCustom
      RootFolderCustomPath = 'C:\Application\'
      Sort.Algorithm = esaQuickSort
      Sort.AutoSort = True
      SortFolderFirstAlways = True
      TabOrder = 0
      ThumbsManager.StorageFilename = 'Thumbnails.album'
      WheelMouseScrollModifierEnabled = False
      OnItemCompare = AppListItemCompare
      OnItemGetCaption = AppListItemGetCaption
      OnRootRebuild = AppListRootRebuild
    end
    object scPanel5: TscPanel
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 394
      Height = 33
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      FluentUIOpaque = False
      TabOrder = 1
      CustomImageIndex = -1
      DragForm = False
      DragTopForm = True
      StyleKind = scpsTransparent
      ShowCaption = False
      BorderStyle = scpbsBottomShadowLine
      WallpaperIndex = -1
      LightBorderColor = clBtnHighlight
      ShadowBorderColor = clSkyBlue
      CaptionGlowEffect.Enabled = False
      CaptionGlowEffect.Color = clBtnShadow
      CaptionGlowEffect.AlphaValue = 255
      CaptionGlowEffect.GlowSize = 7
      CaptionGlowEffect.Offset = 0
      CaptionGlowEffect.Intensive = True
      CaptionGlowEffect.StyleColors = True
      Color = clBlack
      StorePaintBuffer = False
      WordWrap = False
      object BtnAllApps: TscGPCharGlyphButton
        Left = 296
        Top = 0
        Width = 98
        Height = 32
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        FluentUIOpaque = False
        TabOrder = 0
        OnClick = BtnAllAppsClick
        Animation = False
        Badge.Color = clRed
        Badge.ColorAlpha = 255
        Badge.Font.Charset = DEFAULT_CHARSET
        Badge.Font.Color = clWhite
        Badge.Font.Height = -11
        Badge.Font.Name = 'Tahoma'
        Badge.Font.Style = [fsBold]
        Badge.Visible = False
        Caption = 'All Apps'
        CaptionCenterAlignment = True
        CanFocused = False
        CustomDropDown = False
        DrawTextMode = scdtmGDI
        FluentLightEffect = True
        Layout = blGlyphLeft
        TransparentBackground = True
        Options.NormalColor = clWindowText
        Options.HotColor = clWindowText
        Options.PressedColor = clWindowText
        Options.FocusedColor = clHighlightText
        Options.DisabledColor = clHighlightText
        Options.NormalColor2 = clNone
        Options.HotColor2 = clNone
        Options.PressedColor2 = clNone
        Options.FocusedColor2 = clNone
        Options.DisabledColor2 = clNone
        Options.NormalColorAlpha = 0
        Options.HotColorAlpha = 30
        Options.PressedColorAlpha = 15
        Options.FocusedColorAlpha = 0
        Options.DisabledColorAlpha = 255
        Options.NormalColor2Alpha = 255
        Options.HotColor2Alpha = 255
        Options.PressedColor2Alpha = 255
        Options.FocusedColor2Alpha = 255
        Options.DisabledColor2Alpha = 255
        Options.FrameNormalColor = clNone
        Options.FrameHotColor = clNone
        Options.FramePressedColor = clNone
        Options.FrameFocusedColor = clNone
        Options.FrameDisabledColor = clWindowText
        Options.FrameWidth = 1
        Options.FrameNormalColorAlpha = 0
        Options.FrameHotColorAlpha = 0
        Options.FramePressedColorAlpha = 0
        Options.FrameFocusedColorAlpha = 0
        Options.FrameDisabledColorAlpha = 0
        Options.FontNormalColor = clWhite
        Options.FontHotColor = clWhite
        Options.FontPressedColor = clWhite
        Options.FontFocusedColor = clWindowText
        Options.FontDisabledColor = clWindowText
        Options.ShapeFillGradientAngle = 0
        Options.ShapeFillGradientPressedAngle = 180
        Options.ShapeFillGradientColorOffset = 25
        Options.ShapeCornerRadius = 4
        Options.ShapeStyle = scgpRoundedRect
        Options.ShapeStyleLineSize = 26
        Options.ArrowSize = 9
        Options.ArrowAreaSize = 0
        Options.ArrowType = scgpatDefault
        Options.ArrowThickness = 2
        Options.ArrowThicknessScaled = False
        Options.ArrowNormalColor = clBtnText
        Options.ArrowHotColor = clBtnText
        Options.ArrowPressedColor = clBtnText
        Options.ArrowFocusedColor = clBtnText
        Options.ArrowDisabledColor = clBtnText
        Options.ArrowNormalColorAlpha = 200
        Options.ArrowHotColorAlpha = 255
        Options.ArrowPressedColorAlpha = 255
        Options.ArrowFocusedColorAlpha = 200
        Options.ArrowDisabledColorAlpha = 125
        Options.StyleColors = True
        Options.PressedHotColors = True
        GlyphOptions.NormalColor = clWhite
        GlyphOptions.HotColor = clWhite
        GlyphOptions.PressedColor = clWhite
        GlyphOptions.FocusedColor = clWhite
        GlyphOptions.DisabledColor = clWindowText
        GlyphOptions.NormalColorAlpha = 255
        GlyphOptions.HotColorAlpha = 255
        GlyphOptions.PressedColorAlpha = 255
        GlyphOptions.FocusedColorAlpha = 255
        GlyphOptions.DisabledColorAlpha = 100
        GlyphOptions.Index = 9
        GlyphOptions.Margin = 4
        GlyphOptions.Size = 16
        GlyphOptions.StyleColors = True
        TextMargin = 0
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ShowCaption = True
        SplitButton = False
        RepeatClick = False
        RepeatClickInterval = 100
        ShowGalleryMenuFromTop = False
        ShowGalleryMenuFromRight = False
        ShowMenuArrow = True
        ShowFocusRect = True
        Down = False
        GroupIndex = 1
        AllowAllUp = False
        WordWrap = False
        ToggleMode = False
      end
    end
  end
  object scSplitView1: TscSplitView
    Left = 0
    Top = 443
    Width = 404
    Height = 15
    Anchors = [akLeft, akRight, akBottom]
    FluentUIOpaque = False
    TabOrder = 0
    CustomImageIndex = -1
    DragForm = False
    DragTopForm = True
    StyleKind = scpsPanel
    ShowCaption = False
    BorderStyle = scpbsNone
    WallpaperIndex = 1
    LightBorderColor = clBtnHighlight
    ShadowBorderColor = clBtnShadow
    CaptionGlowEffect.Enabled = False
    CaptionGlowEffect.Color = clBtnShadow
    CaptionGlowEffect.AlphaValue = 255
    CaptionGlowEffect.GlowSize = 7
    CaptionGlowEffect.Offset = 0
    CaptionGlowEffect.Intensive = True
    CaptionGlowEffect.StyleColors = True
    Color = 1381653
    StorePaintBuffer = False
    WordWrap = False
    AnimationStep = 5
    AnimationType = scsvaInertial
    CompactWidth = 50
    CompactHeight = 15
    GripSize = 0
    Opened = False
    OpenedWidth = 250
    OpenedHeight = 40
    OpenedMinWidth = 0
    OpenedMaxWidth = 0
    OpenedMinHeight = 0
    OpenedMaxHeight = 0
    ParentBackground = False
    ParentColor = False
    Placement = scsvpBottom
    HideControls = False
    Animation = True
    DisplayMode = scsvmOverlay
    OnClosed = scSplitView1Closed
    OnOpened = scSplitView1Opened
    object BtnOpenMenu: TscGPCharGlyphButton
      Left = 194
      Top = 0
      Width = 15
      Height = 15
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      FluentUIOpaque = False
      TabOrder = 0
      OnClick = BtnOpenMenuClick
      OnMouseEnter = BtnOpenMenuMouseEnter
      Animation = False
      Badge.Color = clRed
      Badge.ColorAlpha = 255
      Badge.Font.Charset = DEFAULT_CHARSET
      Badge.Font.Color = clWhite
      Badge.Font.Height = -11
      Badge.Font.Name = 'Tahoma'
      Badge.Font.Style = [fsBold]
      Badge.Visible = False
      CaptionCenterAlignment = True
      CanFocused = False
      CustomDropDown = False
      DrawTextMode = scdtmGDIPlus
      FluentLightEffect = True
      Layout = blGlyphLeft
      TransparentBackground = True
      Options.NormalColor = clWindowText
      Options.HotColor = clWindowText
      Options.PressedColor = clWindowText
      Options.FocusedColor = clHighlightText
      Options.DisabledColor = clHighlightText
      Options.NormalColor2 = clNone
      Options.HotColor2 = clNone
      Options.PressedColor2 = clNone
      Options.FocusedColor2 = clNone
      Options.DisabledColor2 = clNone
      Options.NormalColorAlpha = 0
      Options.HotColorAlpha = 30
      Options.PressedColorAlpha = 15
      Options.FocusedColorAlpha = 0
      Options.DisabledColorAlpha = 255
      Options.NormalColor2Alpha = 255
      Options.HotColor2Alpha = 255
      Options.PressedColor2Alpha = 255
      Options.FocusedColor2Alpha = 255
      Options.DisabledColor2Alpha = 255
      Options.FrameNormalColor = clNone
      Options.FrameHotColor = clNone
      Options.FramePressedColor = clNone
      Options.FrameFocusedColor = clNone
      Options.FrameDisabledColor = clWindowText
      Options.FrameWidth = 1
      Options.FrameNormalColorAlpha = 0
      Options.FrameHotColorAlpha = 0
      Options.FramePressedColorAlpha = 0
      Options.FrameFocusedColorAlpha = 0
      Options.FrameDisabledColorAlpha = 0
      Options.FontNormalColor = clWhite
      Options.FontHotColor = clWhite
      Options.FontPressedColor = clWhite
      Options.FontFocusedColor = clWindowText
      Options.FontDisabledColor = clWindowText
      Options.ShapeFillGradientAngle = 0
      Options.ShapeFillGradientPressedAngle = 180
      Options.ShapeFillGradientColorOffset = 25
      Options.ShapeCornerRadius = 4
      Options.ShapeStyle = scgpRoundedRect
      Options.ShapeStyleLineSize = 26
      Options.ArrowSize = 9
      Options.ArrowAreaSize = 0
      Options.ArrowType = scgpatDefault
      Options.ArrowThickness = 2
      Options.ArrowThicknessScaled = False
      Options.ArrowNormalColor = clBtnText
      Options.ArrowHotColor = clBtnText
      Options.ArrowPressedColor = clBtnText
      Options.ArrowFocusedColor = clBtnText
      Options.ArrowDisabledColor = clBtnText
      Options.ArrowNormalColorAlpha = 200
      Options.ArrowHotColorAlpha = 255
      Options.ArrowPressedColorAlpha = 255
      Options.ArrowFocusedColorAlpha = 200
      Options.ArrowDisabledColorAlpha = 125
      Options.StyleColors = True
      Options.PressedHotColors = True
      GlyphOptions.NormalColor = clWhite
      GlyphOptions.HotColor = clSkyBlue
      GlyphOptions.PressedColor = clWhite
      GlyphOptions.FocusedColor = clWhite
      GlyphOptions.DisabledColor = clWindowText
      GlyphOptions.NormalColorAlpha = 255
      GlyphOptions.HotColorAlpha = 255
      GlyphOptions.PressedColorAlpha = 255
      GlyphOptions.FocusedColorAlpha = 255
      GlyphOptions.DisabledColorAlpha = 100
      GlyphOptions.Index = 119
      GlyphOptions.Margin = 0
      GlyphOptions.Size = 16
      GlyphOptions.StyleColors = True
      TextMargin = 0
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ShowCaption = True
      SplitButton = False
      RepeatClick = False
      RepeatClickInterval = 100
      ShowGalleryMenuFromTop = False
      ShowGalleryMenuFromRight = False
      ShowMenuArrow = True
      ShowFocusRect = True
      Down = False
      GroupIndex = 1
      AllowAllUp = False
      WordWrap = False
      ToggleMode = False
    end
    object BtnPower: TscGPCharGlyphButton
      Left = 364
      Top = 0
      Width = 40
      Height = 15
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      FluentUIOpaque = False
      TabOrder = 1
      Visible = False
      OnClick = BtnPowerClick
      Animation = False
      Badge.Color = clRed
      Badge.ColorAlpha = 255
      Badge.Font.Charset = DEFAULT_CHARSET
      Badge.Font.Color = clWhite
      Badge.Font.Height = -11
      Badge.Font.Name = 'Tahoma'
      Badge.Font.Style = [fsBold]
      Badge.Visible = False
      CaptionCenterAlignment = True
      CanFocused = False
      CustomDropDown = False
      DrawTextMode = scdtmGDI
      FluentLightEffect = True
      Layout = blGlyphLeft
      TransparentBackground = True
      Options.NormalColor = clWindowText
      Options.HotColor = clWindowText
      Options.PressedColor = clWindowText
      Options.FocusedColor = clHighlightText
      Options.DisabledColor = clHighlightText
      Options.NormalColor2 = clNone
      Options.HotColor2 = clNone
      Options.PressedColor2 = clNone
      Options.FocusedColor2 = clNone
      Options.DisabledColor2 = clNone
      Options.NormalColorAlpha = 0
      Options.HotColorAlpha = 30
      Options.PressedColorAlpha = 15
      Options.FocusedColorAlpha = 0
      Options.DisabledColorAlpha = 255
      Options.NormalColor2Alpha = 255
      Options.HotColor2Alpha = 255
      Options.PressedColor2Alpha = 255
      Options.FocusedColor2Alpha = 255
      Options.DisabledColor2Alpha = 255
      Options.FrameNormalColor = clNone
      Options.FrameHotColor = clNone
      Options.FramePressedColor = clNone
      Options.FrameFocusedColor = clNone
      Options.FrameDisabledColor = clWindowText
      Options.FrameWidth = 1
      Options.FrameNormalColorAlpha = 0
      Options.FrameHotColorAlpha = 0
      Options.FramePressedColorAlpha = 0
      Options.FrameFocusedColorAlpha = 0
      Options.FrameDisabledColorAlpha = 0
      Options.FontNormalColor = clWhite
      Options.FontHotColor = clWhite
      Options.FontPressedColor = clWhite
      Options.FontFocusedColor = clWindowText
      Options.FontDisabledColor = clWindowText
      Options.ShapeFillGradientAngle = 0
      Options.ShapeFillGradientPressedAngle = 180
      Options.ShapeFillGradientColorOffset = 25
      Options.ShapeCornerRadius = 4
      Options.ShapeStyle = scgpRoundedRect
      Options.ShapeStyleLineSize = 26
      Options.ArrowSize = 9
      Options.ArrowAreaSize = 0
      Options.ArrowType = scgpatDefault
      Options.ArrowThickness = 2
      Options.ArrowThicknessScaled = False
      Options.ArrowNormalColor = clBtnText
      Options.ArrowHotColor = clBtnText
      Options.ArrowPressedColor = clBtnText
      Options.ArrowFocusedColor = clBtnText
      Options.ArrowDisabledColor = clBtnText
      Options.ArrowNormalColorAlpha = 200
      Options.ArrowHotColorAlpha = 255
      Options.ArrowPressedColorAlpha = 255
      Options.ArrowFocusedColorAlpha = 200
      Options.ArrowDisabledColorAlpha = 125
      Options.StyleColors = True
      Options.PressedHotColors = True
      GlyphOptions.NormalColor = clWhite
      GlyphOptions.HotColor = clWhite
      GlyphOptions.PressedColor = clWhite
      GlyphOptions.FocusedColor = clWhite
      GlyphOptions.DisabledColor = clWindowText
      GlyphOptions.NormalColorAlpha = 255
      GlyphOptions.HotColorAlpha = 255
      GlyphOptions.PressedColorAlpha = 255
      GlyphOptions.FocusedColorAlpha = 255
      GlyphOptions.DisabledColorAlpha = 100
      GlyphOptions.Index = 17
      GlyphOptions.Margin = 0
      GlyphOptions.Size = 24
      GlyphOptions.StyleColors = True
      TextMargin = 0
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ShowCaption = True
      SplitButton = False
      RepeatClick = False
      RepeatClickInterval = 100
      ShowGalleryMenuFromTop = False
      ShowGalleryMenuFromRight = False
      ShowMenuArrow = True
      ShowFocusRect = True
      Down = False
      GroupIndex = 1
      AllowAllUp = False
      WordWrap = False
      ToggleMode = False
    end
    object BtnSettings: TscGPCharGlyphButton
      Left = 324
      Top = 0
      Width = 40
      Height = 15
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      FluentUIOpaque = False
      TabOrder = 2
      Visible = False
      OnClick = BtnSettingsClick
      Animation = False
      Badge.Color = clRed
      Badge.ColorAlpha = 255
      Badge.Font.Charset = DEFAULT_CHARSET
      Badge.Font.Color = clWhite
      Badge.Font.Height = -11
      Badge.Font.Name = 'Tahoma'
      Badge.Font.Style = [fsBold]
      Badge.Visible = False
      CaptionCenterAlignment = True
      CanFocused = False
      CustomDropDown = False
      DrawTextMode = scdtmGDI
      FluentLightEffect = True
      Layout = blGlyphLeft
      TransparentBackground = True
      Options.NormalColor = clWindowText
      Options.HotColor = clWindowText
      Options.PressedColor = clWindowText
      Options.FocusedColor = clHighlightText
      Options.DisabledColor = clHighlightText
      Options.NormalColor2 = clNone
      Options.HotColor2 = clNone
      Options.PressedColor2 = clNone
      Options.FocusedColor2 = clNone
      Options.DisabledColor2 = clNone
      Options.NormalColorAlpha = 0
      Options.HotColorAlpha = 30
      Options.PressedColorAlpha = 15
      Options.FocusedColorAlpha = 0
      Options.DisabledColorAlpha = 255
      Options.NormalColor2Alpha = 255
      Options.HotColor2Alpha = 255
      Options.PressedColor2Alpha = 255
      Options.FocusedColor2Alpha = 255
      Options.DisabledColor2Alpha = 255
      Options.FrameNormalColor = clNone
      Options.FrameHotColor = clNone
      Options.FramePressedColor = clNone
      Options.FrameFocusedColor = clNone
      Options.FrameDisabledColor = clWindowText
      Options.FrameWidth = 1
      Options.FrameNormalColorAlpha = 0
      Options.FrameHotColorAlpha = 0
      Options.FramePressedColorAlpha = 0
      Options.FrameFocusedColorAlpha = 0
      Options.FrameDisabledColorAlpha = 0
      Options.FontNormalColor = clWhite
      Options.FontHotColor = clWhite
      Options.FontPressedColor = clWhite
      Options.FontFocusedColor = clWindowText
      Options.FontDisabledColor = clWindowText
      Options.ShapeFillGradientAngle = 0
      Options.ShapeFillGradientPressedAngle = 180
      Options.ShapeFillGradientColorOffset = 25
      Options.ShapeCornerRadius = 4
      Options.ShapeStyle = scgpRoundedRect
      Options.ShapeStyleLineSize = 26
      Options.ArrowSize = 9
      Options.ArrowAreaSize = 0
      Options.ArrowType = scgpatDefault
      Options.ArrowThickness = 2
      Options.ArrowThicknessScaled = False
      Options.ArrowNormalColor = clBtnText
      Options.ArrowHotColor = clBtnText
      Options.ArrowPressedColor = clBtnText
      Options.ArrowFocusedColor = clBtnText
      Options.ArrowDisabledColor = clBtnText
      Options.ArrowNormalColorAlpha = 200
      Options.ArrowHotColorAlpha = 255
      Options.ArrowPressedColorAlpha = 255
      Options.ArrowFocusedColorAlpha = 200
      Options.ArrowDisabledColorAlpha = 125
      Options.StyleColors = True
      Options.PressedHotColors = True
      GlyphOptions.NormalColor = clWhite
      GlyphOptions.HotColor = clWhite
      GlyphOptions.PressedColor = clWhite
      GlyphOptions.FocusedColor = clWhite
      GlyphOptions.DisabledColor = clWindowText
      GlyphOptions.NormalColorAlpha = 255
      GlyphOptions.HotColorAlpha = 255
      GlyphOptions.PressedColorAlpha = 255
      GlyphOptions.FocusedColorAlpha = 255
      GlyphOptions.DisabledColorAlpha = 100
      GlyphOptions.Index = 41
      GlyphOptions.Margin = 0
      GlyphOptions.Size = 24
      GlyphOptions.StyleColors = True
      TextMargin = 0
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ShowCaption = True
      SplitButton = False
      RepeatClick = False
      RepeatClickInterval = 100
      ShowGalleryMenuFromTop = False
      ShowGalleryMenuFromRight = False
      ShowMenuArrow = True
      ShowFocusRect = True
      Down = False
      GroupIndex = 1
      AllowAllUp = False
      WordWrap = False
      ToggleMode = False
    end
  end
  object scStyledForm1: TscStyledForm
    FluentUIBackground = scfuibAcrylic
    FluentUIAcrylicColor = clBlack
    FluentUIAcrylicColorAlpha = 100
    FluentUIBorder = True
    FluentUIInactiveAcrylicColorOpaque = False
    DWMClientRoundedCornersType = scDWMRoundedCornersDefault
    DWMClientShadow = True
    DWMClientShadowHitTest = False
    DropDownForm = False
    DropDownAnimation = False
    DropDownBorderColor = clBtnShadow
    StylesMenuSorted = False
    ShowStylesMenu = False
    StylesMenuCaption = 'Styles'
    ClientWidth = 0
    ClientHeight = 0
    ShowHints = True
    Buttons = <>
    ButtonImages = ImageList1
    ButtonFont.Charset = DEFAULT_CHARSET
    ButtonFont.Color = clWindowText
    ButtonFont.Height = -11
    ButtonFont.Name = 'Tahoma'
    ButtonFont.Style = []
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -13
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    CaptionAlignment = taLeftJustify
    InActiveClientColor = clWindow
    InActiveClientColorAlpha = 100
    InActiveClientBlurAmount = 5
    Tabs = <>
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clWindowText
    TabFont.Height = -11
    TabFont.Name = 'Tahoma'
    TabFont.Style = []
    ShowIcon = False
    ShowButtons = True
    ShowTabs = True
    TabIndex = 0
    TabsPosition = sctpLeft
    ShowInactiveTab = True
    CaptionWallpaperIndex = -1
    CaptionWallpaperInActiveIndex = -1
    CaptionWallpaperLeftMargin = 1
    CaptionWallpaperTopMargin = 1
    CaptionWallpaperRightMargin = 1
    CaptionWallpaperBottomMargin = 1
    Left = 8
    Top = 416
  end
  object ImageList1: TImageList
    ColorDepth = cd32Bit
    Height = 24
    Width = 24
    Left = 72
    Top = 416
    Bitmap = {
      494C01011200D800040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000006000000078000000010020000000000000B4
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000081515154A5C5C5C999E9E9EC9FDFD
      FDFEFBFBFBFD9E9E9EC95C5C5C991515154A0000000500000000000000000000
      000000000000000000000000000000000000000000000000000000000000D1D1
      D1E71D1D1D570000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001D1D
      1D57D1D1D1E70000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000009090930828282B6FFFFFFFFE5E5E5F2FFFFFFFF8686
      86B98F8F8FBFFFFFFFFFE5E5E5F2FFFFFFFF7B7B7BB109090930000000000000
      0000000000000000000000000000000000000000000000000000000000001D1D
      1D57F7F7F7FB1D1D1D5700000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001D1D1D57F7F7
      F7FB1D1D1D570000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000010101041DEDEDEEEE1E1E1F02121215C838383B7D1D1D1E70202
      021B0303031ED1D1D1E7838383B72121215CE3E3E3F1DEDEDEEE101010410000
      0000000000000000000000000000000000000000000000000000000000000000
      00001D1D1D57F7F7F7FB1D1D1D57000000000000000000000000000000000000
      000000000000000000000000000000000000000000001D1D1D57F7F7F7FB1D1D
      1D57000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000808082FD4D4D4E98F8F8FBF0000000C00000000F3F3F3F93E3E3E7E0000
      0000000000003E3E3E7EF3F3F3F9000000000000000C8F8F8FBFD4D4D4E90707
      072C000000000000000000000000000000000000000000000000000000000000
      0000000000001D1D1D57F7F7F7FB1D1D1D570000000000000000000000000000
      0000000000000000000000000000000000001D1D1D57F7F7F7FB1D1D1D570000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000B828282B6FFFFFFFF646464A03E3E3E7E656565A1FFFFFFFF7B7B7BB14141
      4181414141817B7B7BB1FFFFFFFF646464A03E3E3E7E646464A0FFFFFFFF7B7B
      7BB10000000B0000000000000000000000000000000000000000000000000000
      000000000000000000001D1D1D57F7F7F7FB1D1D1D5700000000000000000000
      00000000000000000000000000001D1D1D57F7F7F7FB1D1D1D57000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001414
      1449FDFDFDFEF1F1F1F8FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFEFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F8FFFF
      FFFF141414490000000000000000000000000000000000000000000000000000
      00000000000000000000000000001D1D1D57F7F7F7FB1D1D1D57000000000000
      000000000000000000001D1D1D57F7F7F7FB1D1D1D5700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      639FBFBFBFDD040404210000000A0000000A6D6D6DA7C1C1C1DE0202021A0000
      000A0000000A0303031DC4C4C4E06C6C6CA60000000A0000000A04040421BDBD
      BDDC6363639F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001D1D1D57F7F7F7FB1D1D1D570000
      0000000000001D1D1D57F7F7F7FB1D1D1D570000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BCBC
      BCDB5E5E5E9B000000000000000000000000939393C2A9A9A9D0000000000000
      00000000000000000000AEAEAED3929292C10000000000000000000000006464
      64A0BABABADA0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001D1D1D57F7F7F7FB1D1D
      1D571D1D1D57F7F7F7FB1D1D1D57000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EBEB
      EBF5D4D4D4E9A8A8A8CFA9A9A9D0A9A9A9D0F1F1F1F8EDEDEDF6A8A8A8CFA9A9
      A9D0A9A9A9D0A8A8A8CFEBEBEBF5F1F1F1F8A9A9A9D0A9A9A9D0A8A8A8CFDADA
      DAECE9E9E9F40000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001D1D1D57F7F7
      F7FBF7F7F7FB1D1D1D5700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EBEB
      EBF5D4D4D4E9A8A8A8CFA9A9A9D0A9A9A9D0F1F1F1F8EDEDEDF6A8A8A8CFA9A9
      A9D0A9A9A9D0A8A8A8CFEBEBEBF5F1F1F1F8A9A9A9D0A9A9A9D0A8A8A8CFDADA
      DAECE9E9E9F40000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001D1D1D57F7F7
      F7FBF7F7F7FB1D1D1D5700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BCBC
      BCDB5E5E5E9B000000000000000000000000939393C2A9A9A9D0000000000000
      00000000000000000000AEAEAED3929292C10000000000000000000000006464
      64A0BABABADA0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001D1D1D57F7F7F7FB1D1D
      1D571D1D1D57F7F7F7FB1D1D1D57000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      639FBFBFBFDD040404210000000A0000000A6D6D6DA7C1C1C1DE0202021A0000
      000A0000000A0303031DC4C4C4E06C6C6CA60000000A0000000A04040421BDBD
      BDDC6363639F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001D1D1D57F7F7F7FB1D1D1D570000
      0000000000001D1D1D57F7F7F7FB1D1D1D570000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001414
      1449FDFDFDFEF1F1F1F8FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFEFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F8FFFF
      FFFF141414490000000000000000000000000000000000000000000000000000
      00000000000000000000000000001D1D1D57F7F7F7FB1D1D1D57000000000000
      000000000000000000001D1D1D57F7F7F7FB1D1D1D5700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000B828282B6FFFFFFFF646464A03E3E3E7E646464A0FFFFFFFF7B7B7BB14141
      4181414141817B7B7BB1FFFFFFFF646464A03E3E3E7E646464A0FFFFFFFF7B7B
      7BB10000000B0000000000000000000000000000000000000000000000000000
      000000000000000000001D1D1D57F7F7F7FB1D1D1D5700000000000000000000
      00000000000000000000000000001D1D1D57F7F7F7FB1D1D1D57000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000808082FD4D4D4E98F8F8FBF0000000C00000000F3F3F3F93E3E3E7E0000
      0000000000003E3E3E7EF1F1F1F8000000000000000C8F8F8FBFD4D4D4E90707
      072C000000000000000000000000000000000000000000000000000000000000
      0000000000001D1D1D57F7F7F7FB1D1D1D570000000000000000000000000000
      0000000000000000000000000000000000001D1D1D57F7F7F7FB1D1D1D570000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000010101041DEDEDEEEE1E1E1F02121215C848484B8D1D1D1E70303
      031F0303031FD1D1D1E7838383B72121215CE1E1E1F0DEDEDEEE101010410000
      0000000000000000000000000000000000000000000000000000000000000000
      00001D1D1D57F7F7F7FB1D1D1D57000000000000000000000000000000000000
      000000000000000000000000000000000000000000001D1D1D57F7F7F7FB1D1D
      1D57000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000009090930828282B6FFFFFFFFE7E7E7F3FFFFFFFF8F8F
      8FBF8F8F8FBFFFFFFFFFE7E7E7F3FFFFFFFF828282B609090930000000000000
      0000000000000000000000000000000000000000000000000000000000001D1D
      1D57F7F7F7FB1D1D1D5700000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001D1D1D57F7F7
      F7FB1D1D1D570000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000081515154A5A5A5A989D9D9DC8FBFB
      FBFDFBFBFBFD9D9D9DC85A5A5A981515154A0000000800000000000000000000
      000000000000000000000000000000000000000000000000000000000000D1D1
      D1E71D1D1D570000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001D1D
      1D57D1D1D1E70000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000024242460909090C09090
      90C0909090C0909090C0909090C0909090C0909090C0909090C0909090C09090
      90C0909090C0909090C0909090C0909090C0909090C0909090C0909090C09090
      90C0909090C0909090C024242460000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000040404080FFFFFFFF8F8F
      8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F
      8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F
      8FBF8F8F8FBFFFFFFFFF40404080000000000000000000000000909090C0FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF101010400000000000000000000000000000000000000000000000000000
      000000000000000000000000000001010110646464A0C4C4C4E0797979B00101
      011000000000000000000000000031313170C4C4C4E0A9A9A9D0101010400000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000040404080FFFFFFFF1010
      1040101010401010104010101040101010401010104010101040101010401010
      1040101010401010104010101040101010401010104010101040101010401010
      104010101040FFFFFFFF40404080000000000000000000000000515151908F8F
      8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F
      8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F
      8FBF090909300000000000000000000000000000000000000000000000000000
      0000000000000000000000000000646464A0FFFFFFFF8F8F8FBFFFFFFFFF7979
      79B0000000000000000019191950FFFFFFFFC3C3C3DFE0E0E0EFE1E1E1F00404
      042000000000000000000000000000000000000000000000000000000000FFFF
      FFFFE0E0E0EF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F
      8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBFE0E0
      E0EFFFFFFFFF0000000000000000000000000000000040404080FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF40404080000000000000000000000000000000000000
      0000000000000404042024242460404040804040408040404080404040804040
      4080404040804040408040404080313131701010104000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000909090C0C3C3C3DF00000000909090C0FFFF
      FFFF000000000000000040404080FFFFFFFF0404042024242460FFFFFFFF1010
      104000000000000000000000000000000000000000000000000000000000FFFF
      FFFF909090C00000000000000000000000000000000000000000000000002424
      2460242424600000000000000000000000000000000000000000000000009090
      90C0FFFFFFFF00000000000000000000000000000000040404200F0F0F3FFFFF
      FFFFA8A8A8CF0F0F0F3FA8A8A8CFFFFFFFFF0F0F0F3F6363639FFFFFFFFF3030
      306F3030306FFFFFFFFF6363639F0F0F0F3FFFFFFFFFA8A8A8CF0F0F0F3FA8A8
      A8CFFFFFFFFF0F0F0F3F04040420000000000000000000000000000000000000
      000031313170FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF909090C0010101100000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000646464A0FFFFFFFF909090C0FFFFFFFF7979
      79B0000000000000000019191950FFFFFFFFC4C4C4E0E1E1E1F0E0E0E0EF0404
      042000000000000000000000000000000000000000000000000000000000FFFF
      FFFF909090C00000000000000000000000000000000000000000000000009090
      90C0909090C00000000000000000000000000000000000000000000000009090
      90C0FFFFFFFF000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000909090C0FFFFFFFF0000000040404080FFFFFFFF1010
      104010101040FFFFFFFF4040408000000000FFFFFFFF909090C0000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000001010
      1040FFFFFFFF8F8F8FBF0F0F0F3F010101100000000000000000000000000000
      0000000000000000000000000000090909303F3F3F7FFFFFFFFF797979B00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000010101106363639FC3C3C3DF787878AF0101
      011000000000000000000000000031313170C3C3C3DFA8A8A8CF101010400000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFF909090C00000000000000000000000000000000001010110646464A0E1E1
      E1F0E1E1E1F0646464A001010110000000000000000000000000000000009090
      90C0FFFFFFFF000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000909090C0FFFFFFFF0000000040404080FFFFFFFF1010
      104010101040FFFFFFFF4040408000000000FFFFFFFF909090C0000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000009090
      90C0C3C3C3DF0101011000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000646464A0FFFFFFFF0101
      0110000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000646464A0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C4E00404
      042000000000000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000000000000000000000000000909090C0FFFFFFFF8F8F
      8FBF8F8F8FBFFFFFFFFF909090C0000000000000000000000000000000009090
      90C0FFFFFFFF000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000909090C0FFFFFFFF0000000040404080FFFFFFFF1010
      104010101040FFFFFFFF4040408000000000FFFFFFFF909090C0000000009090
      90C0FFFFFFFF000000000000000000000000000000000000000000000000E1E1
      E1F0909090C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000019191950FFFFFFFF6464
      64A0242424600101011000000000000000000000000000000000000000000000
      0000000000000000000001010110FFFFFFFF8F8F8FBF3F3F3F7F3F3F3F7F3F3F
      3F7F3F3F3F7F3F3F3F7F3F3F3F7F3F3F3F7F3F3F3F7F3F3F3F7FFFFFFFFF5151
      519000000000000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000000000000000000009090930FFFFFFFF515151900000
      00000000000051515190FFFFFFFF090909300000000000000000000000009090
      90C0FFFFFFFF000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000909090C0FFFFFFFF0000000040404080FFFFFFFF1010
      104010101040FFFFFFFF4040408000000000FFFFFFFF909090C0000000009090
      90C0FFFFFFFF000000000000000000000000000000000000000000000000FFFF
      FFFF909090C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010101040FFFFFFFFFFFF
      FFFFFFFFFFFFC4C4C4E001010110000000000000000000000000000000000000
      0000000000000000000019191950FFFFFFFF1919195000000000000000000000
      0000000000000000000000000000000000000000000000000000C4C4C4E0A9A9
      A9D000000000000000000000000000000000000000000000000000000000FFFF
      FFFF909090C0000000000000000000000000010101100F0F0F3F040404200000
      00000000000051515190FFFFFFFF040404200000000000000000000000009090
      90C0FFFFFFFF000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000909090C0FFFFFFFF0000000040404080FFFFFFFF1010
      104010101040FFFFFFFF4040408000000000FFFFFFFF909090C0000000009090
      90C0FFFFFFFF000000000000000000000000000000000000000000000000FFFF
      FFFF909090C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010101040FFFFFFFF3030
      306F3030306FFFFFFFFF40404080000000000000000000000000000000000000
      0000000000000000000051515190FFFFFFFF0101011000000000000000000000
      000000000000000000000000000000000000000000000000000051515190FFFF
      FFFF01010110000000000000000000000000000000000000000000000000FFFF
      FFFF909090C00000000000000000000000000000000001010110404040809090
      90C0A9A9A9D0FFFFFFFF8F8F8FBF000000000000000000000000000000009090
      90C0FFFFFFFF000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000909090C0FFFFFFFF0000000040404080FFFFFFFF1010
      104010101040FFFFFFFF4040408000000000FFFFFFFF909090C0000000009090
      90C0FFFFFFFF000000000000000000000000000000000000000000000000FFFF
      FFFF909090C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010101040FFFFFFFF1010
      104000000000FFFFFFFF40404080000000000000000000000000000000000000
      00000000000000000000A9A9A9D0A8A8A8CF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000019191950FFFF
      FFFF24242460000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000000000000000000000000000909090C0FFFFFFFFA8A8
      A8CF8F8F8FBF3F3F3F7F01010110000000000000000000000000000000009090
      90C0FFFFFFFF000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000909090C0FFFFFFFF0000000040404080FFFFFFFF1010
      104010101040FFFFFFFF4040408000000000FFFFFFFF909090C0000000009090
      90C0FFFFFFFF000000000000000000000000000000000000000000000000FFFF
      FFFF909090C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010101040FFFFFFFF1010
      104000000000FFFFFFFF40404080000000000000000000000000000000000000
      00000000000001010110FFFFFFFF515151900000000000000000000000000000
      000000000000000000000000000000000000000000000000000001010110FFFF
      FFFF646464A0000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000000000000000000004040420FFFFFFFF515151900000
      0000000000000404042040404080040404200000000000000000000000009090
      90C0FFFFFFFF000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000909090C0FFFFFFFF0000000040404080FFFFFFFF1010
      104010101040FFFFFFFF4040408000000000FFFFFFFF909090C0000000009090
      90C0FFFFFFFF000000000000000000000000000000000000000000000000FFFF
      FFFF909090C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010101040FFFFFFFF1010
      104000000000FFFFFFFF40404080000000000000000000000000000000000000
      00000000000019191950FFFFFFFF191919500000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009090
      90C0C4C4C4E0000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000000000000000000009090930FFFFFFFF515151900000
      00000000000051515190FFFFFFFF090909300000000000000000000000009090
      90C0FFFFFFFF0000000000000000000000000000000024242460909090C0FFFF
      FFFFE1E1E1F0909090C0E1E1E1F0FFFFFFFF909090C0C4C4C4E0FFFFFFFFA9A9
      A9D0A9A9A9D0FFFFFFFFC4C4C4E0909090C0FFFFFFFFE1E1E1F0909090C0E1E1
      E1F0FFFFFFFF909090C02424246000000000000000000000000000000000FFFF
      FFFFE1E1E1F0909090C0909090C0909090C0909090C0909090C0909090C09090
      90C0909090C0909090C0909090C0909090C0909090C0A9A9A9D0FFFFFFFFA9A9
      A9D0909090C0FFFFFFFF40404080000000000000000000000000000000000000
      00000000000051515190FFFFFFFF0101011051515190909090C0909090C09090
      90C0909090C0909090C0909090C0909090C0909090C0909090C0909090C0C4C4
      C4E0FFFFFFFF090909300000000000000000000000000000000000000000FFFF
      FFFF909090C000000000000000000000000000000000909090C0FFFFFFFF9090
      90C0909090C0FFFFFFFF8F8F8FBF000000000000000000000000000000009090
      90C0FFFFFFFF0000000000000000000000000000000040404080FFFFFFFFFFFF
      FFFFC3C3C3DF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F
      8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBFC3C3
      C3DFFFFFFFFFFFFFFFFF40404080000000000000000000000000000000009090
      90C08F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F
      8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F
      8FBF8F8F8FBF8F8F8FBF24242460000000000000000000000000000000000000
      000000000000A9A9A9D0A8A8A8CF00000000797979B08F8F8FBF8F8F8FBF8F8F
      8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF8F8F
      8FBF8F8F8FBF191919500000000000000000000000000000000000000000FFFF
      FFFF909090C000000000000000000000000000000000010101106363639FE0E0
      E0EFE0E0E0EF6363639F01010110000000000000000000000000000000009090
      90C0FFFFFFFF0000000000000000000000000000000010101040C3C3C3DFFFFF
      FFFFFFFFFFFF646464A010101040000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010101040646464A0FFFF
      FFFFFFFFFFFFC3C3C3DF10101040000000000000000000000000000000000000
      0000000000000000000000000000000000000101011010101040040404200000
      0000101010400909093000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000040404201010
      104010101040FFFFFFFF51515190000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFF909090C00000000000000000000000000000000000000000000000009090
      90C0909090C00000000000000000000000000000000000000000000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000001919
      1950787878AFFFFFFFFFFFFFFFFFC4C4C4E02424246001010110000000000000
      000000000000000000000101011024242460C4C4C4E0FFFFFFFFFFFFFFFF7878
      78AF1818184F0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010101040FFFFFFFF404040800000
      0000FFFFFFFF909090C000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000646464A0FFFF
      FFFFFFFFFFFFFFFFFFFF10101040000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFF909090C00000000000000000000000000000000000000000000000002424
      2460242424600000000000000000000000000000000000000000000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      000000000000040404205050508FE0E0E0EFFFFFFFFFE1E1E1F0646464A00404
      042004040420646464A0E1E1E1F0FFFFFFFFE0E0E0EF5050508F040404200000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010101040FFFFFFFF404040800000
      0000FFFFFFFF909090C000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000040404200F0F
      0F3F0F0F0F3F0404042000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFE1E1E1F0909090C0909090C0909090C0909090C0909090C0909090C09090
      90C0909090C0909090C0909090C0909090C0909090C0909090C0909090C0E1E1
      E1F0FFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000024242460A8A8A8CFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFA8A8A8CF2323235F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010101040FFFFFFFF404040800000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000090909306363
      639F6363639F0909093000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000101011024242460404040809090
      90C0909090C0646464A024242460010101100000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000101011024242460515151909090
      90C0909090C05151519024242460010101100000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009090
      90C0909090C0909090C0909090C0909090C0909090C0909090C0909090C09090
      90C0909090C0909090C0909090C0909090C0909090C0909090C0909090C09090
      90C0909090C00000000000000000000000000000000000000000000000001010
      1040000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000010101040000000000000000000000000000000000000000000000000FFFF
      FFFF909090C0000000000101011051515190FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF646464A001010110000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001010110646464A0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF646464A001010110000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFE0E0E0EF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBFC3C3C3DFFFFFFFFFA8A8
      A8CFA8A8A8CFFFFFFFFFC3C3C3DF8F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBFE0E0
      E0EFFFFFFFFF000000000000000000000000000000000000000010101040FFFF
      FFFF646464A00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006464
      64A0FFFFFFFF101010400000000000000000000000000000000000000000FFFF
      FFFF909090C009090930E1E1E1F0FFFFFFFF8F8F8FBF1818184F000000000000
      000000000000040404201818184F8F8F8FBFFFFFFFFFE1E1E1F0090909300000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000009090930E1E1E1F0FFFFFFFF8F8F8FBF1818184F000000000000
      00000000000000000000191919508F8F8FBFFFFFFFFFE1E1E1F0090909300000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFF909090C00000000000000000000000000000000040404080FFFFFFFF1010
      104010101040FFFFFFFF40404080000000000000000000000000000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000006464
      64A0FFFFFFFF646464A000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000646464A0FFFF
      FFFF6363639F000000000000000000000000000000000000000000000000FFFF
      FFFFC4C4C4E0E1E1E1F0E0E0E0EF191919500000000000000000000000000000
      00000000000000000000000000000000000010101040E0E0E0EFE1E1E1F00909
      0930000000000000000000000000000000000000000000000000000000000000
      000009090930FFFFFFFFE0E0E0EF101010400000000000000000000000000000
      00000000000000000000000000000000000010101040E0E0E0EFFFFFFFFF0909
      093000000000000000000000000000000000000000000000000000000000FFFF
      FFFF909090C00000000000000000000000000000000040404080FFFFFFFF1010
      104010101040FFFFFFFF40404080000000000000000000000000000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      0000646464A0FFFFFFFF646464A0000000000000000000000000000000000000
      00000000000000000000000000000000000000000000646464A0FFFFFFFF6363
      639F00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFE0E0E0EF09090930000000000000000000000000000000000000
      0000000000000000000000000000000000000000000009090930E0E0E0EFE1E1
      E1F0010101100000000000000000000000000000000000000000000000000404
      0420E1E1E1F0E0E0E0EF09090930000000000000000000000000000000000000
      0000000000000000000000000000000000000000000009090930E0E0E0EFE1E1
      E1F001010110000000000000000000000000000000000000000000000000FFFF
      FFFF909090C00000000051515190909090C00000000040404080FFFFFFFFA9A9
      A9D0A9A9A9D0FFFFFFFF4040408000000000909090C051515190000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      000000000000646464A0FFFFFFFF646464A00000000000000000000000000000
      000000000000000000000000000000000000646464A0FFFFFFFF6363639F0000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF909090C000000000000000000000
      000000000000000000000000000000000000000000000000000024242460FFFF
      FFFF646464A00000000000000000000000000000000000000000000000006464
      64A0FFFFFFFF1010104000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000010101040FFFF
      FFFF646464A0000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000909090C0FFFFFFFF0000000040404080FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF4040408000000000FFFFFFFF909090C0000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000646464A0FFFFFFFF646464A000000000000000002424
      2460000000000000000000000000646464A0FFFFFFFF6363639F000000000000
      0000000000000000000000000000000000000000000000000000000000009090
      90C08F8F8FBF8F8F8FBF8F8F8FBF8F8F8FBF5151519000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009090
      90C06363639F000000000000000000000000000000000000000001010110FFFF
      FFFF8F8F8FBF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009090
      90C0FFFFFFFF010101100000000000000000000000000000000000000000FFFF
      FFFF909090C00000000009090930101010400000000004040420101010400101
      0110010101101010104004040420000000001010104009090930000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000646464A0FFFFFFFF646464A0646464A0FFFF
      FFFF646464A000000000646464A0FFFFFFFF6363639F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000024242460FFFF
      FFFF191919500000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001919
      1950FFFFFFFF242424600000000000000000000000000000000000000000FFFF
      FFFF909090C000000000909090C0FFFFFFFF0000000040404080FFFFFFFF1010
      104010101040FFFFFFFF4040408000000000FFFFFFFF909090C0000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000646464A0FFFFFFFFFFFFFFFFC3C3
      C3DFFFFFFFFFC4C4C4E0FFFFFFFF6363639F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000051515190FFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFF515151900000000000000000000000000000000000000000FFFF
      FFFF909090C000000000090909300F0F0F3F00000000040404200F0F0F3F0101
      0110010101100F0F0F3F04040420000000001010104009090930000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000646464A0FFFFFFFF6363639F0000
      0000C4C4C4E0FFFFFFFF6363639F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000909090C0FFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFF909090C00000000000000000000000000000000000000000FFFF
      FFFF909090C00000000051515190909090C00000000024242460909090C00909
      093009090930909090C02424246000000000909090C051515190000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000646464A0FFFFFFFF6363639F000000006464
      64A0FFFFFFFF6363639F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000909090C0FFFF
      FFFF000000000000000000000000000000000000000000000000000000009090
      90C0909090C00000000000000000000000000000000000000000000000000000
      0000FFFFFFFF909090C00000000000000000000000000000000000000000FFFF
      FFFF909090C000000000515151908F8F8FBF00000000242424608F8F8FBF0909
      0930090909308F8F8FBF2424246000000000909090C051515190000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000646464A0FFFFFFFF6363639F00000000646464A0FFFF
      FFFFFFFFFFFF646464A000000000010101101010104000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000646464A0FFFF
      FFFF010101100000000000000000000000000000000000000000000000009090
      90C0909090C00000000000000000000000000000000000000000000000000101
      0110FFFFFFFF646464A00000000000000000000000000000000000000000FFFF
      FFFF909090C00000000024242460404040800000000010101040404040800404
      0420040404204040408010101040000000004040408024242460000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      000000000000646464A0FFFFFFFF6363639F00000000646464A0FFFFFFFF6363
      639F6363639FFFFFFFFF909090C0FFFFFFFFFFFFFFFFC4C4C4E0090909300000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000024242460FFFF
      FFFF191919500000000000000000000000000000000000000000000000009090
      90C0909090C00000000000000000000000000000000000000000000000001919
      1950FFFFFFFF242424600000000000000000000000000000000000000000FFFF
      FFFF909090C000000000909090C0FFFFFFFF0000000040404080FFFFFFFF1010
      104010101040FFFFFFFF4040408000000000FFFFFFFF909090C0000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      0000646464A0FFFFFFFF6363639F00000000646464A0FFFFFFFF6363639F0000
      000000000000909090C0FFFFFFFFE0E0E0EF3030306FE0E0E0EFE1E1E1F00909
      0930000000000000000000000000000000000000000000000000000000006464
      64A0909090C00000000000000000000000000000000000000000000000000000
      000000000000000000000000000051515190909090C0909090C0909090C09090
      90C0909090C0000000000000000000000000000000000000000004040420FFFF
      FFFF909090C00000000000000000000000000000000000000000000000009090
      90C0909090C00000000000000000000000000000000000000000000000009090
      90C0FFFFFFFF010101100000000000000000000000000000000000000000FFFF
      FFFF909090C000000000090909300F0F0F3F00000000040404200F0F0F3F0101
      0110010101100F0F0F3F04040420000000001010104009090930000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000005151
      5190FFFFFFFF6363639F00000000646464A0FFFFFFFF6363639F000000000000
      000004040420FFFFFFFFE0E0E0EFFFFFFFFF646464A009090930E0E0E0EFE1E1
      E1F0090909300000000000000000000000000000000000000000000000006464
      64A0FFFFFFFF1919195000000000000000000000000000000000000000000000
      0000000000000000000000000000515151908F8F8FBF8F8F8FBFC3C3C3DFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000006464
      64A0FFFFFFFF1010104000000000000000000000000000000000000000009090
      90C0909090C0000000000000000000000000000000000000000010101040FFFF
      FFFF646464A0000000000000000000000000000000000000000000000000FFFF
      FFFFA9A9A9D01010104010101040101010401010104010101040101010401010
      104010101040101010401010104010101040101010401010104010101040A9A9
      A9D0FFFFFFFF000000000000000000000000000000000000000009090930FFFF
      FFFF787878AF00000000646464A0FFFFFFFF6363639F00000000000000000000
      000010101040FFFFFFFF31313170646464A0FFFFFFFF646464A009090930E0E0
      E0EFE1E1E1F00909093000000000000000000000000000000000000000000101
      0110E0E0E0EFE1E1E1F009090930000000000000000000000000000000000000
      0000000000000000000000000000000000000000000009090930E1E1E1F0FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000101
      0110E0E0E0EFE1E1E1F009090930000000000000000000000000000000009090
      90C0909090C00000000000000000000000000000000009090930E1E1E1F0E0E0
      E0EF01010110000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF000000000000000000000000000000000000000010101040FFFF
      FFFF24242460646464A0FFFFFFFF6363639F0000000000000000000000000000
      000000000000C4C4C4E0E1E1E1F009090930646464A0FFFFFFFF646464A00909
      0930E0E0E0EF2424246000000000000000000000000000000000000000000000
      000009090930E0E0E0EFE1E1E1F0101010400000000000000000000000000000
      00000000000000000000000000000000000019191950E1E1E1F0E0E0E0EFC3C3
      C3DFFFFFFFFF0000000000000000000000000000000000000000000000000000
      000010101040FFFFFFFFE1E1E1F0191919500000000000000000000000009090
      90C0909090C000000000000000000000000019191950E1E1E1F0FFFFFFFF0909
      0930000000000000000000000000000000000000000000000000000000004040
      40803F3F3F7F8F8F8FBF3F3F3F7F3F3F3F7F787878AF5050508F3F3F3F7F5050
      508F787878AF3F3F3F7F3F3F3F7F8F8F8FBF3F3F3F7F3F3F3F7F8F8F8FBF3F3F
      3F7F3F3F3F7F000000000000000000000000000000000000000010101040FFFF
      FFFFE1E1E1F0FFFFFFFF6363639F000000000000000000000000000000000000
      00000000000009090930E0E0E0EFE1E1E1F009090930646464A0FFFFFFFF6464
      64A0010101100000000000000000000000000000000000000000000000000000
      00000000000010101040E0E0E0EFFFFFFFFF909090C019191950010101100000
      0000000000000000000019191950909090C0FFFFFFFFE0E0E0EF090909309090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000009090930E0E0E0EFFFFFFFFF646464A000000000000000009090
      90C0909090C00000000000000000646464A0FFFFFFFFE0E0E0EF090909300000
      0000000000000000000000000000000000000000000000000000000000000000
      000024242460FFFFFFFF646464A009090930E1E1E1F0A9A9A9D004040420A9A9
      A9D0E1E1E1F009090930646464A0FFFFFFFF2424246024242460FFFFFFFF6464
      64A000000000000000000000000000000000000000000000000000000000A9A9
      A9D0FFFFFFFF6363639F00000000000000000000000000000000000000000000
      0000000000000000000009090930E0E0E0EFE1E1E1F009090930646464A02424
      2460000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010101106363639FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5050508F01010110000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000010101106363639F909090C000000000000000009090
      90C0909090C00000000000000000909090C06363639F01010110000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000646464A0FFFFFFFFA8A8A8CF31313170FFFFFFFFE0E0E0EF24242460E0E0
      E0EFFFFFFFFF31313170A8A8A8CFFFFFFFFF6363639F646464A0FFFFFFFFA8A8
      A8CF010101100000000000000000000000000000000000000000000000000909
      09305050508F0000000000000000000000000000000000000000000000000000
      000000000000000000000000000009090930E0E0E0EFE1E1E1F0010101100000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000040404202323235F6363639F8F8F
      8FBF8F8F8FBF5050508F2323235F010101100000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000101011000000000000000005151
      5190515151900000000000000000010101100000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004040408001010110000000002424246009090930000000000909
      09302424246000000000010101103F3F3F7F0000000000000000404040800101
      0110000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000909093024242460000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010101100000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000010101104040408001010110000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001010110404040800101
      0110000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004040
      4080313131700000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001010110A9A9A9D06464
      64A0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E1E1E1F0C4C4C4E0191919500000000000000000000000000000
      00000000000000000000000000000000000019191950C4C4C4E0E0E0E0EF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000009090930FFFF
      FFFFFFFFFFFF0909093000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009090
      90C0909090C0909090C0909090C0909090C0909090C0909090C0242424600000
      00000000000009090930909090C0909090C0909090C0909090C0909090C09090
      90C0909090C00000000000000000000000000000000000000000646464A0FFFF
      FFFF646464A00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000797979B0FFFFFFFFFFFFFFFF909090C009090930000000000000
      0000000000000000000009090930909090C0FFFFFFFFFFFFFFFF797979B00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A9A9A9D0FFFF
      FFFFFFFFFFFFA9A9A9D000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFE0E0E0EF8F8F8FBF8F8F8FBF8F8F8FBFA8A8A8CFFFFFFFFF404040800000
      00000000000010101040FFFFFFFFA8A8A8CF8F8F8FBF8F8F8FBF8F8F8FBFE0E0
      E0EFFFFFFFFF0000000000000000000000000000000000000000000000006464
      64A0FFFFFFFF646464A000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000040404080FFFFFFFF8F8F8FBFFFFFFFFFFFFFFFFF646464A00101
      011001010110646464A0FFFFFFFFFFFFFFFF8F8F8FBFFFFFFFFF404040800000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313170FFFFFFFF4040
      408040404080FFFFFFFF31313170000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000000000000000000010101040FFFFFFFF404040800000
      00000000000010101040FFFFFFFF101010400000000000000000000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      0000646464A0FFFFFFFF646464A0000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000010101040FFFFFFFF24242460040404208F8F8FBFFFFFFFFFE1E1
      E1F0E1E1E1F0FFFFFFFF8F8F8FBF0404042024242460FFFFFFFF101010400000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004040420E1E1E1F0A8A8A8CF0000
      000000000000C4C4C4E0E1E1E1F0040404200000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000000000000000000010101040FFFFFFFF404040800000
      00000000000010101040FFFFFFFF101010400000000000000000000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      000000000000646464A0FFFFFFFF646464A00000000000000000000000000404
      04203131317051515190909090C0404040802424246001010110000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000001010110FFFFFFFF646464A0000000000000000010101040C3C3
      C3DFC3C3C3DF101010400000000000000000646464A0FFFFFFFF010101100000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000797979B0FFFFFFFF101010400000
      00000000000010101040FFFFFFFF797979B00000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000000000000000000010101040FFFFFFFF404040800000
      00000000000010101040FFFFFFFF101010400000000000000000000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000646464A0FFFFFFFF646464A001010110646464A0FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040800101
      0110000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C4C4C4E0A9A9A9D00000000000000000000000000000
      000000000000000000000000000000000000A9A9A9D0A8A8A8CF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101040FFFFFFFF646464A0000000000000
      00000000000000000000646464A0FFFFFFFF1010104000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000000000000000000010101040FFFFFFFF404040800000
      00000000000010101040FFFFFFFF101010400000000000000000000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000646464A0FFFFFFFFFFFFFFFFFFFFFFFF6363
      639F1818184F000000000000000000000000191919508F8F8FBFFFFFFFFFA9A9
      A9D0010101100000000000000000000000000000000000000000000000000000
      00000000000000000000646464A0FFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFF646464A0000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000909090C0E0E0E0EF04040420000000000000
      0000000000000000000004040420E0E0E0EF909090C000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000000000000000000010101040FFFFFFFF404040800000
      00000000000010101040FFFFFFFF101010400000000000000000000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000001010110FFFFFFFFE0E0E0EF191919500000
      000000000000000000000000000000000000000000000000000024242460FFFF
      FFFFA9A9A9D00101011000000000000000000000000000000000000000000000
      00000000000001010110A9A9A9D0FFFFFFFF1010104000000000000000000000
      000000000000000000000000000010101040FFFFFFFFA9A9A9D0010101100000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000024242460FFFFFFFF4040408000000000000000000000
      000000000000000000000000000040404080FFFFFFFF19191950000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFF909090C000000000000000000000000010101040FFFFFFFF404040800000
      00000000000010101040FFFFFFFF101010400000000000000000000000009090
      90C0FFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000646464A0FFFFFFFF19191950000000000000
      0000000000000000000000000000000000000000000000000000000000003131
      3170FFFFFFFF4040408000000000000000000000000000000000000000000000
      000001010110A9A9A9D0FFFFFFFF6363639F0000000000000000000000000000
      000000000000000000000000000000000000646464A0FFFFFFFFA9A9A9D00101
      0110000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A9A9A9D0E0E0E0EF0101011000000000000000000000
      000000000000000000000000000001010110E0E0E0EF909090C0000000000000
      000000000000000000000000000000000000000000000101011001010110FFFF
      FFFF909090C000000000000000000000000010101040FFFFFFFFC4C4C4E09090
      90C0909090C0A9A9A9D0FFFFFFFF101010400000000000000000000000009090
      90C0FFFFFFFF0101011001010110000000000000000000000000000000000000
      0000000000000000000004040420FFFFFFFF646464A000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000909090C0E1E1E1F000000000000000000000000000000000000000000909
      0930A9A9A9D0FFFFFFFF24242460000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313170FFFFFFFFA9A9
      A9D0040404200000000000000000000000000000000000000000000000000000
      00000000000010101040FFFFFFFF404040800000000000000000000000000000
      00000000000000000000000000000000000040404080FFFFFFFF101010400000
      00000000000000000000000000000000000000000000A9A9A9D0A9A9A9D0FFFF
      FFFF909090C000000000000000000000000010101040FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF101010400000000000000000000000009090
      90C0FFFFFFFFA9A9A9D0A9A9A9D0000000000000000000000000000000000000
      0000000000000000000031313170FFFFFFFF1919195000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000024242460FFFFFFFF1919195000000000000000000000000009090930E1E1
      E1F0FFFFFFFF2424246000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000024242460FFFF
      FFFFE1E1E1F00909093000000000000000000000000000000000000000000000
      000000000000646464A0FFFFFFFF010101100000000000000000000000000000
      00000000000000000000000000000000000001010110FFFFFFFF646464A00000
      0000000000000000000000000000000000000000000024242460FFFFFFFFFFFF
      FFFF909090C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009090
      90C0FFFFFFFFFFFFFFFF24242460000000000000000000000000000000000000
      0000000000000000000051515190FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000009090930FFFFFFFF40404080000000000000000009090930E1E1E1F0FFFF
      FFFF797979B01010104010101040000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010101040101010409090
      90C0FFFFFFFFE1E1E1F009090930000000000000000000000000000000000000
      000000000000FFFFFFFF797979B0000000000000000000000000000000000909
      09300909093000000000000000000000000000000000797979B0FFFFFFFF0000
      000000000000000000000000000000000000000000000000000024242460FFFF
      FFFFC4C4C4E00101011000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000001010110C4C4
      C4E0FFFFFFFF2424246000000000000000000000000000000000000000000000
      00000000000000000000909090C0FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFF404040800000000009090930FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9D0000000000000
      00000000000000000000A9A9A9D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF090909300000000000000000000000000000
      000009090930FFFFFFFF3131317000000000000000000000000024242460FFFF
      FFFFFFFFFFFF2424246000000000000000000000000031313170FFFFFFFF0909
      0930000000000000000000000000000000000000000000000000000000002424
      2460FFFFFFFFA9A9A9D001010110000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001010110A9A9A9D0FFFF
      FFFF242424600000000000000000000000000000000000000000000000000000
      0000000000000000000040404080FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000010101040FFFFFFFF40404080000000000000000000000000000000000404
      04200F0F0F3F1818184F3F3F3F7F3F3F3F7FA8A8A8CFFFFFFFFF242424600000
      00000000000024242460FFFFFFFFA8A8A8CF3F3F3F7F3F3F3F7F1818184F0F0F
      0F3F040404200000000000000000000000000000000000000000000000000000
      000010101040FFFFFFFF1010104000000000000000000000000040404080FFFF
      FFFFFFFFFFFF4040408000000000000000000000000019191950FFFFFFFF1010
      1040000000000000000000000000000000000000000000000000000000000000
      000024242460FFFFFFFFA9A9A9D0010101100000000000000000000000000000
      00000000000000000000000000000000000001010110A9A9A9D0FFFFFFFF2424
      2460000000000000000000000000000000000000000000000000000000000000
      0000000000000000000024242460FFFFFFFF1919195000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000031313170FFFFFFFF19191950000000000000000000000000000000000000
      00000000000000000000000000000000000001010110E0E0E0EF909090C00000
      000000000000909090C0E0E0E0EF010101100000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000009090930FFFFFFFF40404080000000000000000000000000040404207878
      78AF787878AF0404042000000000000000000000000040404080FFFFFFFF0909
      0930000000000000000000000000000000000000000000000000000000000000
      00000000000024242460FFFFFFFFA9A9A9D00101011000000000000000000000
      000000000000000000000000000001010110A9A9A9D0FFFFFFFF242424600000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001010110FFFFFFFF909090C000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C4C4C4E0E0E0E0EF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000646464A0FFFFFFFF0909
      093010101040FFFFFFFF51515190000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E1E1E1F0A9A9A9D0000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A9A9A9D0E0E0E0EF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000024242460FFFFFFFFA9A9A9D001010110000000000000
      0000000000000000000001010110A9A9A9D0FFFFFFFF24242460000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000051515190FFFFFFFF24242460000000000000
      0000000000000000000000000000000000000000000000000000000000005151
      5190FFFFFFFF3131317000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000004040420FFFFFFFF6464
      64A0646464A0FFFFFFFF04040420000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000040404080FFFFFFFF242424600000000000000000000000000000
      00000000000000000000000000000000000024242460FFFFFFFF404040800000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000024242460FFFFFFFFA9A9A9D0010101100000
      00000000000001010110A9A9A9D0FFFFFFFF2424246000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000001010110A8A8A8CFFFFFFFFF313131700000
      000000000000000000000000000000000000000000000000000040404080FFFF
      FFFF8F8F8FBF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000646464A0FFFF
      FFFFFFFFFFFF646464A000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000001010110A8A8A8CFE1E1E1F01919195000000000000000000000
      000000000000000000000000000019191950E1E1E1F0A8A8A8CF010101100000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000024242460FFFFFFFFA9A9A9D00101
      011001010110A9A9A9D0FFFFFFFF242424600000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000001010110A8A8A8CFFFFFFFFF9090
      90C02424246009090930000000001010104031313170C4C4C4E0FFFFFFFF8F8F
      8FBF010101100000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000010101040FFFF
      FFFFFFFFFFFF1010104000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000009090930C3C3C3DFFFFFFFFF646464A0191919500101
      01100101011019191950646464A0FFFFFFFFC3C3C3DF09090930000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000024242460FFFFFFFFA9A9
      A9D0A9A9A9D0FFFFFFFF24242460000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010101103F3F3F7FE0E0
      E0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0EF3030306F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009090
      90C08F8F8FBF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000010101106363639FFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF6363639F0101011000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000024242460FFFF
      FFFFFFFFFFFF2424246000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000191919503F3F3F7F3F3F3F7F3F3F3F7F1818184F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002424
      2460242424600000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000040404202323235F3F3F
      3F7F3F3F3F7F2323235F04040420000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002424
      2460242424600000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010101040D1D1D1E7E7E7
      E7F3CFCFCFE6F5F5F5FA2222225E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000F0000000E0000000000000000000000001F1F1F5AE5E5E5F21717
      174D000000039E9E9EC9484848880000000000000000000000000000000A0101
      0112000000020000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000040404200000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000707
      072DD3D3D3E8B3B3B3D60707072B000000070000000537373777CBCBCBE40909
      093100000000757575AD797979B0010101130000000001010113747474ACFFFF
      FFFF1717174E0000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000909090C0A9A9
      A9D0242424600000000000000000000000000000000000000000000000000000
      00000000000024242460797979B0C4C4C4E03131317001010110000000000000
      00000000000000000000000000000000000000000000000000020707072CBDBD
      BDDCBABABADAA0A0A0CAE3E3E3F14141418131313171E5E5E5F2727272AB0000
      000C000000003C3C3C7CF7F7F7FB585858961616164CB7B7B7D8CDCDCDE59D9D
      9DC8FBFBFBFD1919195000000003000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBFBFBFDFDFDFDFE3F3F3F7F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000909090C0FFFF
      FFFFFFFFFFFFE1E1E1F040404080040404200000000000000000090909306464
      64A0E1E1E1F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1F0646464A00404
      042000000000000000000000000000000000000000000000000C969696C4D8D8
      D8EB000000080000000258585896DEDEDEEED4D4D4E96363639F0707072D0000
      0000000000000000000F3A3A3A7ABABABADAF1F1F1F8999999C60202021B0000
      0000959595C3FFFFFFFF02020217000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF3F3F3F7F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000909090C0FFFF
      FFFF24242460A8A8A8CFFFFFFFFFFFFFFFFF646464A0A9A9A9D0FFFFFFFFFFFF
      FFFFA8A8A8CF2323235F51515190FFFFFFFF101010408F8F8FBFFFFFFFFFFFFF
      FFFF909090C0191919500000000000000000000000000000000634343474E0E0
      E0EF1616164C0000000000000000090909300505052500000000000000000000
      00000000000000000000000000000000000F1212124500000004000000000303
      031EC3C3C3DF828282B60000000E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBFBFBFDFDFDFDFE3F3F3F7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000909090C0FFFF
      FFFF0000000000000000101010406363639FFFFFFFFFC3C3C3DF5050508F0404
      0420000000000000000040404080FFFFFFFF0000000000000000040404206363
      639FE0E0E0EF909090C000000000000000000000000000000000000000026E6E
      6EA8DCDCDCED0606062900000000000000000000000000000000000000000101
      0113020202190000000000000000000000000000000000000000010101129696
      96C4BDBDBDDC0000000900000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFF3F3F3F7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000909090C0FFFF
      FFFF00000000000000000000000000000000FFFFFFFF40404080000000000000
      0000000000000000000040404080FFFFFFFF0000000000000000000000000000
      0000909090C0909090C000000000000000000000000000000000000000000000
      0009FFFFFFFF656565A10000000000000000000000000303031C2B2B2B697676
      76AE8A8A8ABC3A3A3A7A0909093200000000000000000000000010101041F9F9
      F9FC1515154A0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFB
      FBFDFDFDFDFE3F3F3F7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000909090C0FFFF
      FFFF00000000000000000000000000000000FFFFFFFF40404080000000000000
      0000000000000000000040404080FFFFFFFF0000000000000000000000000000
      0000909090C0909090C0000000000000000000000000000000000000000E1D1D
      1D57E1E1E1F0131313470000000000000000040404208A8A8ABCFFFFFFFF8787
      87BA7B7B7BB1D1D1D1E7D6D6D6EA19191950000000040000000002020217C4C4
      C4E04D4D4D8C0202021700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FBFBFBFDFDFD
      FDFE3F3F3F7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000909090C0FFFF
      FFFF00000000000000000000000000000000FFFFFFFF40404080000000000000
      0000000000000000000040404080FFFFFFFF0000000000000000000000000000
      0000909090C0909090C000000000000000001B1B1B5438383878717171AAF3F3
      F3F9848484B80000000000000000010101147F7F7FB4D8D8D8EB1A1A1A520000
      0000000000000707072BA0A0A0CAD3D3D3E80909093100000000000000004343
      4383FFFFFFFF878787BA484848882121215C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF3F3F
      3F7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000909090C0FFFF
      FFFF00000000000000000000000000000000FFFFFFFF40404080000000000000
      0000000000000000000040404080FFFFFFFF0000000000000000000000000000
      0000909090C0909090C00000000000000000FFFFFFFFD1D1D1E7828282B64F4F
      4F8E0F0F0F3E000000000000000014141449FFFFFFFF29292967000000000000
      0000000000000000000005050524D8D8D8EB4141418100000006000000000101
      01133D3D3D7D747474ACADADADD2FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000909090C0FFFF
      FFFF00000000000000000000000000000000FFFFFFFF40404080000000000000
      0000000000000000000040404080FFFFFFFF0000000000000000000000000000
      0000909090C0909090C00000000000000000E9E9E9F405050525000000000000
      00000000000000000000000000002121215CCACACAE30303031F000000000000
      0000000000000000000000000000757575AD898989BB02020218000000000000
      000000000000000000000000000ECFCFCFE60000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FBFBFBFDFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000909090C0FFFF
      FFFF00000000000000000000000000000000FFFFFFFF40404080000000000000
      0000000000000000000040404080FFFFFFFF0000000000000000000000000000
      0000909090C0909090C00000000000000000FDFDFDFE24242461101010410202
      02180000000000000000000000001E1E1E58DCDCDCED0808082E000000000000
      0000000000000000000000000000868686B9767676AE01010112000000000000
      00000000000D0A0A0A341C1C1C55E5E5E5F20000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFBFBFDFDFDFDFE3F3F
      3F7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000909090C0FFFF
      FFFF00000000000000000000000000000000FFFFFFFF40404080000000000000
      0000000000000000000040404080FFFFFFFF0000000000000000000000000000
      0000909090C0909090C00000000000000000B0B0B0D4F9F9F9FCDEDEDEEEA0A0
      A0CA2727276400000000000000000D0D0D3AF1F1F1F84E4E4E8D000000000000
      0000000000000000000012121244F7F7F7FB2B2B2B6900000002000000000909
      0932767676AED1D1D1E7EFEFEFF7CBCBCBE40000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF3F3F3F7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000909090C0FFFF
      FFFF00000000000000000000000000000000FFFFFFFF40404080000000000000
      0000000000000000000040404080FFFFFFFF0000000000000000000000000000
      0000909090C0909090C000000000000000000A0A0A331A1A1A532A2A2A688989
      89BBB7B7B7D800000000000000000000000C45454585FFFFFFFF4E4E4E8D0B0B
      0B360404042231313171D6D6D6EA8F8F8FBF0202021700000000000000006D6D
      6DA7E9E9E9F4363636761F1F1F5A0F0F0F3E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFB
      FBFDFDFDFDFE3F3F3F7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000909090C0FFFF
      FFFF00000000000000000000000000000000FFFFFFFF40404080000000000000
      0000000000000000000040404080FFFFFFFF0000000000000000000000000000
      0000909090C0909090C000000000000000000000000000000000000000000707
      072BEDEDEDF63131317000000000000000000000000E43434383F1F1F1F8E0E0
      E0EFCDCDCDE5FFFFFFFF747474AC0404042100000000000000000A0A0A33E0E0
      E0EF2121215C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFF3F3F3F7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000909090C0FFFF
      FFFF00000000000000000000000000000000FFFFFFFF40404080000000000000
      0000000000000000000040404080FFFFFFFF0000000000000000000000000000
      0000909090C0909090C000000000000000000000000000000000000000000808
      082EFFFFFFFF53535392000000000000000000000000000000030D0D0D3B1D1D
      1D571F1F1F5A141414490101011400000000000000000000000009090931F3F3
      F3F9363636760000000100000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
      000000000000FBFBFBFDFDFDFDFE3F3F3F7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000909090C0FFFF
      FFFF646464A0040404200000000000000000FFFFFFFF40404080000000000000
      00000404042051515190C4C4C4E0FFFFFFFF646464A010101040000000000000
      0000909090C0909090C00000000000000000000000000000000000000003ADAD
      ADD2BCBCBCDB0303031C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000055050
      508FE3E3E3F10707072B00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBFBFBFDFDFDFDFE3F3F3F7F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000191919508F8F
      8FBFFFFFFFFFFFFFFFFF797979B010101040FFFFFFFF5151519024242460A9A9
      A9D0FFFFFFFFFFFFFFFFA8A8A8CF6363639FFFFFFFFFFFFFFFFFA9A9A9D02424
      2460909090C0909090C0000000000000000000000000000000095C5C5C99DADA
      DAEC0202021A000000000000000A4E4E4E8D3131317100000000000000000000
      000000000000000000000000000019191951717171AA04040422000000000000
      000CA4A4A4CDB8B8B8D90000000E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF3F3F3F7F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000090909306363639FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0
      E0EF5050508F090909300000000000000000040404203F3F3F7FE0E0E0EFFFFF
      FFFFFFFFFFFF909090C0000000000000000000000000000000085A5A5A98FBFB
      FBFD1717174D0202021BB3B3B3D6FFFFFFFFEBEBEBF5B5B5B5D7282828660000
      00000000000010101041878787BAE7E7E7F3FFFFFFFFD3D3D3E81C1C1C560101
      0116BCBCBCDBD4D4D4E90000000F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010101103F3F3F7FC3C3C3DF787878AF2323235F0000
      0000000000000000000000000000000000000000000000000000000000002424
      2460A8A8A8CF909090C000000000000000000000000000000001020202185C5C
      5C99EBEBEBF5D4D4D4E9B2B2B2D50A0A0A3406060628878787BAA1A1A1CB0202
      021B000000004F4F4F8EEBEBEBF51B1B1B54040404236D6D6DA7E5E5E5F2D3D3
      D3E8BFBFBFDD0707072D00000002000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000404042000000000000000000000000000000000000000000202
      021759595997696969A40101011200000000000000002B2B2B69DCDCDCED0F0F
      0F3E00000000848484B8686868A300000006000000000000000C343434749393
      93C20707072C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000008000000090000000000000000000000001A1A1A53F3F3F3F93434
      34740D0D0D3ACBCBCBE439393979000000000000000000000000000000050000
      000C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A0A0A34AEAEAED3EFEF
      EFF7EBEBEBF5F9F9F9FC1A1A1A53000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000780000000100010000000000A00500000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object TA: TDzTalkApp
    AutoActivate = True
    AutoFind = True
    MyWindowName = 'SM2_APP'
    DestWindowName = 'LIB_APP'
    Synchronous = True
    Left = 40
    Top = 416
  end
end
