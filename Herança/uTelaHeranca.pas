unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.ExtCtrls, Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  ZAbstractRODataset, ZAbstractDataset, ZDataset,udtmConexao,uEnum;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    btnlRodape: TPanel;
    TabListagem: TTabSheet;
    TabManutencao: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    BtnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    btnNavigator: TDBNavigator;
    qryListagem: TZQuery;
    dtsListagem: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    EstadoDoCadastro : TestadoDoCadastro;

    procedure ControlarBotoes(btnNovo,btnAlterar,btnCanecelar,
                                          btnGravar,btnApagar : TBitBtn;
                                          navegador : TDBNavigator;pgcPrincipal : TPageControl;
                                          flag:Boolean);
    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; indice: integer);


  public
    { Public declarations }
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}


//procedimento de COntrole de t�la

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
     ControlarBotoes(btnNovo,btnAlterar,btnCancelar,BtnGravar,btnApagar,btnNavigator,pgcPrincipal,false);
     EstadoDoCadastro := ecInserir;
end;

procedure TfrmTelaHeranca.ControlarBotoes(btnNovo,btnAlterar,btnCanecelar,
                                          btnGravar,btnApagar : TBitBtn;
                                          navegador : TDBNavigator;pgcPrincipal : TPageControl;
                                          flag:Boolean);
  Begin
       btnNovo.Enabled          :=flag;
       btnApagar.Enabled        :=flag;
       btnAlterar.Enabled       :=flag;
       navegador.Enabled        :=flag;
       pgcPrincipal.pages[0].TabVisible :=flag;
       btnCancelar.Enabled     :=not(flag);
       btnGravar.Enabled       :=not(flag);

  End;


procedure TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal : TPageControl; indice:integer );
  begin
       if (pgcPrincipal.pages[indice].TabVisible) then
          pgcPrincipal.TabIndex := indice;



  end;

procedure TfrmTelaHeranca.BtnAlterarClick(Sender: TObject);
begin
     ControlarBotoes(btnNovo,btnAlterar,btnCancelar,BtnGravar,btnApagar,btnNavigator,pgcPrincipal,false);
      EstadoDoCadastro := ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
      ControlarBotoes(btnNovo,btnAlterar,btnCancelar,BtnGravar,btnApagar,btnNavigator,pgcPrincipal,true);
       EstadoDoCadastro := ecNenhum;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
      ControlarBotoes(btnNovo,btnAlterar,btnCancelar,BtnGravar,btnApagar,btnNavigator,pgcPrincipal,True);
      ControlarIndiceTab(pgcPrincipal,0);
       EstadoDoCadastro := ecNenhum;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
      try
     ControlarBotoes(btnNovo,btnAlterar,btnCancelar,BtnGravar,btnApagar,btnNavigator,pgcPrincipal,True);
      ControlarIndiceTab(pgcPrincipal,0);
          if (EstadoDoCadastro =ecInserir) then
              showmessage('Inserir')
          else if (EstadoDoCadastro =ecAlterar) then
              showmessage('Alterar')
          else
              showmessage('n�o foi feliz');

      finally
      end;
      EstadoDoCadastro := ecNenhum;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
     qryListagem.Connection := dtmPrincipal.conexaoDB;
     dtsListagem.DataSet :=  qryListagem;
     grdListagem.DataSource := dtsListagem;
end;

end.
