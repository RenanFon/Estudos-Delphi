unit uRelCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,udtmConexao,
  ZAbstractDataset, ZDataset, RLReport, RLFilters, RLPDFFilter,uPrincipal;

type
  TfrmRelCadProduto = class(TForm)
    qryProduto: TZQuery;
    dtsProdutos: TDataSource;
    relatorio: TRLReport;
    Cabecalho: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLDraw1: TRLDraw;
    RLPDFFilter1: TRLPDFFilter;
    RLBand1: TRLBand;
    RLDraw2: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand3: TRLBand;
    RLPanel1: TRLPanel;
    RLLabel5: TRLLabel;
    descricao: TRLLabel;
    qryProdutoprodutoId: TIntegerField;
    qryProdutonome: TWideStringField;
    qryProdutodescricao: TWideStringField;
    qryProdutovalor: TFloatField;
    qryProdutoquantidade: TFloatField;
    RLLabel6: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText4: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadProduto: TfrmRelCadProduto;

implementation

{$R *.dfm}


end.
