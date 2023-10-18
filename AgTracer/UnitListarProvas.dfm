object IWFormListarProvas: TIWFormListarProvas
  Left = 0
  Top = 0
  Width = 840
  Height = 400
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  HiddenFields.Strings = (
    'IDAMOSTRATOEDIT='
    'IDCLASSIFICACAOTOEDIT='
    'IDAVALIACAOTOEDIT=')
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
  object IncluirClassificacao: TIWLink
    Left = 16
    Top = 216
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
    FriendlyName = 'IWLink1'
    OnClick = IncluirClassificacaoClick
    TabOrder = 1
    RawText = False
    Caption = 'IncluirClassificacao'
  end
  object EditarClassificacao: TIWLink
    Left = 16
    Top = 239
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
    FriendlyName = 'IWLink1'
    OnClick = EditarClassificacaoClick
    TabOrder = 2
    RawText = False
    Caption = 'EditarClassificacao'
  end
  object ExcluirClassificacao: TIWLink
    Left = 16
    Top = 262
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
    Confirmation = 'Confirma a Exclus'#227'o desta Classifica'#231#227'o?'
    DoSubmitValidation = False
    FriendlyName = 'ExcluirClassificacao'
    OnClick = ExcluirClassificacaoClick
    TabOrder = 3
    RawText = False
    Caption = 'ExcluirClassificacao'
  end
  object IncluirAvaliacao: TIWLink
    Left = 16
    Top = 296
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
    FriendlyName = 'IncluirAvaliacao'
    OnClick = IncluirAvaliacaoClick
    TabOrder = 4
    RawText = False
    Caption = 'IncluirAvaliacao'
  end
  object EditarAvaliacao: TIWLink
    Left = 16
    Top = 319
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
    FriendlyName = 'IWLink1'
    OnClick = EditarAvaliacaoClick
    TabOrder = 5
    RawText = False
    Caption = 'EditarAvaliacao'
  end
  object ExcluirAvaliacao: TIWLink
    Left = 16
    Top = 342
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
    Confirmation = 'Confirma a Exclus'#227'o desta Avalia'#231#227'o?'
    DoSubmitValidation = False
    FriendlyName = 'ExcluirClassificacao'
    OnClick = ExcluirAvaliacaoClick
    TabOrder = 6
    RawText = False
    Caption = 'ExcluirAvaliacao'
  end
  object NaoAvaliadas: TIWCheckBox
    Left = 32
    Top = 96
    Width = 281
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
    Caption = 'Apenas Amostras N'#227'o Avaliadas'
    Editable = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    SubmitOnAsyncEvent = True
    ScriptEvents = <>
    DoSubmitValidation = False
    Style = stNormal
    TabOrder = 7
    OnAsyncClick = NaoAvaliadasAsyncClick
    Checked = True
    FriendlyName = 'NaoAvaliadas'
  end
  object ProfileLogoutLink: TIWLink
    Left = 703
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
    Templates.Default = 'listarProvas.html'
    RenderStyles = False
    Left = 656
    Top = 264
  end
  object Classificacao: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select C.IDClassificacao, U.NomeUsuario as NomeProvador, C.DataP' +
        'rova, C.Defeitos, C.Coloracao, '
      'C.Aspecto,'
      
        'Case when C.BebidaComercial=1 then C.TipoBebidaComercial else '#39'E' +
        'special'#39' end Tipo'
      'from Classificacao C'
      'left join Usuarios U on U.IDUsuario=C.IDProvador'
      'where C.IDAmostra=1'
      'order by C.DataProva')
    Left = 240
    Top = 16
    object ClassificacaoIDClassificacao: TAutoIncField
      DisplayLabel = 'id'
      FieldName = 'IDClassificacao'
      ReadOnly = True
    end
    object ClassificacaoNomeProvador: TStringField
      DisplayLabel = 'provador'
      FieldName = 'NomeProvador'
      Size = 50
    end
    object ClassificacaoDataProva: TDateTimeField
      DisplayLabel = 'dataProva'
      FieldName = 'DataProva'
    end
    object ClassificacaoDefeitos: TIntegerField
      DisplayLabel = 'defeitos'
      FieldName = 'Defeitos'
    end
    object ClassificacaoColoracao: TStringField
      DisplayLabel = 'coloracao'
      FieldName = 'Coloracao'
      Size = 50
    end
    object ClassificacaoAspecto: TStringField
      DisplayLabel = 'aspecto'
      FieldName = 'Aspecto'
    end
    object ClassificacaoTipo: TStringField
      DisplayLabel = 'tipo'
      FieldName = 'Tipo'
      ReadOnly = True
      Size = 50
    end
  end
  object Amostras: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select A.IDAmostra, A.IDLote, A.TipoAmostra, A.EtapaProcesso, A.' +
        'QtdeKg, A.DataEntrada,'
      
        'A.QRCode,A.DataDevolutiva,L.QtdeKg as QtdeLote, L.Safra, Ass.Nom' +
        'eAssociado,'
      'Ass.NomeResponsavel, P.NomePropriedade'
      'from AmostrasLotes A'
      'left join Lotes L on L.IDLote=A.IDLote'
      'left join Associados ASS on ASS.IDAssociado=L.IDAssociado'
      'left join Propriedades P on P.IDPropriedade=L.IDPropriedade'
      
        'where (A.IDAmostra not in (Select IDAmostra from Classificacao) ' +
        'or A.IDAmostra not in (Select IDAmostra from Avaliacao))'
      'order by A.DataEntrada')
    Left = 160
    Top = 16
    object AmostrasIDAmostra: TAutoIncField
      DisplayLabel = 'id'
      FieldName = 'IDAmostra'
      ReadOnly = True
    end
    object AmostrasIDLote: TIntegerField
      DisplayLabel = 'lote'
      FieldName = 'IDLote'
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
    end
    object AmostrasDataEntrada: TDateTimeField
      DisplayLabel = 'entrada'
      FieldName = 'DataEntrada'
    end
    object AmostrasDataDevolutiva: TDateTimeField
      DisplayLabel = 'devolutiva'
      FieldName = 'DataDevolutiva'
    end
    object AmostrasQtdeLote: TIntegerField
      DisplayLabel = 'qtdeLote'
      FieldName = 'QtdeLote'
    end
    object AmostrasSafra: TStringField
      DisplayLabel = 'safra'
      FieldName = 'Safra'
      Size = 9
    end
    object AmostrasNomeAssociado: TStringField
      DisplayLabel = 'associado'
      FieldName = 'NomeAssociado'
      Size = 200
    end
    object AmostrasNomeResponsavel: TStringField
      DisplayLabel = 'responsavel'
      FieldName = 'NomeResponsavel'
      Size = 200
    end
    object AmostrasNomePropriedade: TStringField
      DisplayLabel = 'propriedade'
      FieldName = 'NomePropriedade'
      Size = 100
    end
    object AmostrasQRCode: TGuidField
      DisplayLabel = 'qrcode'
      FieldName = 'QRCode'
      FixedChar = True
      Size = 38
    end
  end
  object IWJQueryAmostras: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      ''
      '/* Formatting function for row details - modify as you need */'
      'function formatAmostra ( d ) {'
      '    // `d` is the original data object for the row'
      
        '    return '#39'<table cellpadding="5" cellspacing="0" border="0" st' +
        'yle="padding-left:50px;">'#39'+'
      '        '#39'<tr>'#39'+'
      '            '#39'<td>Associado:</td>'#39'+'
      '            '#39'<td>'#39'+d.associado+'#39'</td>'#39'+'
      '        '#39'</tr>'#39'+'
      '        '#39'<tr>'#39'+'
      '            '#39'<td>Respons'#225'vel:</td>'#39'+'
      '            '#39'<td>'#39'+d.responsavel+'#39'</td>'#39'+'
      '        '#39'</tr>'#39'+'
      '        '#39'<tr>'#39'+'
      '            '#39'<td>Propriedade:</td>'#39'+'
      '            '#39'<td>'#39'+d.propriedade+'#39'</td>'#39'+'
      '        '#39'</tr>'#39'+'
      '    '#39'</table>'#39';'
      '}'
      ' '
      ''
      '  var oTable =  $('#39'#amostras'#39').DataTable( {'
      '        "ajax": "../../../../examples/ajax/data/objects.txt",'
      '        "columns": ['
      '            { "data": "id", "visible": false },'
      '            {'
      '                "className":      '#39'details-control'#39','
      '                "orderable":      false,'
      '                "data":           null,'
      '                "defaultContent": '#39#39
      '            },'
      
        '            { "data": "lote", "title": "Lote", className: "dt-ce' +
        'nter" },'
      '            { "data": "tipo", "title": "Tipo" },'
      '            { "data": "etapa", "title": "Etapa do Processo" },'
      
        '            { "data": "entrada", "title": "Entrada", className: ' +
        '"dt-center" },'
      
        '            { "data": "devolutiva", "title": "Devolutiva", class' +
        'Name: "dt-center" },'
      '            { "data": "qtdeLote", "title": "Lote(Kg)" },'
      
        '            { "data": "safra", "title": "Safra", className: "dt-' +
        'center" }'
      '           // { "data": "associado", "title": "Associado" },'
      '           // { "data": "propriedade", "title": "Propriedade" },'
      '           // { "data": "responsavel", "title": "Respons'#225'vel" }'
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
      '            $('#39'#HIDDEN_IDCLASSIFICACAOTOEDIT'#39').val(null);'
      '            $('#39'#HIDDEN_IDAVALIACAOTOEDIT'#39').val(null);'
      '            $('#39'#CLASSIFICACAODIV'#39').hide();'
      '            $('#39'#AVALIACAODIV'#39').hide();'
      '        }'
      '        else {'
      '            oTable.$('#39'tr.selected'#39').removeClass('#39'selected'#39');'
      '            $(this).addClass('#39'selected'#39');'
      '            //var sID = oTable.fnGetData($(this));'
      '            var sID = oTable.row(this).data();'
      '            $('#39'#HIDDEN_IDAMOSTRATOEDIT'#39').val(sID['#39'id'#39']);'
      
        '            executeAjaxEvent("&id="+$('#39'#HIDDEN_IDAMOSTRATOEDIT'#39')' +
        '.val(), null,"MyAjaxHandler",false, null, false);'
      '            $('#39'#CLASSIFICACAODIV'#39').show();'
      '            $('#39'#AVALIACAODIV'#39').show();'
      '        }'
      '    } );'
      ' '
      '    $('#39'#button'#39').click( function () {'
      '        oTable.row('#39'.selected'#39').remove().draw( false );'
      '    } );'
      ''
      '        // Add event listener for opening and closing details'
      
        '    $('#39'#amostras tbody'#39').on('#39'click'#39', '#39'td.details-control'#39', funct' +
        'ion () {'
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
      '            row.child( formatAmostra(row.data()) ).show();'
      '            tr.addClass('#39'shown'#39');'
      '        }'
      '    } );')
    Left = 456
    Top = 184
  end
  object IWJQueryClassificacao: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      ''
      '  var oClassificacao =  $('#39'#classificacao'#39').dataTable( {'
      '        /*   "ajax": ,*/'
      '        "columns": ['
      '            { "data": "id", "visible": false },'
      '            { "data": "provador", "title": "Provador" },'
      
        '            { "data": "dataProva", "title": "Dt. Prova", classNa' +
        'me: "dt-center" },'
      '            { "data": "defeitos", "title": "Defeitos" },'
      '            { "data": "coloracao", "title": "Colora'#231#227'o" },'
      '            { "data": "aspecto", "title": "Aspecto" },'
      '            { "data": "tipo", "title": "Tipo" }'
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );'
      ''
      '   $('#39'#classificacao tbody'#39').on( '#39'click'#39', '#39'tr'#39', function () {'
      '        if ( $(this).hasClass('#39'selected'#39') ) {'
      '            $(this).removeClass('#39'selected'#39');'
      '            $('#39'#HIDDEN_IDCLASSIFICACAOTOEDIT'#39').val(null);'
      '        }'
      '        else {'
      
        '            oClassificacao.$('#39'tr.selected'#39').removeClass('#39'selecte' +
        'd'#39');'
      '            $(this).addClass('#39'selected'#39');'
      '            var sID = oClassificacao.fnGetData($(this));'
      '           $('#39'#HIDDEN_IDCLASSIFICACAOTOEDIT'#39').val(sID['#39'id'#39']);'
      '        }'
      '    } );'
      ' '
      '    $('#39'#button'#39').click( function () {'
      '        oClassificacao.row('#39'.selected'#39').remove().draw( false );'
      '    } );')
    Left = 456
    Top = 256
  end
  object Avaliacao: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select A.IDAvaliacao, U.NomeUsuario as NomeProvador, A.DataAvali' +
        'acao, A.TempoTorra,'
      
        'A.ColoracaoTorra, A.Aroma, A.Sabor, A.Retrogosto, A.Acidez, A.Co' +
        'rpo, A.Uniformidade, A.Balanco,'
      
        'A.XicaraLimpa, A.Docura, A.Geral, A.XicarasDefeitosLeves, A.Xica' +
        'rasDefeitosGraves,'
      
        '(A.Aroma+A.Sabor+A.Retrogosto+A.Acidez+A.Corpo+(A.Uniformidade*2' +
        ')+A.Balanco+(A.XicaraLimpa*2)+(A.Docura*2)+A.Geral)-(A.XicarasDe' +
        'feitosLeves*2)-(A.XicarasDefeitosGraves*4) as NotaFinal,'
      'R.Json'
      'from Avaliacao A'
      'left Join RosasSabores R on R.IDAvaliacao=A.IDAvaliacao'
      'left join Usuarios U on U.IDUsuario=A.IDProvador'
      'where A.IDAmostra=2'
      'order by A.DataAvaliacao')
    Left = 328
    Top = 16
    object AvaliacaoIDAvaliacao: TAutoIncField
      DisplayLabel = 'id'
      FieldName = 'IDAvaliacao'
      ReadOnly = True
    end
    object AvaliacaoNomeProvador: TStringField
      DisplayLabel = 'provador'
      FieldName = 'NomeProvador'
      Size = 50
    end
    object AvaliacaoDataAvaliacao: TDateTimeField
      DisplayLabel = 'dataAvaliacao'
      FieldName = 'DataAvaliacao'
    end
    object AvaliacaoTempoTorra: TSmallintField
      DisplayLabel = 'tempoTorra'
      FieldName = 'TempoTorra'
    end
    object AvaliacaoColoracaoTorra: TFloatField
      DisplayLabel = 'coloracao'
      FieldName = 'ColoracaoTorra'
    end
    object AvaliacaoAroma: TFloatField
      DisplayLabel = 'aroma'
      FieldName = 'Aroma'
    end
    object AvaliacaoUniformidade: TFloatField
      DisplayLabel = 'uniformidade'
      FieldName = 'Uniformidade'
    end
    object AvaliacaoXicaraLimpa: TFloatField
      DisplayLabel = 'xicaraLimpa'
      FieldName = 'XicaraLimpa'
    end
    object AvaliacaoDocura: TFloatField
      DisplayLabel = 'docura'
      FieldName = 'Docura'
    end
    object AvaliacaoSabor: TFloatField
      DisplayLabel = 'sabor'
      FieldName = 'Sabor'
    end
    object AvaliacaoAcidez: TFloatField
      DisplayLabel = 'acidez'
      FieldName = 'Acidez'
    end
    object AvaliacaoCorpo: TFloatField
      DisplayLabel = 'corpo'
      FieldName = 'Corpo'
    end
    object AvaliacaoRetrogosto: TFloatField
      DisplayLabel = 'retrogosto'
      FieldName = 'Retrogosto'
    end
    object AvaliacaoBalanco: TFloatField
      DisplayLabel = 'balanco'
      FieldName = 'Balanco'
    end
    object AvaliacaoGeral: TFloatField
      DisplayLabel = 'geral'
      FieldName = 'Geral'
    end
    object AvaliacaoNotaFinal: TFloatField
      DisplayLabel = 'notaFinal'
      FieldName = 'NotaFinal'
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object AvaliacaoJson: TMemoField
      DisplayLabel = 'json'
      FieldName = 'Json'
      ReadOnly = True
      Visible = False
      BlobType = ftMemo
    end
  end
  object IWJQueryAvaliador: TIWJQueryWidget
    Enabled = False
    OnReady.Strings = (
      ''
      '/* Formatting function for row details - modify as you need */'
      'function formatAmostra ( d ) {'
      '    // `d` is the original data object for the row'
      
        '    return '#39'<table cellpadding="5" cellspacing="0" border="0" st' +
        'yle="padding-left:50px;">'#39'+'
      '        '#39'<tr>'#39'+'
      '            '#39'<td>Associado:</td>'#39'+'
      '            '#39'<td>'#39'+d.associado+'#39'</td>'#39'+'
      '        '#39'</tr>'#39'+'
      '        '#39'<tr>'#39'+'
      '            '#39'<td>Respons'#225'vel:</td>'#39'+'
      '            '#39'<td>'#39'+d.responsavel+'#39'</td>'#39'+'
      '        '#39'</tr>'#39'+'
      '        '#39'<tr>'#39'+'
      '            '#39'<td>Propriedade:</td>'#39'+'
      '            '#39'<td>'#39'+d.propriedade+'#39'</td>'#39'+'
      '        '#39'</tr>'#39'+'
      '    '#39'</table>'#39';'
      '}'
      ' '
      ''
      '  var oTable =  $('#39'#amostras'#39').DataTable( {'
      '        "ajax": "../../../../examples/ajax/data/objects.txt",'
      '        "columns": ['
      '            { "data": "id", "visible": false },'
      '            {'
      '                "className":      '#39'details-control'#39','
      '                "orderable":      false,'
      '                "data":           null,'
      '                "defaultContent": '#39#39
      '            },'
      
        '            { "data": "qrcode", "title": "C'#243'digo", className: "d' +
        't-center" },'
      
        '            { "data": "entrada", "title": "Entrada", className: ' +
        '"dt-center" },'
      
        '            { "data": "devolutiva", "title": "Devolutiva", class' +
        'Name: "dt-center" },'
      '           // { "data": "associado", "title": "Associado" },'
      '           // { "data": "propriedade", "title": "Propriedade" },'
      '           // { "data": "responsavel", "title": "Respons'#225'vel" }'
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
      '            $('#39'#HIDDEN_IDCLASSIFICACAOTOEDIT'#39').val(null);'
      '            $('#39'#HIDDEN_IDAVALIACAOTOEDIT'#39').val(null);'
      '            $('#39'#CLASSIFICACAODIV'#39').hide();'
      '            $('#39'#AVALIACAODIV'#39').hide();'
      '        }'
      '        else {'
      '            oTable.$('#39'tr.selected'#39').removeClass('#39'selected'#39');'
      '            $(this).addClass('#39'selected'#39');'
      '            //var sID = oTable.fnGetData($(this));'
      '            var sID = oTable.row(this).data();'
      '            $('#39'#HIDDEN_IDAMOSTRATOEDIT'#39').val(sID['#39'id'#39']);'
      
        '            executeAjaxEvent("&id="+$('#39'#HIDDEN_IDAMOSTRATOEDIT'#39')' +
        '.val(), null,"MyAjaxHandler",false, null, false);'
      '            $('#39'#CLASSIFICACAODIV'#39').show();'
      '            $('#39'#AVALIACAODIV'#39').show();'
      '        }'
      '    } );'
      ' '
      '    $('#39'#button'#39').click( function () {'
      '        oTable.row('#39'.selected'#39').remove().draw( false );'
      '    } );'
      ''
      '        // Add event listener for opening and closing details'
      
        '    $('#39'#amostras tbody'#39').on('#39'click'#39', '#39'td.details-control'#39', funct' +
        'ion () {'
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
      '            row.child( formatAmostra(row.data()) ).show();'
      '            tr.addClass('#39'shown'#39');'
      '        }'
      '    } );')
    Left = 456
    Top = 128
  end
  object IWJQueryAvaliacao: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      '/* Formatting function for row details - modify as you need */'
      'function formatAvaliacao ( el, e ) {'
      '    // `d` is the original data object for the row'
      
        '    var div1 = $('#39'<div/>'#39', {id: '#39'polarChart_'#39'+e.id, class: '#39'form' +
        '-group col-md-4'#39',}).appendTo(el);'
      '    div1.highcharts({'
      ''
      '        chart: {'
      '            polar: true,'
      '            type: '#39'line'#39','
      '            height: 300,'
      '            widht: 300,'
      '            backgroundColor: '#39'transparent'#39
      '        },'
      ''
      '        title: {'
      '            floating: true,'
      '            text: null'
      '        },'
      ''
      '        pane: {'
      '           //size: '#39'80%'#39
      '        },'
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
      '    return div1'
      '}'
      ' '
      '  var oAvaliacao =  $('#39'#avaliacao'#39').DataTable( {'
      '        /*   "ajax": ,*/'
      '        "columns": ['
      '            { "data": "id", "visible": false },'
      '            {'
      '                "className":      '#39'details-control'#39','
      '                "orderable":      false,'
      '                "data":           null,'
      '                "defaultContent": '#39#39
      '            },'
      '            { "data": "provador", "title": "Provador" },'
      
        '            { "data": "dataAvaliacao", "title": "Dt. Avalia'#231#227'o",' +
        ' className: "dt-center" },'
      '            { "data": "tempoTorra", "title": "Tempo de Torra" },'
      
        '            { "data": "coloracao", "title": "Colora'#231#227'o da Torra"' +
        ' },'
      '            //{ "data": "aroma", "title": "Aroma" },'
      
        '            //{ "data": "uniformidade", "title": "Uniformidade" ' +
        '},'
      
        '            //{ "data": "xicaraLimpa", "title": "X'#237'cara Limpa" }' +
        ','
      '            //{ "data": "docura", "title": "Do'#231'ura" },'
      '            //{ "data": "sabor", "title": "Sabor" },'
      '            //{ "data": "acidez", "title": "Acidez" },'
      '            //{ "data": "corpo", "title": "Corpo" },'
      '            //{ "data": "retrogosto", "title": "Retrogosto" },'
      '            //{ "data": "balanco", "title": "Balan'#231'o" },'
      '            //{ "data": "geral", "title": "Geral" },'
      
        '            //{ "data": "defeitosXicara", "title": "Defeitos X'#237'c' +
        'ara" },'
      
        '            //{ "data": "defeitosIntensidade", "title": "Defeito' +
        's Intensidade" },'
      
        '            { "data": "notaFinal", "title": "Nota Final", classN' +
        'ame: "dt-center" }'
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );'
      ''
      '   $('#39'#avaliacao tbody'#39').on( '#39'click'#39', '#39'tr'#39', function () {'
      '        if ( $(this).hasClass('#39'selected'#39') ) {'
      '            $(this).removeClass('#39'selected'#39');'
      '            $('#39'#HIDDEN_IDAVALIACAOTOEDIT'#39').val(null);'
      '        }'
      '        else {'
      '            oAvaliacao.$('#39'tr.selected'#39').removeClass('#39'selected'#39');'
      '            $(this).addClass('#39'selected'#39');'
      '            var sID = oAvaliacao.row(this).data();'
      '           $('#39'#HIDDEN_IDAVALIACAOTOEDIT'#39').val(sID['#39'id'#39']);'
      '        }'
      '    } );'
      ' '
      '    $('#39'#button'#39').click( function () {'
      '        oAvaliacao.row('#39'.selected'#39').remove().draw( false );'
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
        'ow();'
      '            tr.addClass('#39'shown'#39');'
      '        }'
      '    } );')
    Left = 456
    Top = 328
  end
end
