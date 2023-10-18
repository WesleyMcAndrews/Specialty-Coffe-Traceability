object IWFormEditarTalhao: TIWFormEditarTalhao
  Left = 0
  Top = 0
  Width = 899
  Height = 677
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
  HiddenFields.Strings = (
    'VARIEDADES=0')
  OnCreate = IWAppFormCreate
  OnDestroy = IWAppFormDestroy
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
    Top = 445
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
    Left = 160
    Top = 445
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
    TabOrder = 2
    OnClick = VoltarLinkClick
  end
  object CadastradoPor: TIWDBLabel
    Left = 32
    Top = 418
    Width = 118
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
    DataField = 'CadastradoPor'
    DataSource = UsuariosSrc
    FriendlyName = 'CadastradoPor'
  end
  object EditadoPor: TIWDBLabel
    Left = 172
    Top = 418
    Width = 88
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
    DataField = 'EditadoPor'
    DataSource = UsuariosSrc
    FriendlyName = 'UsuarioCadastro'
  end
  object NomeTalhao: TIWDBEdit
    Left = 24
    Top = 152
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
    FriendlyName = 'NomeTalhao'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 3
    AutoEditable = False
    DataField = 'NomeTalhao'
    PasswordPrompt = False
    DataSource = TalhoesSrc
  end
  object Qtdemm: TIWDBEdit
    Left = 24
    Top = 232
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
    TabOrder = 4
    AutoEditable = False
    DataField = 'mmTotal'
    PasswordPrompt = False
    DataSource = TalhoesSrc
  end
  object WKT: TIWEdit
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
    NonEditableAsLabel = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'WKT'
    MaxLength = 0
    ReadOnly = True
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 5
    PasswordPrompt = False
  end
  object ChkIrrigado: TIWDBEdit
    Left = 24
    Top = 192
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
    FriendlyName = 'ChkIrrigado'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 6
    AutoEditable = False
    DataField = 'Irrigado'
    PasswordPrompt = False
    DataSource = TalhoesSrc
  end
  object NomePropriedade: TIWLabel
    Left = 24
    Top = 120
    Width = 174
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
    FriendlyName = 'NomePropriedade'
    Caption = 'Nome da Propriedade'
    RawText = False
  end
  object IWButton1: TIWButton
    Left = 488
    Top = 408
    Width = 75
    Height = 25
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'IWButton1'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWButton1'
    ScriptEvents = <>
    TabOrder = 7
  end
  object MultiComboVariedades: TIWDBComboBox
    Left = 24
    Top = 336
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
    ItemsHaveValues = True
    NoSelectionText = '-- No Selection --'
    Required = True
    RequireSelection = True
    ScriptEvents = <>
    UseSize = False
    OnAsyncChange = MultiComboVariedadesAsyncChange
    Style = stNormal
    ButtonColor = clBtnFace
    Editable = True
    NonEditableAsLabel = True
    SubmitOnAsyncEvent = True
    TabOrder = 8
    AutoEditable = False
    FriendlyName = 'MultiComboVariedades'
    ItemIndex = -1
    Sorted = False
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
    TabOrder = 9
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
    Templates.Default = 'editarTalhaoPropriedade.html'
    RenderStyles = False
    Left = 528
    Top = 312
  end
  object Talhoes: TADODataSet
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    CommandText = 'Select * from Talhoes'
    Parameters = <>
    Left = 336
    Top = 32
    object TalhoesIDTalhao: TAutoIncField
      FieldName = 'IDTalhao'
      ReadOnly = True
    end
    object TalhoesIDPropriedade: TStringField
      FieldName = 'IDPropriedade'
    end
    object TalhoesNomeTalhao: TStringField
      FieldName = 'NomeTalhao'
      Size = 50
    end
    object TalhoesPoligono: TBlobField
      FieldName = 'Poligono'
    end
    object TalhoesIrrigado: TBooleanField
      FieldName = 'Irrigado'
      DisplayValues = 'on;off'
    end
    object TalhoesmmTotal: TIntegerField
      FieldName = 'mmTotal'
    end
    object TalhoesVariedades: TStringField
      FieldName = 'Variedades'
      Size = 50
    end
    object TalhoesIDUsuarioCadastro: TIntegerField
      FieldName = 'IDUsuarioCadastro'
    end
    object TalhoesDataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
    end
    object TalhoesIDUsuarioEdicao: TIntegerField
      FieldName = 'IDUsuarioEdicao'
    end
    object TalhoesDataEdicao: TDateTimeField
      FieldName = 'DataEdicao'
    end
  end
  object TalhoesSrc: TDataSource
    DataSet = Talhoes
    Left = 336
    Top = 96
  end
  object VariedadesTalhao: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    DataSource = TalhoesSrc
    Parameters = <
      item
        Name = 'IDTalhao'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select IDVariedade'
      'from VariedadesTalhoes'
      'Where IDTalhao=:IDTalhao')
    Left = 464
    Top = 32
    object VariedadesTalhaoIDVariedade: TIntegerField
      FieldName = 'IDVariedade'
    end
  end
  object Variedades: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select V.IDVariedade, V.NomeVariedade'
      'from Variedades V'
      'order by V.NomeVariedade')
    Left = 568
    Top = 32
    object VariedadesIDVariedade: TAutoIncField
      FieldName = 'IDVariedade'
      ReadOnly = True
    end
    object VariedadesNomeVariedade: TStringField
      FieldName = 'NomeVariedade'
      Size = 50
    end
  end
  object ADOQuery1: TADOQuery
    Connection = IWUserSession.ADOConnection1
    Parameters = <>
    Left = 464
    Top = 104
  end
  object Usuarios: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    DataSource = TalhoesSrc
    Parameters = <
      item
        Name = 'IDTalhao'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'Select UC.NomeUsuario+'#39' em '#39'+CONVERT(VARCHAR(10), A.DataCadastro' +
        ', 103)+'#39' '#39'+convert(VARCHAR(5), A.DataCadastro, 14) as UsuarioCad' +
        'astro,'
      
        'UE.NomeUsuario+'#39' em '#39'+CONVERT(VARCHAR(10), A.DataEdicao, 103)+'#39' ' +
        #39'+convert(VARCHAR(5), A.DataEdicao, 14) as UsuarioEdicao'
      'from Talhoes A'
      'left join Usuarios UC on UC.IDUsuario=A.IDUsuarioCadastro'
      'left join Usuarios UE on UE.IDUsuario=A.IDUsuarioEdicao'
      'where A.IDTalhao=:IDTalhao')
    Left = 664
    Top = 32
    object UsuariosUsuarioCadastro: TStringField
      FieldName = 'UsuarioCadastro'
      Size = 50
    end
    object UsuariosDataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
    end
    object UsuariosUsuarioEdicao: TStringField
      FieldName = 'UsuarioEdicao'
      Size = 50
    end
    object UsuariosDataEdicao: TDateTimeField
      FieldName = 'DataEdicao'
    end
    object UsuariosCadastradoPor: TStringField
      FieldKind = fkCalculated
      FieldName = 'CadastradoPor'
      Size = 50
      Calculated = True
    end
    object UsuariosEditadoPor: TStringField
      FieldKind = fkCalculated
      FieldName = 'EditadoPor'
      Size = 50
      Calculated = True
    end
  end
  object UsuariosSrc: TDataSource
    DataSet = Usuarios
    Left = 664
    Top = 88
  end
  object Poligono: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    DataSource = TalhoesSrc
    Parameters = <
      item
        Name = 'IDTalhao'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select Poligono.STAsText() as Poligono'
      'from Talhoes'
      'where IDTalhao=:IDTalhao')
    Left = 336
    Top = 168
    object PoligonoPoligono: TWideMemoField
      FieldName = 'Poligono'
      ReadOnly = True
      BlobType = ftWideMemo
    end
  end
end
