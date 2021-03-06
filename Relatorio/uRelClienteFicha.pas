unit uRelClienteFicha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,udtmConexao,
  ZAbstractDataset, ZDataset, RLReport, RLFilters, RLPDFFilter,
  Vcl.Imaging.pngimage;

type
  TfrmRelClienteFicha = class(TForm)
    qryClienteFicha: TZQuery;
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
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    qryClienteFichaclienteId: TIntegerField;
    qryClienteFichanome: TWideStringField;
    qryClienteFichaendereco: TWideStringField;
    qryClienteFichacidade: TWideStringField;
    qryClienteFichabairro: TWideStringField;
    qryClienteFichaestado: TWideStringField;
    qryClienteFichacep: TWideStringField;
    qryClienteFichatelefone: TWideStringField;
    qryClienteFichaemail: TWideStringField;
    qryClienteFichadataNascimento: TDateTimeField;
    RLLabel5: TRLLabel;
    descricao: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel10: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText8: TRLDBText;
    RLLabel12: TRLLabel;
    RLDBText9: TRLDBText;
    RLLabel7: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel13: TRLLabel;
    RLDBText10: TRLDBText;
    RLImage1: TRLImage;
    RLDraw3: TRLDraw;
    RLAngleLabel1: TRLAngleLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelClienteFicha: TfrmRelClienteFicha;

implementation

{$R *.dfm}


procedure TfrmRelClienteFicha.FormCreate(Sender: TObject);
    begin
        qryClienteFicha.Open;
    end;

procedure TfrmRelClienteFicha.FormDestroy(Sender: TObject);
    begin
         qryClienteFicha.Close;
    end;

end.
