object IWServerController: TIWServerController
  OldCreateOrder = False
  AuthBeforeNewSession = False
  AppName = 'AgTracer'
  ComInitialization = ciMultiThreaded
  Compression.Enabled = True
  Description = 'Certifica'#231#227'o e Rastreabilidade'
  DebugHTML = False
  DisplayName = 'AgTracer'
  Log = loNone
  EnableImageToolbar = False
  ExceptionDisplayMode = smAlert
  HistoryEnabled = False
  PageTransitions = False
  Port = 8888
  RedirectMsgDelay = 0
  ServerResizeTimeout = 0
  ShowLoadingAnimation = True
  SessionTimeout = 30
  SSLOptions.NonSSLRequest = nsAccept
  SSLOptions.Port = 0
  SSLOptions.SSLVersion = sslv3
  TemplateDir = 'template\'
  Version = '14.0.13'
  AllowMultipleSessionsPerUser = False
  ExceptionLogger.ReportInfos = [riAppInfo, riExceptionInfo, riIWAppInfo, riStackTrace]
  SearchEngineOptions.RedirectToContentHandler = False
  OnNewSession = IWServerControllerBaseNewSession
  Height = 310
  Width = 342
  object IWAutherEvent1: TIWAutherEvent
    AutherPolicy = apRestrictAll
    OnCheck = IWAutherEvent1Check
    Left = 136
    Top = 72
  end
end
