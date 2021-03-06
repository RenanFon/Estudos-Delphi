unit uRelCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,udtmConexao,
  ZAbstractDataset, ZDataset, RLReport, RLFilters, RLPDFFilter;

type
  TfrmRelCliente = class(TForm)
    qryCliente: TZQuery;
    dtsCliente: TDataSource;
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
    qryClienteclienteId: TIntegerField;
    qryClientenome: TWideStringField;
    qryClienteemail: TWideStringField;
    qryClientetelefone: TWideStringField;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCliente: TfrmRelCliente;

implementation

{$R *.dfm}


procedure TfrmRelCliente.FormCreate(Sender: TObject);
    begin
        qryCliente.Open;
    end;

procedure TfrmRelCliente.FormDestroy(Sender: TObject);
    begin
         qryCliente.Close;
    end;

end.
