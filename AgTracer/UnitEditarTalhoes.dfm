object IWFormEditarTalhoes: TIWFormEditarTalhoes
  Left = 0
  Top = 0
  Width = 899
  Height = 677
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
  HiddenFields.Strings = (
    'WKT=')
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
  object CancelarBtn: TIWButton
    Left = 148
    Top = 589
    Width = 75
    Height = 25
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
    Caption = 'Cancelar'
    DoSubmitValidation = False
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'CancelarBtn'
    ScriptEvents = <>
    TabOrder = 6
    OnAsyncClick = CancelarBtnAsyncClick
  end
  object CadastradoPor: TIWDBLabel
    Left = 24
    Top = 562
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
    Left = 164
    Top = 562
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
  object NomeTalhao: TIWDBEdit
    Left = 24
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
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 1
    AutoEditable = False
    DataField = 'NomeTalhao'
    PasswordPrompt = False
    DataSource = TalhoesSrc
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
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 2
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
    TabOrder = 7
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
  object DataPlantio: TIWDBEdit
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
    FriendlyName = 'DataPlantio'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 3
    AutoEditable = False
    DataField = 'DataPlantio'
    PasswordPrompt = False
    DataSource = TalhoesSrc
  end
  object MultiComboVariedades: TIWDBEdit
    Left = 24
    Top = 307
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
    FriendlyName = 'Variedades'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 4
    OnAsyncChange = MultiComboVariedadesAsyncChange
    AutoEditable = False
    DataField = 'Variedades'
    PasswordPrompt = False
    DataSource = TalhoesSrc
  end
  object WKTEdit: TIWEdit
    Left = 37
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
    FriendlyName = 'WKTEdit'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 8
    PasswordPrompt = False
  end
  object SalvarBtn: TIWButton
    Left = 24
    Top = 589
    Width = 89
    Height = 25
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
    Caption = 'SalvarBtn'
    DoSubmitValidation = False
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    FriendlyName = 'SalvarBtn'
    ScriptEvents = <>
    TabOrder = 9
    OnAsyncClick = SalvarBtnAsyncClick
  end
  object Premios: TIWDBMemo
    Left = 24
    Top = 344
    Width = 121
    Height = 65
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
    TabOrder = 5
    SubmitOnAsyncEvent = True
    AutoEditable = False
    DataField = 'Premios'
    DataSource = TalhoesSrc
    FriendlyName = 'Premios'
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'editarTalhoesPropriedade.html'
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
    object TalhoesDataPlantio: TDateTimeField
      FieldName = 'DataPlantio'
    end
    object TalhoesVariedades: TStringField
      FieldName = 'Variedades'
      Size = 50
    end
    object TalhoesPremios: TMemoField
      FieldName = 'Premios'
      BlobType = ftMemo
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
      ReadOnly = True
      Size = 70
    end
    object UsuariosUsuarioEdicao: TStringField
      FieldName = 'UsuarioEdicao'
      ReadOnly = True
      Size = 70
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
    Left = 240
    Top = 32
    object PoligonoPoligono: TWideMemoField
      FieldName = 'Poligono'
      ReadOnly = True
      BlobType = ftWideMemo
    end
  end
  object IWJQueryWidget1: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      'var arquivo;'
      '$shapes = [];'
      '$.getJSON( arquivo, function( data ) {'
      ' $shapes = data;'
      '});')
    Left = 536
    Top = 200
  end
  object JSON: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT '#39'['#39' + STUFF(('
      ' select '
      '  '#39',{"id":"'#39' + cast(T.idTalhao as varchar(max)) + '#39'"'#39
      '  + '#39', "Nome":"'#39' + T.NomeTalhao + '#39'"'#39
      '  + '#39', "Poligono":"'#39' + T.Poligono.STAsText() + '#39'"'#39
      
        '  + '#39', "Area":"'#39' + Cast(CONVERT(DECIMAL(10,2), T.Poligono.STArea' +
        '()/10000) as varchar(max)) + '#39' ha"'#39
      
        '  + '#39', "Irrigado":"'#39' + case when T.Irrigado=1 then '#39'Sim'#39' else '#39'N' +
        #227'o'#39' end + '#39'"'#39
      
        '  + '#39', "DataPlantio":"'#39' + case when DataPlantio is not null  the' +
        'n convert(varchar(10),T.DataPlantio,103) else '#39' '#39' end + '#39'"'#39
      
        '  + '#39', "Idade":"'#39' + case when DataPlantio is not null  then cast' +
        '(DATEDIFF(hour,T.DataPlantio,GETDATE())/8766 as varchar(max)) el' +
        'se '#39'-'#39' end+ '#39' anos"'#39
      '  +'#39'}'#39'from Talhoes T'
      '  where T.IDPropriedade='#39'1'#39
      '  and T.idTalhao is not null'
      ' for xml path('#39#39'), type'
      ').value('#39'.'#39', '#39'varchar(max)'#39'), 1, 1, '#39#39') + '#39']'#39' as JSON')
    Left = 328
    Top = 200
    object JSONJSON: TMemoField
      FieldName = 'JSON'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
end
