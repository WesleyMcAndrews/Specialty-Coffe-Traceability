object IWFormListarConcursos: TIWFormListarConcursos
  Left = 0
  Top = 0
  Width = 766
  Height = 476
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  HiddenFields.Strings = (
    'IDTOEDIT='
    'IDJURADOTOEDIT=')
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
  object IncluirLink: TIWLink
    Left = 40
    Top = 136
    Width = 65
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
    FriendlyName = 'IncluirLink'
    OnClick = IncluirLinkClick
    TabOrder = 1
    RawText = False
    Caption = 'Incluir'
  end
  object EditarLink: TIWLink
    Left = 40
    Top = 169
    Width = 65
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
    FriendlyName = 'EditarLink'
    OnClick = EditarLinkClick
    TabOrder = 2
    RawText = False
    Caption = 'Editar'
  end
  object ExcluirLink: TIWLink
    Left = 40
    Top = 200
    Width = 73
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
    Confirmation = 'Confirma a exclus'#227'o deste concurso?'
    DoSubmitValidation = False
    FriendlyName = 'ExcluirLink'
    OnClick = ExcluirLinkClick
    TabOrder = 3
    RawText = False
    Caption = 'Excluir'
  end
  object ProfileLogoutLink: TIWLink
    Left = 629
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
    Left = 682
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
  object ExcluirJurado: TIWLink
    Left = 40
    Top = 352
    Width = 150
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
    Confirmation = 'Confirma a exclus'#227'o deste jurado?'
    DoSubmitValidation = False
    FriendlyName = 'ExcluirLink'
    OnAsyncClick = ExcluirJuradoAsyncClick
    TabOrder = 5
    RawText = False
    Caption = 'ExcluirJurado'
  end
  object EditarJurado: TIWLink
    Left = 40
    Top = 321
    Width = 150
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
    FriendlyName = 'EditarLink'
    OnClick = EditarJuradoClick
    TabOrder = 6
    RawText = False
    Caption = 'EditarJurado'
  end
  object IncluirJurado: TIWLink
    Left = 40
    Top = 288
    Width = 150
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
    FriendlyName = 'IncluirLink'
    OnClick = IncluirJuradoClick
    TabOrder = 7
    RawText = False
    Caption = 'IncluirJurado'
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'listarConcursos.html'
    RenderStyles = True
    Left = 400
    Top = 288
  end
  object IWJQueryWidget1: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      ''
      '  var oTable =  $('#39'#concursos'#39').dataTable( {'
      '        "ajax": "../../../../examples/ajax/data/objects.txt",'
      '        "columns": ['
      '            { "data": "id", "visible": false },'
      '            { "data": "nome", "title": "Nome do Concurso" },'
      '            { "data": "categorias", "title": "Categorias" },'
      
        '            { "data": "regulamento", "title": "Regulamento", cla' +
        'ssName: "dt-center" },'
      
        '            { "data": "dtPremiacao", "title": "Data Premia'#231#227'o", ' +
        'className: "dt-center" },'
      '            { "data": "faseAtual", "title": "Fase Atual" }'
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );'
      ''
      '   $('#39'#concursos tbody'#39').on( '#39'click'#39', '#39'tr'#39', function () {'
      '        if ( $(this).hasClass('#39'selected'#39') ) {'
      '            $(this).removeClass('#39'selected'#39');'
      '            $('#39'#HIDDEN_IDTOEDIT'#39').val(null);'
      '            $('#39'#HIDDEN_IDJURADOTOEDIT'#39').val(null);'
      '            $('#39'#JURADOSDIV'#39').hide();'
      '        }'
      '        else {'
      '            ShowBusy(true); //Show Intraweb "loading animation"'
      '            oTable.$('#39'tr.selected'#39').removeClass('#39'selected'#39');'
      '            $(this).addClass('#39'selected'#39');'
      '            var sID = oTable.fnGetData($(this));'
      '            $('#39'#HIDDEN_IDTOEDIT'#39').val(sID['#39'id'#39']);'
      
        '            executeAjaxEvent("&id="+$('#39'#HIDDEN_IDTOEDIT'#39').val(),' +
        ' null,"MyAjaxHandler",false, null, false);'
      
        '            executeAjaxEvent("&categs="+sID['#39'categorias'#39'], null,' +
        '"popularComboCategorias",false, null, false);'
      '            $('#39'#JURADOSDIV'#39').show();'
      '        }'
      '    } );'
      ' ')
    Left = 408
    Top = 112
  end
  object Concursos: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select C.IDConcurso, C.NomeConcurso, C.Categorias, C.ArquivoRegu' +
        'lamento, C.DtPremiacao,'
      'Case'
      
        'when CONVERT (date, GETDATE()) <= CONVERT (date, C.DtEntregaAmos' +
        'tras) then '#39'Entrega de Amostras'#39' '
      
        'when CONVERT (date, GETDATE()) between CONVERT (date, C.DtEntreg' +
        'aAmostras) and CONVERT (date, C.DtIniPreSelecao-1) then '#39'Inscri'#231 +
        #245'es Encerradas'#39
      
        'when CONVERT (date, GETDATE()) between CONVERT (date, C.DtIniPre' +
        'Selecao) and CONVERT (date, C.DtFimPreSelecao) then '#39'Pr'#233'-sele'#231#227'o' +
        '/'#39'+C.CategoriaAvaliacao '
      
        'when CONVERT (date, GETDATE()) between CONVERT (date, C.DtFimPre' +
        'Selecao+1) and CONVERT (date, C.DtIniSelecao-1) then '#39'Pr'#233'-sele'#231#227 +
        'o Encerrada'#39
      
        'when CONVERT (date, GETDATE()) between CONVERT (date, C.DtIniSel' +
        'ecao) and CONVERT (date, C.DtFimSelecao) then '#39'Sele'#231#227'o/'#39'+C.Categ' +
        'oriaAvaliacao'
      
        'when CONVERT (date, GETDATE()) between CONVERT (date, C.DtFimSel' +
        'ecao+1) and CONVERT (date, C.DtPremiacao-1) then '#39'Sele'#231#227'o Encerr' +
        'ada'#39
      'else '#39'Concurso Encerrado'#39' end as '#39'FaseAtual'#39
      'from concursos C'
      'where C.IDCliente=1'
      'order by C.DtPremiacao Desc')
    Left = 184
    Top = 32
    object ConcursosIDConcurso: TAutoIncField
      DisplayLabel = 'id'
      FieldName = 'IDConcurso'
      ReadOnly = True
    end
    object ConcursosNomeConcurso: TStringField
      DisplayLabel = 'nome'
      FieldName = 'NomeConcurso'
      Size = 200
    end
    object ConcursosCategorias: TStringField
      DisplayLabel = 'categorias'
      FieldName = 'Categorias'
      Size = 200
    end
    object ConcursosArquivoRegulamento: TStringField
      DisplayLabel = 'regulamento'
      FieldName = 'ArquivoRegulamento'
      Size = 100
    end
    object ConcursosDtPremiacao: TDateTimeField
      DisplayLabel = 'dtPremiacao'
      FieldName = 'DtPremiacao'
    end
    object ConcursosFaseAtual: TStringField
      DisplayLabel = 'faseAtual'
      FieldName = 'FaseAtual'
      ReadOnly = True
      Size = 25
    end
  end
  object IWJQueryJurados: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      ''
      '  var oJurados =  $('#39'#jurados'#39').dataTable( {'
      '        /*   "ajax": ,*/'
      '        "columns": ['
      '            { "data": "id", "visible": false },'
      '            { "data": "nome", "title": "Nome do Jurado" },'
      
        '            { "data": "nacionalidade", "title": "Nacionalidade" ' +
        '},'
      '            { "data": "instituicao", "title": "Institui'#231#227'o" },'
      '            { "data": "email", "title": "E-mail" },'
      
        '            { "data": "preselecao", "title": "Pr'#233'-Sele'#231#227'o", clas' +
        'sName: "dt-center" },'
      
        '            { "data": "selecao", "title": "Sele'#231#227'o", className: ' +
        '"dt-center" },'
      
        '            { "data": "oficial", "title": "Oficial", className: ' +
        '"dt-center" }'
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );'
      ''
      '   $('#39'#jurados tbody'#39').on( '#39'click'#39', '#39'tr'#39', function () {'
      '        if ( $(this).hasClass('#39'selected'#39') ) {'
      '            $(this).removeClass('#39'selected'#39');'
      '            $('#39'#HIDDEN_IDJURADOTOEDIT'#39').val(null);'
      '        }'
      '        else {'
      '            oJurados.$('#39'tr.selected'#39').removeClass('#39'selected'#39');'
      '            $(this).addClass('#39'selected'#39');'
      '            var sID = oJurados.fnGetData($(this));'
      '           $('#39'#HIDDEN_IDJURADOTOEDIT'#39').val(sID['#39'id'#39']);'
      '        }'
      '    } );')
    Left = 408
    Top = 176
  end
  object JuradosConcurso: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select JC.IDJurado, J.NomeJurado, J.Nacionalidade, J.Instituicao' +
        ', J.Email,'
      'JC.PreSelecao, JC.Selecao, JC.JuriOficial'
      'from ConcursojuradosConcurso JC'
      'left join ConcursoJurados J on J.IDJurado=JC.IDJurado'
      'where JC.IDConcurso=1'
      'order by J.NomeJurado')
    Left = 184
    Top = 96
    object JuradosConcursoIDJurado: TAutoIncField
      DisplayLabel = 'id'
      FieldName = 'IDJurado'
      ReadOnly = True
    end
    object JuradosConcursoNomeJurado: TStringField
      DisplayLabel = 'nome'
      FieldName = 'NomeJurado'
      Size = 200
    end
    object JuradosConcursoNacionalidade: TStringField
      DisplayLabel = 'nacionalidade'
      FieldName = 'Nacionalidade'
      Size = 50
    end
    object JuradosConcursoInstituicao: TStringField
      DisplayLabel = 'instituicao'
      FieldName = 'Instituicao'
      Size = 200
    end
    object JuradosConcursoEmail: TStringField
      DisplayLabel = 'email'
      FieldName = 'Email'
      Size = 100
    end
    object JuradosConcursoPreSelecao: TBooleanField
      DisplayLabel = 'preselecao'
      FieldName = 'PreSelecao'
      DisplayValues = 'Sim;N'#227'o'
    end
    object JuradosConcursoSelecao: TBooleanField
      DisplayLabel = 'selecao'
      FieldName = 'Selecao'
      DisplayValues = 'Sim;N'#227'o'
    end
    object JuradosConcursoJuriOficial: TBooleanField
      DisplayLabel = 'oficial'
      FieldName = 'JuriOficial'
      DisplayValues = 'Sim;N'#227'o'
    end
  end
  object Jurados: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT '#39'['#39' + STUFF(('
      ' select '
      '  '#39',{"id":"'#39' + cast(C.IDJurado as varchar(max)) + '#39'"'#39
      '  + '#39', "text":"'#39' + C.NomeJurado + '#39' - '#39' + C.Instituicao + '#39'"'#39
      '  +'#39'}'#39'from ConcursoJurados C'
      '  where C.IDCliente=1'
      '  and C.Ativo=1'
      
        '  and C.IDJurado not in (Select IDJurado from ConcursoJuradosCon' +
        'curso'
      '  where IDConcurso=1)'
      ' for xml path('#39#39'), type'
      ').value('#39'.'#39', '#39'varchar(max)'#39'), 1, 1, '#39#39') + '#39']'#39' as JSON')
    Left = 272
    Top = 32
    object JuradosJSON: TMemoField
      FieldName = 'JSON'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
end
