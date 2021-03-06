unit uDtmVenda;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Datasnap.DBClient;

type
  TdtmVenda = class(TDataModule)
    qryCliente: TZQuery;
    qryClienteclienteId: TIntegerField;
    qryClientenome: TWideStringField;
    qryProdutos: TZQuery;
    qryProdutosprodutoId: TIntegerField;
    qryProdutosnome: TWideStringField;
    qryProdutosvalor: TFloatField;
    qryProdutosquantidade: TFloatField;
    cdsItensvenda: TClientDataSet;
    dtsCliente: TDataSource;
    dtsProdutos: TDataSource;
    dtsItensVenda: TDataSource;
    cdsItensvendaprodutoId: TIntegerField;
    cdsItensvendaNomeProduto: TStringField;
    cdsItensvendaQuantidade: TFloatField;
    cdsItensvendaValorUnitario: TFloatField;
    cdsItensvendaValorTotalProduto: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmVenda: TdtmVenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udtmConexao;

{$R *.dfm}

procedure TdtmVenda.DataModuleCreate(Sender: TObject);
    begin
        cdsItensvenda.CreateDataSet;

        qryCliente.Open;
        qryProdutos.Open;

    end;

procedure TdtmVenda.DataModuleDestroy(Sender: TObject);
    begin
        cdsItensvenda.Close;
        qryCliente.Close;
        qryProdutos.Close;
    end;


end.
