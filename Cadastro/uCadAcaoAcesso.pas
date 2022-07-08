unit uCadAcaoAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, cAcaoAcesso, uEnum,udtmConexao;

type
  TfrmCadAcaoAcesso = class(TfrmTelaHeranca)
    qryListagemacaoAcessoId: TIntegerField;
    qryListagemdescricao: TWideStringField;
    qryListagemchave: TWideStringField;
    edtDescricao: TLabeledEdit;
    edtAcaoAcessoId: TLabeledEdit;
    edtChave: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    oAcaoAcesso:TAcaoAcesso;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):boolean; override;
    function Apagar:Boolean; override;
  end;

var
  frmCadAcaoAcesso: TfrmCadAcaoAcesso;

implementation

{$R *.dfm}

function TfrmCadAcaoAcesso.Apagar: Boolean;
begin
  if oAcaoAcesso.Selecionar(QryListagem.FieldByName('acaoAcessoId').AsInteger) then begin
     Result:=oAcaoAcesso.Apagar;
  end;
end;

procedure TfrmCadAcaoAcesso.BtnAlterarClick(Sender: TObject);
begin
  if oAcaoAcesso.Selecionar(QryListagem.FieldByName('acaoAcessoId').AsInteger) then begin
     edtacaoAcessoId.Text:=IntToStr(oAcaoAcesso.codigo);
     edtDescricao.Text   :=oAcaoAcesso.descricao;
     edtChave.Text       :=oAcaoAcesso.chave;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;

end;


procedure TfrmCadAcaoAcesso.btnGravarClick(Sender: TObject);
begin
  if edtacaoAcessoId.Text<>EmptyStr then
     oAcaoAcesso.codigo:=StrToInt(edtacaoAcessoId.Text)
  else
     oAcaoAcesso.codigo:=0;

  if oAcaoAcesso.ChaveExiste(edtChave.Text, oAcaoAcesso.codigo) then begin
    MessageDlg('Chave já cadastrado', mtInformation, [mbok],0);
    edtChave.SetFocus;
    abort;
  end;

  oAcaoAcesso.descricao :=edtDescricao.Text;
  oAcaoAcesso.chave     :=edtChave.Text;

  inherited;

end;

procedure TfrmCadAcaoAcesso.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadAcaoAcesso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if assigned (oAcaoAcesso) then
    FreeAndNil(oAcaoAcesso);
end;

procedure TfrmCadAcaoAcesso.FormCreate(Sender: TObject);
begin
  inherited;
  oAcaoAcesso := TAcaoAcesso.Create(dtmPrincipal.conexaoDB);
  indiceAtual := 'descricao';
end;

function TfrmCadAcaoAcesso.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
  if EstadoDoCadastro=ecInserir then
     Result:= oAcaoAcesso.Inserir
  else if EstadoDoCadastro=ecAlterar then
     Result:= oAcaoAcesso.Atualizar;
end;

end.
