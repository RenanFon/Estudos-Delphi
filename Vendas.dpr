program Vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  udtmConexao in 'DataModule\udtmConexao.pas' {dtmPrincipal: TDataModule},
  uTelaHeranca in 'Heran�a\uTelaHeranca.pas' {frmTelaHeranca},
  uCadCategoria in 'Cadastro\uCadCategoria.pas' {frmCadCategoria},
  Enter in 'terceiros\Enter.pas',
  uEnum in 'Heran�a\uEnum.pas',
  cCadCategoria in 'Classes\cCadCategoria.pas',
  uCadCliente in 'Cadastro\uCadCliente.pas' {frmCadCliente},
  cCadCliente in 'Classes\cCadCliente.pas',
  uCadProduto in 'Cadastro\uCadProduto.pas' {frmCadProduto},
  cCadProduto in 'Classes\cCadProduto.pas',
  uFrmAtualizaDb in 'DataModule\uFrmAtualizaDb.pas' {frmAtualizaDB};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
