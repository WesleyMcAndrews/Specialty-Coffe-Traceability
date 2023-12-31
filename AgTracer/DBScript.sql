USE [master]
GO
/****** Object:  Database [AMSC]    Script Date: 09/24/2015 14:20:15 ******/
CREATE DATABASE [AMSC] ON  PRIMARY 
( NAME = N'AMSC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\AMSC.mdf' , SIZE = 39936KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AMSC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\AMSC_log.ldf' , SIZE = 43264KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AMSC] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AMSC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AMSC] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [AMSC] SET ANSI_NULLS OFF
GO
ALTER DATABASE [AMSC] SET ANSI_PADDING OFF
GO
ALTER DATABASE [AMSC] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [AMSC] SET ARITHABORT OFF
GO
ALTER DATABASE [AMSC] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [AMSC] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [AMSC] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [AMSC] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [AMSC] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [AMSC] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [AMSC] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [AMSC] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [AMSC] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [AMSC] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [AMSC] SET  DISABLE_BROKER
GO
ALTER DATABASE [AMSC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [AMSC] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [AMSC] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [AMSC] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [AMSC] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [AMSC] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [AMSC] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [AMSC] SET  READ_WRITE
GO
ALTER DATABASE [AMSC] SET RECOVERY FULL
GO
ALTER DATABASE [AMSC] SET  MULTI_USER
GO
ALTER DATABASE [AMSC] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [AMSC] SET DB_CHAINING OFF
GO
USE [AMSC]
GO
/****** Object:  Table [dbo].[Sabores]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sabores](
	[IDSabor] [int] IDENTITY(1,1) NOT NULL,
	[NomeSabor] [varchar](50) NOT NULL,
	[Flavor] [varchar](50) NULL,
	[Cor] [varchar](10) NULL,
	[GostoOuCheiro] [varchar](1) NULL,
 CONSTRAINT [PK_Sabor] PRIMARY KEY CLUSTERED 
(
	[IDSabor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FlavorSabor] ON [dbo].[Sabores] 
(
	[Flavor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_NomeSabor] ON [dbo].[Sabores] 
(
	[NomeSabor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IDUsuario] [int] IDENTITY(1,1) NOT NULL,
	[IDCliente] [int] NOT NULL,
	[CPF] [varchar](20) NOT NULL,
	[NomeUsuario] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Senha] [varchar](50) NOT NULL,
	[Administrador] [bit] NOT NULL,
	[Administrativo] [bit] NOT NULL,
	[Avaliador] [bit] NOT NULL,
	[Comercial] [bit] NOT NULL,
	[Ativo] [bit] NOT NULL,
	[IDusuarioCadastro] [int] NOT NULL,
	[DtCadastro] [datetime] NOT NULL,
	[IDUsuarioEdicao] [int] NULL,
	[DtEdicao] [datetime] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UsuariosCPF] ON [dbo].[Usuarios] 
(
	[CPF] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UsuariosEmail] ON [dbo].[Usuarios] 
(
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UsuariosLogin] ON [dbo].[Usuarios] 
(
	[Login] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UsuariosNome] ON [dbo].[Usuarios] 
(
	[NomeUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MunicipiosIBGE]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MunicipiosIBGE](
	[CodigoRegiao] [varchar](1) NOT NULL,
	[NomeRegiao] [varchar](100) NOT NULL,
	[CodigoUF] [varchar](2) NOT NULL,
	[UF] [varchar](2) NULL,
	[NomeUF] [varchar](100) NOT NULL,
	[CodigoMesorregiao] [varchar](4) NOT NULL,
	[NomeMesorregiao] [varchar](100) NOT NULL,
	[CodigoMicrorregiao] [varchar](5) NOT NULL,
	[NomeMicrorregiao] [varchar](100) NOT NULL,
	[CodigoMunicipio] [varchar](7) NOT NULL,
	[NomeMunicipio] [varchar](100) NOT NULL,
	[LatDecimal] [float] NULL,
	[LongDecimal] [float] NULL,
	[Sede] [bit] NULL,
	[Poligonos] [geometry] NULL,
	[PontoSede] [geometry] NULL,
	[CodigoBacen] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lotes]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lotes](
	[IDLote] [int] IDENTITY(1,1) NOT NULL,
	[IDAssociado] [varchar](20) NOT NULL,
	[IDPropriedade] [varchar](20) NOT NULL,
	[Safra] [varchar](9) NOT NULL,
	[QtdeKg] [int] NOT NULL,
	[IDUsuarioCadastro] [int] NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
	[IDUsuarioEdicao] [int] NULL,
	[DataEdicao] [datetime] NULL,
 CONSTRAINT [PK_Lotes] PRIMARY KEY CLUSTERED 
(
	[IDLote] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Culturas]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Culturas](
	[IDCultura] [int] IDENTITY(1,1) NOT NULL,
	[NomeCultura] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Culturas] PRIMARY KEY CLUSTERED 
(
	[IDCultura] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Culturas] ON [dbo].[Culturas] 
(
	[NomeCultura] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CotacoesAgricolas]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CotacoesAgricolas](
	[IDProduto] [int] NOT NULL,
	[UF] [varchar](2) NOT NULL,
	[Ano] [smallint] NOT NULL,
	[Mes] [smallint] NOT NULL,
	[PrecoMedio] [float] NOT NULL,
	[MediaNacional] [float] NOT NULL,
 CONSTRAINT [PK_CotacoesAgricolas] PRIMARY KEY CLUSTERED 
(
	[IDProduto] ASC,
	[UF] ASC,
	[Ano] ASC,
	[Mes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConcursoProdutores]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConcursoProdutores](
	[IDConcurso] [int] NOT NULL,
	[IDProdutorConcurso] [int] IDENTITY(1,1) NOT NULL,
	[CPFProdutor] [varchar](20) NOT NULL,
	[NomeProdutor] [varchar](200) NOT NULL,
	[CEP] [varchar](10) NULL,
	[UF] [varchar](2) NOT NULL,
	[CodigoMunicipio] [varchar](10) NULL,
	[Municipio] [varchar](100) NOT NULL,
	[Endereco] [varchar](200) NOT NULL,
	[Bairro] [varchar](50) NOT NULL,
	[FoneContato] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[IDUsuarioCadastro] [int] NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
	[IDUsuarioEdicao] [int] NULL,
	[DataEdicao] [datetime] NULL,
 CONSTRAINT [PK_ConcursoProdutores] PRIMARY KEY CLUSTERED 
(
	[IDProdutorConcurso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ConcursoConcorrentes_CPF] ON [dbo].[ConcursoProdutores] 
(
	[CPFProdutor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcessosQRCode]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AcessosQRCode](
	[IDAmostra] [int] NULL,
	[DataAcesso] [datetime] NULL,
	[IP] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConcursoJurados]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConcursoJurados](
	[IDCliente] [int] NOT NULL,
	[IDJurado] [int] IDENTITY(1,1) NOT NULL,
	[Identidade] [varchar](50) NOT NULL,
	[NomeJurado] [varchar](200) NOT NULL,
	[Nacionalidade] [varchar](50) NOT NULL,
	[Instituicao] [varchar](200) NOT NULL,
	[Fone] [varchar](50) NULL,
	[Endereco] [varchar](200) NULL,
	[Email] [varchar](100) NOT NULL,
	[Curriculo] [text] NOT NULL,
	[Ativo] [bit] NOT NULL,
	[IDUsuarioCadastro] [int] NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
	[IDUsuarioEdicao] [int] NULL,
	[DataEdicao] [datetime] NULL,
 CONSTRAINT [PK_ConcursoJurados] PRIMARY KEY CLUSTERED 
(
	[IDJurado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ConcursoJurados_Email] ON [dbo].[ConcursoJurados] 
(
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ConcursoJurados_Nome] ON [dbo].[ConcursoJurados] 
(
	[NomeJurado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[IDCliente] [int] IDENTITY(1,1) NOT NULL,
	[CNPJCliente] [varchar](20) NOT NULL,
	[NomeCliente] [varchar](200) NOT NULL,
	[CEP] [varchar](10) NOT NULL,
	[UF] [varchar](2) NOT NULL,
	[CodigoMunicipio] [varchar](10) NULL,
	[Municipio] [varchar](100) NOT NULL,
	[Endereco] [varchar](200) NOT NULL,
	[Bairro] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Celular] [varchar](15) NULL,
	[Fone] [varchar](15) NULL,
	[TipoEntidade] [varchar](50) NOT NULL,
	[IDCultura] [int] NOT NULL,
	[Logo] [varchar](50) NULL,
	[CPFResponsavel] [varchar](20) NOT NULL,
	[NomeResponsavel] [varchar](200) NOT NULL,
	[CEPResp] [varchar](10) NOT NULL,
	[UFResp] [varchar](2) NOT NULL,
	[CodigoMunicResp] [varchar](10) NULL,
	[MunicipioResp] [varchar](100) NOT NULL,
	[EnderecoResp] [varchar](200) NOT NULL,
	[BairroResp] [varchar](50) NOT NULL,
	[EmailResp] [varchar](50) NOT NULL,
	[CelularResp] [varchar](15) NULL,
	[FoneResp] [varchar](15) NULL,
	[IDUsuarioCadastro] [int] NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
	[IDUsuarioEdicao] [int] NULL,
	[DataEdicao] [datetime] NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IDCliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CNPJClientes] ON [dbo].[Clientes] 
(
	[IDCliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Concursos]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Concursos](
	[IDConcurso] [int] IDENTITY(1,1) NOT NULL,
	[IDCliente] [int] NOT NULL,
	[NomeConcurso] [varchar](200) NOT NULL,
	[NomeEdicao] [varchar](200) NULL,
	[Categorias] [varchar](200) NULL,
	[PtsPreSelecao] [int] NULL,
	[NroPremiadosPorCategoria] [int] NULL,
	[DtEntregaAmostras] [datetime] NULL,
	[DtIniPreSelecao] [datetime] NULL,
	[DtFimPreSelecao] [datetime] NULL,
	[DtIniSelecao] [datetime] NULL,
	[DtFimSelecao] [datetime] NULL,
	[DtPremiacao] [datetime] NULL,
	[ArquivoRegulamento] [varchar](100) NULL,
	[CategoriaAvaliacao] [varchar](50) NULL,
	[IDUsuarioCadastro] [int] NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
	[IDUsuarioEdicao] [int] NULL,
	[DataEdicao] [datetime] NULL,
 CONSTRAINT [PK_Concursos] PRIMARY KEY CLUSTERED 
(
	[IDConcurso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Concursos_NomeConcurso] ON [dbo].[Concursos] 
(
	[NomeConcurso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Associados]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Associados](
	[IDAssociado] [varchar](20) NOT NULL,
	[IDCliente] [int] NOT NULL,
	[NomeAssociado] [varchar](200) NOT NULL,
	[UF] [varchar](2) NOT NULL,
	[CodigoMunicipio] [varchar](10) NULL,
	[Municipio] [varchar](100) NOT NULL,
	[Endereco] [varchar](200) NOT NULL,
	[Bairro] [varchar](50) NOT NULL,
	[CEP] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Celular] [varchar](15) NULL,
	[Fone] [varchar](15) NULL,
	[TipoEntidade] [varchar](20) NOT NULL,
	[TipoAssociado] [varchar](20) NOT NULL,
	[AssociadoDireto] [varchar](20) NULL,
	[CPFResponsavel] [varchar](20) NOT NULL,
	[NomeResponsavel] [varchar](200) NOT NULL,
	[UFResp] [varchar](2) NOT NULL,
	[CodigoMunicResp] [varchar](10) NULL,
	[MunicipioResp] [varchar](100) NOT NULL,
	[EnderecoResp] [varchar](200) NOT NULL,
	[BairroResp] [varchar](50) NOT NULL,
	[CEPResp] [varchar](10) NOT NULL,
	[EmailResp] [varchar](50) NOT NULL,
	[CelularResp] [varchar](15) NULL,
	[FoneResp] [varchar](15) NULL,
	[Senha] [varchar](20) NOT NULL,
	[IDUsuarioCadastro] [int] NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
	[IDUsuarioEdicao] [int] NULL,
	[DataEdicao] [datetime] NULL,
 CONSTRAINT [PK_Associados] PRIMARY KEY CLUSTERED 
(
	[IDAssociado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Associados] ON [dbo].[Associados] 
(
	[NomeAssociado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConcursoAmostras]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConcursoAmostras](
	[IDConcurso] [int] NOT NULL,
	[IDAssociado] [varchar](20) NOT NULL,
	[IDAmostraConcurso] [int] IDENTITY(1,1) NOT NULL,
	[CNPJPropriedade] [varchar](20) NULL,
	[NomePropriedade] [varchar](200) NOT NULL,
	[InscricaoEstadual] [varchar](20) NOT NULL,
	[UF] [varchar](2) NOT NULL,
	[CodigoMunicipio] [varchar](10) NOT NULL,
	[Armazem] [varchar](50) NULL,
	[Classificador] [varchar](50) NULL,
	[FoneClassificador] [varchar](50) NULL,
	[VariedadeCafe] [varchar](50) NOT NULL,
	[CategoriaConcurso] [varchar](20) NOT NULL,
	[QtdeSacas] [int] NOT NULL,
	[QRCODE] [uniqueidentifier] NOT NULL,
	[Status] [varchar](50) NULL,
	[Obs] [text] NULL,
	[IDUsuarioCadastro] [int] NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
	[IDUsuarioEdicao] [int] NULL,
	[DataEdicao] [datetime] NULL,
 CONSTRAINT [PK_ConcursoAmostras_1] PRIMARY KEY CLUSTERED 
(
	[IDAmostraConcurso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConcursoJuradosConcurso]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConcursoJuradosConcurso](
	[IDConcurso] [int] NOT NULL,
	[IDJurado] [int] NOT NULL,
	[JuriOficial] [bit] NOT NULL,
	[Senha] [varchar](50) NOT NULL,
	[PreSelecao] [bit] NOT NULL,
	[Selecao] [bit] NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
 CONSTRAINT [PK_ConcursoJuradosConcurso] PRIMARY KEY CLUSTERED 
(
	[IDConcurso] ASC,
	[IDJurado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AmostrasLotes]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AmostrasLotes](
	[IDAmostra] [int] IDENTITY(1,1) NOT NULL,
	[IDLote] [int] NOT NULL,
	[DataEntrada] [datetime] NOT NULL,
	[TipoAmostra] [varchar](20) NOT NULL,
	[EtapaProcesso] [varchar](50) NOT NULL,
	[QtdeKg] [int] NOT NULL,
	[DataDevolutiva] [datetime] NULL,
	[LoginAvulso] [varchar](10) NULL,
	[SenhaAvulsa] [varchar](10) NULL,
	[DataAcessoOnline] [datetime] NULL,
	[QRCode] [uniqueidentifier] NULL,
	[IDUsuarioCadastro] [int] NULL,
	[DtCadastro] [datetime] NULL,
	[IDUsuarioEdicao] [int] NULL,
	[DtEdicao] [datetime] NULL,
 CONSTRAINT [PK_AmostrasLotes_1] PRIMARY KEY CLUSTERED 
(
	[IDAmostra] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AmostrasLotes] ON [dbo].[AmostrasLotes] 
(
	[IDLote] ASC,
	[DataEntrada] ASC,
	[EtapaProcesso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propriedades]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Propriedades](
	[IDPropriedade] [varchar](20) NOT NULL,
	[IDAssociado] [varchar](20) NOT NULL,
	[NomePropriedade] [varchar](100) NOT NULL,
	[UF] [varchar](2) NOT NULL,
	[CodigoMunicipio] [varchar](10) NOT NULL,
	[Endereco] [varchar](100) NOT NULL,
	[Altitude] [float] NOT NULL,
	[HectaresCafe] [int] NULL,
	[LatLong] [geography] NULL,
	[AreaReservaLegal] [float] NULL,
	[AreaAPP] [float] NULL,
	[AppComputaRL] [bit] NULL,
	[Historico] [text] NULL,
	[ColhedeiraPropria] [smallint] NOT NULL,
	[ColhedeiraAlugada] [smallint] NOT NULL,
	[QtdeLavador] [smallint] NOT NULL,
	[QtdeDescascador] [smallint] NOT NULL,
	[QtdeTerreiroTerra] [smallint] NOT NULL,
	[AreaTerreiroTerra] [smallint] NOT NULL,
	[QtdeTerreiroCimento] [smallint] NOT NULL,
	[AreaTerreiroCimento] [smallint] NOT NULL,
	[QtdeTerreiroAsfalto] [smallint] NOT NULL,
	[AreaTerreiroAsfalto] [smallint] NOT NULL,
	[QtdeTerreiroSuspenso] [smallint] NOT NULL,
	[AreaTerreiroSuspenso] [smallint] NOT NULL,
	[QtdeSecadorVertical] [smallint] NOT NULL,
	[CapacidadeSecadorVertical] [smallint] NOT NULL,
	[QtdeSecadorHorizontal] [smallint] NOT NULL,
	[CapacidadeSecadorHorizontal] [smallint] NOT NULL,
	[QtdeSecadorRotativo] [smallint] NOT NULL,
	[CapacidadeSecadorRotativo] [smallint] NOT NULL,
	[QtdeSiloSecador] [smallint] NOT NULL,
	[CapacidadeSiloSecador] [smallint] NOT NULL,
	[QtdeTulhaMadeira] [smallint] NOT NULL,
	[CapacidadeTulhasMadeira] [smallint] NOT NULL,
	[QtdeTulhaFerro] [smallint] NOT NULL,
	[CapacidadeTulhaFerro] [smallint] NOT NULL,
	[QtdeMaquinaBeneficio] [smallint] NOT NULL,
	[QtdeRebeneficioPeneirao] [smallint] NOT NULL,
	[QtdeRebeneficioDensimetrica] [smallint] NOT NULL,
	[QtdeRebeneficioEletronica] [smallint] NOT NULL,
	[QtdeRebeneficioBalao] [smallint] NOT NULL,
	[QtdeArmazemProprio] [smallint] NOT NULL,
	[CapacidadeArmazem] [smallint] NOT NULL,
	[RastreiaLotes] [bit] NOT NULL,
	[ControleLavoura] [bit] NOT NULL,
	[ControleLavador] [bit] NOT NULL,
	[ControleTerreiro] [bit] NOT NULL,
	[ControleSecador] [bit] NOT NULL,
	[ControleTulha] [bit] NOT NULL,
	[ControleBeneficio] [bit] NOT NULL,
	[ControleRebeneficio] [bit] NOT NULL,
	[Agronomo] [bit] NOT NULL,
	[BoiaCereja] [bit] NOT NULL,
	[AmostragemMaturacao] [bit] NOT NULL,
	[ProvaPorTalhao] [bit] NOT NULL,
	[ColheitaSeletiva] [bit] NOT NULL,
	[ColheitaMecanica] [smallint] NOT NULL,
	[ConfereUmidade] [bit] NOT NULL,
	[MetodoArmazenagem] [varchar](100) NOT NULL,
	[IDUsuarioCadastro] [int] NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
	[IDUsuarioEdicao] [int] NULL,
	[DataEdicao] [datetime] NULL,
 CONSTRAINT [PK_Propriedades] PRIMARY KEY CLUSTERED 
(
	[IDPropriedade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Propriedades] ON [dbo].[Propriedades] 
(
	[IDAssociado] ASC,
	[NomePropriedade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Variedades]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Variedades](
	[IDVariedade] [int] IDENTITY(1,1) NOT NULL,
	[IDCultura] [int] NOT NULL,
	[NomeVariedade] [varchar](50) NOT NULL,
	[IDUsuarioCadastro] [int] NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
	[IDUsuarioEdicao] [int] NULL,
	[DataEdicao] [datetime] NULL,
 CONSTRAINT [PK_Variedades_1] PRIMARY KEY CLUSTERED 
(
	[IDVariedade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Variedades] ON [dbo].[Variedades] 
(
	[IDCultura] ASC,
	[NomeVariedade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Talhoes]    Script Date: 09/24/2015 14:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Talhoes](
	[IDTalhao] [int] IDENTITY(1,1) NOT NULL,
	[IDPropriedade] [varchar](20) NOT NULL,
	[NomeTalhao] [varchar](50) NOT NULL,
	[Poligono] [geography] NULL,
	[Irrigado] [bit] NULL,
	[DataPlantio] [datetime] NULL,
	[Variedades] [varchar](50) NULL,
	[Premios] [text] NULL,
	[IDUsuarioCadastro] [int] NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
	[IDUsuarioEdicao] [int] NULL,
	[DataEdicao] [datetime] NULL,
 CONSTRAINT [PK_Talhoes_1] PRIMARY KEY CLUSTERED 
(
	[IDTalhao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Talhoes] ON [dbo].[Talhoes] 
(
	[IDPropriedade] ASC,
	[NomeTalhao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[UsuariosPossiveis]    Script Date: 09/24/2015 14:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[UsuariosPossiveis] as
Select U.IDCliente, U.IDUsuario, U.NomeUsuario, U.Administrador,
U.Administrativo, U.Avaliador, U.Comercial, cast(0 as Bit) as Jurado, U.Login, U.Email, U.Senha, U.Ativo
from Usuarios U
union all
(Select J.IDCliente, J.IDJurado as IDUsuario, J.NomeJurado, cast(0 as Bit) as Administrador, cast(0 as Bit) as Administrativo,
cast(0 as Bit) as Avaliador, cast(0 as Bit) as Comercial, cast(1 as Bit) as Jurado, J.email as Login, J.email, CJ.Senha, J.Ativo
from ConcursoJuradosConcurso CJ
left join ConcursoJurados J on J.IDJurado=CJ.IDJurado
left join Concursos C on C.IDConcurso=CJ.IDConcurso
where (CONVERT (date, GETDATE()) between CONVERT (date, C.DtIniPreSelecao) and CONVERT (date, C.DtFimPreSelecao)
  or CONVERT (date, GETDATE()) between CONVERT (date, C.DtIniSelecao)    and CONVERT (date, C.DtFimSelecao)))
GO
/****** Object:  Table [dbo].[PremiosPropriedades]    Script Date: 09/24/2015 14:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PremiosPropriedades](
	[IDPropriedade] [varchar](20) NOT NULL,
	[IDPremio] [int] IDENTITY(1,1) NOT NULL,
	[Premio] [varchar](50) NOT NULL,
	[Safra] [varchar](10) NOT NULL,
 CONSTRAINT [PK_PremiosPropriedades] PRIMARY KEY CLUSTERED 
(
	[IDPremio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConcursoAvaliacoes]    Script Date: 09/24/2015 14:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConcursoAvaliacoes](
	[IDConcurso] [int] NOT NULL,
	[IDAmostraConcurso] [int] NOT NULL,
	[IDJurado] [int] NOT NULL,
	[FaseConcurso] [varchar](20) NOT NULL,
	[IDAvaliacaoConcurso] [int] IDENTITY(1,1) NOT NULL,
	[DataAvaliacao] [datetime] NOT NULL,
	[ColoracaoTorra] [float] NOT NULL,
	[Aroma] [float] NOT NULL,
	[AromaSeca] [float] NOT NULL,
	[AromaUmida] [float] NOT NULL,
	[Sabor] [float] NOT NULL,
	[Retrogosto] [float] NOT NULL,
	[Acidez] [float] NOT NULL,
	[AcidezIntensidade] [float] NOT NULL,
	[Corpo] [float] NOT NULL,
	[CorpoNivel] [float] NOT NULL,
	[Uniformidade] [float] NOT NULL,
	[Balanco] [float] NOT NULL,
	[XicaraLimpa] [float] NOT NULL,
	[Docura] [float] NOT NULL,
	[Geral] [float] NOT NULL,
	[XicarasDefeitosLeves] [float] NOT NULL,
	[XicarasDefeitosGraves] [float] NOT NULL,
	[Obs] [text] NULL,
	[IDUsuarioEdicao] [int] NULL,
	[DataEdicao] [datetime] NULL,
 CONSTRAINT [PK_ConcursoAvaliacoes] PRIMARY KEY CLUSTERED 
(
	[IDAvaliacaoConcurso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Classificacao]    Script Date: 09/24/2015 14:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Classificacao](
	[IDClassificacao] [int] IDENTITY(1,1) NOT NULL,
	[IDProvador] [int] NOT NULL,
	[IDAmostra] [int] NOT NULL,
	[DataProva] [datetime] NOT NULL,
	[Defeitos] [int] NOT NULL,
	[Coloracao] [varchar](50) NOT NULL,
	[Umidade] [float] NOT NULL,
	[Aspecto] [varchar](20) NOT NULL,
	[Catacao] [smallint] NOT NULL,
	[Peneira19] [smallint] NOT NULL,
	[Peneira18] [smallint] NOT NULL,
	[Peneira17] [smallint] NOT NULL,
	[Peneira16] [smallint] NOT NULL,
	[Peneira15] [smallint] NOT NULL,
	[Peneira14] [smallint] NOT NULL,
	[Peneira13] [smallint] NOT NULL,
	[Moca11] [smallint] NOT NULL,
	[Moca10] [smallint] NOT NULL,
	[Moca9] [smallint] NOT NULL,
	[Fundo] [smallint] NOT NULL,
	[BebidaComercial] [bit] NOT NULL,
	[TipoBebidaComercial] [varchar](50) NULL,
	[Obs] [text] NULL,
	[IDUsuarioEdicao] [int] NULL,
	[DataEdicao] [datetime] NULL,
 CONSTRAINT [PK_Classificacoes] PRIMARY KEY CLUSTERED 
(
	[IDClassificacao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Avaliacao]    Script Date: 09/24/2015 14:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Avaliacao](
	[IDAvaliacao] [int] IDENTITY(1,1) NOT NULL,
	[IDProvador] [int] NOT NULL,
	[IDAmostra] [int] NOT NULL,
	[DataAvaliacao] [datetime] NOT NULL,
	[TempoTorra] [smallint] NOT NULL,
	[ColoracaoTorra] [varchar](20) NOT NULL,
	[Aroma] [float] NOT NULL,
	[AromaSeca] [float] NOT NULL,
	[AromaUmida] [float] NOT NULL,
	[Sabor] [float] NOT NULL,
	[Retrogosto] [float] NOT NULL,
	[Acidez] [float] NOT NULL,
	[AcidezIntensidade] [float] NOT NULL,
	[Corpo] [float] NOT NULL,
	[CorpoNivel] [float] NOT NULL,
	[Uniformidade] [float] NOT NULL,
	[Balanco] [float] NOT NULL,
	[XicaraLimpa] [float] NOT NULL,
	[Docura] [float] NOT NULL,
	[Geral] [float] NOT NULL,
	[XicarasDefeitosLeves] [float] NOT NULL,
	[XicarasDefeitosGraves] [float] NOT NULL,
	[Obs] [text] NULL,
	[IDUsuarioEdicao] [int] NULL,
	[DataEdicao] [datetime] NULL,
 CONSTRAINT [PK_Avaliacoes] PRIMARY KEY CLUSTERED 
(
	[IDAvaliacao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QRCodesSacas]    Script Date: 09/24/2015 14:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRCodesSacas](
	[IDAmostra] [int] NOT NULL,
	[IDEmissao] [int] IDENTITY(1,1) NOT NULL,
	[DataEmissao] [datetime] NOT NULL,
	[KgSaca] [int] NOT NULL,
	[QtdeSacas] [int] NOT NULL,
	[IDUsuarioEmissao] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VariedadesTalhoes]    Script Date: 09/24/2015 14:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VariedadesTalhoes](
	[IDTalhao] [int] NOT NULL,
	[IDVariedade] [int] NOT NULL,
 CONSTRAINT [PK_VariedadesXTalhoes] PRIMARY KEY CLUSTERED 
(
	[IDTalhao] ASC,
	[IDVariedade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AreasPropriedades]    Script Date: 09/24/2015 14:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[AreasPropriedades] as
Select IDPropriedade, SUM(poligono.STArea()/10000) as Area
from talhoes
group by IDPropriedade
GO
/****** Object:  Table [dbo].[ConcursoSaboresAvaliacao]    Script Date: 09/24/2015 14:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConcursoSaboresAvaliacao](
	[IDAvaliacaoConcurso] [int] NOT NULL,
	[IDSabor] [int] NOT NULL,
	[Predominancia] [int] NOT NULL,
 CONSTRAINT [PK_ConcursoSaboresAvaliacao] PRIMARY KEY CLUSTERED 
(
	[IDAvaliacaoConcurso] ASC,
	[IDSabor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ConcursoQtdeAmostrasAvaliadas]    Script Date: 09/24/2015 14:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[ConcursoQtdeAmostrasAvaliadas] as
Select J.IDConcurso, J.IDJurado, A.CategoriaConcurso, QAP.QtdeAmostrasPreSelecao, A.QtdeAvaliacoesPreSelecao,
QAS.QtdeAmostrasSelecao, A.QtdeAvaliacoesSelecao

from ConcursoJuradosConcurso J

--Qtde Avaliacoes
left join (Select A.IDConcurso, A.IDJurado, CA.CategoriaConcurso,
Sum(Case when A.FaseConcurso='Pré-seleção' then 1 else 0 end) as 'QtdeAvaliacoesPreSelecao',
Sum(Case when A.FaseConcurso='Seleção' then 1 else 0 end) as 'QtdeAvaliacoesSelecao'
from ConcursoAvaliacoes A
left join ConcursoAmostras CA on CA.IDAmostraConcurso=A.IDAmostraConcurso
group by A.IDConcurso, A.IDJurado, CA.CategoriaConcurso) A
on A.IDConcurso=J.IDConcurso and A.IDJurado=J.IDJurado

--QtdeAmostras Pre-Seleção
left join (Select IDConcurso, CategoriaConcurso, Count(*) QtdeAmostrasPreSelecao
from ConcursoAmostras
where Status='Classificada'
group by IDConcurso, CategoriaConcurso) QAP
on QAP.IDConcurso=J.IDConcurso and QAP.CategoriaConcurso=A.CategoriaConcurso

--QtdeAmostras Seleção
left join (Select C.IDConcurso, C.CategoriaConcurso, COUNT(*) QtdeAmostrasSelecao
from ConcursoAmostras C
where C.IDAmostraConcurso in
(select IDAmostraConcurso from
(Select A.IDConcurso, A.IDAmostraConcurso, Avg((Aroma+Sabor+Retrogosto+Acidez+Corpo+(Uniformidade*2)+
Balanco+(XicaraLimpa*2)+(Docura*2)+Geral)-(XicarasDefeitosLeves*2)-
(XicarasDefeitosGraves*4)) as Nota
from ConcursoAvaliacoes A
group by A.IDConcurso, A.IDAmostraConcurso) A
left join Concursos C on C.IDConcurso=A.IDConcurso
where A.Nota>C.PtsPreSelecao)
group by C.IDConcurso, C.CategoriaConcurso) QAS

on QAS.IDConcurso=J.IDConcurso and QAS.CategoriaConcurso=A.CategoriaConcurso
where A.CategoriaConcurso is not null
GO
/****** Object:  Table [dbo].[SaboresAvaliacao]    Script Date: 09/24/2015 14:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaboresAvaliacao](
	[IDAvaliacao] [int] NOT NULL,
	[IDSabor] [int] NOT NULL,
	[Predominancia] [int] NOT NULL,
 CONSTRAINT [PK_SaborAvaliacao] PRIMARY KEY CLUSTERED 
(
	[IDAvaliacao] ASC,
	[IDSabor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TalhoesLotes]    Script Date: 09/24/2015 14:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TalhoesLotes](
	[IDLote] [int] NOT NULL,
	[IDTalhao] [int] NOT NULL,
	[IDTalhaoLote] [int] IDENTITY(1,1) NOT NULL,
	[MetodoPreparo] [varchar](50) NULL,
	[DtIniColheita] [datetime] NULL,
	[DtFimColheita] [datetime] NULL,
	[TempoColheitaTerreiro] [varchar](15) NULL,
	[TipoTerreiro] [varchar](50) NULL,
	[DtEntradaTerreiro] [datetime] NULL,
	[DtSaidaTerreiro] [datetime] NULL,
	[Espessura] [smallint] NULL,
	[MetodoRodagem] [varchar](15) NULL,
	[FrequenciaRodagem] [smallint] NULL,
	[CafeChuvado] [bit] NULL,
	[TempMedRodagem] [smallint] NULL,
	[TipoSecador] [varchar](50) NULL,
	[DtEntradaSecador] [datetime] NULL,
	[DtSaidaSecador] [datetime] NULL,
	[TempFornalha] [smallint] NULL,
	[TempMassa] [smallint] NULL,
	[PeriodoDescanso] [smallint] NULL,
	[TerreiroTulha] [varchar](50) NULL,
	[DtEntradaTulha] [datetime] NULL,
	[DtSaidaTulha] [datetime] NULL,
	[UmidadeAoBeneficiar] [smallint] NULL,
	[LocalArmazenagem] [varchar](100) NULL,
	[MetodoArmazenagem] [varchar](50) NULL,
	[DataCadastro] [datetime] NULL,
	[IDUsuarioCadastro] [int] NULL,
	[DataEdicao] [datetime] NULL,
	[IDUsuarioEdicao] [int] NULL,
 CONSTRAINT [PK_TalhoesLotes] PRIMARY KEY CLUSTERED 
(
	[IDLote] ASC,
	[IDTalhao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[RosasSabores]    Script Date: 09/24/2015 14:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[RosasSabores] as
SELECT E.IDAvaliacao,
    '[' + STUFF((
        select 
            ',{"id":"' + cast(A.idSabor as varchar(max)) + '"'
            + ', "name":"' + S.NomeSabor + '"'
            + ', "y":"' + cast(A.Predominancia as varchar(max)) + '"'
            + ', "color":"#' + S.Cor + '"'
            +'}'

        from SaboresAvaliacao A
			left join Sabores S on S.IDSabor=A.IDSabor
			where A.IDAvaliacao=E.IDAvaliacao
        for xml path(''), type
    ).value('.', 'varchar(max)'), 1, 1, '') + ']' as Json
FROM Avaliacao As E
GO
/****** Object:  View [dbo].[ConcursoMediaRosasSabores]    Script Date: 09/24/2015 14:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[ConcursoMediaRosasSabores] as
SELECT A.idConcurso,A.IDAmostraConcurso, A.FaseConcurso,
    '[' + STUFF((
        select top 7
            ',{"id":"' + cast(AV.idSabor as varchar(max)) + '"'
            + ', "name":"' + S.NomeSabor + '"'
            + ', "y":"' + cast(AV.Predominancia as varchar(max)) + '"'
            + ', "color":"#' + S.Cor + '"'
            +'}'

        from (Select CA.IDAmostraConcurso, CA.FaseConcurso, A.IDSabor, AVG(A.Predominancia) Predominancia
              from ConcursoAvaliacoes CA
              left join ConcursoSaboresAvaliacao A On A.IDAvaliacaoConcurso=CA.IDAvaliacaoConcurso
              group by CA.IDAmostraConcurso, CA.FaseConcurso, A.IDSabor ) AV
			left join Sabores S on S.IDSabor=AV.IDSabor

			where AV.IDAmostraConcurso=A.IDAmostraConcurso
			and AV.FaseConcurso=A.FaseConcurso
			order by Predominancia desc
        for xml path(''), type
    ).value('.', 'varchar(max)'), 1, 1, '') + ']' as Json
FROM (Select IDConcurso, IDAmostraConcurso, FaseConcurso from  ConcursoAvaliacoes
group by IDConcurso, IDAmostraConcurso, FaseConcurso) as A
GO
/****** Object:  View [dbo].[ConcursoRosasSabores]    Script Date: 09/24/2015 14:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[ConcursoRosasSabores] as
SELECT E.IDAvaliacaoConcurso,
    '[' + STUFF((
        select 
            ',{"id":"' + cast(A.idSabor as varchar(max)) + '"'
            + ', "name":"' + S.NomeSabor + '"'
            + ', "y":"' + cast(A.Predominancia as varchar(max)) + '"'
            + ', "color":"#' + S.Cor + '"'
            +'}'

        from ConcursoSaboresAvaliacao A
			left join Sabores S on S.IDSabor=A.IDSabor
			where A.IDAvaliacaoConcurso=E.IDAvaliacaoConcurso
        for xml path(''), type
    ).value('.', 'varchar(max)'), 1, 1, '') + ']' as Json
FROM ConcursoAvaliacoes As E
GO
/****** Object:  View [dbo].[ConcursoResultados]    Script Date: 09/24/2015 14:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[ConcursoResultados] as
Select A.IDConcurso, A.IDAmostraConcurso, A.FaseConcurso, A.CategoriaConcurso, A.Avaliacoes,
A.ColoracaoTorra, A.Aroma, A.AromaSeca,A.AromaUmida, A.Sabor, A.Retrogosto,
A.Acidez,A.AcidezIntensidade, A.Corpo,A.CorpoNivel, A.Uniformidade, A.Balanco,
A.XicaraLimpa, A.Docura, A.Geral,A.XicarasDefeitosLeves, A.XicarasDefeitosGraves,
A.NotaFinal, S.json
from
(Select CA.IDConcurso, CA.IDAmostraConcurso, CA.FaseConcurso, A.CategoriaConcurso, COUNT(*) Avaliacoes,
AVG(CA.ColoracaoTorra )ColoracaoTorra, AVG(Aroma) Aroma, AVG(CA.AromaSeca) AromaSeca,
AVG(CA.AromaUmida) AromaUmida, AVG(CA.Sabor) Sabor, AVG(CA.Retrogosto) Retrogosto,
AVG(CA.Acidez) Acidez,AVG(CA.AcidezIntensidade) AcidezIntensidade, AVG(CA.Corpo) Corpo,
AVG(CA.CorpoNivel) CorpoNivel, AVG(CA.Uniformidade) Uniformidade, AVG(CA.Balanco) Balanco,
AVG(CA.XicaraLimpa) XicaraLimpa, AVG(CA.Docura) Docura, AVG(CA.Geral) Geral,
AVG(CA.XicarasDefeitosLeves) XicarasDefeitosLeves, AVG(CA.XicarasDefeitosGraves) XicarasDefeitosGraves,
Avg((CA.Aroma+Sabor+CA.Retrogosto+CA.Acidez+CA.Corpo+(CA.Uniformidade*2)+
CA.Balanco+(CA.XicaraLimpa*2)+(CA.Docura*2)+CA.Geral)-(CA.XicarasDefeitosLeves*2)-
(CA.XicarasDefeitosGraves*4)) NotaFinal
from ConcursoAvaliacoes CA
left join ConcursoAmostras A on A.IDConcurso=CA.IDConcurso and A.IDAmostraConcurso=CA.IDAmostraConcurso
group by CA.IDConcurso, CA.IDAmostraConcurso, CA.FaseConcurso, A.CategoriaConcurso) A
left join ConcursoMediaRosasSabores S
on S.IDConcurso=A.IDConcurso and S.IDAmostraConcurso=A.IDAmostraConcurso and S.FaseConcurso=A.FaseConcurso
GO
/****** Object:  Default [DF_Usuarios_Adminstrador]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Adminstrador]  DEFAULT ((0)) FOR [Administrador]
GO
/****** Object:  Default [DF_Usuarios_Administrativo]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Administrativo]  DEFAULT ((0)) FOR [Administrativo]
GO
/****** Object:  Default [DF_Usuarios_Avaliador]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Avaliador]  DEFAULT ((0)) FOR [Avaliador]
GO
/****** Object:  Default [DF_Usuarios_Comercial]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Comercial]  DEFAULT ((0)) FOR [Comercial]
GO
/****** Object:  Default [DF_Usuarios_Ativo]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
/****** Object:  Default [DF_Usuarios_DataCadastro]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_DataCadastro]  DEFAULT (getdate()) FOR [DtCadastro]
GO
/****** Object:  Default [DF_Lotes_DtCadastro]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Lotes] ADD  CONSTRAINT [DF_Lotes_DtCadastro]  DEFAULT (getdate()) FOR [DataCadastro]
GO
/****** Object:  Default [DF_ConcursoConcorrentes_DataCadastro]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[ConcursoProdutores] ADD  CONSTRAINT [DF_ConcursoConcorrentes_DataCadastro]  DEFAULT (getdate()) FOR [DataCadastro]
GO
/****** Object:  Default [DF_ConcursoJurados_Ativo]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[ConcursoJurados] ADD  CONSTRAINT [DF_ConcursoJurados_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
/****** Object:  Default [DF_ConcursoJurados_DataCadastro]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[ConcursoJurados] ADD  CONSTRAINT [DF_ConcursoJurados_DataCadastro]  DEFAULT (getdate()) FOR [DataCadastro]
GO
/****** Object:  Default [DF_Clientes_DataCadastro]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_DataCadastro]  DEFAULT (getdate()) FOR [DataCadastro]
GO
/****** Object:  Default [DF_Concursos_DataCadastro]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Concursos] ADD  CONSTRAINT [DF_Concursos_DataCadastro]  DEFAULT (getdate()) FOR [DataCadastro]
GO
/****** Object:  Default [DF_Associados_DataCadastro]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Associados] ADD  CONSTRAINT [DF_Associados_DataCadastro]  DEFAULT (getdate()) FOR [DataCadastro]
GO
/****** Object:  Default [DF_ConcursoAmostras_QRCODE]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[ConcursoAmostras] ADD  CONSTRAINT [DF_ConcursoAmostras_QRCODE]  DEFAULT (newid()) FOR [QRCODE]
GO
/****** Object:  Default [DF_ConcursoAmostras_DataCadastro]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[ConcursoAmostras] ADD  CONSTRAINT [DF_ConcursoAmostras_DataCadastro]  DEFAULT (getdate()) FOR [DataCadastro]
GO
/****** Object:  Default [DF_ConcursoJuradosConcurso_JuriOficial]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[ConcursoJuradosConcurso] ADD  CONSTRAINT [DF_ConcursoJuradosConcurso_JuriOficial]  DEFAULT ((0)) FOR [JuriOficial]
GO
/****** Object:  Default [DF_ConcursoJuradosConcurso_PreSelecao]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[ConcursoJuradosConcurso] ADD  CONSTRAINT [DF_ConcursoJuradosConcurso_PreSelecao]  DEFAULT ((0)) FOR [PreSelecao]
GO
/****** Object:  Default [DF_ConcursoJuradosConcurso_Selecao]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[ConcursoJuradosConcurso] ADD  CONSTRAINT [DF_ConcursoJuradosConcurso_Selecao]  DEFAULT ((0)) FOR [Selecao]
GO
/****** Object:  Default [DF_ConcursoJuradosConcurso_DataCadastro]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[ConcursoJuradosConcurso] ADD  CONSTRAINT [DF_ConcursoJuradosConcurso_DataCadastro]  DEFAULT (getdate()) FOR [DataCadastro]
GO
/****** Object:  Default [DF_Amostras_QRCode]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[AmostrasLotes] ADD  CONSTRAINT [DF_Amostras_QRCode]  DEFAULT (newid()) FOR [QRCode]
GO
/****** Object:  Default [DF_Propriedades_ColhedeiraPropria]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_ColhedeiraPropria]  DEFAULT ((0)) FOR [ColhedeiraPropria]
GO
/****** Object:  Default [DF_Propriedades_ColhedeiraAlugada]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_ColhedeiraAlugada]  DEFAULT ((0)) FOR [ColhedeiraAlugada]
GO
/****** Object:  Default [DF_Propriedades_QtdeLavador]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeLavador]  DEFAULT ((0)) FOR [QtdeLavador]
GO
/****** Object:  Default [DF_Propriedades_QtdeDescascador]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeDescascador]  DEFAULT ((0)) FOR [QtdeDescascador]
GO
/****** Object:  Default [DF_Propriedades_QtdeTerreiroTerra]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeTerreiroTerra]  DEFAULT ((0)) FOR [QtdeTerreiroTerra]
GO
/****** Object:  Default [DF_Propriedades_AreaTerreiroTerra]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_AreaTerreiroTerra]  DEFAULT ((0)) FOR [AreaTerreiroTerra]
GO
/****** Object:  Default [DF_Propriedades_QtdeTerreiroCimento]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeTerreiroCimento]  DEFAULT ((0)) FOR [QtdeTerreiroCimento]
GO
/****** Object:  Default [DF_Propriedades_AreaTerreiroCimento]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_AreaTerreiroCimento]  DEFAULT ((0)) FOR [AreaTerreiroCimento]
GO
/****** Object:  Default [DF_Propriedades_QtdeTerreiroAsfalto]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeTerreiroAsfalto]  DEFAULT ((0)) FOR [QtdeTerreiroAsfalto]
GO
/****** Object:  Default [DF_Propriedades_AreaTerreiroAsfalto]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_AreaTerreiroAsfalto]  DEFAULT ((0)) FOR [AreaTerreiroAsfalto]
GO
/****** Object:  Default [DF_Propriedades_QtdeTerreiroSuspenso]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeTerreiroSuspenso]  DEFAULT ((0)) FOR [QtdeTerreiroSuspenso]
GO
/****** Object:  Default [DF_Propriedades_AreaTerreiroSuspenso]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_AreaTerreiroSuspenso]  DEFAULT ((0)) FOR [AreaTerreiroSuspenso]
GO
/****** Object:  Default [DF_Propriedades_QtdeSecadorVertical]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeSecadorVertical]  DEFAULT ((0)) FOR [QtdeSecadorVertical]
GO
/****** Object:  Default [DF_Propriedades_CapacidadeSecadorVertical]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_CapacidadeSecadorVertical]  DEFAULT ((0)) FOR [CapacidadeSecadorVertical]
GO
/****** Object:  Default [DF_Propriedades_QtdeSecadorHorizontal]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeSecadorHorizontal]  DEFAULT ((0)) FOR [QtdeSecadorHorizontal]
GO
/****** Object:  Default [DF_Propriedades_CapacidadeSecadorHorizontal]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_CapacidadeSecadorHorizontal]  DEFAULT ((0)) FOR [CapacidadeSecadorHorizontal]
GO
/****** Object:  Default [DF_Propriedades_QtdeSecadorRotativo]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeSecadorRotativo]  DEFAULT ((0)) FOR [QtdeSecadorRotativo]
GO
/****** Object:  Default [DF_Propriedades_CapacidadeSecadorRotativo]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_CapacidadeSecadorRotativo]  DEFAULT ((0)) FOR [CapacidadeSecadorRotativo]
GO
/****** Object:  Default [DF_Propriedades_QtdeSiloSecador]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeSiloSecador]  DEFAULT ((0)) FOR [QtdeSiloSecador]
GO
/****** Object:  Default [DF_Propriedades_CapacidadeSiloSecador]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_CapacidadeSiloSecador]  DEFAULT ((0)) FOR [CapacidadeSiloSecador]
GO
/****** Object:  Default [DF_Propriedades_QtdeTulhaMadeira]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeTulhaMadeira]  DEFAULT ((0)) FOR [QtdeTulhaMadeira]
GO
/****** Object:  Default [DF_Propriedades_CapacidadeTulhasMadeira]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_CapacidadeTulhasMadeira]  DEFAULT ((0)) FOR [CapacidadeTulhasMadeira]
GO
/****** Object:  Default [DF_Propriedades_QtdeTulhaFerro]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeTulhaFerro]  DEFAULT ((0)) FOR [QtdeTulhaFerro]
GO
/****** Object:  Default [DF_Propriedades_CapacidadeTulhaFerro]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_CapacidadeTulhaFerro]  DEFAULT ((0)) FOR [CapacidadeTulhaFerro]
GO
/****** Object:  Default [DF_Propriedades_QtdeMaquinaBeneficio]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeMaquinaBeneficio]  DEFAULT ((0)) FOR [QtdeMaquinaBeneficio]
GO
/****** Object:  Default [DF_Propriedades_QtdeRebeneficioPeneirao]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeRebeneficioPeneirao]  DEFAULT ((0)) FOR [QtdeRebeneficioPeneirao]
GO
/****** Object:  Default [DF_Propriedades_QtdeRebeneficioDensimetrica]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeRebeneficioDensimetrica]  DEFAULT ((0)) FOR [QtdeRebeneficioDensimetrica]
GO
/****** Object:  Default [DF_Propriedades_QtdeRebeneficioEletronica]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeRebeneficioEletronica]  DEFAULT ((0)) FOR [QtdeRebeneficioEletronica]
GO
/****** Object:  Default [DF_Propriedades_QtdeRebeneficioBalao]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeRebeneficioBalao]  DEFAULT ((0)) FOR [QtdeRebeneficioBalao]
GO
/****** Object:  Default [DF_Propriedades_QtdeArmazemProprio]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_QtdeArmazemProprio]  DEFAULT ((0)) FOR [QtdeArmazemProprio]
GO
/****** Object:  Default [DF_Propriedades_CapacidadeArmazem]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_CapacidadeArmazem]  DEFAULT ((0)) FOR [CapacidadeArmazem]
GO
/****** Object:  Default [DF_Propriedades_RastreiaLotes]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_RastreiaLotes]  DEFAULT ((0)) FOR [RastreiaLotes]
GO
/****** Object:  Default [DF_Propriedades_ControleLavoura]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_ControleLavoura]  DEFAULT ((0)) FOR [ControleLavoura]
GO
/****** Object:  Default [DF_Propriedades_ControleLavador]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_ControleLavador]  DEFAULT ((0)) FOR [ControleLavador]
GO
/****** Object:  Default [DF_Propriedades_ControleTerreiro]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_ControleTerreiro]  DEFAULT ((0)) FOR [ControleTerreiro]
GO
/****** Object:  Default [DF_Propriedades_ControleSecador]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_ControleSecador]  DEFAULT ((0)) FOR [ControleSecador]
GO
/****** Object:  Default [DF_Propriedades_ControleTulha]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_ControleTulha]  DEFAULT ((0)) FOR [ControleTulha]
GO
/****** Object:  Default [DF_Propriedades_ControleBeneficio]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_ControleBeneficio]  DEFAULT ((0)) FOR [ControleBeneficio]
GO
/****** Object:  Default [DF_Propriedades_ControleRebeneficio]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_ControleRebeneficio]  DEFAULT ((0)) FOR [ControleRebeneficio]
GO
/****** Object:  Default [DF_Propriedades_Agronomo]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_Agronomo]  DEFAULT ((0)) FOR [Agronomo]
GO
/****** Object:  Default [DF_Propriedades_BoiaCereja]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_BoiaCereja]  DEFAULT ((0)) FOR [BoiaCereja]
GO
/****** Object:  Default [DF_Propriedades_AmostragemMaturacao]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_AmostragemMaturacao]  DEFAULT ((0)) FOR [AmostragemMaturacao]
GO
/****** Object:  Default [DF_Propriedades_ProvaPorTalhao]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_ProvaPorTalhao]  DEFAULT ((0)) FOR [ProvaPorTalhao]
GO
/****** Object:  Default [DF_Propriedades_ColheitaSeletiva]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_ColheitaSeletiva]  DEFAULT ((0)) FOR [ColheitaSeletiva]
GO
/****** Object:  Default [DF_Propriedades_ConfereUmidade]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_ConfereUmidade]  DEFAULT ((0)) FOR [ConfereUmidade]
GO
/****** Object:  Default [DF_Propriedades_DataCadastro]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades] ADD  CONSTRAINT [DF_Propriedades_DataCadastro]  DEFAULT (getdate()) FOR [DataCadastro]
GO
/****** Object:  Default [DF_Variedades_DataCadastro]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Variedades] ADD  CONSTRAINT [DF_Variedades_DataCadastro]  DEFAULT (getdate()) FOR [DataCadastro]
GO
/****** Object:  Default [DF_Talhoes_Irrigado]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Talhoes] ADD  CONSTRAINT [DF_Talhoes_Irrigado]  DEFAULT ((0)) FOR [Irrigado]
GO
/****** Object:  Default [DF_Talhoes_DataCadastro]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Talhoes] ADD  CONSTRAINT [DF_Talhoes_DataCadastro]  DEFAULT (getdate()) FOR [DataCadastro]
GO
/****** Object:  Default [DF_ConcursoAvaliacoes_DataAvaliacao]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes] ADD  CONSTRAINT [DF_ConcursoAvaliacoes_DataAvaliacao]  DEFAULT (getdate()) FOR [DataAvaliacao]
GO
/****** Object:  Default [DF_ConcursoAvaliacoes_Aroma]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes] ADD  CONSTRAINT [DF_ConcursoAvaliacoes_Aroma]  DEFAULT ((6)) FOR [Aroma]
GO
/****** Object:  Default [DF_ConcursoAvaliacoes_AromaSeca]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes] ADD  CONSTRAINT [DF_ConcursoAvaliacoes_AromaSeca]  DEFAULT ((0)) FOR [AromaSeca]
GO
/****** Object:  Default [DF_ConcursoAvaliacoes_AromaUmida]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes] ADD  CONSTRAINT [DF_ConcursoAvaliacoes_AromaUmida]  DEFAULT ((0)) FOR [AromaUmida]
GO
/****** Object:  Default [DF_ConcursoAvaliacoes_Sabor]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes] ADD  CONSTRAINT [DF_ConcursoAvaliacoes_Sabor]  DEFAULT ((6)) FOR [Sabor]
GO
/****** Object:  Default [DF_ConcursoAvaliacoes_Retrogosto]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes] ADD  CONSTRAINT [DF_ConcursoAvaliacoes_Retrogosto]  DEFAULT ((6)) FOR [Retrogosto]
GO
/****** Object:  Default [DF_ConcursoAvaliacoes_Acidez]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes] ADD  CONSTRAINT [DF_ConcursoAvaliacoes_Acidez]  DEFAULT ((6)) FOR [Acidez]
GO
/****** Object:  Default [DF_ConcursoAvaliacoes_AcidezIntensidade]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes] ADD  CONSTRAINT [DF_ConcursoAvaliacoes_AcidezIntensidade]  DEFAULT ((2.5)) FOR [AcidezIntensidade]
GO
/****** Object:  Default [DF_ConcursoAvaliacoes_Corpo]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes] ADD  CONSTRAINT [DF_ConcursoAvaliacoes_Corpo]  DEFAULT ((6)) FOR [Corpo]
GO
/****** Object:  Default [DF_ConcursoAvaliacoes_CorpoNivel]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes] ADD  CONSTRAINT [DF_ConcursoAvaliacoes_CorpoNivel]  DEFAULT ((2.5)) FOR [CorpoNivel]
GO
/****** Object:  Default [DF_ConcursoAvaliacoes_Uniformidade]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes] ADD  CONSTRAINT [DF_ConcursoAvaliacoes_Uniformidade]  DEFAULT ((0)) FOR [Uniformidade]
GO
/****** Object:  Default [DF_ConcursoAvaliacoes_Balanco]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes] ADD  CONSTRAINT [DF_ConcursoAvaliacoes_Balanco]  DEFAULT ((6)) FOR [Balanco]
GO
/****** Object:  Default [DF_ConcursoAvaliacoes_XicaraLimpa]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes] ADD  CONSTRAINT [DF_ConcursoAvaliacoes_XicaraLimpa]  DEFAULT ((0)) FOR [XicaraLimpa]
GO
/****** Object:  Default [DF_ConcursoAvaliacoes_Docura]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes] ADD  CONSTRAINT [DF_ConcursoAvaliacoes_Docura]  DEFAULT ((0)) FOR [Docura]
GO
/****** Object:  Default [DF_ConcursoAvaliacoes_Geral]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes] ADD  CONSTRAINT [DF_ConcursoAvaliacoes_Geral]  DEFAULT ((6)) FOR [Geral]
GO
/****** Object:  Default [DF_ConcursoAvaliacoes_XicarasDefeitosLeves]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes] ADD  CONSTRAINT [DF_ConcursoAvaliacoes_XicarasDefeitosLeves]  DEFAULT ((0)) FOR [XicarasDefeitosLeves]
GO
/****** Object:  Default [DF_ConcursoAvaliacoes_XicarasDefeitosGraves]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes] ADD  CONSTRAINT [DF_ConcursoAvaliacoes_XicarasDefeitosGraves]  DEFAULT ((0)) FOR [XicarasDefeitosGraves]
GO
/****** Object:  Default [DF_Classificacoes_Catacao]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Classificacao] ADD  CONSTRAINT [DF_Classificacoes_Catacao]  DEFAULT ((0)) FOR [Catacao]
GO
/****** Object:  Default [DF_Classificacoes_Peneira19]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Classificacao] ADD  CONSTRAINT [DF_Classificacoes_Peneira19]  DEFAULT ((0)) FOR [Peneira19]
GO
/****** Object:  Default [DF_Classificacoes_Peneira18]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Classificacao] ADD  CONSTRAINT [DF_Classificacoes_Peneira18]  DEFAULT ((0)) FOR [Peneira18]
GO
/****** Object:  Default [DF_Classificacoes_Peneira17]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Classificacao] ADD  CONSTRAINT [DF_Classificacoes_Peneira17]  DEFAULT ((0)) FOR [Peneira17]
GO
/****** Object:  Default [DF_Classificacoes_Peneira16]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Classificacao] ADD  CONSTRAINT [DF_Classificacoes_Peneira16]  DEFAULT ((0)) FOR [Peneira16]
GO
/****** Object:  Default [DF_Classificacoes_Peneira15]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Classificacao] ADD  CONSTRAINT [DF_Classificacoes_Peneira15]  DEFAULT ((0)) FOR [Peneira15]
GO
/****** Object:  Default [DF_Classificacoes_Peneira14]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Classificacao] ADD  CONSTRAINT [DF_Classificacoes_Peneira14]  DEFAULT ((0)) FOR [Peneira14]
GO
/****** Object:  Default [DF_Classificacoes_Peneira13]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Classificacao] ADD  CONSTRAINT [DF_Classificacoes_Peneira13]  DEFAULT ((0)) FOR [Peneira13]
GO
/****** Object:  Default [DF_Classificacoes_Moca11]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Classificacao] ADD  CONSTRAINT [DF_Classificacoes_Moca11]  DEFAULT ((0)) FOR [Moca11]
GO
/****** Object:  Default [DF_Classificacoes_Moca10]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Classificacao] ADD  CONSTRAINT [DF_Classificacoes_Moca10]  DEFAULT ((0)) FOR [Moca10]
GO
/****** Object:  Default [DF_Classificacoes_Moca9]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Classificacao] ADD  CONSTRAINT [DF_Classificacoes_Moca9]  DEFAULT ((0)) FOR [Moca9]
GO
/****** Object:  Default [DF_Classificacoes_Fundo]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Classificacao] ADD  CONSTRAINT [DF_Classificacoes_Fundo]  DEFAULT ((0)) FOR [Fundo]
GO
/****** Object:  Default [DF_Classificacoes_BebidaComercial]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Classificacao] ADD  CONSTRAINT [DF_Classificacoes_BebidaComercial]  DEFAULT ((0)) FOR [BebidaComercial]
GO
/****** Object:  Default [DF_Avaliacao_DataAvaliacao]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Avaliacao] ADD  CONSTRAINT [DF_Avaliacao_DataAvaliacao]  DEFAULT (getdate()) FOR [DataAvaliacao]
GO
/****** Object:  Default [DF_Avaliacao_Aroma]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Avaliacao] ADD  CONSTRAINT [DF_Avaliacao_Aroma]  DEFAULT ((0)) FOR [Aroma]
GO
/****** Object:  Default [DF_Avaliacao_Sabor]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Avaliacao] ADD  CONSTRAINT [DF_Avaliacao_Sabor]  DEFAULT ((0)) FOR [Sabor]
GO
/****** Object:  Default [DF_Avaliacao_Retrogosto]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Avaliacao] ADD  CONSTRAINT [DF_Avaliacao_Retrogosto]  DEFAULT ((0)) FOR [Retrogosto]
GO
/****** Object:  Default [DF_Avaliacao_Acidez]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Avaliacao] ADD  CONSTRAINT [DF_Avaliacao_Acidez]  DEFAULT ((0)) FOR [Acidez]
GO
/****** Object:  Default [DF_Avaliacao_Corpo]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Avaliacao] ADD  CONSTRAINT [DF_Avaliacao_Corpo]  DEFAULT ((0)) FOR [Corpo]
GO
/****** Object:  Default [DF_Avaliacao_Uniformidade]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Avaliacao] ADD  CONSTRAINT [DF_Avaliacao_Uniformidade]  DEFAULT ((0)) FOR [Uniformidade]
GO
/****** Object:  Default [DF_Avaliacao_Balanco]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Avaliacao] ADD  CONSTRAINT [DF_Avaliacao_Balanco]  DEFAULT ((0)) FOR [Balanco]
GO
/****** Object:  Default [DF_Avaliacao_XicaraLimpa]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Avaliacao] ADD  CONSTRAINT [DF_Avaliacao_XicaraLimpa]  DEFAULT ((0)) FOR [XicaraLimpa]
GO
/****** Object:  Default [DF_Avaliacao_Docura]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Avaliacao] ADD  CONSTRAINT [DF_Avaliacao_Docura]  DEFAULT ((0)) FOR [Docura]
GO
/****** Object:  Default [DF_Avaliacao_Geral]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Avaliacao] ADD  CONSTRAINT [DF_Avaliacao_Geral]  DEFAULT ((0)) FOR [Geral]
GO
/****** Object:  Default [DF_Avaliacao_DefeitosXicara]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Avaliacao] ADD  CONSTRAINT [DF_Avaliacao_DefeitosXicara]  DEFAULT ((0)) FOR [XicarasDefeitosLeves]
GO
/****** Object:  Default [DF_Avaliacao_DefeitosIntensidade]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Avaliacao] ADD  CONSTRAINT [DF_Avaliacao_DefeitosIntensidade]  DEFAULT ((0)) FOR [XicarasDefeitosGraves]
GO
/****** Object:  Default [DF_QRCodesSacas_DataEmissao]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[QRCodesSacas] ADD  CONSTRAINT [DF_QRCodesSacas_DataEmissao]  DEFAULT (getdate()) FOR [DataEmissao]
GO
/****** Object:  ForeignKey [FK_ConcursoAmostras_Concursos]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[ConcursoAmostras]  WITH CHECK ADD  CONSTRAINT [FK_ConcursoAmostras_Concursos] FOREIGN KEY([IDConcurso])
REFERENCES [dbo].[Concursos] ([IDConcurso])
GO
ALTER TABLE [dbo].[ConcursoAmostras] CHECK CONSTRAINT [FK_ConcursoAmostras_Concursos]
GO
/****** Object:  ForeignKey [FK_ConcursoJuradosConcurso_ConcursoJurados]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[ConcursoJuradosConcurso]  WITH CHECK ADD  CONSTRAINT [FK_ConcursoJuradosConcurso_ConcursoJurados] FOREIGN KEY([IDJurado])
REFERENCES [dbo].[ConcursoJurados] ([IDJurado])
GO
ALTER TABLE [dbo].[ConcursoJuradosConcurso] CHECK CONSTRAINT [FK_ConcursoJuradosConcurso_ConcursoJurados]
GO
/****** Object:  ForeignKey [FK_ConcursoJuradosConcurso_Concursos]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[ConcursoJuradosConcurso]  WITH CHECK ADD  CONSTRAINT [FK_ConcursoJuradosConcurso_Concursos] FOREIGN KEY([IDConcurso])
REFERENCES [dbo].[Concursos] ([IDConcurso])
GO
ALTER TABLE [dbo].[ConcursoJuradosConcurso] CHECK CONSTRAINT [FK_ConcursoJuradosConcurso_Concursos]
GO
/****** Object:  ForeignKey [FK_AmostrasLotes_Lotes]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[AmostrasLotes]  WITH CHECK ADD  CONSTRAINT [FK_AmostrasLotes_Lotes] FOREIGN KEY([IDLote])
REFERENCES [dbo].[Lotes] ([IDLote])
GO
ALTER TABLE [dbo].[AmostrasLotes] CHECK CONSTRAINT [FK_AmostrasLotes_Lotes]
GO
/****** Object:  ForeignKey [FK_Propriedades_Associados]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Propriedades]  WITH CHECK ADD  CONSTRAINT [FK_Propriedades_Associados] FOREIGN KEY([IDAssociado])
REFERENCES [dbo].[Associados] ([IDAssociado])
GO
ALTER TABLE [dbo].[Propriedades] CHECK CONSTRAINT [FK_Propriedades_Associados]
GO
/****** Object:  ForeignKey [FK_Variedades_Culturas]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Variedades]  WITH CHECK ADD  CONSTRAINT [FK_Variedades_Culturas] FOREIGN KEY([IDCultura])
REFERENCES [dbo].[Culturas] ([IDCultura])
GO
ALTER TABLE [dbo].[Variedades] CHECK CONSTRAINT [FK_Variedades_Culturas]
GO
/****** Object:  ForeignKey [FK_Talhoes_Propriedades]    Script Date: 09/24/2015 14:20:17 ******/
ALTER TABLE [dbo].[Talhoes]  WITH CHECK ADD  CONSTRAINT [FK_Talhoes_Propriedades] FOREIGN KEY([IDPropriedade])
REFERENCES [dbo].[Propriedades] ([IDPropriedade])
GO
ALTER TABLE [dbo].[Talhoes] CHECK CONSTRAINT [FK_Talhoes_Propriedades]
GO
/****** Object:  ForeignKey [FK_PropriedadesXPremios_Propriedades]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[PremiosPropriedades]  WITH CHECK ADD  CONSTRAINT [FK_PropriedadesXPremios_Propriedades] FOREIGN KEY([IDPropriedade])
REFERENCES [dbo].[Propriedades] ([IDPropriedade])
GO
ALTER TABLE [dbo].[PremiosPropriedades] CHECK CONSTRAINT [FK_PropriedadesXPremios_Propriedades]
GO
/****** Object:  ForeignKey [FK_ConcursoAvaliacoes_ConcursoAmostras]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes]  WITH CHECK ADD  CONSTRAINT [FK_ConcursoAvaliacoes_ConcursoAmostras] FOREIGN KEY([IDAmostraConcurso])
REFERENCES [dbo].[ConcursoAmostras] ([IDAmostraConcurso])
GO
ALTER TABLE [dbo].[ConcursoAvaliacoes] CHECK CONSTRAINT [FK_ConcursoAvaliacoes_ConcursoAmostras]
GO
/****** Object:  ForeignKey [FK_ConcursoAvaliacoes_ConcursoJurados]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes]  WITH CHECK ADD  CONSTRAINT [FK_ConcursoAvaliacoes_ConcursoJurados] FOREIGN KEY([IDJurado])
REFERENCES [dbo].[ConcursoJurados] ([IDJurado])
GO
ALTER TABLE [dbo].[ConcursoAvaliacoes] CHECK CONSTRAINT [FK_ConcursoAvaliacoes_ConcursoJurados]
GO
/****** Object:  ForeignKey [FK_ConcursoAvaliacoes_Concursos]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoAvaliacoes]  WITH CHECK ADD  CONSTRAINT [FK_ConcursoAvaliacoes_Concursos] FOREIGN KEY([IDConcurso])
REFERENCES [dbo].[Concursos] ([IDConcurso])
GO
ALTER TABLE [dbo].[ConcursoAvaliacoes] CHECK CONSTRAINT [FK_ConcursoAvaliacoes_Concursos]
GO
/****** Object:  ForeignKey [FK_Classificacao_AmostrasLotes]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Classificacao]  WITH CHECK ADD  CONSTRAINT [FK_Classificacao_AmostrasLotes] FOREIGN KEY([IDAmostra])
REFERENCES [dbo].[AmostrasLotes] ([IDAmostra])
GO
ALTER TABLE [dbo].[Classificacao] CHECK CONSTRAINT [FK_Classificacao_AmostrasLotes]
GO
/****** Object:  ForeignKey [FK_Classificacao_Usuarios]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Classificacao]  WITH CHECK ADD  CONSTRAINT [FK_Classificacao_Usuarios] FOREIGN KEY([IDProvador])
REFERENCES [dbo].[Usuarios] ([IDUsuario])
GO
ALTER TABLE [dbo].[Classificacao] CHECK CONSTRAINT [FK_Classificacao_Usuarios]
GO
/****** Object:  ForeignKey [FK_Avaliacao_AmostrasLotes]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Avaliacao]  WITH CHECK ADD  CONSTRAINT [FK_Avaliacao_AmostrasLotes] FOREIGN KEY([IDAmostra])
REFERENCES [dbo].[AmostrasLotes] ([IDAmostra])
GO
ALTER TABLE [dbo].[Avaliacao] CHECK CONSTRAINT [FK_Avaliacao_AmostrasLotes]
GO
/****** Object:  ForeignKey [FK_Avaliacao_Usuarios]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[Avaliacao]  WITH CHECK ADD  CONSTRAINT [FK_Avaliacao_Usuarios] FOREIGN KEY([IDProvador])
REFERENCES [dbo].[Usuarios] ([IDUsuario])
GO
ALTER TABLE [dbo].[Avaliacao] CHECK CONSTRAINT [FK_Avaliacao_Usuarios]
GO
/****** Object:  ForeignKey [FK_QRCodesSacas_AmostrasLotes]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[QRCodesSacas]  WITH CHECK ADD  CONSTRAINT [FK_QRCodesSacas_AmostrasLotes] FOREIGN KEY([IDAmostra])
REFERENCES [dbo].[AmostrasLotes] ([IDAmostra])
GO
ALTER TABLE [dbo].[QRCodesSacas] CHECK CONSTRAINT [FK_QRCodesSacas_AmostrasLotes]
GO
/****** Object:  ForeignKey [FK_VariedadesXTalhoes_Talhoes]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[VariedadesTalhoes]  WITH CHECK ADD  CONSTRAINT [FK_VariedadesXTalhoes_Talhoes] FOREIGN KEY([IDTalhao])
REFERENCES [dbo].[Talhoes] ([IDTalhao])
GO
ALTER TABLE [dbo].[VariedadesTalhoes] CHECK CONSTRAINT [FK_VariedadesXTalhoes_Talhoes]
GO
/****** Object:  ForeignKey [FK_VariedadesXTalhoes_Variedades]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[VariedadesTalhoes]  WITH CHECK ADD  CONSTRAINT [FK_VariedadesXTalhoes_Variedades] FOREIGN KEY([IDVariedade])
REFERENCES [dbo].[Variedades] ([IDVariedade])
GO
ALTER TABLE [dbo].[VariedadesTalhoes] CHECK CONSTRAINT [FK_VariedadesXTalhoes_Variedades]
GO
/****** Object:  ForeignKey [FK_ConcursoSaboresAvaliacao_ConcursoAvaliacoes]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoSaboresAvaliacao]  WITH CHECK ADD  CONSTRAINT [FK_ConcursoSaboresAvaliacao_ConcursoAvaliacoes] FOREIGN KEY([IDAvaliacaoConcurso])
REFERENCES [dbo].[ConcursoAvaliacoes] ([IDAvaliacaoConcurso])
GO
ALTER TABLE [dbo].[ConcursoSaboresAvaliacao] CHECK CONSTRAINT [FK_ConcursoSaboresAvaliacao_ConcursoAvaliacoes]
GO
/****** Object:  ForeignKey [FK_ConcursoSaboresAvaliacao_Sabores]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[ConcursoSaboresAvaliacao]  WITH CHECK ADD  CONSTRAINT [FK_ConcursoSaboresAvaliacao_Sabores] FOREIGN KEY([IDSabor])
REFERENCES [dbo].[Sabores] ([IDSabor])
GO
ALTER TABLE [dbo].[ConcursoSaboresAvaliacao] CHECK CONSTRAINT [FK_ConcursoSaboresAvaliacao_Sabores]
GO
/****** Object:  ForeignKey [FK_SaborAvaliacao_Avaliacao]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[SaboresAvaliacao]  WITH CHECK ADD  CONSTRAINT [FK_SaborAvaliacao_Avaliacao] FOREIGN KEY([IDAvaliacao])
REFERENCES [dbo].[Avaliacao] ([IDAvaliacao])
GO
ALTER TABLE [dbo].[SaboresAvaliacao] CHECK CONSTRAINT [FK_SaborAvaliacao_Avaliacao]
GO
/****** Object:  ForeignKey [FK_SaborAvaliacao_Sabor]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[SaboresAvaliacao]  WITH CHECK ADD  CONSTRAINT [FK_SaborAvaliacao_Sabor] FOREIGN KEY([IDSabor])
REFERENCES [dbo].[Sabores] ([IDSabor])
GO
ALTER TABLE [dbo].[SaboresAvaliacao] CHECK CONSTRAINT [FK_SaborAvaliacao_Sabor]
GO
/****** Object:  ForeignKey [FK_TalhoesLotes_Lotes]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[TalhoesLotes]  WITH CHECK ADD  CONSTRAINT [FK_TalhoesLotes_Lotes] FOREIGN KEY([IDLote])
REFERENCES [dbo].[Lotes] ([IDLote])
GO
ALTER TABLE [dbo].[TalhoesLotes] CHECK CONSTRAINT [FK_TalhoesLotes_Lotes]
GO
/****** Object:  ForeignKey [FK_TalhoesLotes_Talhoes]    Script Date: 09/24/2015 14:20:18 ******/
ALTER TABLE [dbo].[TalhoesLotes]  WITH CHECK ADD  CONSTRAINT [FK_TalhoesLotes_Talhoes] FOREIGN KEY([IDTalhao])
REFERENCES [dbo].[Talhoes] ([IDTalhao])
GO
ALTER TABLE [dbo].[TalhoesLotes] CHECK CONSTRAINT [FK_TalhoesLotes_Talhoes]
GO
