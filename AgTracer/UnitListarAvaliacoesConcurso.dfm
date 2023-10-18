object IWFormListarAvaliacoesConcurso: TIWFormListarAvaliacoesConcurso
  Left = 0
  Top = 0
  Width = 848
  Height = 400
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  HiddenFields.Strings = (
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
  object SairLink: TIWLink
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
    FriendlyName = 'SairLink'
    OnClick = SairLinkClick
    TabOrder = 0
    RawText = False
    Caption = 'SairLink'
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
    TabOrder = 1
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
  object NomeConcurso: TIWDBEdit
    Left = 24
    Top = 64
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
    DoSubmitValidation = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'NomeConcurso'
    MaxLength = 0
    ReadOnly = True
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = False
    TabOrder = 2
    AutoEditable = False
    DataField = 'NomeConcurso'
    PasswordPrompt = False
    DataSource = ConcursoSrc
  end
  object NomeEdicao: TIWDBEdit
    Left = 24
    Top = 91
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
    DoSubmitValidation = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'NomeEdicao'
    MaxLength = 0
    ReadOnly = True
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = False
    TabOrder = 3
    AutoEditable = False
    DataField = 'NomeEdicao'
    PasswordPrompt = False
    DataSource = ConcursoSrc
  end
  object FaseAtual: TIWDBEdit
    Left = 24
    Top = 118
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
    DoSubmitValidation = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'FaseAtual'
    MaxLength = 0
    ReadOnly = True
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = False
    TabOrder = 4
    AutoEditable = False
    DataField = 'FaseAtual'
    PasswordPrompt = False
    DataSource = ConcursoSrc
  end
  object CategoriaAvaliacao: TIWDBEdit
    Left = 24
    Top = 145
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
    DoSubmitValidation = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'CategoriaAvaliacao'
    MaxLength = 0
    ReadOnly = True
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = False
    TabOrder = 5
    AutoEditable = False
    DataField = 'CategoriaAvaliacao'
    PasswordPrompt = False
    DataSource = ConcursoSrc
  end
  object PtsPreSelecao: TIWDBEdit
    Left = 24
    Top = 172
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
    DoSubmitValidation = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'PtsPreSelecao'
    MaxLength = 0
    ReadOnly = True
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = False
    TabOrder = 6
    AutoEditable = False
    DataField = 'PtsPreSelecao'
    PasswordPrompt = False
    DataSource = ConcursoSrc
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'listarAvaliacoesConcurso.html'
    RenderStyles = True
    Left = 456
    Top = 312
  end
  object Concurso: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select TOP 1 C.IDConcurso, C.NomeConcurso, C.NomeEdicao, C.PtsPr' +
        'eSelecao, C.CategoriaAvaliacao,'
      'Case'
      
        'when CONVERT (date, GETDATE()) <= CONVERT (date, C.DtEntregaAmos' +
        'tras) then '#39'Entrega de Amostras'#39' '
      
        'when CONVERT (date, GETDATE()) between CONVERT (date, C.DtEntreg' +
        'aAmostras) and CONVERT (date, C.DtIniPreSelecao-1) then '#39'Inscri'#231 +
        #245'es Encerradas'#39
      
        'when CONVERT (date, GETDATE()) between CONVERT (date, C.DtIniPre' +
        'Selecao) and CONVERT (date, C.DtFimPreSelecao) then '#39'Pr'#233'-sele'#231#227'o' +
        #39' '
      
        'when CONVERT (date, GETDATE()) between CONVERT (date, C.DtFimPre' +
        'Selecao+1) and CONVERT (date, C.DtIniSelecao-1) then '#39'Pr'#233'-sele'#231#227 +
        'o Encerrada'#39
      
        'when CONVERT (date, GETDATE()) between CONVERT (date, C.DtIniSel' +
        'ecao) and CONVERT (date, C.DtFimSelecao) then '#39'Sele'#231#227'o'#39
      
        'when CONVERT (date, GETDATE()) between CONVERT (date, C.DtFimSel' +
        'ecao+1) and CONVERT (date, C.DtPremiacao-1) then '#39'Sele'#231#227'o Encerr' +
        'ada'#39
      'else '#39'Concurso Encerrado'#39' end as '#39'FaseAtual'#39
      'from concursos C'
      'where C.IDCliente=1'
      
        'and (CONVERT (date, GETDATE()) between CONVERT (date, C.DtIniPre' +
        'Selecao) and CONVERT (date, C.DtFimPreSelecao)'
      
        '  or CONVERT (date, GETDATE()) between CONVERT (date, C.DtIniSel' +
        'ecao)    and CONVERT (date, C.DtFimSelecao))'
      'and C.CategoriaAvaliacao is not null'
      'order by C.DtPremiacao Desc')
    Left = 240
    Top = 8
    object ConcursoIDConcurso: TAutoIncField
      FieldName = 'IDConcurso'
      ReadOnly = True
    end
    object ConcursoNomeConcurso: TStringField
      FieldName = 'NomeConcurso'
      Size = 200
    end
    object ConcursoNomeEdicao: TStringField
      FieldName = 'NomeEdicao'
      Size = 200
    end
    object ConcursoPtsPreSelecao: TIntegerField
      FieldName = 'PtsPreSelecao'
    end
    object ConcursoCategoriaAvaliacao: TStringField
      FieldName = 'CategoriaAvaliacao'
      Size = 50
    end
    object ConcursoFaseAtual: TStringField
      FieldName = 'FaseAtual'
      ReadOnly = True
      Size = 21
    end
  end
  object IWJQueryAmostras: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      '/* Formatting function for row details - modify as you need */'
      'function formatAvaliacao ( el, e ) {'
      '    // `d` is the original data object for the row'
      
        '    var div1 = $('#39'<div/>'#39', {id: '#39'polarChart_'#39'+e.id, class: '#39'form' +
        '-group col-md-6'#39'}).appendTo(el);'
      '    div1.highcharts({'
      ''
      '        chart: {'
      '            polar: true,'
      '            type: '#39'line'#39','
      '            backgroundColor: '#39'transparent'#39','
      '            height: 300'
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
      '  var oAvaliacao =  $('#39'#avaliacao'#39').DataTable( {'
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
        'r"  },'
      
        '            { bSortable: false, "data": "nota", "title": "Nota",' +
        ' className: "dt-center" },'
      
        '            { bSortable: false, "data": "dtAvaliacao", "title": ' +
        '"Dt. Avalia'#231#227'o", className: "dt-center" },'
      
        '            { bSortable: false, "title": "A'#231#227'o", className: "dt-' +
        'center",'
      '              "mRender": function(data, type, full) {'
      
        '                  return '#39'<button onClick="listarAvaliacoes.aval' +
        'ia('#39' + full['#39'id'#39'] +'#39','#39'+ full['#39'avaliada'#39'] + '#39');" class="btn btn-x' +
        's red" type="button"><i class="icon-coffee"></i> Avaliar</button' +
        '>'#39';'
      '                 }'
      '         }'
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );'
      ''
      '        // Add event listener for opening and closing details'
      
        '    $('#39'#avaliacao tbody'#39').on('#39'click'#39', '#39'td.details-control'#39', func' +
        'tion () {'
      '        var tr = $(this).closest('#39'tr'#39');'
      '        var row = oAvaliacao.row( tr );'
      ' '
      '        if ( row.child.isShown() ) {'
      '            // This row is already open - close it'
      '            row.child.hide();'
      '            tr.removeClass('#39'shown'#39');'
      '        }'
      '        else {'
      '            // Open this row'
      
        '            row.child( formatAvaliacao($(this), row.data()) ).sh' +
        'ow();          '
      '            tr.addClass('#39'shown'#39');'
      '            $(window).trigger('#39'resize'#39');'
      '        }'
      '    } );')
    Left = 456
    Top = 240
  end
  object Amostras: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 344
    Top = 8
    object AmostrasIDAmostraConcurso: TAutoIncField
      DisplayLabel = 'id'
      FieldName = 'IDAmostraConcurso'
      ReadOnly = True
      DisplayFormat = '0000'
    end
    object AmostrasCategoriaConcurso: TStringField
      DisplayLabel = 'categoria'
      FieldName = 'CategoriaConcurso'
    end
    object AmostrasQRCODE: TGuidField
      FieldName = 'QRCODE'
      Visible = False
      FixedChar = True
      Size = 38
    end
    object AmostrasDataAvaliacao: TDateTimeField
      DisplayLabel = 'dtAvaliacao'
      FieldName = 'DataAvaliacao'
    end
    object AmostrasAroma: TFloatField
      DisplayLabel = 'aroma'
      FieldName = 'Aroma'
    end
    object AmostrasSabor: TFloatField
      DisplayLabel = 'sabor'
      FieldName = 'Sabor'
    end
    object AmostrasRetrogosto: TFloatField
      DisplayLabel = 'retrogosto'
      FieldName = 'Retrogosto'
    end
    object AmostrasAcidez: TFloatField
      DisplayLabel = 'acidez'
      FieldName = 'Acidez'
    end
    object AmostrasCorpo: TFloatField
      DisplayLabel = 'corpo'
      FieldName = 'Corpo'
    end
    object AmostrasUniformidade: TFloatField
      DisplayLabel = 'uniformidade'
      FieldName = 'Uniformidade'
    end
    object AmostrasBalanco: TFloatField
      DisplayLabel = 'balanco'
      FieldName = 'Balanco'
    end
    object AmostrasXicaraLimpa: TFloatField
      DisplayLabel = 'xicaraLimpa'
      FieldName = 'XicaraLimpa'
    end
    object AmostrasDocura: TFloatField
      DisplayLabel = 'docura'
      FieldName = 'Docura'
    end
    object AmostrasGeral: TFloatField
      DisplayLabel = 'geral'
      FieldName = 'Geral'
    end
    object AmostrasXicarasDefeitosLeves: TFloatField
      DisplayLabel = 'defeitosLeves'
      FieldName = 'XicarasDefeitosLeves'
    end
    object AmostrasXicarasDefeitosGraves: TFloatField
      DisplayLabel = 'defeitosGraves'
      FieldName = 'XicarasDefeitosGraves'
    end
    object AmostrasNotaFinal: TFloatField
      DisplayLabel = 'nota'
      FieldName = 'NotaFinal'
      ReadOnly = True
      DisplayFormat = '#.00'
    end
    object AmostrasAvaliada: TIntegerField
      DisplayLabel = 'avaliada'
      FieldName = 'Avaliada'
      ReadOnly = True
    end
    object AmostrasJson: TMemoField
      DisplayLabel = 'sabores'
      FieldName = 'Json'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
  object ConcursoSrc: TDataSource
    DataSet = Concurso
    Left = 240
    Top = 72
  end
end
