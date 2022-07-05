unit uRelCadProdutoComGrupoCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,udtmConexao,
  ZAbstractDataset, ZDataset, RLReport, RLFilters, RLPDFFilter,uPrincipal;

type
  TfrmRelCadProdutoComGrupoCategoria = class(TForm)
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
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    qryProdutoprodutoId: TIntegerField;
    qryProdutonome: TWideStringField;
    qryProdutodescricao: TWideStringField;
    qryProdutovalor: TFloatField;
    qryProdutoquantidade: TFloatField;
    qryProdutocategoriaId: TIntegerField;
    qryProdutoDescricaoCategoria: TWideStringField;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadProdutoComGrupoCategoria: TfrmRelCadProdutoComGrupoCategoria;

implementation

{$R *.dfm}


end.
