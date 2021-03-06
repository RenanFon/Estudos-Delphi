program Vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  udtmConexao in 'DataModule\udtmConexao.pas' {dtmPrincipal: TDataModule},
  uTelaHeranca in 'Heran?a\uTelaHeranca.pas' {frmTelaHeranca},
  uCadCategoria in 'Cadastro\uCadCategoria.pas' {frmCadCategoria},
  Enter in 'terceiros\Enter.pas',
  uEnum in 'Heran?a\uEnum.pas',
  cCadCategoria in 'Classes\cCadCategoria.pas',
  uCadCliente in 'Cadastro\uCadCliente.pas' {frmCadCliente},
  cCadCliente in 'Classes\cCadCliente.pas',
  uCadProduto in 'Cadastro\uCadProduto.pas' {frmCadProduto},
  cCadProduto in 'Classes\cCadProduto.pas',
  uFrmAtualizaDb in 'DataModule\uFrmAtualizaDb.pas' {frmAtualizaDB},
  uDtmVenda in 'DataModule\uDtmVenda.pas' {dtmVenda: TDataModule},
  uProVendas in 'Processo\uProVendas.pas' {frmProVendas},
  cProVendas in 'Classes\cProVendas.pas',
  cControleEstoque in 'Classes\cControleEstoque.pas',
  uRelCliente in 'Relatorio\uRelCliente.pas' {frmRelCliente},
  uRelCategoria in 'Relatorio\uRelCategoria.pas' {frmRelCategoria},
  uRelClienteFicha in 'Relatorio\uRelClienteFicha.pas' {frmRelClienteFicha},
  uRelCadProduto in 'Relatorio\uRelCadProduto.pas' {frmRelCadProduto},
  uSelecionarData in 'Processo\uSelecionarData.pas' {frmSelecionarData},
  uRelCadProdutosComGrupoCategoria in 'Relatorio\uRelCadProdutosComGrupoCategoria.pas' {frmRelCadProdutosComGrupoCategoria},
  uRelProVenda in 'Relatorio\uRelProVenda.pas' {frmRelProVenda},
  uRelProVendaPorData in 'Relatorio\uRelProVendaPorData.pas' {frmRelProVendaPorData},
  uFuncaoCriptografia in 'Heran?a\uFuncaoCriptografia.pas',
  ucadUsuario in 'Cadastro\ucadUsuario.pas' {frmCadUsuario},
  cUsuario in 'Classes\cUsuario.pas',
  uLogin in 'login\uLogin.pas' {frmLogin},
  uAlterarSenha in 'login\uAlterarSenha.pas' {frmAlterarSenha},
  cUsuarioLogado in 'Classes\cUsuarioLogado.pas',
  cAtualizacaoBancoDeDados in 'Classes\cAtualizacaoBancoDeDados.pas',
  cAtualizacaoTabelaMSSQL in 'Classes\cAtualizacaoTabelaMSSQL.pas',
  cAtualizacaoCampoMSSQL in 'cAtualizacaoCampoMSSQL.pas',
  cAquivoIni in 'Classes\cAquivoIni.pas',
  cAcaoAcesso in 'Classes\cAcaoAcesso.pas',
  uCadAcaoAcesso in 'Cadastro\uCadAcaoAcesso.pas' {frmCadAcaoAcesso},
  uUsuarioVsAcoes in 'login\uUsuarioVsAcoes.pas' {frmUsuarioVsAcoes},
  udtmGrafico in 'DataModule\udtmGrafico.pas' {dtmGrafico: TDataModule},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
