object IWFormListarAssociados: TIWFormListarAssociados
  Left = 0
  Top = 0
  Width = 868
  Height = 400
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  HiddenFields.Strings = (
    'IDTOEDIT='
    'IDINDIRETOTOEDIT=')
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
  object IncluirDiretoLink: TIWLink
    Left = 32
    Top = 194
    Width = 120
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
    FriendlyName = 'IncluirDiretoLink'
    OnClick = IncluirDiretoLinkClick
    TabOrder = 1
    RawText = False
    Caption = 'IncluirDireto'
  end
  object EditarDiretoLink: TIWLink
    Left = 32
    Top = 217
    Width = 120
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
    FriendlyName = 'EditarDiretoLink'
    OnClick = EditarDiretoLinkClick
    TabOrder = 2
    RawText = False
    Caption = 'EditarDireto'
  end
  object ExcluirDiretoLink: TIWLink
    Left = 32
    Top = 240
    Width = 120
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
    Confirmation = 'Confirma a exclus'#227'o deste associado?'
    DoSubmitValidation = False
    FriendlyName = 'ExcluirDiretoLink'
    OnClick = ExcluirDiretoLinkClick
    TabOrder = 3
    RawText = False
    Caption = 'ExcluirDireto'
  end
  object IncluirIndiretoLink: TIWLink
    Left = 32
    Top = 298
    Width = 120
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
    FriendlyName = 'IncluirDiretoLink'
    OnClick = IncluirIndiretoLinkClick
    TabOrder = 4
    RawText = False
    Caption = 'IncluirInDireto'
  end
  object EditarIndiretoLink: TIWLink
    Left = 32
    Top = 321
    Width = 120
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
    FriendlyName = 'EditarDiretoLink'
    OnClick = EditarIndiretoLinkClick
    TabOrder = 5
    RawText = False
    Caption = 'EditarInDireto'
  end
  object ExcluirIndireto: TIWLink
    Left = 32
    Top = 344
    Width = 120
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
    Confirmation = 'Confirma a exclus'#227'o deste associado?'
    DoSubmitValidation = False
    FriendlyName = 'ExcluirDiretoLink'
    OnClick = ExcluirIndiretoClick
    TabOrder = 6
    RawText = False
    Caption = 'ExcluirIndireto'
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
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'listarAssociados.html'
    RenderStyles = True
    Left = 368
    Top = 288
  end
  object IWJQueryDiretos: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      ''
      '  var oTable =  $('#39'#associados'#39').dataTable( {'
      '        "ajax": "../../../../examples/ajax/data/objects.txt",'
      '        "columns": ['
      '            { "data": "id", "visible": false },'
      '            { "data": "associado", "title": "Associado" },'
      
        '            { "data": "tipoAssociado", "title": "Tipo Associado"' +
        '},'
      '            { "data": "tipoEntidade", "title": "Tipo Entidade"},'
      '            { "data": "municipio", "title": "Munic'#237'pio" },'
      '            { "data": "responsavel", "title": "Respons'#225'vel" }'
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );'
      ''
      '    $('#39'#associados tbody'#39').on( '#39'click'#39', '#39'tr'#39', function () {'
      '        if ( $(this).hasClass('#39'selected'#39') ) {'
      '            $(this).removeClass('#39'selected'#39');'
      '            $('#39'#HIDDEN_IDTOEDIT'#39').val(null);'
      '            $('#39'#HIDDEN_IDINDIRETOTOEDIT'#39').val(null);'
      '            $('#39'#INDIRETOSDIV'#39').hide();'
      '        }'
      '        else {'
      '            oTable.$('#39'tr.selected'#39').removeClass('#39'selected'#39');'
      '            $(this).addClass('#39'selected'#39');'
      '            var sID = oTable.fnGetData($(this));'
      '            $('#39'#HIDDEN_IDTOEDIT'#39').val(sID['#39'id'#39']);'
      '            if (sID['#39'tipoAssociado'#39']=='#39'Direto'#39')'
      '            {'
      
        '                executeAjaxEvent("&id="+$('#39'#HIDDEN_IDTOEDIT'#39').va' +
        'l(), null,"MyAjaxHandler",false, null, false);'
      '                $('#39'#INDIRETOSDIV'#39').show();'
      '            };'
      '            '
      '        }'
      '    } );'
      ' '
      '    $('#39'#button'#39').click( function () {'
      '        oTable.row('#39'.selected'#39').remove().draw( false );'
      '    } );'
      '')
    Left = 448
    Top = 40
  end
  object Associados: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select A.IDAssociado, A.CNPJAssociado, A.NomeAssociado, A.TipoEn' +
        'tidade, A.TipoAssociado,'
      'A.NomeResponsavel, M.NomeMunicipio+'#39'-'#39'+M.UF NomeMunicipio'
      'from Associados A'
      
        'left join MunicipiosIBGE M on M.CodigoMunicipio=A.CodigoMunicipi' +
        'o'
      'Where A.TipoAssociado<>'#39'Indireto'#39
      'and A.IDCliente=1'
      'order by A.NomeAssociado')
    Left = 192
    Top = 56
    object AssociadosIDAssociado: TAutoIncField
      DisplayLabel = 'id'
      FieldName = 'IDAssociado'
      ReadOnly = True
    end
    object AssociadosCNPJAssociado: TStringField
      DisplayLabel = 'cnpj'
      FieldName = 'CNPJAssociado'
      Visible = False
    end
    object AssociadosNomeAssociado: TStringField
      DisplayLabel = 'associado'
      FieldName = 'NomeAssociado'
      Size = 200
    end
    object AssociadosTipoEntidade: TStringField
      DisplayLabel = 'tipoEntidade'
      FieldName = 'TipoEntidade'
    end
    object AssociadosTipoAssociado: TStringField
      DisplayLabel = 'tipoAssociado'
      FieldName = 'TipoAssociado'
      ReadOnly = True
    end
    object AssociadosNomeMunicipio: TStringField
      DisplayLabel = 'municipio'
      FieldName = 'NomeMunicipio'
      Size = 100
    end
    object AssociadosNomeResponsavel: TStringField
      DisplayLabel = 'responsavel'
      FieldName = 'NomeResponsavel'
      Size = 200
    end
  end
  object IWJQueryIndiretos: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      ''
      '  var oIndiretos =  $('#39'#indiretos'#39').dataTable( {'
      '        /*   "ajax": ,*/'
      '       "columns": ['
      '            { "data": "id", "visible": false },'
      '            { "data": "associado", "title": "Associado" },'
      
        '            { "data": "tipoAssociado", "title": "Tipo Associado"' +
        '},'
      '            { "data": "tipoEntidade", "title": "Tipo Entidade"},'
      '            { "data": "municipio", "title": "Munic'#237'pio" },'
      '            { "data": "responsavel", "title": "Respons'#225'vel" }'
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );'
      ''
      '   $('#39'#indiretos tbody'#39').on( '#39'click'#39', '#39'tr'#39', function () {'
      '        if ( $(this).hasClass('#39'selected'#39') ) {'
      '            $(this).removeClass('#39'selected'#39');'
      '            $('#39'#HIDDEN_IDINDIRETOTOEDIT'#39').val(null);'
      '        }'
      '        else {'
      '            oIndiretos.$('#39'tr.selected'#39').removeClass('#39'selected'#39');'
      '            $(this).addClass('#39'selected'#39');'
      '            var sID = oIndiretos.fnGetData($(this));'
      '           $('#39'#HIDDEN_IDINDIRETOTOEDIT'#39').val(sID['#39'id'#39']);'
      '        }'
      '    } );'
      ' '
      '    $('#39'#button'#39').click( function () {'
      '        oIndiretos.row('#39'.selected'#39').remove().draw( false );'
      '    } );')
    Left = 448
    Top = 128
  end
  object Indiretos: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select A.IDAssociado, A.NomeAssociado, M.NomeMunicipio+'#39'-'#39'+M.UF ' +
        'NomeMunicipio,'
      'A.TipoEntidade, A.TipoAssociado, A.NomeResponsavel'
      'from Associados A'
      
        'left join MunicipiosIBGE M on M.CodigoMunicipio=A.CodigoMunicipi' +
        'o'
      'Where A.TipoAssociado='#39'Indireto'#39
      'and A.IDCliente=1'
      'And A.AssociadoDireto=1'
      'order by A.NomeAssociado')
    Left = 192
    Top = 128
    object IndiretosIDAssociado: TAutoIncField
      DisplayLabel = 'id'
      FieldName = 'IDAssociado'
      ReadOnly = True
    end
    object IndiretosNomeAssociado: TStringField
      DisplayLabel = 'associado'
      FieldName = 'NomeAssociado'
      Size = 200
    end
    object IndiretosNomeMunicipio: TStringField
      DisplayLabel = 'municipio'
      FieldName = 'NomeMunicipio'
      ReadOnly = True
      Size = 103
    end
    object IndiretosTipoEntidade: TStringField
      DisplayLabel = 'tipoEntidade'
      FieldName = 'TipoEntidade'
    end
    object IndiretosTipoAssociado: TStringField
      DisplayLabel = 'tipoAssociado'
      FieldName = 'TipoAssociado'
    end
    object IndiretosNomeResponsavel: TStringField
      DisplayLabel = 'responsavel'
      FieldName = 'NomeResponsavel'
      Size = 200
    end
  end
end
