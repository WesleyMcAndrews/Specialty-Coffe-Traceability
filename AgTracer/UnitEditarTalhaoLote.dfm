object IWFormEditarTalhaoLote: TIWFormEditarTalhaoLote
  Left = 0
  Top = 0
  Width = 899
  Height = 677
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  ActiveControl = IDTalhao
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
  object SalvarBtn: TIWButton
    Left = 30
    Top = 635
    Width = 75
    Height = 25
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'SalvarBtn'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'SalvarBtn'
    ScriptEvents = <>
    TabOrder = 29
    OnClick = SalvarBtnClick
  end
  object CancelarBtn: TIWButton
    Left = 136
    Top = 635
    Width = 75
    Height = 25
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Cancelar'
    DoSubmitValidation = False
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'CancelarBtn'
    ScriptEvents = <>
    TabOrder = 30
    OnClick = VoltarLinkClick
  end
  object CadastradoPor: TIWDBLabel
    Left = 24
    Top = 602
    Width = 134
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    DataField = 'UsuarioCadastro'
    DataSource = UsuariosSrc
    FriendlyName = 'CadastradoPor'
  end
  object EditadoPor: TIWDBLabel
    Left = 164
    Top = 602
    Width = 115
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    DataField = 'UsuarioEdicao'
    DataSource = UsuariosSrc
    FriendlyName = 'UsuarioCadastro'
  end
  object MetodoPreparo: TIWDBComboBox
    Left = 24
    Top = 252
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
    TabOrder = 2
    AutoEditable = False
    DataField = 'MetodoPreparo'
    DataSource = TalhoesLotesSrc
    FriendlyName = 'Metodo Preparo'
    ItemIndex = -1
    Items.Strings = (
      'Boia'
      'Cereja Descascado'
      'Cereja Despolpado'
      'Fully Washed'
      'Natural'
      'Verde Descascado')
    Sorted = True
  end
  object DataIniColheita: TIWDBEdit
    Left = 24
    Top = 279
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Data Inicio Colheita'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <
      item
        EventCode.Strings = (
          'var dataIni = new Date($('#39'#DATAINICOLHEITA'#39').val()); '
          'var dataFim = new Date($('#39'#DATAFIMCOLHEITA'#39').val());'
          'if(dataFim < dataIni)'
          '{'
          '   $(this).val(null);'
          '   alert('#39'A data Final n'#227'o pode ser anterior a Inicial'#39');'
          '}')
        Event = 'onChange'
      end>
    SubmitOnAsyncEvent = True
    TabOrder = 3
    AutoEditable = False
    DataField = 'DtIniColheita'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object DataFimColheita: TIWDBEdit
    Left = 24
    Top = 306
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Data Fim Colheita'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <
      item
        EventCode.Strings = (
          'var dataIni = new Date($('#39'#DATAINICOLHEITA'#39').val()); '
          'var dataFim = new Date($('#39'#DATAFIMCOLHEITA'#39').val());'
          'if(dataFim < dataIni)'
          '{'
          '   $(this).val(null);'
          '   alert('#39'A data Final n'#227'o pode ser anterior a Inicial'#39');'
          '}')
        Event = 'onChange'
      end>
    SubmitOnAsyncEvent = True
    TabOrder = 4
    AutoEditable = False
    DataField = 'DtFimColheita'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object TipoTerreiro: TIWDBComboBox
    Left = 24
    Top = 360
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
    TabOrder = 6
    AutoEditable = False
    DataField = 'TipoTerreiro'
    DataSource = TalhoesLotesSrc
    FriendlyName = 'Tipo Terreiro'
    ItemIndex = -1
    Items.Strings = (
      'Asfalto'
      'Cimento'
      'Suspenso'
      'Terra')
    Sorted = True
  end
  object DataEntradaTerreiro: TIWDBEdit
    Left = 24
    Top = 414
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Data Entrada Terreiro'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <
      item
        EventCode.Strings = (
          'var dataIni = new Date($('#39'#DATAENTRADATERREIRO'#39').val()); '
          'var dataFim = new Date($('#39'#DATASAIDATERREIRO'#39').val());'
          'if(dataFim < dataIni)'
          '{'
          '   $(this).val(null);'
          '   alert('#39'A data Final n'#227'o pode ser anterior a Inicial'#39');'
          '}')
        Event = 'onChange'
      end>
    SubmitOnAsyncEvent = True
    TabOrder = 8
    AutoEditable = False
    DataField = 'DtEntradaTerreiro'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object DataSaidaTerreiro: TIWDBEdit
    Left = 24
    Top = 440
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Data Sa'#237'da Terreiro'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <
      item
        EventCode.Strings = (
          'var dataIni = new Date($('#39'#DATAENTRADATERREIRO'#39').val()); '
          'var dataFim = new Date($('#39'#DATASAIDATERREIRO'#39').val());'
          'if(dataFim < dataIni)'
          '{'
          '   $(this).val(null);'
          '   alert('#39'A data Final n'#227'o pode ser anterior a Inicial'#39');'
          '}')
        Event = 'onChange'
      end>
    SubmitOnAsyncEvent = True
    TabOrder = 9
    AutoEditable = False
    DataField = 'DtSaidaTerreiro'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object QtdeEspessura: TIWDBEdit
    Left = 24
    Top = 467
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Espessura'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 10
    AutoEditable = False
    DataField = 'Espessura'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object MetodoRodagem: TIWDBComboBox
    Left = 24
    Top = 494
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
    TabOrder = 11
    AutoEditable = False
    DataField = 'MetodoRodagem'
    DataSource = TalhoesLotesSrc
    FriendlyName = 'Metodo de Rodagem'
    ItemIndex = -1
    Items.Strings = (
      'Manual'
      'Mec'#226'nica'
      'Tra'#231#227'o Animal')
    Sorted = True
  end
  object ChkCafeChuvado: TIWDBEdit
    Left = 216
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Caf'#233' Chuvado'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 13
    AutoEditable = False
    DataField = 'CafeChuvado'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object TemperMedRodagem: TIWDBEdit
    Left = 216
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Temperatuda de Rodagem'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 14
    AutoEditable = False
    DataField = 'TempMedRodagem'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object TipoSecador: TIWDBComboBox
    Left = 216
    Top = 199
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
    TabOrder = 15
    AutoEditable = False
    DataField = 'TipoSecador'
    DataSource = TalhoesLotesSrc
    FriendlyName = 'Tipo Secador'
    ItemIndex = -1
    Items.Strings = (
      'Horizontal'
      'Rotativo'
      'Silo Secador'
      'Vertical')
    Sorted = True
  end
  object DataEntradaSecador: TIWDBEdit
    Left = 216
    Top = 252
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Data Entrada Secador'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <
      item
        EventCode.Strings = (
          'var dataIni = new Date($('#39'#DATAENTRADASECADOR'#39').val()); '
          'var dataFim = new Date($('#39'#DATASAIDASECADOR'#39').val());'
          'if(dataFim < dataIni)'
          '{'
          '   $(this).val(null);'
          '   alert('#39'A data Final n'#227'o pode ser anterior a Inicial'#39');'
          '}')
        Event = 'onChange'
      end>
    SubmitOnAsyncEvent = True
    TabOrder = 17
    AutoEditable = False
    DataField = 'DtEntradaSecador'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object DataSaidaSecador: TIWDBEdit
    Left = 216
    Top = 279
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Data Saida Secador'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <
      item
        EventCode.Strings = (
          'var dataIni = new Date($('#39'#DATAENTRADASECADOR'#39').val()); '
          'var dataFim = new Date($('#39'#DATASAIDASECADOR'#39').val());'
          'if(dataFim < dataIni)'
          '{'
          '   $(this).val(null);'
          '   alert('#39'A data Final n'#227'o pode ser anterior a Inicial'#39');'
          '}')
        Event = 'onChange'
      end>
    SubmitOnAsyncEvent = True
    TabOrder = 18
    AutoEditable = False
    DataField = 'DtSaidaSecador'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object TemperMassa: TIWDBEdit
    Left = 216
    Top = 335
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Temperatura massa'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 20
    AutoEditable = False
    DataField = 'TempMassa'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object TemperFornalha: TIWDBEdit
    Left = 216
    Top = 308
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Temperatuda Fornalha'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 19
    AutoEditable = False
    DataField = 'TempFornalha'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object DataEntradaTulha: TIWDBEdit
    Left = 216
    Top = 440
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Data Entrada Tulha'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <
      item
        EventCode.Strings = (
          'var dataIni = new Date($('#39'#DATAENTRADATULHA'#39').val()); '
          'var dataFim = new Date($('#39'#DATASAIDATULHA'#39').val());'
          'if(dataFim < dataIni)'
          '{'
          '   $(this).val(null);'
          '   alert('#39'A data Final n'#227'o pode ser anterior a Inicial'#39');'
          '}')
        Event = 'onChange'
      end>
    SubmitOnAsyncEvent = True
    TabOrder = 24
    AutoEditable = False
    DataField = 'DtEntradaTulha'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object QtdePeriodoDescanso: TIWDBEdit
    Left = 216
    Top = 362
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Per'#237'odo de Descanso'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 21
    AutoEditable = False
    DataField = 'PeriodoDescanso'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object DataSaidaTulha: TIWDBEdit
    Left = 216
    Top = 467
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Data Sa'#237'da Tulha'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <
      item
        EventCode.Strings = (
          'var dataIni = new Date($('#39'#DATAENTRADATULHA'#39').val()); '
          'var dataFim = new Date($('#39'#DATASAIDATULHA'#39').val());'
          'if(dataFim < dataIni)'
          '{'
          '   $(this).val(null);'
          '   alert('#39'A data Final n'#227'o pode ser anterior a Inicial'#39');'
          '}')
        Event = 'onChange'
      end>
    SubmitOnAsyncEvent = True
    TabOrder = 25
    AutoEditable = False
    DataField = 'DtSaidaTulha'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object MetodoArmazenagem: TIWDBComboBox
    Left = 216
    Top = 548
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
    TabOrder = 28
    AutoEditable = False
    DataField = 'MetodoArmazenagem'
    DataSource = TalhoesLotesSrc
    FriendlyName = 'M'#233'todo de Armazenagem'
    ItemIndex = -1
    Items.Strings = (
      'Big bag'
      'Granel'
      'Sacaria')
    Sorted = True
  end
  object QtdeUmidadeAoBeneficiar: TIWDBEdit
    Left = 216
    Top = 494
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Umidade ao Beneficiar'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 26
    AutoEditable = False
    DataField = 'UmidadeAoBeneficiar'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object IDTalhao: TIWDBLookupComboBox
    Left = 24
    Top = 199
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
    TabOrder = 1
    AutoEditable = False
    DataField = 'IDTalhao'
    DataSource = TalhoesLotesSrc
    FriendlyName = 'Talh'#227'o'
    KeyField = 'IDTalhao'
    ListField = 'NomeTalhao'
    ListSource = TalhoesSrc
    DisableWhenEmpty = True
  end
  object NomeAssociado: TIWDBEdit
    Left = 24
    Top = 75
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
    NonEditableAsLabel = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'NomeAssociado'
    MaxLength = 0
    ReadOnly = True
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 31
    AutoEditable = False
    DataField = 'NomeAssociado'
    PasswordPrompt = False
    DataSource = LoteSrc
  end
  object NomePropriedade: TIWDBEdit
    Left = 24
    Top = 102
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
    NonEditableAsLabel = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = True
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 32
    AutoEditable = False
    DataField = 'NomePropriedade'
    PasswordPrompt = False
    DataSource = LoteSrc
  end
  object QtdeFrequenciaRodagem: TIWDBEdit
    Left = 24
    Top = 521
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Frequencia Rodagem'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 12
    AutoEditable = False
    DataField = 'FrequenciaRodagem'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object TipoTulha: TIWDBComboBox
    Left = 216
    Top = 386
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
    TabOrder = 22
    AutoEditable = False
    DataField = 'TipoTulha'
    DataSource = TalhoesLotesSrc
    FriendlyName = 'Tipo Tulha'
    ItemIndex = -1
    Items.Strings = (
      'Alvenaria'
      'Madeira'
      'Metal')
    Sorted = True
  end
  object LocalArmazenagem: TIWDBEdit
    Left = 216
    Top = 521
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Local de Armazenagem'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <
      item
        EventCode.Strings = (
          'this.value=this.value.replace(/["'#39']/g, "");')
        Event = 'onKeyUp'
      end>
    SubmitOnAsyncEvent = True
    TabOrder = 27
    AutoEditable = False
    DataField = 'LocalArmazenagem'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object TEMPOCOLHEITATERREIRO: TIWDBComboBox
    Left = 24
    Top = 333
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
    TabOrder = 5
    AutoEditable = False
    DataField = 'TempoColheitaTerreiro'
    DataSource = TalhoesLotesSrc
    FriendlyName = 'Tempo M'#233'dio entre a Colheita e o Terreiro'
    ItemIndex = -1
    Items.Strings = (
      '02h'
      '12h'
      '24h'
      'mais de 24h')
    Sorted = False
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
    TabOrder = 33
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
  object NomeTerreiro: TIWDBEdit
    Left = 24
    Top = 387
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Nome Terreiro'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <
      item
        EventCode.Strings = (
          'var dataIni = new Date($('#39'#DATAENTRADATERREIRO'#39').val()); '
          'var dataFim = new Date($('#39'#DATASAIDATERREIRO'#39').val());'
          'if(dataFim < dataIni)'
          '{'
          '   $(this).val(null);'
          '   alert('#39'A data Final n'#227'o pode ser anterior a Inicial'#39');'
          '}')
        Event = 'onChange'
      end>
    SubmitOnAsyncEvent = True
    TabOrder = 7
    AutoEditable = False
    DataField = 'NomeTerreiro'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object NomeSecador: TIWDBEdit
    Left = 216
    Top = 226
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Nome Secador'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <
      item
        EventCode.Strings = (
          'var dataIni = new Date($('#39'#DATAENTRADATERREIRO'#39').val()); '
          'var dataFim = new Date($('#39'#DATASAIDATERREIRO'#39').val());'
          'if(dataFim < dataIni)'
          '{'
          '   $(this).val(null);'
          '   alert('#39'A data Final n'#227'o pode ser anterior a Inicial'#39');'
          '}')
        Event = 'onChange'
      end>
    SubmitOnAsyncEvent = True
    TabOrder = 16
    AutoEditable = False
    DataField = 'NomeSecador'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object NomeTulha: TIWDBEdit
    Left = 216
    Top = 413
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
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Nome Terreiro'
    MaxLength = 0
    ReadOnly = False
    Required = True
    ScriptEvents = <
      item
        EventCode.Strings = (
          'var dataIni = new Date($('#39'#DATAENTRADATERREIRO'#39').val()); '
          'var dataFim = new Date($('#39'#DATASAIDATERREIRO'#39').val());'
          'if(dataFim < dataIni)'
          '{'
          '   $(this).val(null);'
          '   alert('#39'A data Final n'#227'o pode ser anterior a Inicial'#39');'
          '}')
        Event = 'onChange'
      end>
    SubmitOnAsyncEvent = True
    TabOrder = 23
    AutoEditable = False
    DataField = 'NomeTulha'
    PasswordPrompt = False
    DataSource = TalhoesLotesSrc
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'editarTalhaoLote.html'
    RenderStyles = False
    Left = 672
    Top = 320
  end
  object TalhoesLotes: TADODataSet
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    CommandText = 'Select * from TalhoesLotes'
    Parameters = <>
    Left = 376
    Top = 40
    object TalhoesLotesIDLote: TIntegerField
      FieldName = 'IDLote'
    end
    object TalhoesLotesIDTalhao: TIntegerField
      FieldName = 'IDTalhao'
    end
    object TalhoesLotesIDTalhaoLote: TAutoIncField
      FieldName = 'IDTalhaoLote'
      ReadOnly = True
    end
    object TalhoesLotesMetodoPreparo: TStringField
      FieldName = 'MetodoPreparo'
      Size = 50
    end
    object TalhoesLotesDtIniColheita: TDateTimeField
      FieldName = 'DtIniColheita'
    end
    object TalhoesLotesDtFimColheita: TDateTimeField
      FieldName = 'DtFimColheita'
    end
    object TalhoesLotesTempoColheitaTerreiro: TStringField
      FieldName = 'TempoColheitaTerreiro'
      Size = 15
    end
    object TalhoesLotesTipoTerreiro: TStringField
      FieldName = 'TipoTerreiro'
      Size = 50
    end
    object TalhoesLotesNomeTerreiro: TStringField
      FieldName = 'NomeTerreiro'
      Size = 50
    end
    object TalhoesLotesDtEntradaTerreiro: TDateTimeField
      FieldName = 'DtEntradaTerreiro'
    end
    object TalhoesLotesDtSaidaTerreiro: TDateTimeField
      FieldName = 'DtSaidaTerreiro'
    end
    object TalhoesLotesEspessura: TSmallintField
      FieldName = 'Espessura'
    end
    object TalhoesLotesMetodoRodagem: TStringField
      FieldName = 'MetodoRodagem'
      Size = 15
    end
    object TalhoesLotesFrequenciaRodagem: TSmallintField
      FieldName = 'FrequenciaRodagem'
    end
    object TalhoesLotesCafeChuvado: TBooleanField
      FieldName = 'CafeChuvado'
      DisplayValues = 'on;off'
    end
    object TalhoesLotesTempMedRodagem: TSmallintField
      FieldName = 'TempMedRodagem'
    end
    object TalhoesLotesTipoSecador: TStringField
      FieldName = 'TipoSecador'
      Size = 50
    end
    object TalhoesLotesNomeSecador: TStringField
      FieldName = 'NomeSecador'
      Size = 50
    end
    object TalhoesLotesDtEntradaSecador: TDateTimeField
      FieldName = 'DtEntradaSecador'
    end
    object TalhoesLotesDtSaidaSecador: TDateTimeField
      FieldName = 'DtSaidaSecador'
    end
    object TalhoesLotesTempFornalha: TSmallintField
      FieldName = 'TempFornalha'
    end
    object TalhoesLotesTempMassa: TSmallintField
      FieldName = 'TempMassa'
    end
    object TalhoesLotesPeriodoDescanso: TSmallintField
      FieldName = 'PeriodoDescanso'
    end
    object TalhoesLotesTipoTulha: TStringField
      FieldName = 'TipoTulha'
      Size = 50
    end
    object TalhoesLotesNomeTulha: TStringField
      FieldName = 'NomeTulha'
      Size = 50
    end
    object TalhoesLotesDtEntradaTulha: TDateTimeField
      FieldName = 'DtEntradaTulha'
    end
    object TalhoesLotesDtSaidaTulha: TDateTimeField
      FieldName = 'DtSaidaTulha'
    end
    object TalhoesLotesUmidadeAoBeneficiar: TSmallintField
      FieldName = 'UmidadeAoBeneficiar'
    end
    object TalhoesLotesLocalArmazenagem: TStringField
      FieldName = 'LocalArmazenagem'
      Size = 100
    end
    object TalhoesLotesMetodoArmazenagem: TStringField
      FieldName = 'MetodoArmazenagem'
      Size = 50
    end
    object TalhoesLotesIDUsuarioCadastro: TIntegerField
      FieldName = 'IDUsuarioCadastro'
    end
    object TalhoesLotesDataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
    end
    object TalhoesLotesIDUsuarioEdicao: TIntegerField
      FieldName = 'IDUsuarioEdicao'
    end
    object TalhoesLotesDataEdicao: TDateTimeField
      FieldName = 'DataEdicao'
    end
  end
  object TalhoesLotesSrc: TDataSource
    DataSet = TalhoesLotes
    Left = 376
    Top = 104
  end
  object Talhoes: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    DataSource = LoteSrc
    Parameters = <
      item
        Name = 'IDLote'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select T.IDTalhao, T.NomeTalhao'
      'from Lotes L'
      'left join Talhoes T on T.IDPropriedade=L.IDPropriedade'
      'where L.IDLote=:IDLote'
      'order by NomeTalhao')
    Left = 584
    Top = 40
    object TalhoesIDTalhao: TAutoIncField
      FieldName = 'IDTalhao'
      ReadOnly = True
    end
    object TalhoesNomeTalhao: TStringField
      FieldName = 'NomeTalhao'
      Size = 50
    end
  end
  object TalhoesSrc: TDataSource
    DataSet = Talhoes
    Left = 584
    Top = 104
  end
  object Lote: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select L.IDLote, P.NomePropriedade, A.NomeAssociado, L.Safra, L.' +
        'QtdeKg, L.DataCadastro, AL.Amostras'
      'from Lotes L'
      'left join Propriedades P on P.IDPropriedade=L.IDPropriedade'
      'left join Associados A on A.IDAssociado=P.IDAssociado'
      
        'left join (Select IDLote, COUNT(*) Amostras from AmostrasLotes g' +
        'roup by IDLote) AL on AL.IDLote=L.IDLote'
      'Where L.IDLote=1')
    Left = 480
    Top = 40
    object LoteIDLote: TAutoIncField
      FieldName = 'IDLote'
      ReadOnly = True
    end
    object LoteNomePropriedade: TStringField
      FieldName = 'NomePropriedade'
      Size = 100
    end
    object LoteNomeAssociado: TStringField
      FieldName = 'NomeAssociado'
      Size = 200
    end
    object LoteSafra: TStringField
      FieldName = 'Safra'
      Size = 9
    end
    object LoteQtdeKg: TIntegerField
      FieldName = 'QtdeKg'
    end
    object LoteDataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
    end
    object LoteAmostras: TIntegerField
      FieldName = 'Amostras'
      ReadOnly = True
    end
  end
  object LoteSrc: TDataSource
    DataSet = Lote
    Left = 480
    Top = 104
  end
  object Usuarios: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    DataSource = TalhoesLotesSrc
    Parameters = <
      item
        Name = 'IDTalhaoLote'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'Select UC.NomeUsuario+'#39' em '#39'+CONVERT(VARCHAR(10), A.DataCadastro' +
        ', 103)+'#39' '#39'+convert(VARCHAR(5), A.DataCadastro, 14) as UsuarioCad' +
        'astro,'
      
        'UE.NomeUsuario+'#39' em '#39'+CONVERT(VARCHAR(10), A.DataEdicao, 103)+'#39' ' +
        #39'+convert(VARCHAR(5), A.DataEdicao, 14) as UsuarioEdicao'
      'from TalhoesLotes A'
      'left join Usuarios UC on UC.IDUsuario=A.IDUsuarioCadastro'
      'left join Usuarios UE on UE.IDUsuario=A.IDUsuarioEdicao'
      'where A.IDTalhaoLote=:IDTalhaoLote')
    Left = 680
    Top = 40
    object UsuariosUsuarioCadastro: TStringField
      FieldName = 'UsuarioCadastro'
      ReadOnly = True
      Size = 70
    end
    object UsuariosUsuarioEdicao: TStringField
      FieldName = 'UsuarioEdicao'
      ReadOnly = True
      Size = 70
    end
  end
  object UsuariosSrc: TDataSource
    DataSet = Usuarios
    Left = 680
    Top = 96
  end
end
