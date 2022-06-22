unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit, RxCurrEdit, cCadProduto, uEnum;

type
  TfrmCadProduto = class(TfrmTelaHeranca)
    qryListagemprodutoId: TIntegerField;
    qryListagemnome: TWideStringField;
    qryListagemdescricao: TWideStringField;
    qryListagemvalor: TFloatField;
    qryListagemquantidade: TFloatField;
    qryListagemcategoriaId: TIntegerField;
    qryListagemDescricaoCategoria: TWideStringField;
    edtProdutoId: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtDescricao: TMemo;
    Label1: TLabel;
    edtValor: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    lkpCategoria: TDBLookupComboBox;
    qryCategoria: TZQuery;
    dtsCategoria: TDataSource;
    qryCategoriacategoriaId: TIntegerField;
    qryCategoriadescricao: TWideStringField;
    procedure BtnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    oProduto : Tproduto;
    function Apagar:Boolean;override;
    function Gravar(EstadoDoCadastro:TestadoDoCadastro):Boolean;override;
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

uses uPrincipal, udtmConexao;

{ TfrmCadProduto }

function TfrmCadProduto.Apagar: Boolean;
    begin
        if oProduto.Selecionar(qryListagem.FieldByName('produtoId').AsInteger) then
            begin
                Result := oProduto.Apagar;
            end;
    end;

procedure TfrmCadProduto.BtnAlterarClick(Sender: TObject);
begin
     if oProduto.Selecionar(qryListagem.FieldByName('produtoId').AsInteger) then
        begin
            edtProdutoId.Text              :=IntToStr(oProduto.codigo);
            edtNome.Text                   :=oProduto.nome;
            edtDescricao.Text              :=oProduto.descricao;
            lkpCategoria.KeyValue          :=oProduto.categoriaId;
            edtValor.Value                 :=oProduto.valor;
            edtQuantidade.Value            :=oProduto.quantidade;
        end
     else begin
        btnCancelar.Click;
        Abort;
     end;

  inherited;

end;

procedure TfrmCadProduto.btnNovoClick(Sender: TObject);
begin
  inherited;
   edtNome.SetFocus;
end;

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryCategoria.Close;
  if assigned(oProduto) then
    FreeAndNil(oProduto);
end;

procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
    oProduto:= Tproduto.Create(dtmPrincipal.conexaoDB);

    indiceAtual:='nome';
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;
  qryCategoria.Open;

end;

function TfrmCadProduto.Gravar(EstadoDoCadastro: TestadoDoCadastro): Boolean;
    begin
        if edtProdutoId.Text<>EmptyStr then
            oProduto.codigo := StrToInt(edtProdutoId.Text)
        else
            oProduto.codigo := 0;
        oProduto.nome            :=edtNome.Text;
        oProduto.descricao       :=edtDescricao.Text;
        oProduto.categoriaId     :=lkpCategoria.KeyValue;
        oProduto.valor           :=edtValor.Value;
        oProduto.quantidade      :=edtQuantidade.Value;

        if (EstadoDoCadastro=ecInserir) then
            Result := oProduto.Inserir
        else if (EstadoDoCadastro = ecAlterar) then
            Result := oProduto.Atualizar;
    end;

end.
