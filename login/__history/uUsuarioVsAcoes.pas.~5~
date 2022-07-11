unit uUsuarioVsAcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmUsuarioVsAcoes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    qryAcoes: TZQuery;
    dtsAcoes: TDataSource;
    dtsUsuario: TDataSource;
    qryUsuario: TZQuery;
    qryUsuariousuarioId: TIntegerField;
    qryUsuarionome: TWideStringField;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    qryAcoesusuarioId: TIntegerField;
    qryAcoesAcaoACessoId: TIntegerField;
    qryAcoesdescricao: TWideStringField;
    qryAcoesativo: TByteField;
    btnFechar: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    procedure  SelecionarAcoesAcessoPorUsuario;
  public
    { Public declarations }
  end;

var
  frmUsuarioVsAcoes: TfrmUsuarioVsAcoes;

implementation

{$R *.dfm}

uses udtmConexao, uDtmVenda;

procedure TfrmUsuarioVsAcoes.btnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmUsuarioVsAcoes.SelecionarAcoesAcessoPorUsuario;
    begin
        QryAcoes.Close;
        QryAcoes.ParamByName('usuarioId').AsInteger := QryUsuario.FieldByName('usuarioID').AsInteger;
        QryAcoes.Open;
    end;
end.
