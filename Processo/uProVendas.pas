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
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    Produto: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProVendas: TfrmProVendas;

implementation

{$R *.dfm}


end.
