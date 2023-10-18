object IWFormEditarAmostra: TIWFormEditarAmostra
  Left = 0
  Top = 0
  Width = 899
  Height = 677
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
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
    Left = 38
    Top = 627
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
    TabOrder = 1
    OnClick = SalvarBtnClick
  end
  object CancelarBtn: TIWButton
    Left = 144
    Top = 627
    Width = 75
    Height = 25
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Cancelar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'CancelarBtn'
    ScriptEvents = <>
    TabOrder = 2
    OnClick = VoltarLinkClick
  end
  object CadastradoPor: TIWDBLabel
    Left = 32
    Top = 600
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
    Left = 188
    Top = 600
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
  object DataEntrada: TIWDBEdit
    Left = 48
    Top = 93
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
    FriendlyName = 'DataEntrada'
    MaxLength = 0
    ReadOnly = True
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 3
    AutoEditable = False
    DataField = 'DataEntrada'
    PasswordPrompt = False
    DataSource = AmostrasSrc
  end
  object Tipo: TIWDBComboBox
    Left = 48
    Top = 120
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
    Required = False
    RequireSelection = True
    ScriptEvents = <>
    UseSize = False
    Style = stNormal
    ButtonColor = clBtnFace
    Editable = True
    NonEditableAsLabel = True
    SubmitOnAsyncEvent = True
    TabOrder = 4
    AutoEditable = False
    DataField = 'TipoAmostra'
    DataSource = AmostrasSrc
    FriendlyName = 'Tipo'
    ItemIndex = -1
    Items.Strings = (
      'Concurso'
      'Final'
      'Verifica'#231#227'o')
    Sorted = True
  end
  object Etapa: TIWDBComboBox
    Left = 48
    Top = 147
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
    Required = False
    RequireSelection = True
    ScriptEvents = <>
    UseSize = False
    Style = stNormal
    ButtonColor = clBtnFace
    Editable = True
    NonEditableAsLabel = True
    SubmitOnAsyncEvent = True
    TabOrder = 5
    AutoEditable = False
    DataField = 'EtapaProcesso'
    DataSource = AmostrasSrc
    FriendlyName = 'IWDBComboBox1'
    ItemIndex = -1
    Items.Strings = (
      'Pr'#233'-colheita'
      'Terreiro'
      'Secador'
      'Silo'
      'Tulha'
      'Benef'#237'cio'
      'Rebenef'#237'cio'
      'Armaz'#233'm')
    Sorted = False
  end
  object Qtde: TIWDBEdit
    Left = 48
    Top = 174
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
    TabOrder = 6
    AutoEditable = False
    DataField = 'QtdeKg'
    PasswordPrompt = False
    DataSource = AmostrasSrc
  end
  object DataDevolutiva: TIWDBEdit
    Left = 48
    Top = 201
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
    TabOrder = 7
    OnAsyncChange = DataDevolutivaAsyncChange
    AutoEditable = False
    DataField = 'DataDevolutiva'
    PasswordPrompt = False
    DataSource = AmostrasSrc
  end
  object Login: TIWDBEdit
    Left = 48
    Top = 257
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
    FriendlyName = 'Login'
    MaxLength = 0
    ReadOnly = True
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 8
    AutoEditable = False
    DataField = 'LoginAvulso'
    PasswordPrompt = False
    DataSource = AmostrasSrc
  end
  object Senha: TIWDBEdit
    Left = 48
    Top = 284
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
    ReadOnly = True
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 9
    AutoEditable = False
    DataField = 'SenhaAvulsa'
    PasswordPrompt = False
    DataSource = AmostrasSrc
  end
  object DataAcesso: TIWDBEdit
    Left = 48
    Top = 311
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
    ReadOnly = True
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 10
    AutoEditable = False
    DataField = 'DataAcessoOnline'
    PasswordPrompt = False
    DataSource = AmostrasSrc
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
    TabOrder = 11
    RawText = False
    Caption = 'ProfileLogoutLink'
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'editarAmostra.html'
    RenderStyles = False
    Left = 528
    Top = 312
  end
  object IWJQueryWidget1: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      ''
      ''
      ''
      '')
    Left = 536
    Top = 200
  end
  object Amostras: TADODataSet
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    CommandText = 'Select * from AmostrasLotes'
    Parameters = <>
    Left = 336
    Top = 40
    object AmostrasIDAmostra: TAutoIncField
      FieldName = 'IDAmostra'
      ReadOnly = True
    end
    object AmostrasIDLote: TIntegerField
      FieldName = 'IDLote'
    end
    object AmostrasDataEntrada: TDateTimeField
      FieldName = 'DataEntrada'
    end
    object AmostrasTipoAmostra: TStringField
      FieldName = 'TipoAmostra'
    end
    object AmostrasEtapaProcesso: TStringField
      FieldName = 'EtapaProcesso'
      Size = 50
    end
    object AmostrasQtdeKg: TIntegerField
      FieldName = 'QtdeKg'
    end
    object AmostrasDataDevolutiva: TDateTimeField
      FieldName = 'DataDevolutiva'
    end
    object AmostrasLoginAvulso: TStringField
      FieldName = 'LoginAvulso'
      Size = 10
    end
    object AmostrasSenhaAvulsa: TStringField
      FieldName = 'SenhaAvulsa'
      Size = 10
    end
    object AmostrasDataAcessoOnline: TDateTimeField
      FieldName = 'DataAcessoOnline'
    end
    object AmostrasQRCode: TGuidField
      FieldName = 'QRCode'
      FixedChar = True
      Size = 38
    end
    object AmostrasIDUsuarioCadastro: TIntegerField
      FieldName = 'IDUsuarioCadastro'
    end
    object AmostrasDtCadastro: TDateTimeField
      FieldName = 'DtCadastro'
    end
    object AmostrasIDUsuarioEdicao: TIntegerField
      FieldName = 'IDUsuarioEdicao'
    end
    object AmostrasDtEdicao: TDateTimeField
      FieldName = 'DtEdicao'
    end
  end
  object AmostrasSrc: TDataSource
    DataSet = Amostras
    Left = 336
    Top = 96
  end
  object Usuarios: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    DataSource = AmostrasSrc
    Parameters = <
      item
        Name = 'IDAmostra'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'Select UC.NomeUsuario+'#39' em '#39'+CONVERT(VARCHAR(19),A.DtCadastro) a' +
        's UsuarioCadastro,'
      
        'UE.NomeUsuario+'#39' em '#39'+CONVERT(VARCHAR(19),A.DtEdicao) as Usuario' +
        'Edicao'
      'from AmostrasLotes A'
      'left join Usuarios UC on UC.IDUsuario=A.IDUsuarioCadastro'
      'left join Usuarios UE on UE.IDUsuario=A.IDUsuarioEdicao'
      'where A.IDAmostra=:IDAmostra')
    Left = 440
    Top = 40
    object UsuariosUsuarioCadastro: TStringField
      FieldName = 'UsuarioCadastro'
      ReadOnly = True
      Size = 88
    end
    object UsuariosUsuarioEdicao: TStringField
      FieldName = 'UsuarioEdicao'
      ReadOnly = True
      Size = 85
    end
  end
  object UsuariosSrc: TDataSource
    DataSet = Usuarios
    Left = 440
    Top = 96
  end
end
