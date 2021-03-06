unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,udtmConexao,
   Enter, uFrmAtualizaDb,uProVendas,ucadUsuario,uLogin, uAlterarSenha,cUsuarioLogado,
  Vcl.ComCtrls,cAtualizacaoBancoDeDados,uCadAcaoAcesso,cAcaoAcesso,RLReport,uUsuarioVsAcoes,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.ExtCtrls,udtmGrafico,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart, VCLTee.DBChart, Vcl.StdCtrls, Vcl.Buttons;

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
    AOA1: TMenuItem;
    UsuariosVSa1: TMenuItem;
    N5: TMenuItem;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel1: TPanel;
    DBChart3: TDBChart;
    Panel6: TPanel;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    DBChart2: TDBChart;
    Series2: TPieSeries;
    DBChart4: TDBChart;
    Series3: TLineSeries;
    Series4: THorizBarSeries;
    BitBtn1: TBitBtn;
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
    procedure AOA1Click(Sender: TObject);
    procedure UsuariosVSa1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    //procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    TeclaEnter : TMREnter;
    procedure AtualizacaoDoBanco(aForm: TFrmAtualizaDb);
    procedure CriarForm(aNomeForm: TFormClass);
    procedure AtualizarDashbord;
    //procedure CriarRelatorio(oNomeForm: TFormClass);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  oUsuarioLogado: TUsuarioLogado;

implementation

{$R *.dfm}

uses uCadCategoria, uCadCliente,uCadProduto,cCadProduto,uRelCategoria,uRelClienteFicha,uRelCliente,
        uSelecionarData,uRelCadProduto,uRelProVendaPorData,
        uRelCadProdutosComGrupoCategoria,cAquivoIni;

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
    begin
        CriarForm(TfrmCadCategoria);
    end;

procedure TfrmPrincipal.Categoria2Click(Sender: TObject);
    begin
        frmRelCategoria:= TfrmRelCategoria.Create(self);
        frmRelCategoria.relatorio.PreviewModal;
        frmRelCategoria.Release;
        //CriarForm(TfrmRelCategoria);
    end;

procedure TfrmPrincipal.CLIENTE1Click(Sender: TObject);
    begin
        CriarForm(TfrmCadCliente);
    end;

procedure TfrmPrincipal.CLIENTE2Click(Sender: TObject);
    begin

        frmRelCliente:= TfrmRelCliente.create(self);
        frmRelCliente.relatorio.PreviewModal;
        frmRelCliente.Release;


        //CriarForm(TfrmRelCliente);
    end;

