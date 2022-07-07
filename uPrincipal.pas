unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,udtmConexao,
   Enter, uFrmAtualizaDb,uProVendas,ucadUsuario,uLogin, uAlterarSenha,cUsuarioLogado,
  Vcl.ComCtrls,cAtualizacaoBancoDeDados;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    RELATORIO1: TMenuItem;
    CLIENTE1: TMenuItem;
    N1: TMenuItem;
    CATEGORIA1: TMenuItem;
    PRODUTO1: TMenuItem;
    N2: TMenuItem;
    menuFECHAR: TMenuItem;
    VENDAS1: TMenuItem;
    CLIENTE2: TMenuItem;
    CLIENTE3: TMenuItem;
    PRODUTO2: TMenuItem;
    N3: TMenuItem;
    VENDAPORDATA1: TMenuItem;
    Categoria2: TMenuItem;
    FICHADOCLIENTE1: TMenuItem;
    USUARIO1: TMenuItem;
    N4: TMenuItem;
    ALTERARSENHA1: TMenuItem;
    stbPrincipal: TStatusBar;
    procedure menuFECHARClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CLIENTE1Click(Sender: TObject);
    procedure PRODUTO1Click(Sender: TObject);
    procedure VENDAS1Click(Sender: TObject);
    procedure Categoria2Click(Sender: TObject);
    procedure FICHADOCLIENTE1Click(Sender: TObject);
    procedure CLIENTE2Click(Sender: TObject);
    procedure PRODUTO2Click(Sender: TObject);
    procedure VENDAPORDATA1Click(Sender: TObject);
    procedure USUARIO1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ALTERARSENHA1Click(Sender: TObject);
  private
    { Private declarations }
    TeclaEnter : TMREnter;
    procedure AtualizacaoDoBanco(aForm: TFrmAtualizaDb);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  oUsuarioLogado: TUsuarioLogado;

implementation

{$R *.dfm}

uses uCadCategoria, uCadCliente,uCadProduto,cCadProduto,uRelCategoria,uRelClienteFicha,uRelCliente,
        uSelecionarData,uRelCadProduto,uRelProVendaPorData,uRelCadProdutosComGrupoCategoria;

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
begin
    frmCadCategoria:= TfrmCadCategoria.Create(self);
    frmCadCategoria.showModal;
    frmCadCategoria.Release;
end;

procedure TfrmPrincipal.Categoria2Click(Sender: TObject);
    begin
        frmRelCategoria := TfrmRelCategoria.Create(self);
        frmRelCategoria.relatorio.PreviewModal;
        frmRelCategoria.Release;
    end;

procedure TfrmPrincipal.CLIENTE1Click(Sender: TObject);
begin
    frmCadCliente := TfrmCadCliente.Create(self);
    frmCadCliente.ShowModal;
    frmCadCliente.Release;
end;

procedure TfrmPrincipal.CLIENTE2Click(Sender: TObject);
    begin
         frmRelCliente:= TfrmRelCliente.create(self);
         frmRelCliente.relatorio.PreviewModal;
         frmRelCliente.Release;
    end;

procedure TfrmPrincipal.FICHADOCLIENTE1Click(Sender: TObject);
    begin
        frmRelClienteFicha:= TfrmRelClienteFicha.Create(self);
        frmRelClienteFicha.relatorio.PreviewModal;
        frmRelClienteFicha.Release;
    end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     FreeandNil(TeclaEnter);
     FreeAndNil(dtmPrincipal);

     if assigned(oUsuarioLogado) then
        FreeAndNil(oUsuarioLogado);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
    begin
         frmAtualizaDB := TfrmAtualizaDB.Create(Self);
         frmAtualizaDB.Show;
         frmAtualizaDB.Refresh;

         dtmPrincipal := TdtmPrincipal.create(self);
         dtmPrincipal.conexaoDB.SQLHourGlass := true;
         dtmPrincipal.conexaoDB.Connected := true;
         TeclaEnter := TMREnter.Create(Self);
         TeclaEnter.FocusEnabled := True;
         TeclaEnter.FocusColor := clInfoBk;

         AtualizacaoDoBanco(frmAtualizaDB);
         frmAtualizaDB.free;
    end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
    begin
        try
          oUsuarioLogado := TUsuarioLogado.Create;
          frmLogin:= TfrmLogin.Create(self);
          frmLogin.ShowModal;
        finally
          frmLogin.Release;
          stbPrincipal.Panels[0].Text:='USU�RIO: '+oUsuarioLogado.nome;
        end;


    end;

procedure TfrmPrincipal.menuFECHARClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmPrincipal.PRODUTO1Click(Sender: TObject);
    begin
        frmCadProduto:= TfrmCadProduto.Create(Self);
        frmCadProduto.ShowModal;
        frmCadProduto.Release;
    end;

procedure TfrmPrincipal.PRODUTO2Click(Sender: TObject);
    begin
        frmRelCadProduto:= TfrmRelCadProduto.Create(self);
        frmRelCadProduto.relatorio.PreviewModal;
        frmRelCadProduto.Release;
    end;

procedure TfrmPrincipal.USUARIO1Click(Sender: TObject);
    begin
         frmCadUsuario:= TfrmCadUsuario.Create(self);
         frmCadUsuario.ShowModal;
         frmCadUsuario.Release;
    end;

procedure TfrmPrincipal.VENDAPORDATA1Click(Sender: TObject);
    begin
        try
            frmSelecionarData:= TfrmSelecionarData.Create(self);
            frmSelecionarData.ShowModal;


        finally
            frmSelecionarData.Release;
        end;
    end;

procedure TfrmPrincipal.VENDAS1Click(Sender: TObject);
    begin
        frmProVendas := TfrmProVendas.Create(self);
        frmProVendas.ShowModal;
        frmProVendas.Release;
    end;

procedure TfrmPrincipal.ALTERARSENHA1Click(Sender: TObject);
    begin
         frmAlterarSenha:= TfrmAlterarSenha.Create(self);
         frmAlterarSenha.ShowModal;
         frmAlterarSenha.Release;
    end;

procedure TfrmPrincipal.AtualizacaoDoBanco(aForm:TFrmAtualizaDb);
var oAtualizaMSSQL : TAtualizaBancoDadosMSSQL;
   BEGIN
            //aForm.chkConexao.Checked := true;
            aForm.Refresh;

      try
        oAtualizaMSSQL:=TAtualizaBancoDadosMSSQL.Create(DtmPrincipal.ConexaoDB);
        oAtualizaMSSQL.AtualizarBancoDeDadosMSSQL;
      finally
        if Assigned(oAtualizaMSSQL) then
           FreeAndNil(oAtualizaMSSQL);
      end;
    end;

end.
