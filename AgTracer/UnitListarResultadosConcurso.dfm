object IWFormListarResultadosConcurso: TIWFormListarResultadosConcurso
  Left = 0
  Top = 0
  Width = 794
  Height = 476
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  HiddenFields.Strings = (
    'IDTOEDIT='
    'CATEGORIAS='
    'IDJURADOTOEDIT='
    'AMOSTRAPRESELECAO='
    'AMOSTRASELECAO='
    'POLARCHART=')
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
    TabOrder = 1
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
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'listarResultadosConcurso.html'
    RenderStyles = True
    Left = 576
    Top = 376
  end
  object IWJQueryConcursos: TIWJQueryWidget
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
      '            $('#39'#HIDDEN_AMOSTRAPRESELECAO'#39').val(null);'
      '            $('#39'#HIDDEN_AMOSTRASELECAO'#39').val(null);'
      '            $('#39'#JURADOSDIV'#39').hide();'
      '            $('#39'#CATEGORIASDIV'#39').hide();'
      '            $('#39'#RESULTADOSDIV'#39').hide();'
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
    Top = 64
  end
  object Concursos: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select C.IDCliente, C.IDConcurso, C.NomeConcurso, C.NomeEdicao, ' +
        'C.Categorias, C.PtsPreSelecao, C.ArquivoRegulamento,'
      'C.NroPremiadosPorCategoria, C.DtPremiacao,'
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
      'and C.IDConcurso is not null'
      'order by C.DtPremiacao Desc')
    Left = 112
    Top = 72
    object ConcursosIDCliente: TIntegerField
      FieldName = 'IDCliente'
      Visible = False
    end
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
    object ConcursosNomeEdicao: TStringField
      FieldName = 'NomeEdicao'
      Size = 200
    end
    object ConcursosPtsPreSelecao: TIntegerField
      FieldName = 'PtsPreSelecao'
      Visible = False
    end
    object ConcursosNroPremiadosPorCategoria: TIntegerField
      FieldName = 'NroPremiadosPorCategoria'
      Visible = False
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
      '            { "data": "instituicao", "title": "Institui'#231#227'o" },'
      
        '            { "data": "oficial", "title": "Oficial", className: ' +
        '"dt-center" },'
      
        '            { "data": "preselecao", "title": "Pr'#233'-Sele'#231#227'o", clas' +
        'sName: "dt-center" },'
      
        '            { "data": "selecao", "title": "Sele'#231#227'o", className: ' +
        '"dt-center" },'
      
        '            { "data": "percpreselecao", "title": "% Pr'#233'-Sele'#231#227'o"' +
        ', className: "dt-center" },'
      
        '            { "data": "percselecao", "title": "% Sele'#231#227'o", class' +
        'Name: "dt-center" }'
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );')
    Left = 408
    Top = 128
  end
  object JuradosConcurso: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select JC.IDJurado, J.NomeJurado, JC.PreSelecao, JC.Selecao, J.I' +
        'nstituicao, J.Email, JC.JuriOficial,'
      'Case when JC.PreSelecao=1 then'
      
        'case when (QA.QtdeAvaliacoesPreSelecao>0 and QA.QtdeAmostrasPreS' +
        'elecao>0) then Cast(CONVERT(DECIMAL(5,1),(QA.QtdeAvaliacoesPreSe' +
        'lecao*100)/QA.QtdeAmostrasPreSelecao) as varchar(max))+'#39'%'#39' else ' +
        #39'0%'#39' end'
      'else '#39'-'#39' end PercPreSelecao,'
      'Case when JC.Selecao=1 then'
      
        'case when (QA.QtdeAvaliacoesSelecao>0 and QA.QtdeAmostrasSelecao' +
        '>0)  then Cast(CONVERT(DECIMAL(5,1),(QA.QtdeAvaliacoesSelecao*10' +
        '0)/QA.QtdeAmostrasSelecao) as Varchar(max))+'#39'%'#39' else '#39'0%'#39' end'
      'else '#39'-'#39' end PercSelecao'
      'from ConcursojuradosConcurso JC'
      'left join ConcursoJurados J on J.IDJurado=JC.IDJurado'
      'left join (Select IDConcurso, IDJurado,'
      
        'Sum(QtdeAvaliacoesPreSelecao) QtdeAvaliacoesPreSelecao, Sum(Qtde' +
        'AvaliacoesSelecao) QtdeAvaliacoesSelecao,'
      
        'Sum(QtdeAmostrasPreSelecao) QtdeAmostrasPreSelecao, Sum(QtdeAmos' +
        'trasSelecao) QtdeAmostrasSelecao'
      'from ConcursoQtdeAmostrasAvaliadas'
      
        'group by IDConcurso, IDJurado) QA on QA.IDConcurso=JC.IDConcurso' +
        ' and QA.IDJurado=JC.IDJurado'
      'where JC.IDConcurso=1'
      'order by J.NomeJurado')
    Left = 112
    Top = 136
    object JuradosConcursoIDJurado: TIntegerField
      DisplayLabel = 'id'
      FieldName = 'IDJurado'
    end
    object JuradosConcursoNomeJurado: TStringField
      DisplayLabel = 'nome'
      FieldName = 'NomeJurado'
      Size = 200
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
    object JuradosConcursoInstituicao: TStringField
      DisplayLabel = 'instituicao'
      FieldName = 'Instituicao'
      Size = 200
    end
    object JuradosConcursoJuriOficial: TBooleanField
      DisplayLabel = 'oficial'
      FieldName = 'JuriOficial'
      DisplayValues = 'Sim;N'#227'o'
    end
    object JuradosConcursoPercPreSelecao: TMemoField
      DisplayLabel = 'percpreselecao'
      FieldName = 'PercPreSelecao'
      ReadOnly = True
      BlobType = ftMemo
    end
    object JuradosConcursoPercSelecao: TMemoField
      DisplayLabel = 'percselecao'
      FieldName = 'PercSelecao'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
  object Preselecao: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select  R.IDConcurso, R.IDAmostraConcurso, R.FaseConcurso, R.Cat' +
        'egoriaConcurso, R.Avaliacoes,'
      
        'R.ColoracaoTorra, R.Aroma, R.AromaSeca, R.AromaUmida, R.Sabor, R' +
        '.Retrogosto, R.Acidez,'
      
        'R.AcidezIntensidade, R.Corpo, R.CorpoNivel, R.Uniformidade, R.Ba' +
        'lanco, R.XicaraLimpa,'
      
        'R.Docura, R.Geral, R.XicarasDefeitosLeves, R.XicarasDefeitosGrav' +
        'es, R.NotaFinal, R.Json,'
      'DENSE_RANK() OVER (ORDER BY R.NotaFinal desc) AS Classificacao,'
      
        'CA.NomePropriedade, CA.VariedadeCafe, M.NomeMunicipio+'#39'-'#39'+M.UF N' +
        'omeMunicipio, A.NomeAssociado'
      'from ConcursoResultados R'
      
        'left join ConcursoAmostras CA on CA.idConcurso=R.IDConcurso and ' +
        'CA.IDAmostraConcurso=R.IDAmostraConcurso'
      
        'left join MunicipiosIBGE M on M.CodigoMunicipio=CA.CodigoMunicip' +
        'io'
      'left join Associados A on A.IDAssociado=CA.IDAssociado'
      'where R.idConcurso=1'
      'and R.FaseConcurso='#39'Pr'#233'-sele'#231#227'o'#39
      'and R.CategoriaConcurso='#39'Cereja Descascada'#39
      'and R.IDAmostraConcurso is not null'
      'order by R.NotaFinal Desc, A.NomeAssociado')
    Left = 56
    Top = 224
    object PreselecaoClassificacao: TLargeintField
      FieldName = 'Classificacao'
      ReadOnly = True
      DisplayFormat = '00'
    end
    object PreselecaoIDConcurso: TIntegerField
      FieldName = 'IDConcurso'
    end
    object PreselecaoIDAmostraConcurso: TIntegerField
      DisplayLabel = 'id'
      FieldName = 'IDAmostraConcurso'
      DisplayFormat = '0000'
    end
    object PreselecaoFaseConcurso: TStringField
      DisplayLabel = 'fase'
      FieldName = 'FaseConcurso'
    end
    object PreselecaoCategoriaConcurso: TStringField
      FieldName = 'CategoriaConcurso'
    end
    object PreselecaoAvaliacoes: TIntegerField
      FieldName = 'Avaliacoes'
      ReadOnly = True
    end
    object PreselecaoColoracaoTorra: TFloatField
      FieldName = 'ColoracaoTorra'
      ReadOnly = True
    end
    object PreselecaoAroma: TFloatField
      DisplayLabel = 'aroma'
      FieldName = 'Aroma'
      ReadOnly = True
    end
    object PreselecaoAromaSeca: TFloatField
      FieldName = 'AromaSeca'
      ReadOnly = True
    end
    object PreselecaoAromaUmida: TFloatField
      FieldName = 'AromaUmida'
      ReadOnly = True
    end
    object PreselecaoSabor: TFloatField
      DisplayLabel = 'sabor'
      FieldName = 'Sabor'
      ReadOnly = True
    end
    object PreselecaoRetrogosto: TFloatField
      DisplayLabel = 'retrogosto'
      FieldName = 'Retrogosto'
      ReadOnly = True
    end
    object PreselecaoAcidez: TFloatField
      DisplayLabel = 'acidez'
      FieldName = 'Acidez'
      ReadOnly = True
    end
    object PreselecaoAcidezIntensidade: TFloatField
      FieldName = 'AcidezIntensidade'
      ReadOnly = True
    end
    object PreselecaoCorpo: TFloatField
      DisplayLabel = 'corpo'
      FieldName = 'Corpo'
      ReadOnly = True
    end
    object PreselecaoCorpoNivel: TFloatField
      FieldName = 'CorpoNivel'
      ReadOnly = True
    end
    object PreselecaoUniformidade: TFloatField
      FieldName = 'Uniformidade'
      ReadOnly = True
    end
    object PreselecaoBalanco: TFloatField
      DisplayLabel = 'balanco'
      FieldName = 'Balanco'
      ReadOnly = True
    end
    object PreselecaoXicaraLimpa: TFloatField
      DisplayLabel = 'xicaraLimpa'
      FieldName = 'XicaraLimpa'
      ReadOnly = True
    end
    object PreselecaoDocura: TFloatField
      DisplayLabel = 'docura'
      FieldName = 'Docura'
      ReadOnly = True
    end
    object PreselecaoGeral: TFloatField
      DisplayLabel = 'geral'
      FieldName = 'Geral'
      ReadOnly = True
    end
    object PreselecaoXicarasDefeitosLeves: TFloatField
      DisplayLabel = 'xicarasDefeitosLeves'
      FieldName = 'XicarasDefeitosLeves'
      ReadOnly = True
    end
    object PreselecaoXicarasDefeitosGraves: TFloatField
      DisplayLabel = 'xicarasDefeitosGraves'
      FieldName = 'XicarasDefeitosGraves'
      ReadOnly = True
    end
    object PreselecaoNotaFinal: TFloatField
      FieldName = 'NotaFinal'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object Preselecaojson: TMemoField
      FieldName = 'json'
      ReadOnly = True
      BlobType = ftMemo
    end
    object PreselecaoNomePropriedade: TStringField
      FieldName = 'NomePropriedade'
      Visible = False
      Size = 200
    end
    object PreselecaoVariedadeCafe: TStringField
      FieldName = 'VariedadeCafe'
      Visible = False
      Size = 50
    end
    object PreselecaoNomeMunicipio: TStringField
      FieldName = 'NomeMunicipio'
      ReadOnly = True
      Visible = False
      Size = 103
    end
    object PreselecaoNomeAssociado: TStringField
      FieldName = 'NomeAssociado'
      Visible = False
      Size = 200
    end
  end
  object Selecao: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select  R.IDConcurso, R.IDAmostraConcurso, R.FaseConcurso, R.Cat' +
        'egoriaConcurso, R.Avaliacoes,'
      
        'R.ColoracaoTorra, R.Aroma, R.AromaSeca, R.AromaUmida, R.Sabor, R' +
        '.Retrogosto, R.Acidez,'
      
        'R.AcidezIntensidade, R.Corpo, R.CorpoNivel, R.Uniformidade, R.Ba' +
        'lanco, R.XicaraLimpa,'
      
        'R.Docura, R.Geral, R.XicarasDefeitosLeves, R.XicarasDefeitosGrav' +
        'es, R.NotaFinal, R.Json,'
      
        'DENSE_RANK() OVER (ORDER BY R.NotaFinal desc) AS Classificacao, ' +
        'CA.QtdeSacas,'
      
        'CA.NomePropriedade, CA.VariedadeCafe, M.NomeMunicipio+'#39'-'#39'+M.UF N' +
        'omeMunicipio, A.NomeAssociado'
      'from ConcursoResultados R'
      
        'left join ConcursoAmostras CA on CA.idConcurso=R.IDConcurso and ' +
        'CA.IDAmostraConcurso=R.IDAmostraConcurso'
      
        'left join MunicipiosIBGE M on M.CodigoMunicipio=CA.CodigoMunicip' +
        'io'
      'left join Associados A on A.IDAssociado=CA.IDAssociado'
      'where R.idConcurso=1'
      'and R.FaseConcurso='#39'Sele'#231#227'o'#39
      'and R.CategoriaConcurso='#39'Cereja Descascada'#39
      'and R.IDAmostraConcurso is not null'
      'order by R.NotaFinal Desc, A.NomeAssociado')
    Left = 160
    Top = 224
    object SelecaoClassificacao: TLargeintField
      FieldName = 'Classificacao'
      ReadOnly = True
      DisplayFormat = '00'
    end
    object SelecaoIDConcurso: TIntegerField
      FieldName = 'IDConcurso'
    end
    object SelecaoIDAmostraConcurso: TIntegerField
      DisplayLabel = 'id'
      FieldName = 'IDAmostraConcurso'
    end
    object SelecaoFaseConcurso: TStringField
      DisplayLabel = 'fase'
      FieldName = 'FaseConcurso'
    end
    object SelecaoCategoriaConcurso: TStringField
      FieldName = 'CategoriaConcurso'
    end
    object SelecaoAvaliacoes: TIntegerField
      FieldName = 'Avaliacoes'
      ReadOnly = True
    end
    object SelecaoColoracaoTorra: TFloatField
      FieldName = 'ColoracaoTorra'
      ReadOnly = True
    end
    object SelecaoAroma: TFloatField
      DisplayLabel = 'aroma'
      FieldName = 'Aroma'
      ReadOnly = True
    end
    object SelecaoAromaSeca: TFloatField
      FieldName = 'AromaSeca'
      ReadOnly = True
    end
    object SelecaoAromaUmida: TFloatField
      FieldName = 'AromaUmida'
      ReadOnly = True
    end
    object SelecaoSabor: TFloatField
      DisplayLabel = 'sabor'
      FieldName = 'Sabor'
      ReadOnly = True
    end
    object SelecaoRetrogosto: TFloatField
      DisplayLabel = 'retrogosto'
      FieldName = 'Retrogosto'
      ReadOnly = True
    end
    object SelecaoAcidez: TFloatField
      DisplayLabel = 'acidez'
      FieldName = 'Acidez'
      ReadOnly = True
    end
    object SelecaoAcidezIntensidade: TFloatField
      FieldName = 'AcidezIntensidade'
      ReadOnly = True
    end
    object SelecaoCorpo: TFloatField
      DisplayLabel = 'corpo'
      FieldName = 'Corpo'
      ReadOnly = True
    end
    object SelecaoCorpoNivel: TFloatField
      FieldName = 'CorpoNivel'
      ReadOnly = True
    end
    object SelecaoUniformidade: TFloatField
      DisplayLabel = 'uniformidade'
      FieldName = 'Uniformidade'
      ReadOnly = True
    end
    object SelecaoBalanco: TFloatField
      DisplayLabel = 'balanco'
      FieldName = 'Balanco'
      ReadOnly = True
    end
    object SelecaoXicaraLimpa: TFloatField
      DisplayLabel = 'xicaralimpa'
      FieldName = 'XicaraLimpa'
      ReadOnly = True
    end
    object SelecaoDocura: TFloatField
      DisplayLabel = 'docura'
      FieldName = 'Docura'
      ReadOnly = True
    end
    object SelecaoGeral: TFloatField
      DisplayLabel = 'geral'
      FieldName = 'Geral'
      ReadOnly = True
    end
    object SelecaoXicarasDefeitosLeves: TFloatField
      DisplayLabel = 'xicarasDefeitosLeves'
      FieldName = 'XicarasDefeitosLeves'
      ReadOnly = True
    end
    object SelecaoXicarasDefeitosGraves: TFloatField
      DisplayLabel = 'xicarasDefeitosGraves'
      FieldName = 'XicarasDefeitosGraves'
      ReadOnly = True
    end
    object SelecaoNotaFinal: TFloatField
      FieldName = 'NotaFinal'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object Selecaojson: TMemoField
      FieldName = 'json'
      ReadOnly = True
      BlobType = ftMemo
    end
    object SelecaoNomePropriedade: TStringField
      FieldName = 'NomePropriedade'
      Visible = False
      Size = 200
    end
    object SelecaoQtdeSacas: TIntegerField
      FieldName = 'QtdeSacas'
      Visible = False
    end
    object SelecaoVariedadeCafe: TStringField
      FieldName = 'VariedadeCafe'
      Visible = False
      Size = 50
    end
    object SelecaoNomeMunicipio: TStringField
      FieldName = 'NomeMunicipio'
      ReadOnly = True
      Visible = False
      Size = 103
    end
    object SelecaoNomeAssociado: TStringField
      FieldName = 'NomeAssociado'
      Visible = False
      Size = 200
    end
  end
  object IWJQueryPreSelecao: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      '/* Formatting function for row details - modify as you need */'
      'function formatPreselecao ( el, e ) {'
      '    // `d` is the original data object for the row'
      
        '    var div1 = $('#39'<div/>'#39', {id: '#39'polarChart_'#39'+e.id, class: '#39'form' +
        '-group col-md-6'#39'}).appendTo(el);'
      '    div1.highcharts({'
      ''
      '        chart: {'
      '            polar: true,'
      '            type: '#39'line'#39','
      '            backgroundColor: '#39'transparent'#39
      '            //height: 300'
      '            //widht: 300'
      '        },'
      ''
      '        title: {'
      '            floating: true,'
      '            text: null'
      '        },'
      ''
      '        /*pane: {'
      '           size: '#39'80%'#39
      '        },*/'
      ''
      '        xAxis: {'
      
        '            categories: ['#39'Aroma'#39', '#39'Sabor'#39', '#39'Retrogosto'#39', '#39'Acidez' +
        #39', '#39'Corpo'#39', '#39'Balan'#231'o'#39', '#39'Geral'#39'],'
      '            tickmarkPlacement: '#39'on'#39','
      '            lineWidth: 0'
      '        },'
      ''
      '        yAxis: {'
      '            alternateGridColor: '#39'#dddddd'#39','
      '            lineWidth: 0,'
      '            tickPositions: [6, 7,8,9,10,11],'
      '            showLastLabel: false'
      '        },'
      ''
      '        tooltip: {'
      '            //shared: true,'
      
        '            //pointFormat: '#39'<span style="color:{series.color}">{' +
        'series.name}: <b>{point.y:,.0f}</b><br/>'#39
      '        },'
      '        credits: {'
      '            enabled: false'
      '        },'
      ''
      '        legend: {'
      '           enabled: false'
      '        },'
      ''
      '        series: [{'
      '            name: '#39'Nota'#39','
      
        '            data: [Number(e.aroma.replace(",", ".")),  Number(e.' +
        'sabor.replace(",", ".")), Number(e.retrogosto.replace(",", "."))' +
        ','
      
        '                      Number(e.acidez.replace(",", ".")), Number' +
        '(e.corpo.replace(",", ".")),  Number(e.balanco.replace(",", ".")' +
        '), '
      '                      Number(e.geral.replace(",", "."))],'
      '            pointPlacement: '#39'on'#39
      '        }]'
      ''
      '    });'
      ''
      '    return div1;'
      '}'
      ' '
      '  var oPreselecao =  $('#39'#preselecao'#39').DataTable( {'
      '        /*   "ajax": ,*/'
      '        "paging": false,'
      '        "columns": ['
      '            {'
      '                "className":      '#39'details-control'#39','
      '                 bSortable: false,'
      '                "data":           null,'
      '                "defaultContent": '#39#39
      '            },'
      
        '            { "data": "id", "title": "Seq", className: "dt-cente' +
        'r" },'
      
        '            { "data": "Avaliacoes", "title": "Avalia'#231#245'es", class' +
        'Name: "dt-center" },'
      
        '            { "data": "NotaFinal", "title": "Nota Final", classN' +
        'ame: "dt-center" },'
      
        '            { "data": "Classificacao", "title": "Classifica'#231#227'o",' +
        ' className: "dt-center" }'
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );'
      ''
      '        // Add event listener for opening and closing details'
      
        '    $('#39'#preselecao tbody'#39').on('#39'click'#39', '#39'td.details-control'#39', fun' +
        'ction () {'
      '        var tr = $(this).closest('#39'tr'#39');'
      '        var row = oPreselecao.row( tr );'
      ' '
      '        if ( row.child.isShown() ) {'
      '            // This row is already open - close it'
      '            row.child.hide();'
      '            tr.removeClass('#39'shown'#39');'
      '        }'
      '        else {'
      '            // Open this row'
      
        '            row.child( formatPreselecao($(this), row.data()) ).s' +
        'how();          '
      '            tr.addClass('#39'shown'#39');'
      '            $(window).trigger('#39'resize'#39');'
      '        }'
      '    } );')
    Left = 328
    Top = 200
  end
  object IWJQuerySelecao: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      '/* Formatting function for row details - modify as you need */'
      'function formatSelecao ( el, e ) {'
      '    // `d` is the original data object for the row'
      
        '    var div1 = $('#39'<div/>'#39', {id: '#39'polarChart_'#39'+e.id, class: '#39'form' +
        '-group col-md-6'#39'}).appendTo(el);'
      '    div1.highcharts({'
      ''
      '        chart: {'
      '            polar: true,'
      '            type: '#39'line'#39','
      '            backgroundColor: '#39'transparent'#39
      '            //height: 300'
      '            //widht: 300'
      '        },'
      ''
      '        title: {'
      '            floating: true,'
      '            text: null'
      '        },'
      ''
      '        /*pane: {'
      '           size: '#39'80%'#39
      '        },*/'
      ''
      '        xAxis: {'
      
        '            categories: ['#39'Aroma'#39', '#39'Sabor'#39', '#39'Retrogosto'#39', '#39'Acidez' +
        #39', '#39'Corpo'#39', '#39'Balan'#231'o'#39', '#39'Geral'#39'],'
      '            tickmarkPlacement: '#39'on'#39','
      '            lineWidth: 0'
      '        },'
      ''
      '        yAxis: {'
      '            alternateGridColor: '#39'#dddddd'#39','
      '            lineWidth: 0,'
      '            tickPositions: [6, 7,8,9,10,11],'
      '            showLastLabel: false'
      '        },'
      ''
      '        tooltip: {'
      '            //shared: true,'
      
        '            //pointFormat: '#39'<span style="color:{series.color}">{' +
        'series.name}: <b>{point.y:,.0f}</b><br/>'#39
      '        },'
      '        credits: {'
      '            enabled: false'
      '        },'
      ''
      '        legend: {'
      '           enabled: false'
      '        },'
      ''
      '        series: [{'
      '            name: '#39'Nota'#39','
      
        '            data: [Number(e.aroma.replace(",", ".")),  Number(e.' +
        'sabor.replace(",", ".")), Number(e.retrogosto.replace(",", "."))' +
        ','
      
        '                      Number(e.acidez.replace(",", ".")), Number' +
        '(e.corpo.replace(",", ".")),  Number(e.balanco.replace(",", ".")' +
        '), '
      '                      Number(e.geral.replace(",", "."))],'
      '            pointPlacement: '#39'on'#39
      '        }]'
      ''
      '    });'
      ''
      '    return div1;'
      '}'
      ' '
      '  var oSelecao =  $('#39'#selecao'#39').DataTable( {'
      '        /*   "ajax": ,*/'
      '        "paging": false,'
      '        "columns": ['
      '            {'
      '                "className":      '#39'details-control'#39','
      '                 bSortable: false,'
      '                "data":           null,'
      '                "defaultContent": '#39#39
      '            },'
      
        '            { "data": "id", "title": "Seq", className: "dt-cente' +
        'r" },'
      
        '            { "data": "Avaliacoes", "title": "Avalia'#231#245'es", class' +
        'Name: "dt-center" },'
      
        '            { "data": "NotaFinal", "title": "Nota Final", classN' +
        'ame: "dt-center" },'
      
        '            { "data": "Classificacao", "title": "Classifica'#231#227'o",' +
        ' className: "dt-center" },'
      
        '            { bSortable: false, "title": "A'#231#227'o", className: "dt-' +
        'center",'
      '              "mRender": function(data, type, full) {'
      
        '                     return '#39'<button onClick="resultados.rptResu' +
        'ltado('#39' + full['#39'id'#39'] + '#39');" class="btn btn-xs green" type="butto' +
        'n"><i class="icon-print"></i> Detalhe</button>'#39';'
      '                 }'
      '         }'
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );'
      ''
      '        // Add event listener for opening and closing details'
      
        '    $('#39'#selecao tbody'#39').on('#39'click'#39', '#39'td.details-control'#39', functi' +
        'on () {'
      '        var tr = $(this).closest('#39'tr'#39');'
      '        var row = oSelecao.row( tr );'
      ' '
      '        if ( row.child.isShown() ) {'
      '            // This row is already open - close it'
      '            row.child.hide();'
      '            tr.removeClass('#39'shown'#39');'
      '        }'
      '        else {'
      '            // Open this row'
      
        '            row.child( formatSelecao($(this), row.data()) ).show' +
        '();          '
      '            tr.addClass('#39'shown'#39');'
      '            $(window).trigger('#39'resize'#39');'
      '        }'
      '    } );')
    Left = 480
    Top = 200
  end
  object frxReport1: TfrxReport
    Version = '4.11.17'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42271.359187951400000000
    ReportOptions.LastChange = 42279.413420474540000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnBeforePrint = frxReport1BeforePrint
    Left = 40
    Top = 328
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'ConcursosDataSet'
    CloseDataSource = False
    DataSet = Concursos
    BCDToCurrency = False
    Left = 136
    Top = 328
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'ResultadosDataSet'
    CloseDataSource = False
    DataSet = Selecao
    BCDToCurrency = False
    Left = 136
    Top = 392
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 40
    Top = 392
  end
end
