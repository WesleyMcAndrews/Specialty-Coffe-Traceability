object IWFormEditarConcurso: TIWFormEditarConcurso
  Left = 0
  Top = 0
  Width = 871
  Height = 659
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
  object NomeConcurso: TIWDBEdit
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
    NonEditableAsLabel = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'NomeConcurso'
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
    TabOrder = 1
    AutoEditable = False
    DataField = 'NomeConcurso'
    PasswordPrompt = False
    DataSource = ConcursosSrc
  end
  object DataIniPreSelecao: TIWDBEdit
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
    NonEditableAsLabel = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 7
    AutoEditable = False
    DataField = 'DtIniPreSelecao'
    PasswordPrompt = False
    DataSource = ConcursosSrc
  end
  object DataFimPreSelecao: TIWDBEdit
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
    NonEditableAsLabel = False
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
    DataField = 'DtFimPreSelecao'
    PasswordPrompt = False
    DataSource = ConcursosSrc
  end
  object MultiComboCategorias: TIWDBEdit
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
    NonEditableAsLabel = False
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
    DataField = 'Categorias'
    PasswordPrompt = False
    DataSource = ConcursosSrc
  end
  object NomeEdicao: TIWDBEdit
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
    NonEditableAsLabel = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 2
    AutoEditable = False
    DataField = 'NomeEdicao'
    PasswordPrompt = False
    DataSource = ConcursosSrc
  end
  object DataFimSelecao: TIWDBEdit
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
    Editable = True
    NonEditableAsLabel = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 10
    AutoEditable = False
    DataField = 'DtFimSelecao'
    PasswordPrompt = False
    DataSource = ConcursosSrc
  end
  object DataIniSelecao: TIWDBEdit
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
    Editable = True
    NonEditableAsLabel = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 9
    AutoEditable = False
    DataField = 'DtIniSelecao'
    PasswordPrompt = False
    DataSource = ConcursosSrc
  end
  object DataPremiacao: TIWDBEdit
    Left = 32
    Top = 383
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
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 11
    AutoEditable = False
    DataField = 'DtPremiacao'
    PasswordPrompt = False
    DataSource = ConcursosSrc
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
    TabOrder = 13
    OnClick = SalvarBtnClick
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
    TabOrder = 14
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
    TabOrder = 15
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
  object DataEntregaAmostras: TIWDBEdit
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
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 6
    AutoEditable = False
    DataField = 'DtEntregaAmostras'
    PasswordPrompt = False
    DataSource = ConcursosSrc
  end
  object QtdePremiadosPorCategoria: TIWDBEdit
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
    Editable = True
    NonEditableAsLabel = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'CodigoMunicipio'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 5
    AutoEditable = False
    DataField = 'NroPremiadosPorCategoria'
    PasswordPrompt = False
    DataSource = ConcursosSrc
  end
  object QtdePtsPreSelecao: TIWDBEdit
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
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 4
    AutoEditable = False
    DataField = 'PtsPreSelecao'
    PasswordPrompt = False
    DataSource = ConcursosSrc
  end
  object ArquivoRegulamento: TIWFileUploader
    Left = 32
    Top = 424
    Width = 321
    Height = 65
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
    TabOrder = 12
    MaxFileSize = 20971520
    TextStrings.DragText = 'Drop files here to upload'
    TextStrings.UploadButtonText = 'Selecione um arquivo PDF'
    TextStrings.CancelButtonText = 'Cancel'
    TextStrings.UploadErrorText = 'Upload failed'
    TextStrings.MultipleFileDropNotAllowedText = 'You may only drop a single file'
    TextStrings.OfTotalText = 'of'
    TextStrings.TypeErrorText = 
      '{file} has an invalid extension. Only {extensions} files are all' +
      'owed.'
    TextStrings.SizeErrorText = '{file} is too large, maximum file size is {sizeLimit}.'
    TextStrings.MinSizeErrorText = '{file} is too small, minimum file size is {minSizeLimit}.'
    TextStrings.EmptyErrorText = '{file} is empty, please select files again without it.'
    TextStrings.NoFilesErrorText = 'No files to upload.'
    TextStrings.OnLeaveWarningText = 
      'The files are being uploaded, if you leave now the upload will b' +
      'e cancelled.'
    Style.ButtonOptions.Alignment = taCenter
    Style.ButtonOptions.BGColor = clWebMAROON
    Style.ButtonOptions.Font.Color = clWebWHITE
    Style.ButtonOptions.Font.FontFamily = 'Arial, Sans-Serif, Verdana'
    Style.ButtonOptions.Font.Size = 10
    Style.ButtonOptions.Font.Style = []
    Style.ButtonOptions.Height = 30
    Style.ButtonOptions.Width = 200
    Style.ButtonHoverOptions.Alignment = taCenter
    Style.ButtonHoverOptions.BGColor = 214
    Style.ButtonHoverOptions.Font.Color = clWebWHITE
    Style.ButtonHoverOptions.Font.FontFamily = 'Arial, Sans-Serif, Verdana'
    Style.ButtonHoverOptions.Font.Size = 10
    Style.ButtonHoverOptions.Font.Style = []
    Style.ListOptions.Alignment = taLeftJustify
    Style.ListOptions.BGColor = clWebGOLD
    Style.ListOptions.Font.Color = clWebBLACK
    Style.ListOptions.Font.FontFamily = 'Arial, Sans-Serif, Verdana'
    Style.ListOptions.Font.Size = 10
    Style.ListOptions.Font.Style = []
    Style.ListOptions.Height = 30
    Style.ListOptions.Width = 0
    Style.ListSuccessOptions.Alignment = taLeftJustify
    Style.ListSuccessOptions.BGColor = clWebFORESTGREEN
    Style.ListSuccessOptions.Font.Color = clWebWHITE
    Style.ListSuccessOptions.Font.FontFamily = 'Arial, Sans-Serif, Verdana'
    Style.ListSuccessOptions.Font.Size = 10
    Style.ListSuccessOptions.Font.Style = []
    Style.ListErrorOptions.Alignment = taLeftJustify
    Style.ListErrorOptions.BGColor = clWebRED
    Style.ListErrorOptions.Font.Color = clWebWHITE
    Style.ListErrorOptions.Font.FontFamily = 'Arial, Sans-Serif, Verdana'
    Style.ListErrorOptions.Font.Size = 10
    Style.ListErrorOptions.Font.Style = []
    Style.DropAreaOptions.Alignment = taCenter
    Style.DropAreaOptions.BGColor = clWebDARKORANGE
    Style.DropAreaOptions.Font.Color = clWebWHITE
    Style.DropAreaOptions.Font.FontFamily = 'Arial, Sans-Serif, Verdana'
    Style.DropAreaOptions.Font.Size = 10
    Style.DropAreaOptions.Font.Style = []
    Style.DropAreaOptions.Height = 60
    Style.DropAreaOptions.Width = 0
    Style.DropAreaActiveOptions.Alignment = taCenter
    Style.DropAreaActiveOptions.BGColor = clWebLIMEGREEN
    Style.DropAreaActiveOptions.Font.Color = clWebWHITE
    Style.DropAreaActiveOptions.Font.FontFamily = 'Arial, Sans-Serif, Verdana'
    Style.DropAreaActiveOptions.Font.Size = 10
    Style.DropAreaActiveOptions.Font.Style = []
    Style.DropAreaActiveOptions.Height = 60
    Style.DropAreaActiveOptions.Width = 0
    AllowedExtensions = 'pdf'
    AcceptFiles = 'true'
    AutoSave = True
    OnAsyncUploadCompleted = ArquivoRegulamentoAsyncUploadCompleted
    FriendlyName = 'ArquivoRegulamento'
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'editarConcurso.html'
    RenderStyles = False
    Left = 528
    Top = 312
  end
  object Concursos: TADODataSet
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    CommandText = 'Select * from Concursos'
    Parameters = <>
    Left = 408
    Top = 8
    object ConcursosIDConcurso: TAutoIncField
      FieldName = 'IDConcurso'
      ReadOnly = True
    end
    object ConcursosIDCliente: TIntegerField
      FieldName = 'IDCliente'
    end
    object ConcursosNomeConcurso: TStringField
      FieldName = 'NomeConcurso'
      Size = 200
    end
    object ConcursosNomeEdicao: TStringField
      FieldName = 'NomeEdicao'
      Size = 200
    end
    object ConcursosCategorias: TStringField
      FieldName = 'Categorias'
      Size = 200
    end
    object ConcursosPtsPreSelecao: TIntegerField
      FieldName = 'PtsPreSelecao'
    end
    object ConcursosNroPremiadosPorCategoria: TIntegerField
      FieldName = 'NroPremiadosPorCategoria'
    end
    object ConcursosDtEntregaAmostras: TDateTimeField
      FieldName = 'DtEntregaAmostras'
    end
    object ConcursosDtIniPreSelecao: TDateTimeField
      FieldName = 'DtIniPreSelecao'
    end
    object ConcursosDtFimPreSelecao: TDateTimeField
      FieldName = 'DtFimPreSelecao'
    end
    object ConcursosDtIniSelecao: TDateTimeField
      FieldName = 'DtIniSelecao'
    end
    object ConcursosDtFimSelecao: TDateTimeField
      FieldName = 'DtFimSelecao'
    end
    object ConcursosDtPremiacao: TDateTimeField
      FieldName = 'DtPremiacao'
    end
    object ConcursosArquivoRegulamento: TStringField
      FieldName = 'ArquivoRegulamento'
      Size = 100
    end
    object ConcursosIDUsuarioCadastro: TIntegerField
      FieldName = 'IDUsuarioCadastro'
    end
    object ConcursosDataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
    end
    object ConcursosIDUsuarioEdicao: TIntegerField
      FieldName = 'IDUsuarioEdicao'
    end
    object ConcursosDataEdicao: TDateTimeField
      FieldName = 'DataEdicao'
    end
  end
  object ConcursosSrc: TDataSource
    DataSet = Concursos
    Left = 408
    Top = 64
  end
  object Usuarios: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    DataSource = ConcursosSrc
    Parameters = <
      item
        Name = 'IDConcurso'
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
      'from Concursos A'
      'left join Usuarios UC on UC.IDUsuario=A.IDUsuarioCadastro'
      'left join Usuarios UE on UE.IDUsuario=A.IDUsuarioEdicao'
      'where A.IDConcurso=:IDConcurso')
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
  object UsuariosSrc: TDataSource
    DataSet = Usuarios
    Left = 408
    Top = 192
  end
end
