object IWFormListarPropriedades: TIWFormListarPropriedades
  Left = 0
  Top = 0
  Width = 848
  Height = 400
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  HiddenFields.Strings = (
    'IDTOEDIT='
    'IDPREMIOTOEDIT=')
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
  object IncluirPropriedade: TIWLink
    Left = 16
    Top = 130
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
    FriendlyName = 'IncluirPropriedade'
    OnClick = IncluirPropriedadeClick
    TabOrder = 1
    RawText = False
    Caption = 'IncluirPropriedade'
  end
  object EditarPropriedade: TIWLink
    Left = 16
    Top = 153
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
    FriendlyName = 'EditarPropriedade'
    OnClick = EditarPropriedadeClick
    TabOrder = 2
    RawText = False
    Caption = 'EditarPropriedade'
  end
  object ExcluirPropriedade: TIWLink
    Left = 16
    Top = 176
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
    Confirmation = 'Confirma a Exclus'#227'o desta Propriedade?'
    DoSubmitValidation = False
    FriendlyName = 'ExcluirPropriedade'
    OnClick = ExcluirPropriedadeClick
    TabOrder = 3
    RawText = False
    Caption = 'ExcluirPropriedade'
  end
  object IncluirPremio: TIWLink
    Left = 16
    Top = 312
    Width = 100
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
    FriendlyName = 'IncluirPremio'
    OnClick = IncluirPremioClick
    TabOrder = 4
    RawText = False
    Caption = 'IncluirPremio'
  end
  object EditarPremio: TIWLink
    Left = 16
    Top = 335
    Width = 100
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
    OnClick = EditarPremioClick
    TabOrder = 5
    RawText = False
    Caption = 'EditarPremio'
  end
  object ExcluirPremio: TIWLink
    Left = 16
    Top = 358
    Width = 100
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
    Confirmation = 'Confirma a Exclus'#227'o deste Pr'#234'mio?'
    DoSubmitValidation = False
    FriendlyName = 'IWLink1'
    OnClick = ExcluirPremioClick
    TabOrder = 6
    RawText = False
    Caption = 'ExcluirPremio'
  end
  object EditarTalhoes: TIWLink
    Left = 16
    Top = 239
    Width = 121
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
    FriendlyName = 'Editar Talhoes'
    OnClick = EditarTalhoesClick
    TabOrder = 7
    RawText = False
    Caption = 'EditarTalhoes'
  end
  object ProfileLogoutLink: TIWLink
    Left = 671
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
    TabOrder = 8
    RawText = False
    Caption = 'ProfileLogoutLink'
  end
  object UserName: TIWLabel
    Left = 680
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
    Templates.Default = 'listarPropriedades.html'
    RenderStyles = True
    Left = 440
    Top = 8
  end
  object Propriedades: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select P.IDPropriedade, P.NomePropriedade, M.NomeMunicipio+'#39'-'#39'+M' +
        '.UF NomeMunicipio,'
      'A.NomeAssociado, AP.Area'
      'from Propriedades P'
      
        'left join MunicipiosIBGE M on M.CodigoMunicipio=P.CodigoMunicipi' +
        'o'
      'left join Associados A on A.IDAssociado=P.IDAssociado'
      
        'left join AreasPropriedades AP on AP.IDPropriedade=P.IDProprieda' +
        'de'
      'where A.IDCliente=1'
      'order by P.NomePropriedade')
    Left = 160
    Top = 8
    object PropriedadesIDPropriedade: TStringField
      DisplayLabel = 'id'
      FieldName = 'IDPropriedade'
    end
    object PropriedadesNomePropriedade: TStringField
      DisplayLabel = 'propriedade'
      FieldName = 'NomePropriedade'
      Size = 100
    end
    object PropriedadesNomeMunicipio: TStringField
      DisplayLabel = 'municipio'
      FieldName = 'NomeMunicipio'
      ReadOnly = True
      Size = 103
    end
    object PropriedadesNomeAssociado: TStringField
      DisplayLabel = 'associado'
      FieldName = 'NomeAssociado'
      Size = 200
    end
    object PropriedadesArea: TFloatField
      DisplayLabel = 'area'
      FieldName = 'Area'
      ReadOnly = True
      DisplayFormat = '0.00 ha'
    end
  end
  object Premios: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select IDPremio, Safra, Premio'
      'from PremiosPropriedades'
      'where IDPropriedade='#39'1'#39
      'order by Safra')
    Left = 312
    Top = 8
    object PremiosIDPremio: TAutoIncField
      DisplayLabel = 'id'
      FieldName = 'IDPremio'
      ReadOnly = True
    end
    object PremiosSafra: TStringField
      DisplayLabel = 'safra'
      FieldName = 'Safra'
      Size = 10
    end
    object PremiosPremio: TStringField
      DisplayLabel = 'premio'
      FieldName = 'Premio'
      Size = 50
    end
  end
  object Talhoes: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select IDTalhao, NomeTalhao, Irrigado, poligono.STArea()/10000 A' +
        'rea'
      'from Talhoes'
      'where IDPropriedade='#39'1'#39
      'order by NomeTalhao')
    Left = 248
    Top = 8
    object TalhoesIDTalhao: TAutoIncField
      DisplayLabel = 'id'
      FieldName = 'IDTalhao'
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
    object TalhoesArea: TFloatField
      DisplayLabel = 'area'
      FieldName = 'Area'
      ReadOnly = True
      DisplayFormat = '0.00 ha'
    end
  end
  object IWJQueryPropriedades: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      ''
      '  var oTable =  $('#39'#propriedades'#39').dataTable( {'
      '        "ajax": "../../../../examples/ajax/data/objects.txt",'
      '        "columns": ['
      '            { "data": "id", "visible": false },'
      '            { "data": "propriedade", "title": "Propriedade" },'
      '            { "data": "municipio", "title": "Munic'#237'pio" },'
      '            { "data": "associado", "title": "Associado" },'
      
        '            { "data": "area", "title": "'#193'rea", className: "dt-ri' +
        'ght" }'
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );'
      ''
      '   $('#39'#propriedades tbody'#39').on( '#39'click'#39', '#39'tr'#39', function () {'
      '        if ( $(this).hasClass('#39'selected'#39') ) {'
      '            $(this).removeClass('#39'selected'#39');'
      '            $('#39'#HIDDEN_IDTOEDIT'#39').val(null);'
      '            $('#39'#HIDDEN_IDPREMIOTOEDIT'#39').val(null);'
      '            $('#39'#PREMIOSDIV'#39').hide();'
      '            $('#39'#TALHOESDIV'#39').hide();'
      '        }'
      '        else {'
      '            ShowBusy(true); //Show Intraweb "loading animation"'
      '            oTable.$('#39'tr.selected'#39').removeClass('#39'selected'#39');'
      '            $(this).addClass('#39'selected'#39');'
      '            var sID = oTable.fnGetData($(this));'
      '            $('#39'#HIDDEN_IDTOEDIT'#39').val(sID['#39'id'#39']);'
      
        '            executeAjaxEvent("&id="+$('#39'#HIDDEN_IDTOEDIT'#39').val(),' +
        ' null,"MyAjaxHandler",false, null, false);'
      '            $('#39'#PREMIOSDIV'#39').show();'
      '            $('#39'#TALHOESDIV'#39').show();'
      '            //oPremio.ajax.reload();'
      '            //oTalhao.ajax.reload();'
      '        }'
      '    } );'
      ' '
      '    $('#39'#button'#39').click( function () {'
      '        oTable.row('#39'.selected'#39').remove().draw( false );'
      '    } );')
    Left = 456
    Top = 184
  end
  object IWJQueryPremios: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      ''
      '  var oPremio =  $('#39'#premios'#39').dataTable( {'
      '        /*   "ajax": ,*/'
      '        "columns": ['
      '            { "data": "id", "visible": false },'
      
        '            { "data": "safra", "title": "Safra", className: "dt-' +
        'center"  },'
      '            { "data": "premio", "title": "Pr'#234'mio" }'
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );'
      ''
      '   $('#39'#premios tbody'#39').on( '#39'click'#39', '#39'tr'#39', function () {'
      '        if ( $(this).hasClass('#39'selected'#39') ) {'
      '            $(this).removeClass('#39'selected'#39');'
      '            $('#39'#HIDDEN_IDPREMIOTOEDIT'#39').val(null);'
      '        }'
      '        else {'
      '            oPremio.$('#39'tr.selected'#39').removeClass('#39'selected'#39');'
      '            $(this).addClass('#39'selected'#39');'
      '            var sID = oPremio.fnGetData($(this));'
      '           $('#39'#HIDDEN_IDPREMIOTOEDIT'#39').val(sID['#39'id'#39']);'
      '        }'
      '    } );'
      ' '
      '    $('#39'#button'#39').click( function () {'
      '        oPremio.row('#39'.selected'#39').remove().draw( false );'
      '    } );')
    Left = 456
    Top = 312
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
      
        '            { "data": "area", "title": "'#193'rea", className: "dt-ri' +
        'ght" }'
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );')
    Left = 456
    Top = 248
  end
end
