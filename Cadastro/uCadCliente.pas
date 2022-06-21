unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit,cCadCliente,Uenum;

type
  TfrmCadCliente = class(TfrmTelaHeranca)
    edtClienteId: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtCep: TMaskEdit;
    Label1: TLabel;
    edtEndereço: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtTelefone: TMaskEdit;
    Teefone: TLabel;
    edtEmail: TLabeledEdit;
    edtDataNascimento: TDateEdit;
    Label2: TLabel;
    qryListagemclienteId: TIntegerField;
    qryListagemnome: TWideStringField;
    qryListagemendereco: TWideStringField;
    qryListagemcidade: TWideStringField;
    qryListagembairro: TWideStringField;
    qryListagemestado: TWideStringField;
    qryListagemcep: TWideStringField;
    qryListagemtelefone: TWideStringField;
    qryListagememail: TWideStringField;
    qryListagemdataNascimento: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    oCliente:TCliente;
    function Apagar:Boolean ; override;
    function Gravar(EstadoDoCadastro : TEstadoDoCadastro ):Boolean ; override;
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

uses udtmConexao;



{ TfrmCadCliente }

function TfrmCadCliente.Apagar: Boolean;
    begin
        if oCliente.Selecionar(qryListagem.FieldByName('clienteId').AsInteger)then
            begin
                Result := oCliente.Apagar;
            end;
    end;

procedure TfrmCadCliente.BtnAlterarClick(Sender: TObject);
begin
  inherited;
   if oCliente.Selecionar(qryListagem.FieldByName('clienteId').AsInteger)then
    begin
        edtClienteId.Text      := IntToStr(oCliente.codigo);
        edtNome.text           := oCliente.nome;
        edtCep.text            :=oCliente.cep;
        edtEndereço.text       :=oCliente.endereco;
        edtBairro.text         := oCliente.bairro;
        edtCidade.Text         := oCliente.cidade;
        edtTelefone.text       := oCliente.telefone;
        edtEmail.text          := oCliente.email;
        edtDataNascimento.Date :=oCliente.dataNascimeto;
    end;
end;

procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
   edtDataNascimento.Date := Date;
   edtNome.SetFocus;
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
        oCliente:= TCliente.Create(dtmPrincipal.conexaoDB);
        IndiceAtual := 'nome';
end;

function TfrmCadCliente.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
    begin
         if edtClienteId.Text<>EmptyStr then
            oCliente.codigo:= StrToInt(edtClienteId.Text)
         else
            oCliente.codigo:= 0;

         oCliente.nome := edtNome.Text;
         oCliente.cep := edtCep.Text;
         oCliente.endereco := edtEndereço.Text;
         oCliente.bairro := edtBairro.Text;
         oCliente.cidade := edtCidade.Text;
         oCliente.telefone := edtTelefone.Text;
         oCliente.email := edtEmail.Text;
         oCliente.dataNascimeto := edtDataNascimento.Date;

         if (EstadoDoCadastro = ecInserir) then
            Result:=oCliente.Inserir
         else if(EstadoDoCadastro = ecAlterar)then
            Result:= oCliente.Atualizar;
    end;
end.
