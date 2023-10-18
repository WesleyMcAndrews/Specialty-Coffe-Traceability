object IWFormListarAmostras: TIWFormListarAmostras
  Left = 0
  Top = 0
  Width = 837
  Height = 400
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  HiddenFields.Strings = (
    'IDLOTETOEDIT='
    'IDAMOSTRATOEDIT=')
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
  object IncluirAmostra: TIWLink
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
    OnClick = IncluirAmostraClick
    TabOrder = 4
    RawText = False
    Caption = 'IncluirAmostra'
  end
  object EditarAmostra: TIWLink
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
    OnClick = EditarAmostraClick
    TabOrder = 5
    RawText = False
    Caption = 'EditarAmostra'
  end
  object ExcluirAmostra: TIWLink
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
    FriendlyName = 'ExcluirAmostra'
    OnClick = ExcluirAmostraClick
    TabOrder = 6
    RawText = False
    Caption = 'ExcluirAmostra'
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
    Templates.Default = 'listarAmostras.html'
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
        'QtdeKg, L.DataCadastro,'
      
        'L.MetodoPreparo, N.NomesTalhoes, Case when Json is null then '#39'{}' +
        #39' else Json end as Json'
      'from Lotes L'
      'left join Propriedades P on P.IDPropriedade=L.IDPropriedade'
      'left join Associados A on A.IDAssociado=P.IDAssociado'
      'left join NomesTalhoesLote N on N.IDLote=L.IDLote'
      'left join Timeline T on T.IDLote=L.IDLote'
      'Where A.IDCliente=2'
      'and L.IDAssociado=1'
      'and L.IDPropriedade=1'
      'and L.Safra='#39'1'#39
      'order by L.DataCadastro desc'
      '')
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
    object LotesNomesTalhoes: TMemoField
      DisplayLabel = 'talhoes'
      FieldName = 'NomesTalhoes'
      ReadOnly = True
      BlobType = ftMemo
    end
    object LotesQtdeKg: TIntegerField
      DisplayLabel = 'qtde'
      FieldName = 'QtdeKg'
      DisplayFormat = '0,000'
    end
    object LotesMetodoPreparo: TStringField
      DisplayLabel = 'preparo'
      FieldName = 'MetodoPreparo'
      Size = 50
    end
    object LotesDataCadastro: TDateTimeField
      DisplayLabel = 'dtcadastro'
      FieldName = 'DataCadastro'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object LotesJson: TMemoField
      DisplayLabel = 'json'
      FieldName = 'Json'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
  object Amostras: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select A.IDAmostra, A.DataEntrada, A.TipoAmostra, A.EtapaProcess' +
        'o, A.QtdeKg, A.DataDevolutiva'
      'from amostrasLotes A'
      'where IDLote is not null'
      'order by A.DataEntrada Desc')
    Left = 248
    Top = 8
    object AmostrasIDAmostra: TAutoIncField
      DisplayLabel = 'id'
      FieldName = 'IDAmostra'
      ReadOnly = True
    end
    object AmostrasDataEntrada: TDateTimeField
      DisplayLabel = 'entrada'
      FieldName = 'DataEntrada'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object AmostrasTipoAmostra: TStringField
      DisplayLabel = 'tipo'
      FieldName = 'TipoAmostra'
    end
    object AmostrasEtapaProcesso: TStringField
      DisplayLabel = 'etapa'
      FieldName = 'EtapaProcesso'
      Size = 50
    end
    object AmostrasQtdeKg: TIntegerField
      DisplayLabel = 'qtde'
      FieldName = 'QtdeKg'
      DisplayFormat = '00'
    end
    object AmostrasDataDevolutiva: TDateTimeField
      DisplayLabel = 'devolutiva'
      FieldName = 'DataDevolutiva'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object IWJQueryLotes: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      '  var jsonFasesCultura='#39#39';'
      '  $fasesCultura = [];'
      '  $.getJSON( jsonFasesCultura, function( data ) {'
      '    $fasesCultura = data;'
      '  });'
      ''
      '  var oTable =  $('#39'#lotes'#39').DataTable( {'
      '       // "ajax": "{'#39'data'#39': []}",'
      '        "columns": ['
      '            {'
      '                "className":      '#39'details-control'#39','
      '                "orderable":      false,'
      '                "data":           null,'
      '                "defaultContent": '#39#39
      '            },'
      
        '            { "data": "id", "title": "N'#186' Lote", className: "dt-c' +
        'enter" },'
      '            { "data": "propriedade", "title": "Propriedade" },'
      '            { "data": "associado", "title": "Associado" },'
      
        '            { "data": "safra", "title": "Safra", className: "dt-' +
        'center" },'
      '            { "data": "talhoes", "title": "Talh'#245'es" },'
      '            { "data": "preparo", "title": "Preparo" },'
      '            { "data": "qtde", "title": "Qtde(Kg)" },'
      '            { "data": "json", "visible": false }'
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );'
      ''
      '   $('#39'#lotes tbody'#39').on( '#39'click'#39', '#39'tr'#39', function () {'
      '       if ( $(this).hasClass('#39'detalhe'#39') ) {'
      '           return;'
      '        };'
      ''
      '        if ( $(this).hasClass('#39'selected'#39') ) {'
      '            $(this).removeClass('#39'selected'#39');'
      '            $('#39'#HIDDEN_IDLOTETOEDIT'#39').val(null);'
      '            $('#39'#HIDDEN_IDAMOSTRATOEDIT'#39').val(null);'
      '            $('#39'#AMOSTRASDIV'#39').hide();'
      '        }'
      '        else {'
      '            oTable.$('#39'tr.selected'#39').removeClass('#39'selected'#39');'
      '            $(this).addClass('#39'selected'#39');'
      '            var sID = oTable.row(this).data();'
      '            $('#39'#HIDDEN_IDLOTETOEDIT'#39').val(sID['#39'id'#39']);'
      
        '            executeAjaxEvent("&id="+$('#39'#HIDDEN_IDLOTETOEDIT'#39').va' +
        'l(), null,"MyAjaxHandler",false, null, false);'
      '            $('#39'#AMOSTRASDIV'#39').show();'
      '        }'
      '    } );'
      ''
      ' '
      '     // Add event listener for opening and closing details'
      
        '    $('#39'#lotes tbody'#39').on('#39'click'#39', '#39'td.details-control'#39', function' +
        ' () {'
      '        var tr = $(this).closest('#39'tr'#39');'
      '        var row = oTable.row( tr );'
      ' '
      '        if ( row.child.isShown() ) {'
      '            // This row is already open - close it'
      '            row.child.hide();'
      '            tr.removeClass('#39'shown'#39');'
      '        }'
      '        else {'
      '            // Open this row'
      
        '            row.child( ListarAmostras.formatTimeline($(this), ro' +
        'w.data()) ).show();'
      '            row.child().addClass('#39'detalhe'#39');'
      '            tr.addClass('#39'shown'#39');'
      '        }'
      '    } );')
    Left = 552
    Top = 280
  end
  object IWJQueryAmostras: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      ''
      '  var oAmostras =  $('#39'#amostras'#39').dataTable( {'
      '        /*   "ajax": ,*/'
      '        "columns": ['
      '            { "data": "id", "visible": false },'
      
        '            { "data": "entrada", "title": "Entrada", className: ' +
        '"dt-center" },'
      '            { "data": "tipo", "title": "Tipo de Amostra" },'
      '            { "data": "etapa", "title": "Etapa" },'
      
        '            { "data": "qtde", "title": "Qtde(kg)", className: "d' +
        't-right" },'
      
        '            { "data": "devolutiva", "title": "Devolutiva", class' +
        'Name: "dt-center" }'
      ''
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );'
      ''
      '   $('#39'#amostras tbody'#39').on( '#39'click'#39', '#39'tr'#39', function () {'
      '        if ( $(this).hasClass('#39'selected'#39') ) {'
      '            $(this).removeClass('#39'selected'#39');'
      '            $('#39'#HIDDEN_IDAMOSTRATOEDIT'#39').val(null);'
      '        }'
      '        else {'
      '            oAmostras.$('#39'tr.selected'#39').removeClass('#39'selected'#39');'
      '            $(this).addClass('#39'selected'#39');'
      '            var sID = oAmostras.fnGetData($(this));'
      '           $('#39'#HIDDEN_IDAMOSTRATOEDIT'#39').val(sID['#39'id'#39']);'
      '        }'
      '    } );'
      ' '
      '    $('#39'#button'#39').click( function () {'
      '        oAmostras.row('#39'.selected'#39').remove().draw( false );'
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
  object FasesProducao: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select F.Json'
      'from Clientes C'
      'left join JsonFasesProducaoCultura F on C.IdCultura=F.IdCultura'
      'where idCliente=1')
    Left = 344
    Top = 8
    object FasesProducaoJson: TMemoField
      FieldName = 'Json'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
end
