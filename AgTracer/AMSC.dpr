program AMSC;

uses
  IWRtlFix,
  Forms,
  IWStart,
  UTF8ContentParser,
  UnitDashboard in 'UnitDashboard.pas' {IWFormDashboard: TIWAppForm},
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  UnitLogin in 'UnitLogin.pas' {IWFormLogin: TIWAppForm},
  UnitListarProvas in 'UnitListarProvas.pas' {IWFormListarProvas: TIWAppForm},
  UnitEditarInscricao in 'UnitEditarInscricao.pas' {IWFormEditarInscricao: TIWAppForm},
  UnitEditarLoteAmostra in 'UnitEditarLoteAmostra.pas' {IWFormEditarLoteAmostra: TIWAppForm},
  UnitEditarConcurso in 'UnitEditarConcurso.pas' {IWFormEditarConcurso: TIWAppForm},
  UnitEditarTalhaoLote in 'UnitEditarTalhaoLote.pas' {IWFormEditarTalhaoLote: TIWAppForm},
  UnitEditarSenha in 'UnitEditarSenha.pas' {IWFormEditarSenha: TIWAppForm},
  UnitEditarClassificacao in 'UnitEditarClassificacao.pas' {IWFormEditarClassificacao: TIWAppForm},
  UnitListarLotes in 'UnitListarLotes.pas' {IWFormListarLotes: TIWAppForm},
  UnitListarInscricoes in 'UnitListarInscricoes.pas' {IWFormListarInscricoes: TIWAppForm},
  UnitEditarVariedade in 'UnitEditarVariedade.pas' {IWFormEditarVariedade: TIWAppForm},
  UnitEditarAvaliacaoConcurso in 'UnitEditarAvaliacaoConcurso.pas' {IWFormEditarAvaliacaoConcurso: TIWAppForm},
  UnitListarAssociados in 'UnitListarAssociados.pas' {IWFormListarAssociados: TIWAppForm},
  UnitEditarAmostra in 'UnitEditarAmostra.pas' {IWFormEditarAmostra: TIWAppForm},
  UnitEditarUsuario in 'UnitEditarUsuario.pas' {IWFormEditarUsuario: TIWAppForm},
  UnitListarPropriedades in 'UnitListarPropriedades.pas' {IWFormListarPropriedades: TIWAppForm},
  UnitListarAvaliacoesConcurso in 'UnitListarAvaliacoesConcurso.pas' {IWFormListarAvaliacoesConcurso: TIWAppForm},
  UnitEditarPremio in 'UnitEditarPremio.pas' {IWFormEditarPremio: TIWAppForm},
  UnitEditarTalhoes in 'UnitEditarTalhoes.pas' {IWFormEditarTalhoes: TIWAppForm},
  UnitListarUsuarios in 'UnitListarUsuarios.pas' {IWFormListarUsuarios: TIWAppForm},
  UnitEditarJurado in 'UnitEditarJurado.pas' {IWFormEditarJurado: TIWAppForm},
  UnitEditarAssociado in 'UnitEditarAssociado.pas' {IWFormEditarAssociado: TIWAppForm},
  UnitListarAmostras in 'UnitListarAmostras.pas' {IWFormListarAmostras: TIWAppForm},
  UnitEditarPropriedade in 'UnitEditarPropriedade.pas' {IWFormEditarPropriedade: TIWAppForm},
  UnitListarVariedades in 'UnitListarVariedades.pas' {IWFormListarVariedades: TIWAppForm},
  UnitEditarAvaliacao in 'UnitEditarAvaliacao.pas' {IWFormEditarAvaliacao: TIWAppForm},
  UnitListarConcursos in 'UnitListarConcursos.pas' {IWFormListarConcursos: TIWAppForm},
  UnitListarResultadosConcurso in 'UnitListarResultadosConcurso.pas' {IWFormListarResultadosConcurso: TIWAppForm};

{$R *.res}

begin
  TIWStart.Execute(True);
end.
