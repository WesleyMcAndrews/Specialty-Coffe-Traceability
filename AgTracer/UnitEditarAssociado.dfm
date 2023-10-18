object IWFormEditarAssociado: TIWFormEditarAssociado
  Left = 0
  Top = 0
  Width = 871
  Height = 659
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  OnDestroy = IWAppFormDestroy
  ActiveControl = CNPJAssociado
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
  object NomeAssociado: TIWDBEdit
    Left = 32
    Top = 112
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
    FriendlyName = 'NomeAssociado'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <
      item
        EventCode.Strings = (
          'this.value=this.value.replace(/["'#39']/g, "");')
        Event = 'onKeyUp'
      end>
    SubmitOnAsyncEvent = True
    TabOrder = 2
    AutoEditable = False
    DataField = 'NomeAssociado'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object EnderecoAssociado: TIWDBEdit
    Left = 32
    Top = 272
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
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 8
    AutoEditable = False
    DataField = 'Endereco'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object BairroAssociado: TIWDBEdit
    Left = 32
    Top = 302
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
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 9
    AutoEditable = False
    DataField = 'Bairro'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object CEPAssociado: TIWDBEdit
    Left = 32
    Top = 164
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
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 4
    AutoEditable = False
    DataField = 'CEP'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object EmailAssociado: TIWDBEdit
    Left = 32
    Top = 139
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
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 3
    AutoEditable = False
    DataField = 'Email'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object CelularAssociado: TIWDBEdit
    Left = 32
    Top = 358
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 11
    AutoEditable = False
    DataField = 'Celular'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object FoneAssociado: TIWDBEdit
    Left = 32
    Top = 329
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 10
    AutoEditable = False
    DataField = 'Fone'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object AssociadoDireto: TIWDBLookupComboBox
    Left = 32
    Top = 416
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
    Enabled = False
    BGColor = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- Selecione --'
    Required = False
    RequireSelection = True
    ScriptEvents = <>
    UseSize = False
    OnAsyncChange = AssociadoDiretoAsyncChange
    Style = stNormal
    ButtonColor = clBtnFace
    Editable = True
    NonEditableAsLabel = True
    SubmitOnAsyncEvent = True
    TabOrder = 13
    AutoEditable = False
    DataField = 'AssociadoDireto'
    DataSource = AssociadosSrc
    FriendlyName = 'IWDBLookupComboBox1'
    KeyField = 'IDAssociado'
    ListField = 'NomeAssociado'
    ListSource = AssociadosListSrc
    DisableWhenEmpty = True
  end
  object CPFResponsavel: TIWDBEdit
    Left = 192
    Top = 111
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
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 15
    AutoEditable = False
    DataField = 'CPFResponsavel'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object NomeResponsavel: TIWDBEdit
    Left = 192
    Top = 138
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
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <
      item
        EventCode.Strings = (
          'this.value=this.value.replace(/["'#39']/g, "");')
        Event = 'onKeyUp'
      end>
    SubmitOnAsyncEvent = True
    TabOrder = 16
    AutoEditable = False
    DataField = 'NomeResponsavel'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object EnderecoResponsavel: TIWDBEdit
    Left = 192
    Top = 302
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
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 22
    AutoEditable = False
    DataField = 'EnderecoResp'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object BairroResponsavel: TIWDBEdit
    Left = 192
    Top = 329
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
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 23
    AutoEditable = False
    DataField = 'BairroResp'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object CEPResponsavel: TIWDBEdit
    Left = 192
    Top = 194
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
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 18
    AutoEditable = False
    DataField = 'CEPResp'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object EmailResponsavel: TIWDBEdit
    Left = 192
    Top = 165
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
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 17
    AutoEditable = False
    DataField = 'EmailResp'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object CelularResponsavel: TIWDBEdit
    Left = 192
    Top = 387
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 25
    AutoEditable = False
    DataField = 'CelularResp'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object FoneResponsavel: TIWDBEdit
    Left = 192
    Top = 360
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 24
    AutoEditable = False
    DataField = 'FoneResp'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object SalvarBtn: TIWButton
    Left = 38
    Top = 587
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
    TabOrder = 26
    OnClick = SalvarBtnClick
  end
  object CNPJAssociado: TIWDBEdit
    Left = 32
    Top = 85
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
    FriendlyName = 'CNPJ Associado'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 1
    AutoEditable = False
    DataField = 'CNPJAssociado'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object TipoAssociado: TIWDBComboBox
    Left = 32
    Top = 389
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
    BGColor = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- Selecione --'
    Required = True
    RequireSelection = True
    ScriptEvents = <>
    UseSize = False
    Style = stNormal
    ButtonColor = clBtnFace
    Editable = True
    NonEditableAsLabel = True
    SubmitOnAsyncEvent = True
    TabOrder = 12
    AutoEditable = False
    DataField = 'TipoAssociado'
    DataSource = AssociadosSrc
    FriendlyName = 'TipoAssociado'
    ItemIndex = -1
    Items.Strings = (
      'Direto'
      'N'#227'o Associado')
    Sorted = False
  end
  object CancelarBtn: TIWButton
    Left = 142
    Top = 587
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
    TabOrder = 27
    OnClick = VoltarLinkClick
  end
  object CadastradoPor: TIWDBLabel
    Left = 32
    Top = 554
    Width = 134
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
    DataField = 'UsuarioCadastro'
    DataSource = UsuariosSrc
    FriendlyName = 'CadastradoPor'
  end
  object EditadoPor: TIWDBLabel
    Left = 172
    Top = 554
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
  object TipoEntidade: TIWDBComboBox
    Left = 32
    Top = 443
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
    BGColor = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- Selecione --'
    Required = True
    RequireSelection = True
    ScriptEvents = <>
    UseSize = False
    Style = stNormal
    ButtonColor = clBtnFace
    Editable = True
    NonEditableAsLabel = True
    SubmitOnAsyncEvent = True
    TabOrder = 14
    AutoEditable = False
    DataField = 'TipoEntidade'
    DataSource = AssociadosSrc
    FriendlyName = 'Tipo Entidade'
    ItemIndex = -1
    Items.Strings = (
      'Associa'#231#227'o'
      'Cooperativa'
      'Nenhum'
      'Outros'
      'Sindicato Rural')
    Sorted = True
  end
  object ProfileLogoutLink: TIWLink
    Left = 704
    Top = 62
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
    TabOrder = 28
    RawText = False
    Caption = 'ProfileLogoutLink'
  end
  object UserName: TIWLabel
    Left = 704
    Top = 35
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
  object MunicAssociado: TIWDBEdit
    Left = 32
    Top = 245
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
    NonEditableAsLabel = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Munic'#237'pio do Associado'
    MaxLength = 0
    ReadOnly = True
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 7
    AutoEditable = False
    DataField = 'Municipio'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object MunicResponsavel: TIWDBEdit
    Left = 192
    Top = 275
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
    NonEditableAsLabel = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Munic'#237'pio do Respons'#225'vel'
    MaxLength = 0
    ReadOnly = True
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 21
    AutoEditable = False
    DataField = 'MunicipioResp'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object CodigoMunicAssociado: TIWDBEdit
    Left = 32
    Top = 218
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'CodigoMunicipio'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 6
    AutoEditable = False
    DataField = 'CodigoMunicipio'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object CodigoMunicResponsavel: TIWDBEdit
    Left = 192
    Top = 248
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'CodigoMunicipioResp'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 20
    AutoEditable = False
    DataField = 'CodigoMunicResp'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object UFAssociado: TIWDBEdit
    Left = 32
    Top = 191
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
    NonEditableAsLabel = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'UF Associado'
    MaxLength = 0
    ReadOnly = True
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 5
    AutoEditable = False
    DataField = 'UF'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object UFResponsavel: TIWDBEdit
    Left = 192
    Top = 221
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
    NonEditableAsLabel = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'UF Respons'#225'vel'
    MaxLength = 0
    ReadOnly = True
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 19
    AutoEditable = False
    DataField = 'UFResp'
    PasswordPrompt = False
    DataSource = AssociadosSrc
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'editarAssociado.html'
    RenderStyles = False
    Left = 528
    Top = 312
  end
  object Associados: TADODataSet
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    OnNewRecord = AssociadosNewRecord
    CommandText = 'Select * from Associados'
    Parameters = <>
    Left = 408
    Top = 8
    object AssociadosIDCliente: TIntegerField
      FieldName = 'IDCliente'
    end
    object AssociadosIDAssociado: TAutoIncField
      FieldName = 'IDAssociado'
      ReadOnly = True
    end
    object AssociadosCNPJAssociado: TStringField
      FieldName = 'CNPJAssociado'
    end
    object AssociadosNomeAssociado: TStringField
      FieldName = 'NomeAssociado'
      Required = True
      Size = 200
    end
    object AssociadosUF: TStringField
      FieldName = 'UF'
      Required = True
      Size = 2
    end
    object AssociadosCodigoMunicipio: TStringField
      FieldName = 'CodigoMunicipio'
      Required = True
      Size = 10
    end
    object AssociadosMunicipio: TStringField
      FieldName = 'Municipio'
      Size = 100
    end
    object AssociadosEndereco: TStringField
      FieldName = 'Endereco'
      Required = True
      Size = 200
    end
    object AssociadosBairro: TStringField
      FieldName = 'Bairro'
      Required = True
      Size = 50
    end
    object AssociadosCEP: TStringField
      FieldName = 'CEP'
      Required = True
      Size = 10
    end
    object AssociadosEmail: TStringField
      FieldName = 'Email'
      Required = True
      Size = 50
    end
    object AssociadosCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object AssociadosFone: TStringField
      FieldName = 'Fone'
      Required = True
      Size = 15
    end
    object AssociadosTipoAssociado: TStringField
      FieldName = 'TipoAssociado'
    end
    object AssociadosAssociadoDireto: TIntegerField
      FieldName = 'AssociadoDireto'
    end
    object AssociadosTipoEntidade: TStringField
      FieldName = 'TipoEntidade'
    end
    object AssociadosCPFResponsavel: TStringField
      FieldName = 'CPFResponsavel'
      Required = True
    end
    object AssociadosNomeResponsavel: TStringField
      FieldName = 'NomeResponsavel'
      Required = True
      Size = 200
    end
    object AssociadosUFResp: TStringField
      FieldName = 'UFResp'
      Required = True
      Size = 2
    end
    object AssociadosCodigoMunicResp: TStringField
      FieldName = 'CodigoMunicResp'
      Required = True
      Size = 10
    end
    object AssociadosMunicipioResp: TStringField
      FieldName = 'MunicipioResp'
      Size = 100
    end
    object AssociadosEnderecoResp: TStringField
      FieldName = 'EnderecoResp'
      Required = True
      Size = 200
    end
    object AssociadosBairroResp: TStringField
      FieldName = 'BairroResp'
      Required = True
      Size = 50
    end
    object AssociadosCEPResp: TStringField
      FieldName = 'CEPResp'
      Required = True
      Size = 10
    end
    object AssociadosEmailResp: TStringField
      FieldName = 'EmailResp'
      Required = True
      Size = 50
    end
    object AssociadosCelularResp: TStringField
      FieldName = 'CelularResp'
      Size = 15
    end
    object AssociadosFoneResp: TStringField
      FieldName = 'FoneResp'
      Required = True
      Size = 15
    end
    object AssociadosSenha: TStringField
      FieldName = 'Senha'
    end
    object AssociadosIDUsuarioCadastro: TIntegerField
      FieldName = 'IDUsuarioCadastro'
    end
    object AssociadosDataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
    end
    object AssociadosIDUsuarioEdicao: TIntegerField
      FieldName = 'IDUsuarioEdicao'
    end
    object AssociadosDataEdicao: TDateTimeField
      FieldName = 'DataEdicao'
    end
  end
  object AssociadosSrc: TDataSource
    DataSet = Associados
    Left = 408
    Top = 64
  end
  object Usuarios: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    DataSource = AssociadosSrc
    Parameters = <
      item
        Name = 'IDAssociado'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      
        'Select UC.NomeUsuario+'#39' em '#39'+CONVERT(VARCHAR(10), A.DataCadastro' +
        ', 103)+'#39' '#39'+convert(VARCHAR(5), A.DataCadastro, 14) as UsuarioCad' +
        'astro,'
      
        'UE.NomeUsuario+'#39' em '#39'+CONVERT(VARCHAR(10), A.DataEdicao, 103)+'#39' ' +
        #39'+convert(VARCHAR(5), A.DataEdicao, 14) as UsuarioEdicao'
      'from Associados A'
      'left join Usuarios UC on UC.IDUsuario=A.IDUsuarioCadastro'
      'left join Usuarios UE on UE.IDUsuario=A.IDUsuarioEdicao'
      'where A.IDAssociado=:IDAssociado')
    Left = 408
    Top = 136
    object UsuariosUsuarioCadastro: TStringField
      FieldName = 'UsuarioCadastro'
      ReadOnly = True
      Size = 73
    end
    object UsuariosUsuarioEdicao: TStringField
      FieldName = 'UsuarioEdicao'
      ReadOnly = True
      Size = 73
    end
  end
  object AssociadosList: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select IDAssociado, NomeAssociado'
      'from Associados'
      'Where IDCliente=1'
      'And TipoAssociado='#39'Direto'#39
      'order by NomeAssociado')
    Left = 520
    Top = 16
    object AssociadosListIDAssociado: TAutoIncField
      FieldName = 'IDAssociado'
      ReadOnly = True
    end
    object AssociadosListNomeAssociado: TStringField
      FieldName = 'NomeAssociado'
      Size = 200
    end
  end
  object AssociadosListSrc: TDataSource
    DataSet = AssociadosList
    Left = 520
    Top = 80
  end
  object UsuariosSrc: TDataSource
    DataSet = Usuarios
    Left = 408
    Top = 192
  end
  object IWJQueryWidget1: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      '//Ocultar os campos do c'#243'digo do municipio'
      '$("#CODIGOMUNICASSOCIADO").hide();'
      '$("#CODIGOMUNICRESPONSAVEL").hide();')
    Left = 560
    Top = 208
  end
end
