object IWFormListarUsuarios: TIWFormListarUsuarios
  Left = 0
  Top = 0
  Width = 766
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
    Top = 248
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
    Top = 281
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
  object DesativarLink: TIWLink
    Left = 40
    Top = 312
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
    Confirmation = 'Confirma a desativa'#231#227'o deste usu'#225'rio?'
    DoSubmitValidation = False
    FriendlyName = 'DesativarLink'
    OnClick = DesativarLinkClick
    TabOrder = 3
    RawText = False
    Caption = 'Desativar'
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
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'listarUsuarios.html'
    RenderStyles = True
    Left = 240
    Top = 288
  end
  object IWJQueryWidget1: TIWJQueryWidget
    Enabled = True
    OnReady.Strings = (
      ''
      '  var oTable =  $('#39'#usuarios'#39').dataTable( {'
      '        "ajax": "../../../../examples/ajax/data/objects.txt",'
      '        "columns": ['
      '            { "data": "id", "visible": false },'
      
        '            { "data": "cpf", "title": "CPF", className: "dt-cent' +
        'er" },'
      '            { "data": "usuario", "title": "Nome do Usu'#225'rio" },'
      '            { "data": "email", "title": "Email" },'
      
        '            { "data": "cadastrante", "title": "Cadastrador Por" ' +
        '},'
      '            { "data": "editor", "title": "Editado Por" },'
      
        '            { "data": "ativo", "title": "Ativo", className: "dt-' +
        'center" },'
      
        '            { "data": "administrador", "title": "Administrador",' +
        ' className: "dt-center" }'
      '        ],'
      '        deferRender: true,'
      
        '        "oLanguage": { "sUrl": "//cdn.datatables.net/plug-ins/1.' +
        '10.7/i18n/Portuguese-Brasil.json" }'
      '    } );'
      ''
      '   $('#39'#usuarios tbody'#39').on( '#39'click'#39', '#39'tr'#39', function () {'
      '        if ( $(this).hasClass('#39'selected'#39') ) {'
      '            $(this).removeClass('#39'selected'#39');'
      '            $('#39'#HIDDEN_IDTOEDIT'#39').val(null);'
      '        }'
      '        else {'
      '            oTable.$('#39'tr.selected'#39').removeClass('#39'selected'#39');'
      '            $(this).addClass('#39'selected'#39');'
      '            var sID = oTable.fnGetData($(this));'
      '           $('#39'#HIDDEN_IDTOEDIT'#39').val(sID['#39'id'#39']);'
      '        }'
      '    } );'
      ' '
      '    $('#39'#button'#39').click( function () {'
      '        oTable.row('#39'.selected'#39').remove().draw( false );'
      '    } );')
    Left = 448
    Top = 40
  end
  object Usuarios: TADOQuery
    Connection = IWUserSession.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select U.IDUsuario, U.CPF, U.NomeUsuario, U.Email, U.Ativo, U.Ad' +
        'ministrativo,'
      
        'U.Administrador, U.Avaliador, U.Comercial, UC.NomeUsuario Usuari' +
        'oCadastro,'
      'U.DtCadastro, UE.NomeUsuario UsuarioEdicao, U.DtEdicao'
      'from Usuarios U'
      'left join Usuarios UC on UC.IDUsuario=U.IDusuarioCadastro'
      'left join Usuarios UE on UE.IDUsuario=U.IDUsuarioEdicao'
      'Where U.IDCliente=1'
      'order by U.NomeUsuario')
    Left = 192
    Top = 56
    object UsuariosIDUsuario: TAutoIncField
      DisplayLabel = 'id'
      FieldName = 'IDUsuario'
      ReadOnly = True
    end
    object UsuariosCPF: TStringField
      DisplayLabel = 'cpf'
      FieldName = 'CPF'
    end
    object UsuariosNomeUsuario: TStringField
      DisplayLabel = 'usuario'
      FieldName = 'NomeUsuario'
      Size = 50
    end
    object UsuariosEmail: TStringField
      DisplayLabel = 'email'
      FieldName = 'Email'
      Size = 100
    end
    object UsuariosAtivo: TBooleanField
      DisplayLabel = 'ativo'
      FieldName = 'Ativo'
      DisplayValues = 'Sim;N'#227'o'
    end
    object UsuariosAdministrativo: TBooleanField
      DisplayLabel = 'administrativo'
      FieldName = 'Administrativo'
      DisplayValues = 'Sim;N'#227'o'
    end
    object UsuariosAdministrador: TBooleanField
      DisplayLabel = 'administrador'
      FieldName = 'Administrador'
      DisplayValues = 'Sim;N'#227'o'
    end
    object UsuariosAvaliador: TBooleanField
      DisplayLabel = 'avaliador'
      FieldName = 'Avaliador'
      DisplayValues = 'Sim;N'#227'o'
    end
    object UsuariosComercial: TBooleanField
      DisplayLabel = 'comercial'
      FieldName = 'Comercial'
      DisplayValues = 'Sim;N'#227'o'
    end
    object UsuariosUsuarioCadastro: TStringField
      DisplayLabel = 'cadastrante'
      FieldName = 'UsuarioCadastro'
      Size = 50
    end
    object UsuariosDtCadastro: TDateTimeField
      DisplayLabel = 'dtCadastro'
      FieldName = 'DtCadastro'
    end
    object UsuariosUsuarioEdicao: TStringField
      DisplayLabel = 'editor'
      FieldName = 'UsuarioEdicao'
      Size = 50
    end
    object UsuariosDtEdicao: TDateTimeField
      DisplayLabel = 'dtEdicao'
      FieldName = 'DtEdicao'
    end
  end
end
