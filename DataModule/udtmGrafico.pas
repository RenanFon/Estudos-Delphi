unit udtmGrafico;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset,udtmConexao;

type
  TdtmGrafico = class(TDataModule)
    qryProdutoEstoque: TZQuery;
    qryProdutoEstoqueCONVERTprodutoIdCHAR: TWideStringField;
    qryProdutoEstoqueLabel: TWideStringField;
    qryProdutoEstoqueValue: TFloatField;
    dtsProdutoEstoque: TDataSource;
    qryVendaValorPorCliente: TZQuery;
    qryVendaValorPorClienteCONVERTvendasclienteIdCHAR: TWideStringField;
    qryVendaValorPorClientelabel: TWideStringField;
    qryVendaValorPorClienteVALUE: TFloatField;
    qryProdutosMaisVendidos: TZQuery;
    qryProdutosMaisVendidosCONVERTviprodutoIdCHAR: TWideStringField;
    qryProdutosMaisVendidoslabel: TWideStringField;
    qryProdutosMaisVendidosVALUE: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmGrafico: TdtmGrafico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
