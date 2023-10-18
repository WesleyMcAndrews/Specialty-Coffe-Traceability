object IWFormEditarAvaliacaoConcurso: TIWFormEditarAvaliacaoConcurso
  Left = 0
  Top = 0
  Width = 899
  Height = 677
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
  HiddenFields.Strings = (
    'SLIDERRESULTS=')
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  LayoutMgr = IWTemplateProcessorHTML1
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object VoltarLink: TIWLink
    Left = 24
    Top = 24
    Width = 89
    Height = 17
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    ScriptEvents = <>
    DoSubmitValidation = False
    FriendlyName = 'VoltarLink'
    OnClick = VoltarLinkClick
    TabOrder = 0
    RawText = False
    Caption = 'VoltarLink'
  end
  object SalvarBtn: TIWButton
    Left = 24
    Top = 629
    Width = 75
    Height = 25
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'SalvarBtn'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'SalvarBtn'
    ScriptEvents = <>
    TabOrder = 14
    OnClick = SalvarBtnClick
  end
  object CancelarBtn: TIWButton
    Left = 128
    Top = 629
    Width = 75
    Height = 25
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Cancelar'
    DoSubmitValidation = False
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'CancelarBtn'
    ScriptEvents = <>
    TabOrder = 15
    OnClick = VoltarLinkClick
  end
  object EditadoPor: TIWDBLabel
    Left = 128
    Top = 602
    Width = 115
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    DataField = 'UsuarioEdicao'
    DataSource = UsuariosSrc
    FriendlyName = 'UsuarioCadastro'
  end
  object NotaAroma: TIWDBEdit
    Left = 24
    Top = 217
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Aroma'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 1
    AutoEditable = False
    DataField = 'Aroma'
    PasswordPrompt = False
    DataSource = AvaliacaoScr
  end
  object NotaUniformidade: TIWDBEdit
    Left = 24
    Top = 348
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Uniformidade'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 2
    AutoEditable = False
    DataField = 'Uniformidade'
    PasswordPrompt = False
    DataSource = AvaliacaoScr
  end
  object NotaXicaraLimpa: TIWDBEdit
    Left = 24
    Top = 400
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Limpa'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 3
    AutoEditable = False
    DataField = 'XicaraLimpa'
    PasswordPrompt = False
    DataSource = AvaliacaoScr
  end
  object NotaDocura: TIWDBEdit
    Left = 24
    Top = 430
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Docura'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 4
    AutoEditable = False
    DataField = 'Docura'
    PasswordPrompt = False
    DataSource = AvaliacaoScr
  end
  object NotaSabor: TIWDBEdit
    Left = 24
    Top = 244
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Sabor'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 5
    AutoEditable = False
    DataField = 'Sabor'
    PasswordPrompt = False
    DataSource = AvaliacaoScr
  end
  object NotaAcidez: TIWDBEdit
    Left = 24
    Top = 295
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Acidez'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 6
    AutoEditable = False
    DataField = 'Acidez'
    PasswordPrompt = False
    DataSource = AvaliacaoScr
  end
  object NotaCorpo: TIWDBEdit
    Left = 24
    Top = 321
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Corpo'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 7
    AutoEditable = False
    DataField = 'Corpo'
    PasswordPrompt = False
    DataSource = AvaliacaoScr
  end
  object NotaRetrogosto: TIWDBEdit
    Left = 24
    Top = 270
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Retrogosto'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 8
    AutoEditable = False
    DataField = 'Retrogosto'
    PasswordPrompt = False
    DataSource = AvaliacaoScr
  end
  object NotaBalanco: TIWDBEdit
    Left = 24
    Top = 373
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Balanco'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 9
    AutoEditable = False
    DataField = 'Balanco'
    PasswordPrompt = False
    DataSource = AvaliacaoScr
  end
  object NotaGeral: TIWDBEdit
    Left = 24
    Top = 457
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Geral'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 10
    AutoEditable = False
    DataField = 'Geral'
    PasswordPrompt = False
    DataSource = AvaliacaoScr
  end
  object NotaXicarasDefeitosGraves: TIWDBEdit
    Left = 24
    Top = 510
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Defeitos Graves'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 12
    AutoEditable = False
    DataField = 'XicarasDefeitosGraves'
    PasswordPrompt = False
    DataSource = AvaliacaoScr
  end
  object Obs: TIWDBMemo
    Left = 24
    Top = 536
    Width = 121
    Height = 49
    Cursor = crAuto
    ExtraTagParams.Strings = (
      'rows=3')
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    BGColor = clNone
    Editable = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    InvisibleBorder = False
    HorizScrollBar = False
    VertScrollBar = True
    Required = False
    TabOrder = 13
    SubmitOnAsyncEvent = True
    AutoEditable = False
    DataField = 'Obs'
    DataSource = AvaliacaoScr
    FriendlyName = 'Obs'
  end
  object NotaXicarasDefeitosLeves: TIWDBEdit
    Left = 24
    Top = 483
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Defeitos leves'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 11
    AutoEditable = False
    DataField = 'XicarasDefeitosLeves'
    PasswordPrompt = False
    DataSource = AvaliacaoScr
  end
  object PontuacaoFinal: TIWEdit
    Left = 168
    Top = 510
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    DoSubmitValidation = False
    Editable = False
    NonEditableAsLabel = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Pontua'#231#227'o Final'
    MaxLength = 0
    ReadOnly = True
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = False
    TabOrder = 16
    Enabled = False
    PasswordPrompt = False
  end
  object ProfileLogoutLink: TIWLink
    Left = 720
    Top = 43
    Width = 137
    Height = 17
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    ScriptEvents = <>
    DoSubmitValidation = False
    FriendlyName = 'ProfileLogoutLink'
    OnClick = ProfileLogoutLinkClick
    TabOrder = 17
    RawText = False
    Caption = 'ProfileLogoutLink'
  end
  object UserName: TIWLabel
    Left = 720
    Top = 16
    Width = 84
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    FriendlyName = 'UserName'
    Caption = 'UserName'
    RawText = False
  end
  object NotaAromaSeca: TIWDBEdit
    Left = 151
    Top = 217
    Width = 92
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Aroma Seca'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 18
    AutoEditable = False
    DataField = 'AromaSeca'
    PasswordPrompt = False
    DataSource = AvaliacaoScr
  end
  object NotaAromaUmida: TIWDBEdit
    Left = 249
    Top = 217
    Width = 104
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Aroma Umida'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 19
    AutoEditable = False
    DataField = 'AromaUmida'
    PasswordPrompt = False
    DataSource = AvaliacaoScr
  end
  object NotaAcidezIntensidade: TIWDBEdit
    Left = 151
    Top = 295
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Intensidade Acidez'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 20
    AutoEditable = False
    DataField = 'AcidezIntensidade'
    PasswordPrompt = False
    DataSource = AvaliacaoScr
  end
  object NotaCorpoNivel: TIWDBEdit
    Left = 151
    Top = 322
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Corpo-N'#237'vel'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 21
    AutoEditable = False
    DataField = 'CorpoNivel'
    PasswordPrompt = False
    DataSource = AvaliacaoScr
  end
  object IDAmostra: TIWEdit
    Left = 24
    Top = 56
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    DoSubmitValidation = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IDAmostra'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = False
    TabOrder = 22
    PasswordPrompt = False
    Text = 'IDAmostra'
  end
  object Fase: TIWEdit
    Left = 24
    Top = 83
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    DoSubmitValidation = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Fase'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = False
    TabOrder = 23
    PasswordPrompt = False
    Text = 'Fase'
  end
  object Categoria: TIWEdit
    Left = 24
    Top = 110
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    DoSubmitValidation = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Categoria'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = False
    TabOrder = 24
    PasswordPrompt = False
    Text = 'Categoria'
  end
  object NotaColoracao: TIWDBEdit
    Left = 24
    Top = 190
    Width = 121
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Colora'#231#227'o da Torra'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 25
    AutoEditable = False
    DataField = 'ColoracaoTorra'
    PasswordPrompt = False
    DataSource = AvaliacaoScr
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'editarAvaliacaoConcurso.html'
    RenderStyles = False
    Left = 528
    Top = 312
  end
  object Avaliacao: TADODataSet
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    CommandText = 'Select * from ConcursoAvaliacoes'
    Parameters = <>
    Left = 472
    Top = 32
    object AvaliacaoIDConcurso: TIntegerField
      FieldName = 'IDConcurso'
    end
    object AvaliacaoIDAmostraConcurso: TIntegerField
      FieldName = 'IDAmostraConcurso'
    end
    object AvaliacaoIDJurado: TIntegerField
      FieldName = 'IDJurado'
    end
    object AvaliacaoFaseConcurso: TStringField
      FieldName = 'FaseConcurso'
    end
    object AvaliacaoIDAvaliacaoConcurso: TAutoIncField
      FieldName = 'IDAvaliacaoConcurso'
      ReadOnly = True
    end
    object AvaliacaoDataAvaliacao: TDateTimeField
      FieldName = 'DataAvaliacao'
    end
    object AvaliacaoColoracaoTorra: TFloatField
      FieldName = 'ColoracaoTorra'
    end
    object AvaliacaoAroma: TFloatField
      FieldName = 'Aroma'
      DisplayFormat = '#.00'
    end
    object AvaliacaoAromaSeca: TFloatField
      FieldName = 'AromaSeca'
    end
    object AvaliacaoAromaUmida: TFloatField
      FieldName = 'AromaUmida'
    end
    object AvaliacaoSabor: TFloatField
      FieldName = 'Sabor'
      DisplayFormat = '#.00'
    end
    object AvaliacaoRetrogosto: TFloatField
      FieldName = 'Retrogosto'
      DisplayFormat = '#.00'
    end
    object AvaliacaoAcidez: TFloatField
      FieldName = 'Acidez'
      DisplayFormat = '#.00'
    end
    object AvaliacaoAcidezIntensidade: TFloatField
      FieldName = 'AcidezIntensidade'
    end
    object AvaliacaoCorpo: TFloatField
      FieldName = 'Corpo'
      DisplayFormat = '#.00'
    end
    object AvaliacaoCorpoNivel: TFloatField
      FieldName = 'CorpoNivel'
    end
    object AvaliacaoUniformidade: TFloatField
      FieldName = 'Uniformidade'
    end
    object AvaliacaoBalanco: TFloatField
      FieldName = 'Balanco'
      DisplayFormat = '#.00'
    end
    object AvaliacaoXicaraLimpa: TFloatField
      FieldName = 'XicaraLimpa'
    end
    object AvaliacaoDocura: TFloatField
      FieldName = 'Docura'
    end
    object AvaliacaoGeral: TFloatField
      FieldName = 'Geral'
      DisplayFormat = '#.00'
    end
    object AvaliacaoXicarasDefeitosLeves: TFloatField
      FieldName = 'XicarasDefeitosLeves'
    end
    object AvaliacaoXicarasDefeitosGraves: TFloatField
      FieldName = 'XicarasDefeitosGraves'
    end
    object AvaliacaoObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object AvaliacaoIDUsuarioEdicao: TIntegerField
      FieldName = 'IDUsuarioEdicao'
    end
    object AvaliacaoDataEdicao: TDateTimeField
      FieldName = 'DataEdicao'
    end
  end
  object AvaliacaoScr: TDataSource
    DataSet = Avaliacao
    Left = 472
    Top = 88
  end
  object Usuarios: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    DataSource = AvaliacaoScr
    Parameters = <
      item
        Name = 'IDAvaliacao'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'Select UE.NomeUsuario+'#39' em '#39'+CONVERT(VARCHAR(10), A.DataEdicao, ' +
        '103)+'#39' '#39'+convert(VARCHAR(5), A.DataEdicao, 14) as UsuarioEdicao'
      'from Avaliacao A'
      'left join Usuarios UE on UE.IDUsuario=A.IDUsuarioEdicao'
      'where A.IDAvaliacao=:IDAvaliacao')
    Left = 640
    Top = 32
    object UsuariosUsuarioEdicao: TStringField
      FieldName = 'UsuarioEdicao'
      ReadOnly = True
      Size = 85
    end
  end
  object UsuariosSrc: TDataSource
    DataSet = Usuarios
    Left = 640
    Top = 88
  end
  object IWJQueryRosa: TIWJQueryWidget
    Enabled = False
    OnReady.Strings = (
      '        var data = [];'
      ''
      '    var borderWidth = 4;'
      '    '
      '    $('#39'#rosa'#39').highcharts({'
      ''
      #9'        chart: {'
      #9'            polar: true,'
      #9'            backgroundColor: '#39'transparent'#39','
      #9'            plotBorderWidth: null,'
      #9#9#9#9'margin: [0, 0, 0, 0],'
      #9#9#9#9'spacingTop: 0,'
      #9#9#9#9'spacingBottom: 0,'
      #9#9#9#9'spacingLeft: 0,'
      #9#9#9#9'spacingRight: 0'
      #9'        },'
      ''
      #9#9#9'title:{'
      #9#9#9#9'text:'#39#39
      #9#9#9'},'
      ''
      #9#9#9'subTitle:{'
      #9#9#9#9'text:'#39#39
      #9#9#9'},'
      ''
      #9'        pane: {'
      #9'            startAngle: 0,'
      #9'            endAngle: 360'
      #9'        },'
      ''
      #9'        legend: {'
      #9'        '#9'enabled: false'
      #9'        },'
      ''
      #9'        xAxis: {'
      #9#9#9#9'tickInterval: 45,'
      #9#9#9#9'//min: 0, //Aqui se ajusta se vai completar a volta'
      #9#9#9#9'//max: 360,'
      #9#9#9#9'lineWidth: 0,'
      #9#9#9#9'minorGridLineWidth: 0,'
      #9#9#9#9'gridLineColor: '#39'transparent'#39','
      #9#9#9#9'labels: {'
      #9#9#9#9'   enabled: false'
      #9#9#9#9'},'
      #9'        },'
      ''
      #9'        yAxis: {'
      #9'            min: 0,'
      #9#9#9#9'lineWidth: 0,'
      #9#9#9#9'minorGridLineWidth: 0,'
      #9#9#9#9'gridLineColor: '#39'transparent'#39','
      #9#9#9#9'labels: {'
      #9#9#9#9'   enabled: false'
      #9#9#9#9'},'
      #9'        },'
      ''
      #9'        plotOptions: {'
      #9'            series: {'
      #9'                pointStart: 0,'
      #9'                pointInterval: 45,'
      #9'                pointPlacement: '#39'between'#39','
      #9'                states: {'
      #9#9'                hover: {'
      #9#9'                    enabled: true'
      #9#9'                }'
      #9#9'            },'
      #9#9#9#9#9'dataLabels: {'
      #9#9#9#9#9#9'enabled: true,'
      
        #9#9#9#9#9#9'format: '#39'<span class="wheel-label" style="color: {point.co' +
        'lor}">{point.name}</span>'#39','
      #9#9#9#9#9#9'style: {'
      #9#9'                    textShadow: false,'
      #9#9'                    width: 150,'
      #9#9'                    //fontSize: "12px"'
      #9#9'                },'
      #9#9#9#9#9'}'
      #9'            },'
      #9'            column: {'
      #9'                pointPadding: 0,'
      #9'                groupPadding: 0,'
      #9'                borderWidth: borderWidth'
      #9'            },'
      #9'        },'
      ''
      #9'        series: [{'
      #9'        '#9'showInLegend: false,'
      #9'            type: '#39'column'#39','
      #9'            name: '#39'Predominancia'#39','
      #9'            data: data'
      #9'        }],'
      ''
      #9'        credits: {'
      '                             position: {'
      #9'                align: '#39'left'#39','
      #9'                x: 10,'
      #9'                verticalAlign: '#39'bottom'#39','
      #9'                y: 0'
      '                              },'
      #9'        '#9'enabled: true,'
      '                              text: '#39'Copyright: McAndrews'#39','
      
        '                              href: '#39'http://www.mcandrews.com.br' +
        #39
      #9'        }'
      #9'    });')
    Left = 648
    Top = 256
  end
  object IWJQueryCombo: TIWJQueryWidget
    Enabled = False
    OnReady.Strings = (
      ''
      
        'var names = [{"text":"Gostos","children":[{"id":"12","text":"Ado' +
        'cicado"},{"id":"11","text":"Agridoce"},{"id":"15","text":"Amargo' +
        '"},{"id":"1","text":"Azedo"},{"id":"14","text":"Meio-Amargo"},{"' +
        'id":"13","text":"Salgado"},{"id":"10","text":"Tanino"}]},{"text"' +
        ':"Aromas","children":[{"id":"23","text":"Baunilha"},{"id":"21","' +
        'text":"Caramelo"},{"id":"27","text":"Carbonizado"},{"id":"22","t' +
        'ext":"Chocolate"},{"id":"17","text":"C'#237'trico"},{"id":"26","text"' +
        ':"Defumado"},{"id":"25","text":"Especiarias"},{"id":"16","text":' +
        '"Floral"},{"id":"18","text":"Frutas Vermelhas"},{"id":"19","text' +
        '":"Herbal"},{"id":"20","text":"Nozes"},{"id":"24","text":"Resino' +
        'so"}]}];'
      'var data =[];'
      ''
      '  function updateChart() {'
      '    data = [];'
      '    $(".slider").each(function() {'
      '        item = {};'
      '        item["name"] = $(this).attr("name");'
      '        item["y"] = $(this).slider( "value" );'
      '        item["color"] = $(this).css('#39'background-color'#39');'
      '        data.push(item);'
      '    });'
      '     //alert(JSON.stringify(data));'
      '    $('#39'#rosa'#39').highcharts().series[0].setData (data);'
      '   };'
      ''
      '   function addSlider(e){'
      '      alert(JSON.stringify(e));'
      
        '      //alert("selecting val=" + e.val + " choice=" + e.object.t' +
        'ext);'
      
        '      var div1 = $('#39'<div/>'#39', {id: '#39'slider_'#39'+e.val, class: '#39'form-' +
        'group'#39',}).appendTo('#39'#predominancia'#39');'
      
        '      $('#39'<label/>'#39', {class: '#39'col-md-3 control-label'#39', text: e.ob' +
        'ject.text}).appendTo(div1);'
      
        '      var div2 = $('#39'<div/>'#39', {class: '#39'col-md-8'#39',}).appendTo(div1' +
        '); '
      
        '      var slider = $('#39'<div/>'#39', {id: '#39'slider_'#39'+e.val, class: '#39'sli' +
        'der slider-basic flavorColor-'#39'+e.val, name: e.object.text}).appe' +
        'ndTo(div2); '
      '      slider.slider({'
      '         min:0,'
      '         max: 100,'
      '         stop: function( event, ui ) {updateChart();}'
      '     });'
      '     updateChart();'
      '    };'
      ''
      '  $("#saborescombo").select2({'
      '        placeholder: "Selecione os Sabores",'
      '        multiple: true,'
      '        data:{ results: names, text: '#39'text'#39' },'
      '        allowClear: true'
      '      })'
      '      .on("select2-selecting", function(e) { addSlider(e);'
      '        })'
      '      .on("select2-removed", function(e) {'
      
        '             //alert("removed val=" + e.val + " choice=" + e.cho' +
        'ice.text);'
      '             $("#slider_"+e.val).remove();'
      '             updateChart();'
      '        });'
      '  '
      '   //Inicializa os sabores j'#225' armazenados no BD'
      
        '   executeAjaxEvent("", null,"MyAjaxHandler",false, null, false)' +
        ';'
      '')
    Left = 768
    Top = 256
  end
  object Sabores: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    DataSource = AvaliacaoScr
    Parameters = <
      item
        Name = 'IDAvaliacaoConcurso'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select A.IDSabor, S.NomeSabor, S.Cor, A.Predominancia'
      'from ConcursoSaboresAvaliacao A'
      'left join Sabores S on S.IDSabor=A.IDSabor'
      'where A.IDAvaliacaoConcurso=:IDAvaliacaoConcurso'
      'order by S.NomeSabor')
    Left = 560
    Top = 32
    object SaboresIDSabor: TIntegerField
      FieldName = 'IDSabor'
    end
    object SaboresNomeSabor: TStringField
      FieldName = 'NomeSabor'
      Size = 50
    end
    object SaboresCor: TStringField
      FieldName = 'Cor'
      Size = 10
    end
    object SaboresPredominancia: TIntegerField
      FieldName = 'Predominancia'
    end
  end
end
