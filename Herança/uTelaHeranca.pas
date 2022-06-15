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
    lblIndice: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);
  private
    { Private declarations }
    EstadoDoCadastro : TestadoDoCadastro;

    procedure ControlarBotoes(btnNovo,btnAlterar,btnCanecelar,
                                          btnGravar,btnApagar : TBitBtn;
                                          navegador : TDBNavigator;pgcPrincipal : TPageControl;
                                          flag:Boolean);
    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; indice: integer);
    function RetornarCampoTraduzido(Campo: String): string;
    procedure ExibirLabelIndice(campo: String; aLabel: Tlabel);


  public
    { Public declarations }
    indiceAtual : String;
    function excluir:Boolean ; virtual;
     function Gravar(EstadoDoCadastro : TEstadoDoCadastro ):Boolean ; virtual;
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


 {$region METODOS VIRTUAIS}
function TfrmTelaHeranca.excluir: Boolean;
begin
    showmessage('DELETADO');
     Result := True;
end;
function Gravar(EstadoDoCadastro : TEstadoDoCadastro ):Boolean ;
begin
     if (EstadoDoCadastro =ecInserir) then
              showmessage('Inserir')
     else if (EstadoDoCadastro =ecAlterar) then
             showmessage('Alterar');

             Result := True;
end;



{$endregion}
function TfrmTelaHeranca.RetornarCampoTraduzido(Campo : String): string;
begin
    var i : INTEGER;

    for I := 0 to qryListagem.Fields.Count -1 do
        begin
            if lowercase(qryListagem.Fields[i].FieldName) = lowercase(campo) then
                begin
                  Result := qryListagem.Fields[i].DisplayLabel;
                   Break;
                end;

        end;



end;


procedure TfrmTelaHeranca.ExibirLabelIndice(campo:String;aLabel:Tlabel);
begin
   aLabel.Caption := RetornarCampoTraduzido(campo);





end;

procedure TfrmTelaHeranca.BtnAlterarClick(Sender: TObject);
begin
     ControlarBotoes(btnNovo,btnAlterar,btnCancelar,BtnGravar,btnApagar,btnNavigator,pgcPrincipal,false);
      EstadoDoCadastro := ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
       if excluir then
       begin
      ControlarBotoes(btnNovo,btnAlterar,btnCancelar,BtnGravar,btnApagar,btnNavigator,pgcPrincipal,true);
       EstadoDoCadastro := ecNenhum;
       end;
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
      if Gravar(EstadoDoCadastro) then
          begin
     ControlarBotoes(btnNovo,btnAlterar,btnCancelar,BtnGravar,btnApagar,btnNavigator,pgcPrincipal,True);
      ControlarIndiceTab(pgcPrincipal,0);
          if (EstadoDoCadastro =ecInserir) then
              showmessage('Inserir')
          else if (EstadoDoCadastro =ecAlterar) then
              showmessage('Alterar')
          else
              showmessage('n�o foi feliz');
           end;
      finally
      end;
      EstadoDoCadastro := ecNenhum;
end;

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    qryListagem.Close;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
     qryListagem.Connection     := dtmPrincipal.conexaoDB;
     dtsListagem.DataSet        := qryListagem;
     grdListagem.DataSource     := dtsListagem;
     grdListagem.Options        :=[dgTitles,dgIndicator,dgColumnResize,
     dgColLines,dgRowLines,dgTabs,
     dgRowSelect,dgAlwaysShowSelection,dgCancelOnExit,
     dgTitleClick,dgTitleHotTrack]
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
    if (qryListagem.SQL.Text <> emptystr) then
        begin
          qryListagem.IndexFieldNames := indiceAtual;
          ExibirLabelIndice(indiceAtual,lblIndice);
          qryListagem.Open;
        end;

       ControlarBotoes(btnNovo,btnAlterar,btnCancelar,BtnGravar,
                       btnApagar,btnNavigator,pgcPrincipal,true);

end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
     indiceAtual                := Column.FieldName;
     qryListagem.IndexFieldNames:= indiceAtual;
     ExibirLabelIndice(indiceAtual, lblIndice);

end;

procedure TfrmTelaHeranca.mskPesquisarChange(Sender: TObject);
begin
     qryListagem.Locate(indiceAtual, TMaskEdit(sender).Text, [loPartialKey]);

end;

end.
