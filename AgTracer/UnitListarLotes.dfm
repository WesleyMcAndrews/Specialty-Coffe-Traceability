object IWFormListarLotes: TIWFormListarLotes
  Left = 0
  Top = 0
  Width = 837
  Height = 400
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
  HiddenFields.Strings = (
    'IDLOTETOEDIT='
    'IDTALHAOTOEDIT=')
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
  object IncluirLote: TIWLink
    Left = 24
    Top = 218
    Width = 137
    Height = 17
    Cursor = crAuto
    Css = 'blueNum'
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderVisibility = False
    StyleRenderOptions.RenderStatus = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    ScriptEvents = <>
    DoSubmitValidation = False
    FriendlyName = 'IncluirLote'
    OnClick = IncluirLoteClick
    TabOrder = 1
    RawText = False
    Caption = 'IncluirLote'
  end
  object EditarLote: TIWLink
    Left = 24
    Top = 241
    Width = 137
    Height = 17
    Cursor = crAuto
    Css = 'greenNum'
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderVisibility = False
    StyleRenderOptions.RenderStatus = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    ScriptEvents = <>
    DoSubmitValidation = False
    FriendlyName = 'EditarLote'
    OnClick = EditarLoteClick
    TabOrder = 2
    RawText = False
    Caption = 'EditarLote'
  end
  object ExcluirLote: TIWLink
    Left = 24
    Top = 264
    Width = 129
    Height = 17
    Cursor = crAuto
    Css = 'redNum'
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderVisibility = False
    StyleRenderOptions.RenderStatus = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    ScriptEvents = <>
    Confirmation = 'Confirma a Exclus'#227'o deste Lote?'
    DoSubmitValidation = False
    FriendlyName = 'ExcluirLote'
    OnClick = ExcluirLoteClick
    TabOrder = 3
    RawText = False
    Caption = 'ExcluirLote'
  end
  object IncluirTalhao: TIWLink
    Left = 24
    Top = 304
    Width = 120
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
    FriendlyName = 'IWLink1'
    OnClick = IncluirTalhaoClick
    TabOrder = 4
    RawText = False
    Caption = 'IncluirTalhao'
  end
  object EditarTalhao: TIWLink
    Left = 24
    Top = 327
    Width = 120
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
    FriendlyName = 'IWLink1'
    OnClick = EditarTalhaoClick
    TabOrder = 5
    RawText = False
    Caption = 'EditarTalhao'
  end
  object ExcluirTalhao: TIWLink
    Left = 24
    Top = 350
    Width = 120
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
    Confirmation = 'Confirma a Exclus'#227'o deste Talh'#227'o?'
    DoSubmitValidation = False
    FriendlyName = 'ExcluirTalhao'
    OnClick = ExcluirTalhaoClick
    TabOrder = 6
    RawText = False
    Caption = 'ExcluirTalhao'
  end
  object ProfileLogoutLink: TIWLink
    Left = 700
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
  object AssociadosCombo: TIWComboBox
    Left = 40
    Top = 96
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
    BGColor = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = True
    NoSelectionText = '-- Selecione --'
    Required = True
    RequireSelection = True
    ScriptEvents = <>
    UseSize = False
    OnAsyncChange = AssociadosComboAsyncChange
    Style = stNormal
    ButtonColor = clBtnFace
    Editable = True
    NonEditableAsLabel = True
    SubmitOnAsyncEvent = True
    TabOrder = 8
    ItemIndex = -1
    Sorted = False
    FriendlyName = 'Associados'
  end
  object PropriedadesCombo: TIWComboBox
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
    ItemsHaveValues = True
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
    TabOrder = 9
    ItemIndex = -1
    Sorted = False
    FriendlyName = 'Propriedade'
  end
  object SafraCombo: TIWComboBox
    Left = 40
    Top = 155
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
    TabOrder = 10
    ItemIndex = -1
    Items.Strings = (
      '2015/2016'
      '2016/2017'
      '2017/2018'
      '2018/2019'
      '2019/2020'
      '2020/2021')
    Sorted = False
    FriendlyName = 'Safra'
  end
  object BuscarBtn: TIWLink
    Left = 184
    Top = 155
    Width = 89
    Height = 17
    Cursor = crAuto
    Css = 'blueNum'
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    StyleRenderOptions.RenderPosition = False
    StyleRenderOptions.RenderFont = False
    StyleRenderOptions.RenderZIndex = False
    StyleRenderOptions.RenderVisibility = False
    StyleRenderOptions.RenderStatus = False
    StyleRenderOptions.RenderAbsolute = False
    StyleRenderOptions.RenderPadding = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    ScriptEvents = <>
    DoSubmitValidation = False
    FriendlyName = 'Buscar'
    OnAsyncClick = BuscarBtnAsyncClick
    TabOrder = 11
    RawText = False
    Caption = 'BuscarBtn'
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'listarLotes.html'
    RenderStyles = True
    Left = 728
    Top = 296
  end
  object Lotes: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select L.IDLote, P.NomePropriedade, A.NomeAssociado, L.Safra, L.' +
        'QtdeKg, L.DataCadastro'
      'from Lotes L'
      'left join Propriedades P on P.IDPropriedade=L.IDPropriedade'
      'left join Associados A on A.IDAssociado=P.IDAssociado'
      'Where A.IDCliente=1'
      'and L.IDAssociado=1'
      'and L.IDPropriedade=1'
      'and L.Safra='#39'1'#39
      'order by L.DataCadastro desc')
    Left = 160
    Top = 8
    object LotesIDLote: TAutoIncField
      DisplayLabel = 'id'
      FieldName = 'IDLote'
      ReadOnly = True
    end
    object LotesNomePropriedade: TStringField
      DisplayLabel = 'propriedade'
      FieldName = 'NomePropriedade'
      Size = 100
    end
    object LotesNomeAssociado: TStringField
      DisplayLabel = 'associado'
      FieldName = 'NomeAssociado'
      Size = 200
    end
    object LotesSafra: TStringField
      DisplayLabel = 'safra'
      FieldName = 'Safra'
      Size = 9
    end
    object LotesQtdeKg: TIntegerField
      DisplayLabel = 'qtde'
      FieldName = 'QtdeKg'
      DisplayFormat = '0,000'
    end
    object LotesDataCadastro: TDateTimeField
      DisplayLabel = 'dtcadastro'
      FieldName = 'DataCadastro'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object Talhoes: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select L.IDTalhaoLote, T.NomeTalhao, T.Irrigado, L.MetodoPreparo' +
        ', T.Poligono.STArea() Area'
      'from TalhoesLotes L'
      'left join Talhoes T on T.IDTalhao=L.IDTalhao'
      'Where L.IDLote is not null'
      'order by T.NomeTalhao')
    Left = 248
    Top = 8
    object TalhoesIDTalhaoLote: TAutoIncField
      DisplayLabel = 'id'
      FieldName = 'IDTalhaoLote'
      ReadOnly = True
    end
    object TalhoesNomeTalhao: TStringField
      DisplayLabel = 'nome'
      FieldName = 'NomeTalhao'
      Size = 50
    end
    object TalhoesIrrigado: TBooleanField
      DisplayLabel = 'irrigado'
      FieldName = 'Irrigado'
      DisplayValues = 'Sim;N'#227'o'
    end
    object TalhoesMetodoPreparo: TStringField
      DisplayLabel = 'metodo'
      FieldName = 'MetodoPreparo'
      Size = 50
    end
    object TalhoesArea: TFloatField
      DisplayLabel = 'area'
      FieldName = 'Area'
      ReadOnly = True
      DisplayFormat = '.00'
    end
  end
  object IWJQueryLotes: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      ''
      '  var oTable =  $('#39'#lotes'#39').dataTable( {'
      '       // "ajax": "{'#39'data'#39': []}",'
      '        "columns": ['
      
        '            { "data": "id", "title": "N'#186' Lote", className: "dt-c' +
        'enter" },'
      '            { "data": "propriedade", "title": "Propriedade" },'
      '            { "data": "associado", "title": "Associado" },'
      
        '            { "data": "safra", "title": "Safra", className: "dt-' +
        'center" },'
      '            { "data": "qtde", "title": "Qtde(Kg)" },'
      
        '            { "data": "dtcadastro", "title": "Data Cadastro", cl' +
        'assName: "dt-center" }'
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );'
      ''
      '   $('#39'#lotes tbody'#39').on( '#39'click'#39', '#39'tr'#39', function () {'
      '        if ( $(this).hasClass('#39'selected'#39') ) {'
      '            $(this).removeClass('#39'selected'#39');'
      '            $('#39'#HIDDEN_IDLOTETOEDIT'#39').val(null);'
      '            $('#39'#HIDDEN_IDTALHAOTOEDIT'#39').val(null);'
      '            $('#39'#TALHOESDIV'#39').hide();'
      '        }'
      '        else {'
      '            oTable.$('#39'tr.selected'#39').removeClass('#39'selected'#39');'
      '            $(this).addClass('#39'selected'#39');'
      '            var sID = oTable.fnGetData($(this));'
      '            $('#39'#HIDDEN_IDLOTETOEDIT'#39').val(sID['#39'id'#39']);'
      
        '            executeAjaxEvent("&id="+$('#39'#HIDDEN_IDLOTETOEDIT'#39').va' +
        'l(), null,"MyAjaxHandler",false, null, false);'
      '            $('#39'#TALHOESDIV'#39').show();'
      '        }'
      '    } );'
      ' '
      '    $('#39'#button'#39').click( function () {'
      '        oTable.row('#39'.selected'#39').remove().draw( false );'
      '    } );')
    Left = 552
    Top = 280
  end
  object IWJQueryTalhoes: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      ''
      '  var oTalhao =  $('#39'#talhoes'#39').dataTable( {'
      '        /*   "ajax": ,*/'
      '        "columns": ['
      '            { "data": "id", "visible": false },'
      '            { "data": "nome", "title": "Nome do Talh'#227'o" },'
      
        '            { "data": "irrigado", "title": "Irrigado", className' +
        ': "dt-center" },'
      '            { "data": "metodo", "title": "M'#233'todo de Preparo" },'
      '            { "data": "area", "title": "'#193'rea" }'
      ''
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );'
      ''
      '   $('#39'#talhoes tbody'#39').on( '#39'click'#39', '#39'tr'#39', function () {'
      '        if ( $(this).hasClass('#39'selected'#39') ) {'
      '            $(this).removeClass('#39'selected'#39');'
      '            $('#39'#HIDDEN_IDTALHAOTOEDIT'#39').val(null);'
      '        }'
      '        else {'
      '            oTalhao.$('#39'tr.selected'#39').removeClass('#39'selected'#39');'
      '            $(this).addClass('#39'selected'#39');'
      '            var sID = oTalhao.fnGetData($(this));'
      '           $('#39'#HIDDEN_IDTALHAOTOEDIT'#39').val(sID['#39'id'#39']);'
      '        }'
      '    } );'
      ' '
      '    $('#39'#button'#39').click( function () {'
      '        oTalhao.row('#39'.selected'#39').remove().draw( false );'
      '    } );')
    Left = 552
    Top = 336
  end
  object Associados: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select IDAssociado, NomeAssociado+'#39' - '#39'+CNPJAssociado Associado'
      'from Associados'
      'where IDCliente=1'
      'order by NomeAssociado')
    Left = 448
    Top = 16
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
    Left = 448
    Top = 72
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
      'order by P.NomePropriedade')
    Left = 544
    Top = 16
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
    Left = 544
    Top = 72
  end
end
