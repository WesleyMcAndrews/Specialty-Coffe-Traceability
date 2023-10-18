object IWFormListarVariedades: TIWFormListarVariedades
  Left = 0
  Top = 0
  Width = 848
  Height = 400
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  HiddenFields.Strings = (
    'IDCULTURA='
    'IDTOEDIT=')
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
  object IncluirVariedade: TIWLink
    Left = 16
    Top = 208
    Width = 150
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
    FriendlyName = 'IncluirVariedade'
    OnClick = IncluirVariedadeClick
    TabOrder = 1
    RawText = False
    Caption = 'IncluirVariedade'
  end
  object EditarVariedade: TIWLink
    Left = 16
    Top = 231
    Width = 150
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
    Confirmation = 'Editar a Variedade afetar'#225' os Talh'#245'es cadastrados. Continua?'
    DoSubmitValidation = False
    FriendlyName = 'IWLink1'
    OnClick = EditarVariedadeClick
    TabOrder = 2
    RawText = False
    Caption = 'EditarVariedade'
  end
  object ExcluirVariedade: TIWLink
    Left = 16
    Top = 254
    Width = 150
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
    Confirmation = 'Confirma a Exclus'#227'o desta Variedade?'
    DoSubmitValidation = False
    FriendlyName = 'IWLink1'
    OnClick = ExcluirVariedadeClick
    TabOrder = 3
    RawText = False
    Caption = 'ExcluirVariedade'
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
    TabOrder = 4
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
  object CulturaCliente: TIWLabel
    Left = 16
    Top = 136
    Width = 114
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
    FriendlyName = 'CulturaCliente'
    Caption = 'CulturaCliente'
    RawText = False
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'listarVariedades.html'
    RenderStyles = True
    Left = 440
    Top = 8
  end
  object Variedades: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select V.IDCultura, Cu.NomeCultura, V.IDVariedade, V.NomeVarieda' +
        'de, T.Talhoes, T.AreaPlantada,'
      'U.NomeUsuario, V.DataCadastro'
      'from variedades V'
      'left join Clientes C on C.IDCultura=V.IDCultura'
      
        'left join (Select V.IDVariedade, COUNT(*) Talhoes, SUM(T.Poligon' +
        'o.STArea()/10000) AreaPlantada'
      'from Talhoes T'
      'left join VariedadesTalhoes V on V.IDTalhao=T.IDTalhao'
      'left join Propriedades P on P.IDPropriedade=T.IDPropriedade'
      'left join Associados A on A.IDAssociado=P.IDAssociado'
      'Where A.IDCliente=1'
      'group by V.IDVariedade) T on T.IDVariedade=V.IDVariedade'
      'left join Culturas Cu on Cu.IDCultura=C.IDCultura'
      'left join Usuarios U on U.IDUsuario=V.IDUsuarioCadastro'
      'where C.IDCliente=1'
      'order by V.NomeVariedade')
    Left = 248
    Top = 8
    object VariedadesIDCultura: TIntegerField
      FieldName = 'IDCultura'
      Visible = False
    end
    object VariedadesNomeCultura: TStringField
      FieldName = 'NomeCultura'
      Visible = False
      Size = 50
    end
    object VariedadesIDVariedade: TAutoIncField
      DisplayLabel = 'id'
      FieldName = 'IDVariedade'
      ReadOnly = True
    end
    object VariedadesNomeVariedade: TStringField
      DisplayLabel = 'variedade'
      FieldName = 'NomeVariedade'
      Size = 50
    end
    object VariedadesTalhoes: TIntegerField
      DisplayLabel = 'talhoes'
      FieldName = 'Talhoes'
      ReadOnly = True
    end
    object VariedadesAreaPlantada: TFloatField
      DisplayLabel = 'area'
      FieldName = 'AreaPlantada'
      ReadOnly = True
      DisplayFormat = '0.00ha'
    end
    object VariedadesNomeUsuario: TStringField
      DisplayLabel = 'usuariocadastro'
      FieldName = 'NomeUsuario'
      Size = 50
    end
    object VariedadesDataCadastro: TDateTimeField
      DisplayLabel = 'datacadastro'
      FieldName = 'DataCadastro'
      Visible = False
    end
  end
  object IWJQueryVariedades: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      ''
      '  var oVariedade =  $('#39'#variedades'#39').dataTable( {'
      '        /*   "ajax": ,*/'
      '        "columns": ['
      '            { "data": "id", "visible": false },'
      '            { "data": "variedade", "title": "Variedade" },'
      
        '            { "data": "talhoes", "title": "Talh'#245'es", className: ' +
        '"dt-center" },'
      
        '            { "data": "area", "title": "'#193'rea Plantada", classNam' +
        'e: "dt-right" },'
      
        '            { "data": "usuariocadastro", "title": "Cadastrada po' +
        'r"}'
      '         ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );'
      ''
      '   $('#39'#variedades tbody'#39').on( '#39'click'#39', '#39'tr'#39', function () {'
      '        if ( $(this).hasClass('#39'selected'#39') ) {'
      '            $(this).removeClass('#39'selected'#39');'
      '            $('#39'#HIDDEN_IDTOEDIT'#39').val(null);'
      '        }'
      '        else {'
      '            oVariedade.$('#39'tr.selected'#39').removeClass('#39'selected'#39');'
      '            $(this).addClass('#39'selected'#39');'
      '            var sID = oVariedade.fnGetData($(this));'
      '           $('#39'#HIDDEN_IDTOEDIT'#39').val(sID['#39'id'#39']);'
      '        }'
      '    } );'
      ' '
      '    $('#39'#button'#39').click( function () {'
      '        oVariedade.row('#39'.selected'#39').remove().draw( false );'
      '    } );')
    Left = 456
    Top = 240
  end
end
