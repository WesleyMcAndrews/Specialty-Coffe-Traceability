object IWFormDashboard: TIWFormDashboard
  Left = 0
  Top = 0
  Width = 1001
  Height = 637
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
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
  object VariedadesLink: TIWLink
    Left = 32
    Top = 71
    Width = 190
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
    FriendlyName = 'VariedadesLink'
    OnClick = VariedadesLinkClick
    TabOrder = 0
    RawText = False
    Caption = 'Variedades'
  end
  object AssociadosLink: TIWLink
    Left = 32
    Top = 94
    Width = 190
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
    FriendlyName = 'AssociadosLink'
    OnClick = AssociadosLinkClick
    TabOrder = 1
    RawText = False
    Caption = 'Associados'
  end
  object PropriedadesLink: TIWLink
    Left = 32
    Top = 117
    Width = 190
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
    FriendlyName = 'PropriedadesLink'
    OnClick = PropriedadesLinkClick
    TabOrder = 2
    RawText = False
    Caption = 'Propriedades'
  end
  object AlterarSenhaLink: TIWLink
    Left = 32
    Top = 192
    Width = 190
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
    FriendlyName = 'AlterarSenhaLink'
    OnClick = AlterarSenhaLinkClick
    TabOrder = 3
    RawText = False
    Caption = 'Alterar Senha'
  end
  object UsuariosLink: TIWLink
    Left = 32
    Top = 215
    Width = 190
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
    FriendlyName = 'UsuariosLink'
    OnClick = UsuariosLinkClick
    TabOrder = 4
    RawText = False
    Caption = 'Gerenciar'
  end
  object AmostrasLink: TIWLink
    Left = 32
    Top = 282
    Width = 190
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
    FriendlyName = 'AmostrasLink'
    OnClick = AmostrasLinkClick
    TabOrder = 5
    RawText = False
    Caption = 'Amostras'
  end
  object ProvasLink: TIWLink
    Left = 33
    Top = 365
    Width = 129
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
    FriendlyName = 'ProvasLink'
    OnClick = ProvasLinkClick
    TabOrder = 6
    RawText = False
    Caption = 'Provas'
  end
  object UserName: TIWLabel
    Left = 752
    Top = 32
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
  object ProfileLogoutLink: TIWLink
    Left = 752
    Top = 59
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
  object AmostrasAAnalisarLabel: TIWLabel
    Left = 768
    Top = 160
    Width = 199
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
    FriendlyName = 'AmostrasAAnalisarLabel'
    Caption = 'AmostrasAAnalisarLabel'
    RawText = False
  end
  object PontuacaoMediaEspeciaisLabel: TIWLabel
    Left = 768
    Top = 200
    Width = 251
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
    FriendlyName = 'PontuacaoMediaEspeciaisLabel'
    Caption = 'PontuacaoMediaEspeciaisLabel'
    RawText = False
  end
  object AreaCultivadaLabel: TIWLabel
    Left = 768
    Top = 278
    Width = 156
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
    FriendlyName = 'AreaCultivadaLabel'
    Caption = 'AreaCultivadaLabel'
    RawText = False
  end
  object PopularidadeMarcaLabel: TIWLabel
    Left = 768
    Top = 240
    Width = 196
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
    FriendlyName = 'PopularidadeMarcaLabel'
    Caption = 'PopularidadeMarcaLabel'
    RawText = False
  end
  object ConcursosLink: TIWLink
    Left = 31
    Top = 441
    Width = 130
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
    FriendlyName = 'ConcursosLink'
    OnClick = ConcursosLinkClick
    TabOrder = 8
    RawText = False
    Caption = 'Concursos'
  end
  object ConcursosInscricoesLink: TIWLink
    Left = 31
    Top = 464
    Width = 130
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
    FriendlyName = 'ConcursosInscricoesLink'
    OnClick = ConcursosInscricoesLinkClick
    TabOrder = 9
    RawText = False
    Caption = 'Inscri'#231#245'es'
  end
  object ConcursosResultadosLink: TIWLink
    Left = 32
    Top = 487
    Width = 130
    Height = 18
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
    FriendlyName = 'ConcursosResultadosLink'
    OnClick = ConcursosResultadosLinkClick
    TabOrder = 10
    RawText = False
    Caption = 'Resultados'
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'dashboard.html'
    RenderStyles = False
    Left = 832
    Top = 376
  end
  object Cotacao: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select '#39'[Date.UTC('#39'+cast(Ano as varchar(4))+'#39','#39'+Cast(Mes-1 as va' +
        'rchar(2))+'#39',1),'#39'+'
      'Cast(PrecoMedio as varchar(8))+'#39'],'#39' as Cotacao'
      'from cotacoesAgricolas'
      'where IDProduto=1'
      'and UF='#39'SP'#39
      'order by Ano, Mes')
    Left = 208
    Top = 24
    object CotacaoCotacao: TStringField
      FieldName = 'Cotacao'
      ReadOnly = True
      Size = 31
    end
  end
  object IWJQueryCotacao: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      '        Highcharts.setOptions({'
      #9'lang: {'
      
        #9#9'months: ['#39'Janeiro'#39', '#39'Fevereiro'#39', '#39'Mar'#231'o'#39', '#39'Abril'#39', '#39'Maio'#39', '#39'Ju' +
        'nho'#39',  '#39'Julho'#39', '#39'Agosto'#39', '#39'Setembro'#39', '#39'Outubro'#39', '#39'Novembro'#39', '#39'De' +
        'zembro'#39'],'
      
        '                              shortMonths: ['#39'Jan'#39', '#39'Fev'#39', '#39'Mar'#39',' +
        ' '#39'Abr'#39', '#39'Mai'#39', '#39'Jun'#39',  '#39'Jul'#39', '#39'Ago'#39', '#39'Set'#39', '#39'Out'#39', '#39'Nov'#39', '#39'Dez'#39']' +
        ','
      #9#9'decimalPoint: '#39','#39
      #9'}'
      '        });'
      ''
      '        $('#39'#cotacao'#39').highcharts({'
      '            chart: {'
      '                zoomType: '#39'x'#39
      '            },'
      '            title: {'
      
        '                text: '#39'Caf'#233' Beneficiado (Cereja Descascada) Sc 6' +
        '0kg'#39
      '            },'
      '            subtitle: {'
      '                text: document.ontouchstart === undefined ?'
      
        '                        '#39'Clique e arraste para zoom'#39' : '#39'Pinch th' +
        'e chart to zoom in'#39
      '            },'
      '            xAxis: {'
      '                type: '#39'datetime'#39
      '            },'
      '            yAxis: {'
      '                title: {'
      '                    text: '#39'R$'#39
      '                }'
      '            },'
      '            legend: {'
      '                enabled: false'
      '            },'
      '            plotOptions: {'
      '                area: {'
      '                    fillColor: {'
      '                        linearGradient: {'
      '                            x1: 0,'
      '                            y1: 0,'
      '                            x2: 0,'
      '                            y2: 1'
      '                        },'
      '                        stops: ['
      
        '                            [0, Highcharts.getOptions().colors[0' +
        ']],'
      
        '                            [1, Highcharts.Color(Highcharts.getO' +
        'ptions().colors[0]).setOpacity(0).get('#39'rgba'#39')]'
      '                        ]'
      '                    },'
      '                    marker: {'
      '                        radius: 2'
      '                    },'
      '                    lineWidth: 1,'
      '                    states: {'
      '                        hover: {'
      '                            lineWidth: 1'
      '                        }'
      '                    },'
      '                    threshold: null'
      '                }'
      '            },'
      '            series: [{'
      '                type: '#39'area'#39','
      '                name: '#39'Pre'#231'o M'#233'dio'#39','
      '                data: data'
      '            }]'
      '        });')
    Left = 208
    Top = 88
  end
  object AmostrasAAnalisar: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select COUNT(*) as Amostras from amostrasLotes'
      'where IDAmostra not in'
      '(Select IDAmostra from Classificacao)'
      'or IDAmostra not in (Select IDAmostra from Avaliacao)')
    Left = 288
    Top = 24
    object AmostrasAAnalisarAmostras: TIntegerField
      FieldName = 'Amostras'
      ReadOnly = True
    end
  end
  object PontuacaoMedia: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select Sum((A.Aroma+A.Sabor+A.Retrogosto+A.Acidez+A.Corpo+(A.Uni' +
        'formidade*2)+A.Balanco+(A.XicaraLimpa*2)+(A.Docura*2)+A.Geral)-(' +
        'A.XicarasDefeitosLeves*2)-(A.XicarasDefeitosGraves*4))/COUNT(*) ' +
        'as Media'
      'from Avaliacao A'
      'left join Classificacao C on C.IDAmostra=A.IDAmostra'
      'where C.BebidaComercial=0')
    Left = 416
    Top = 24
    object PontuacaoMediaMedia: TFloatField
      FieldName = 'Media'
      ReadOnly = True
    end
  end
  object AreaCultivada: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select Sum(poligono.STArea())/10000 as Area'
      'from Talhoes')
    Left = 536
    Top = 24
    object AreaCultivadaArea: TFloatField
      FieldName = 'Area'
      ReadOnly = True
    end
  end
end
