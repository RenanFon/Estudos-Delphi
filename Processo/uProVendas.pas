unit uProVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,udtmConexao, uDtmVenda,
  RxToolEdit, RxCurrEdit;

type
  TfrmProVendas = class(TfrmTelaHeranca)
    qryListagemvendaId: TIntegerField;
    qryListagemclienteId: TIntegerField;
    qryListagemnome: TWideStringField;
    qryListagemdatavenda: TDateTimeField;
    qryListagemtotalVenda: TFloatField;
    edtVendasId: TLabeledEdit;
    lkpCategoria: TDBLookupComboBox;
    Clinte: TLabel;
    edtDataVenda: TDateEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    edtValor: TCurrencyEdit;
    Label2: TLabel;
    lkpProduto: TDBLookupComboBox;
    Produto: TLabel;
    edtUnitario: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    edtTotalProduto: TCurrencyEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbGridItensVendas: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    dtmVenda :TdtmVenda;
  public
    { Public declarations }
  end;

var
  frmProVendas: TfrmProVendas;

implementation

{$R *.dfm}


procedure TfrmProVendas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
    begin
        inherited;
        BloqueiaCTRL_DBL_DBGrid(Key,Shift);
    end;

procedure TfrmProVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   if Assigned(dtmVenda) then
        FreeAndNil(dtmVenda);

end;

procedure TfrmProVendas.FormCreate(Sender: TObject);
begin
  inherited;
  dtmVenda := TdtmVenda.Create(self);


end;

end.