procedure TfrmPrincipal.FICHADOCLIENTE1Click(Sender: TObject);
    begin
    frmRelClienteFicha:= TfrmRelClienteFicha.Create(self);
    frmRelClienteFicha.relatorio.PreviewModal;
    frmRelClienteFicha.Release
       //CriarForm(TfrmRelClienteFicha);
    end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     FreeandNil(TeclaEnter);
     FreeAndNil(dtmPrincipal);
     FreeAndNil(dtmGrafico);

     if assigned(oUsuarioLogado) then
        FreeAndNil(oUsuarioLogado);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
    begin
         frmAtualizaDB := TfrmAtualizaDB.Create(Self);
         frmAtualizaDB.Show;
         frmAtualizaDB.Refresh;

          if not FileExists(TArquivoIni.ArquivoIni) then
          begin
            TArquivoIni.AtualizarIni('SERVER', 'TipoDataBase', 'MSSQL');
            TArquivoIni.AtualizarIni('SERVER', 'HostName', '.\');
            TArquivoIni.AtualizarIni('SERVER', 'Port', '1433');
            TArquivoIni.AtualizarIni('SERVER', 'User', 'sa');
            TArquivoIni.AtualizarIni('SERVER', 'Password', 'mudar@123');
            TArquivoIni.AtualizarIni('SERVER', 'Database', 'vendas');
            MessageDlg('Arquivo '+ TArquivoIni.ArquivoIni +' Criado com sucesso' +#13+
                       'Configure o arquivo antes de inicializar aplica??o',MtInformation,[mbok],0);


          end

          else
            begin

             dtmPrincipal := TdtmPrincipal.create(self);
             dtmPrincipal.conexaoDB.SQLHourGlass := true;
             dtmPrincipal.conexaoDB.Connected := true;
             TeclaEnter := TMREnter.Create(Self);
             TeclaEnter.FocusEnabled := True;
             TeclaEnter.FocusColor := clInfoBk;





            AtualizacaoDoBanco(frmAtualizaDB);

            TAcaoAcesso.CriarAcoes(TfrmCadCategoria,DtmPrincipal.ConexaoDB);
            TAcaoAcesso.CriarAcoes(TfrmCadCliente,DtmPrincipal.ConexaoDB);
            TAcaoAcesso.CriarAcoes(TfrmCadProduto,DtmPrincipal.ConexaoDB);
            TAcaoAcesso.CriarAcoes(TfrmCadUsuario,DtmPrincipal.ConexaoDB);
            TAcaoAcesso.CriarAcoes(TfrmCadAcaoAcesso,DtmPrincipal.ConexaoDB);
            TAcaoAcesso.CriarAcoes(TfrmAlterarSenha,DtmPrincipal.ConexaoDB);
            TAcaoAcesso.CriarAcoes(TfrmProVendas,DtmPrincipal.ConexaoDB);
            TAcaoAcesso.CriarAcoes(TfrmRelProVendaPorData,DtmPrincipal.ConexaoDB);
            TAcaoAcesso.CriarAcoes(TfrmRelClienteFicha,DtmPrincipal.ConexaoDB);
            TAcaoAcesso.CriarAcoes(TfrmRelCliente,DtmPrincipal.ConexaoDB);
            TAcaoAcesso.CriarAcoes(TfrmRelCadProdutosComGrupoCategoria,DtmPrincipal.ConexaoDB);
            TAcaoAcesso.CriarAcoes(TfrmRelCadProduto,DtmPrincipal.ConexaoDB);
            TAcaoAcesso.CriarAcoes(TfrmRelCategoria,DtmPrincipal.ConexaoDB);
            TAcaoAcesso.CriarAcoes(TfrmUsuarioVsAcoes,DtmPrincipal.ConexaoDB);
             dtmGrafico := TdtmGrafico.Create(self);
    AtualizarDashbord;

             frmAtualizaDB.free;
             TAcaoAcesso.PreencherUsuariosVsAcoes(DtmPrincipal.ConexaoDB);
            end;
    end;



procedure TfrmPrincipal.FormShow(Sender: TObject);
    begin
        try
          oUsuarioLogado := TUsuarioLogado.Create;
          frmLogin:= TfrmLogin.Create(self);
          frmLogin.ShowModal;
        finally
          frmLogin.Release;
          stbPrincipal.Panels[0].Text:='USU?RIO: '+oUsuarioLogado.nome;
        end;


    end;

procedure TfrmPrincipal.menuFECHARClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmPrincipal.PRODUTO1Click(Sender: TObject);
    begin
        CriarForm(TfrmCadProduto);
    end;

procedure TfrmPrincipal.PRODUTO2Click(Sender: TObject);
    begin
          frmRelCadProduto:= TfrmRelCadProduto.Create(self);
          frmRelCadProduto.relatorio.PreviewModal;
          frmRelCadProduto.Release;
        //CriarForm(TfrmRelCadProduto);
    end;

procedure TfrmPrincipal.USUARIO1Click(Sender: TObject);
    begin
         CriarForm(TfrmCadUsuario);
    end;

procedure TfrmPrincipal.UsuariosVSa1Click(Sender: TObject);
begin
     CriarForm(TfrmUsuarioVsAcoes);
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
        CriarForm(TfrmProVendas);
    end;

procedure TfrmPrincipal.ALTERARSENHA1Click(Sender: TObject);
    begin
         CriarForm(TfrmAlterarSenha);
    end;

procedure TfrmPrincipal.AOA1Click(Sender: TObject);
    begin
         CriarForm(TfrmCadAcaoAcesso);
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

procedure TfrmPrincipal.CriarForm(aNomeForm: TFormClass);
var form : Tform;
    begin
        try
            form := aNomeForm.Create(Application);
            form.ShowModal;
        finally
            if assigned(form) then
                Form.Release;
               AtualizarDashbord;
        end;
    end;

procedure TfrmPrincipal.AtualizarDashbord;
begin
  if DTMGrafico.QryProdutoEstoque.Active then
     DTMGrafico.QryProdutoEstoque.Close;

  if DTMGrafico.qryVendaValorPorCliente.Active then
     DTMGrafico.qryVendaValorPorCliente.Close;

  if DTMGrafico.qryProdutosMaisVendidos.Active then
     DTMGrafico.qryProdutosMaisVendidos.Close;

  if DTMGrafico.qryVendasUltimasSemanas.Active then
     DTMGrafico.qryVendasUltimasSemanas.Close;

  DTMGrafico.QryProdutoEstoque.Open;
  DTMGrafico.qryVendaValorPorCliente.Open;
  DTMGrafico.qryProdutosMaisVendidos.Open;
  DTMGrafico.qryVendasUltimasSemanas.Open;

end;



procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
    AtualizarDashbord;
end;

end.
