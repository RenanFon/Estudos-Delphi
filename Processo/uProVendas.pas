unit uProVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,udtmConexao, uDtmVenda,
  RxToolEdit, RxCurrEdit,cProVendas,uEnum;

type
  TfrmProVendas = class(TfrmTelaHeranca)
    qryListagemvendaId: TIntegerField;
    qryListagemclienteId: TIntegerField;
    qryListagemnome: TWideStringField;
    qryListagemdatavenda: TDateTimeField;
    qryListagemtotalVenda: TFloatField;
    edtVendasId: TLabeledEdit;
    lkpCliente: TDBLookupComboBox;
    Clinte: TLabel;
    edtDataVenda: TDateEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    edtValorTotal: TCurrencyEdit;
    Label2: TLabel;
    lkpProduto: TDBLookupComboBox;
    Produto: TLabel;
    edtUnitario: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    edtTotalProduto: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbGridItensVendas: TDBGrid;
    btnAdicionar: TBitBtn;
    btnRemover: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNovoClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure lkpProdutoExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
  private
    { Private declarations }
    dtmVenda :TdtmVenda;
    oVenda:Tvenda;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):boolean; override;
    function apagar:Boolean;override;
    function TotalizarProduto(valorUnitario, quantidade: Double): Double;
    procedure limparComponenteItem;

  public
    { Public declarations }
  end;

var
  frmProVendas: TfrmProVendas;

implementation

{$R *.dfm}

function TfrmProVendas.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
    begin
      Result:=False;
      if edtVendasId.Text<>EmptyStr then
         oVenda.VendaId:=StrToInt(edtVendasId.Text)
      else
         oVenda.VendaId:=0;

      oVenda.ClienteId        := lkpCliente.KeyValue;
      oVenda.DataVenda        :=edtDataVenda.Date;
      oVenda.TotalVenda       :=edtValorTotal.Value;

       if(EstadoDoCadastro = ecInserir) then
          Result := oVenda.Inserir
       else if(EstadoDoCadastro = ecAlterar) then
          Result := oVenda.Atualizar;
    end;

procedure TfrmProVendas.lkpProdutoExit(Sender: TObject);
begin
  inherited;
   edtUnitario.Value := dtmVenda.qryProdutos.FieldByName('valor').AsFloat;
end;

function TfrmProVendas.apagar: Boolean;
   begin
       Result := oVenda.Apagar(qryListagem.FieldByName('vendaId').AsInteger);

    end;

procedure TfrmProVendas.btnAdicionarClick(Sender: TObject);
begin
    Inherited;
     if lkpProduto.KeyValue = null then
         begin
           MessageDlg('Produto � um campo obrigat�rio ',TMsgDlgType.mtInformation,[mbOK],0);
           lkpProduto.SetFocus;
           abort;
         end;

     if edtUnitario.Value <= 0 then
        begin
            MessageDlg('Valor unitario n�o p�de ser zero',TMsgDlgType.mtInformation,[MBOK],0);
            edtUnitario.SetFocus;
            abort;
        end;

     if edtQuantidade.Value <= 0 then
         begin
             MessageDlg('Quantidade n�o pode ser zero',TMsgDlgType.mtInformation,[mbok],0);
             edtQuantidade.SetFocus;
             abort;
         end;

     if lkpCliente.KeyValue = null then
         begin
             MessageDlg('Informe o cliente',TMsgDlgType.mtInformation,[mbok],0);
             lkpCliente.SetFocus;
             abort;
         end;

      if dtmVenda.cdsItensvenda.Locate('produtoId',lkpProduto.KeyValue,[]) then
         begin
             MessageDlg('Este Produto ja foi selecionado',TMsgDlgType.mtInformation,[mbok],0);
             lkpProduto.SetFocus;
             abort;
         end;


       edtTotalProduto.Value := TotalizarProduto(edtUnitario.Value,edtQuantidade.Value);

        dtmVenda.cdsItensvenda.Append;
        dtmVenda.cdsItensvenda.FieldByName('produtoId').AsString:= lkpProduto.KeyValue;
        dtmVenda.cdsItensvenda.FieldByName('NomeProduto').AsString := dtmVenda.qryProdutos.FieldByName('nome').AsString;
        dtmVenda.cdsItensvenda.FieldByName('quantidade').AsFloat := edtQuantidade.Value;
        dtmVenda.cdsItensvenda.FieldByName('valorUnitario').AsFloat := edtUnitario.value;
        dtmVenda.cdsItensvenda.FieldByName('valorTotalProduto').AsFloat := edtTotalProduto.value;
        dtmVenda.cdsItensvenda.Post;

        limparComponenteItem;
        lkpProduto.SetFocus;

end;


procedure TfrmProVendas.limparComponenteItem;
    begin
      lkpProduto.KeyValue := null;
      edtQuantidade.Value  := 0;
      edtUnitario.Value   := 0;
      edtTotalProduto.value := 0;
    end;

function TfrmProVendas.TotalizarProduto(valorUnitario, quantidade:Double):Double;
    BEGIN
         result := valorUnitario * quantidade;
    END;


procedure TfrmProVendas.BtnAlterarClick(Sender: TObject);
begin
    if oVenda.Selecionar(qryListagem.FieldByName('vendaId').AsInteger) then Begin
        edtVendasId.Text    :=IntToStr(oVenda.VendaId);
        lkpCliente.KeyValue :=oVenda.ClienteId;
        edtDataVenda.Date   :=oVenda.DataVenda;
        edtValorTotal.Value :=ovenda.TotalVenda;
    End
    else
       begin
            btnCancelar.Click;
            abort;
       end;

     inherited;
end;

procedure TfrmProVendas.btnNovoClick(Sender: TObject);
    begin
      inherited;
      edtDataVenda.Date := date;
      lkpCliente.SetFocus;
    end;

procedure TfrmProVendas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
    begin
        inherited;
        BloqueiaCTRL_DBL_DBGrid(Key,Shift);
    end;

procedure TfrmProVendas.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value := TotalizarProduto(edtUnitario.Value,edtQuantidade.Value);
end;

procedure TfrmProVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   if Assigned(dtmVenda) then
        FreeAndNil(dtmVenda);
   if Assigned(oVenda) then
        FreeAndNil(oVenda);
end;

procedure TfrmProVendas.FormCreate(Sender: TObject);
    begin
      inherited;
      dtmVenda := TdtmVenda.Create(self);
      oVenda := Tvenda.Create(dtmPrincipal.conexaoDB);

      indiceAtual := 'nome';
    end;

end.
