object IWFormEditarUsuario: TIWFormEditarUsuario
  Left = 0
  Top = 0
  Width = 899
  Height = 677
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  ActiveControl = CPF
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
    TabOrder = 9
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
    TabOrder = 10
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
  object CPF: TIWDBEdit
    Left = 24
    Top = 80
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
    FriendlyName = 'CPF'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 1
    AutoEditable = False
    DataField = 'CPF'
    PasswordPrompt = False
    DataSource = UsersSrc
  end
  object NomeUsuario: TIWDBEdit
    Left = 24
    Top = 107
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
    FriendlyName = 'Nome do Usu'#225'rio'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 2
    AutoEditable = False
    DataField = 'NomeUsuario'
    PasswordPrompt = False
    DataSource = UsersSrc
  end
  object Email: TIWDBEdit
    Left = 24
    Top = 134
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
    FriendlyName = 'E-mail'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <
      item
        EventCode.Strings = (
          'var $email = $(this); '
          
            'var re = /^[a-zA-Z0-9.!#$%&'#39'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-' +
            'Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a' +
            '-zA-Z0-9])?)*$/;'
          'if ($email.val() == '#39#39' || !re.test($email.val()))'
          '{'
          '   alert('#39'Digite um e-mail v'#225'lido.'#39'); '
          '   $(this).each(function(){this[0].focus()});'
          '    '
          '}')
        Event = 'onBlur'
      end>
    SubmitOnAsyncEvent = True
    TabOrder = 3
    AutoEditable = False
    DataField = 'Email'
    PasswordPrompt = False
    DataSource = UsersSrc
  end
  object ChkAtivo: TIWDBEdit
    Left = 24
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
    FriendlyName = 'Ativo'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 4
    AutoEditable = False
    DataField = 'Ativo'
    PasswordPrompt = False
    DataSource = UsersSrc
  end
  object ChkAdministrador: TIWDBEdit
    Left = 24
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
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Administrador'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 5
    AutoEditable = False
    DataField = 'Administrador'
    PasswordPrompt = False
    DataSource = UsersSrc
  end
  object ChkAdministrativo: TIWDBEdit
    Left = 24
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Administrativo'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 6
    AutoEditable = False
    DataField = 'Administrativo'
    PasswordPrompt = False
    DataSource = UsersSrc
  end
  object ChkComercial: TIWDBEdit
    Left = 24
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
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Comercial'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 7
    AutoEditable = False
    DataField = 'Comercial'
    PasswordPrompt = False
    DataSource = UsersSrc
  end
  object ChkAvaliador: TIWDBEdit
    Left = 24
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
    FriendlyName = 'Avaliador'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 8
    AutoEditable = False
    DataField = 'Avaliador'
    PasswordPrompt = False
    DataSource = UsersSrc
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
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'editarUsuario.html'
    RenderStyles = False
    Left = 528
    Top = 312
  end
  object Users: TADODataSet
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    CommandText = 'Select * from Usuarios'
    Parameters = <>
    Left = 336
    Top = 40
    object UsersIDUsuario: TAutoIncField
      FieldName = 'IDUsuario'
      ReadOnly = True
    end
    object UsersIDCliente: TIntegerField
      FieldName = 'IDCliente'
    end
    object UsersCPF: TStringField
      FieldName = 'CPF'
    end
    object UsersNomeUsuario: TStringField
      FieldName = 'NomeUsuario'
      Size = 50
    end
    object UsersEmail: TStringField
      FieldName = 'Email'
      Size = 100
    end
    object UsersSenha: TStringField
      FieldName = 'Senha'
      Size = 50
    end
    object UsersAtivo: TBooleanField
      FieldName = 'Ativo'
      DisplayValues = 'on;off'
    end
    object UsersAdministrador: TBooleanField
      FieldName = 'Administrador'
      DisplayValues = 'on;off'
    end
    object UsersAdministrativo: TBooleanField
      FieldName = 'Administrativo'
      DisplayValues = 'on;off'
    end
    object UsersAvaliador: TBooleanField
      FieldName = 'Avaliador'
      DisplayValues = 'on;off'
    end
    object UsersComercial: TBooleanField
      FieldName = 'Comercial'
      DisplayValues = 'on;off'
    end
    object UsersIDusuarioCadastro: TIntegerField
      FieldName = 'IDusuarioCadastro'
    end
    object UsersDtCadastro: TDateTimeField
      FieldName = 'DtCadastro'
    end
    object UsersIDUsuarioEdicao: TIntegerField
      FieldName = 'IDUsuarioEdicao'
    end
    object UsersDtEdicao: TDateTimeField
      FieldName = 'DtEdicao'
    end
  end
  object UsersSrc: TDataSource
    DataSet = Users
    Left = 336
    Top = 96
  end
  object Usuarios: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    DataSource = UsersSrc
    Parameters = <
      item
        Name = 'IDUsuario'
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
      'from Usuarios A'
      'left join Usuarios UC on UC.IDUsuario=A.IDUsuarioCadastro'
      'left join Usuarios UE on UE.IDUsuario=A.IDUsuarioEdicao'
      'where A.IDUsuario=:IDUsuario')
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
