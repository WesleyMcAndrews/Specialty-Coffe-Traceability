object IWFormEditarLoteAmostra: TIWFormEditarLoteAmostra
  Left = 0
  Top = 0
  Width = 899
  Height = 677
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  ActiveControl = AssociadosCombo
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
    Top = 499
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
    TabOrder = 7
    OnClick = SalvarBtnClick
  end
  object CancelarBtn: TIWButton
    Left = 144
    Top = 499
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
    TabOrder = 8
    OnClick = VoltarLinkClick
  end
  object CadastradoPor: TIWDBLabel
    Left = 24
    Top = 466
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
    Top = 466
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
  object AssociadosCombo: TIWDBLookupComboBox
    Left = 40
    Top = 128
    Width = 233
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
    Required = True
    RequireSelection = False
    ScriptEvents = <>
    UseSize = False
    OnAsyncChange = AssociadosComboAsyncChange
    Style = stNormal
    ButtonColor = clBtnFace
    Editable = True
    NonEditableAsLabel = False
    SubmitOnAsyncEvent = True
    TabOrder = 1
    AutoEditable = False
    DataField = 'IDAssociado'
    DataSource = LotesSrc
    FriendlyName = 'Associados'
    KeyField = 'IDAssociado'
    ListField = 'Associado'
    ListSource = AssociadosSrc
    DisableWhenEmpty = True
  end
  object PropriedadesCombo: TIWDBLookupComboBox
    Left = 40
    Top = 168
    Width = 233
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
    Required = True
    RequireSelection = False
    ScriptEvents = <>
    UseSize = False
    Style = stNormal
    ButtonColor = clBtnFace
    Editable = True
    NonEditableAsLabel = False
    SubmitOnAsyncEvent = True
    TabOrder = 2
    AutoEditable = False
    DataField = 'IDPropriedade'
    DataSource = LotesSrc
    FriendlyName = 'Propriedade'
    KeyField = 'IDPropriedade'
    ListField = 'Propriedade'
    ListSource = PropriedadesSrc
    DisableWhenEmpty = True
  end
  object QtdeEdit: TIWDBEdit
    Left = 40
    Top = 328
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
    FriendlyName = 'Qtde'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 6
    AutoEditable = False
    DataField = 'QtdeKg'
    PasswordPrompt = False
    DataSource = LotesSrc
  end
  object SafraCombo: TIWDBComboBox
    Left = 40
    Top = 208
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
    TabOrder = 3
    AutoEditable = False
    DataField = 'Safra'
    DataSource = LotesSrc
    FriendlyName = 'Safra'
    ItemIndex = -1
    Items.Strings = (
      '2015/2016'
      '2016/2017'
      '2017/2018'
      '2018/2019'
      '2019/2020'
      '2020/2021')
    Sorted = False
  end
  object ProfileLogoutLink: TIWLink
    Left = 762
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
    Left = 762
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
  object MulticomboTalhoes: TIWDBEdit
    Left = 40
    Top = 248
    Width = 233
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'MulticomboTalhoes'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 4
    OnAsyncChange = MulticomboTalhoesAsyncChange
    AutoEditable = False
    DataField = 'Talhoes'
    PasswordPrompt = False
    DataSource = LotesSrc
  end
  object MetodoPreparo: TIWDBComboBox
    Left = 40
    Top = 288
    Width = 179
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
    TabOrder = 5
    AutoEditable = False
    DataField = 'MetodoPreparo'
    DataSource = LotesSrc
    FriendlyName = 'Metodo Preparo'
    ItemIndex = -1
    Items.Strings = (
      'Boia'
      'Cereja Descascado'
      'Cereja Despolpado'
      'Fully Washed'
      'Natural'
      'Verde Descascado')
    Sorted = True
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'editarLoteAmostra.html'
    RenderStyles = False
    Left = 528
    Top = 312
  end
  object IWJQueryWidget1: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      '')
    Left = 536
    Top = 200
  end
  object Lotes: TADODataSet
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    CommandText = 'Select * from Lotes'
    Parameters = <>
    Left = 344
    Top = 40
    object LotesIDLote: TAutoIncField
      FieldName = 'IDLote'
      ReadOnly = True
    end
    object LotesIDAssociado: TIntegerField
      FieldName = 'IDAssociado'
    end
    object LotesIDPropriedade: TStringField
      FieldName = 'IDPropriedade'
    end
    object LotesTalhoes: TStringField
      FieldName = 'Talhoes'
      Size = 50
    end
    object LotesSafra: TStringField
      FieldName = 'Safra'
      Size = 9
    end
    object LotesMetodoPreparo: TStringField
      FieldName = 'MetodoPreparo'
      Size = 50
    end
    object LotesQtdeKg: TIntegerField
      FieldName = 'QtdeKg'
    end
    object LotesIDUsuarioCadastro: TIntegerField
      FieldName = 'IDUsuarioCadastro'
    end
    object LotesDataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
    end
    object LotesIDUsuarioEdicao: TIntegerField
      FieldName = 'IDUsuarioEdicao'
    end
    object LotesDataEdicao: TDateTimeField
      FieldName = 'DataEdicao'
    end
  end
  object LotesSrc: TDataSource
    DataSet = Lotes
    Left = 344
    Top = 96
  end
  object Usuarios: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    DataSource = LotesSrc
    Parameters = <
      item
        Name = 'IDLote'
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
      'from Lotes A'
      'left join Usuarios UC on UC.IDUsuario=A.IDUsuarioCadastro'
      'left join Usuarios UE on UE.IDUsuario=A.IDUsuarioEdicao'
      'where A.IDLote=:IDLote'
      '')
    Left = 712
    Top = 40
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
    Left = 712
    Top = 96
  end
  object Propriedades: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select P.IDPropriedade, P.NomePropriedade+'#39' - '#39'+M.NomeMunicipio+' +
        #39'-'#39'+M.UF Propriedade'
      'from propriedades P'
      
        'left join MunicipiosIBGE M on M.CodigoMunicipio=P.CodigoMunicipi' +
        'o'
      'Where P.IDAssociado=1'
      'and P.IDPropriedade is not null'
      'order by P.NomePropriedade')
    Left = 528
    Top = 40
    object PropriedadesIDPropriedade: TStringField
      FieldName = 'IDPropriedade'
    end
    object PropriedadesPropriedade: TStringField
      FieldName = 'Propriedade'
      ReadOnly = True
      Size = 206
    end
  end
  object PropriedadesSrc: TDataSource
    DataSet = Propriedades
    Left = 528
    Top = 96
  end
  object Associados: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select IDAssociado, NomeAssociado+'#39' - '#39'+CNPJAssociado Associado'
      'from Associados'
      'where IDCliente=1'
      'and IDAssociado=1'
      'order by NomeAssociado')
    Left = 432
    Top = 40
    object AssociadosIDAssociado: TAutoIncField
      FieldName = 'IDAssociado'
      ReadOnly = True
    end
    object AssociadosAssociado: TStringField
      FieldName = 'Associado'
      ReadOnly = True
      Size = 223
    end
  end
  object AssociadosSrc: TDataSource
    DataSet = Associados
    Left = 432
    Top = 96
  end
  object Talhoes: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select T.IDTalhao, T.NomeTalhao'
      'from Talhoes T'
      'where T.IDPropriedade=1'
      'order by T.NomeTalhao')
    Left = 624
    Top = 40
    object TalhoesIDTalhao: TAutoIncField
      FieldName = 'IDTalhao'
      ReadOnly = True
    end
    object TalhoesNomeTalhao: TStringField
      FieldName = 'NomeTalhao'
      Size = 50
    end
  end
  object TalhoesSrc: TDataSource
    DataSet = Talhoes
    Left = 624
    Top = 96
  end
end
