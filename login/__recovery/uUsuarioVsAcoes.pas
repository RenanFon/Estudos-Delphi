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
    grdUsuarios: TDBGrid;
    grdAcoes: TDBGrid;
    qryAcoesusuarioId: TIntegerField;
    qryAcoesAcaoACessoId: TIntegerField;
    qryAcoesdescricao: TWideStringField;
    qryAcoesativo: TByteField;
    btnFechar: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
   // procedure grdAcoesDblClick(Sender: TObject);
    //procedure grdAcoesDrawColumnCell(Sender: TObject; const Rect: TRect;
      //DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure  SelecionarAcoesAcessoPorUsuario;
    procedure QryUsuarioAfterScroll(DataSet: TDataSet);
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



{procedure TfrmUsuarioVsAcoes.grdAcoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    begin
        If not QryAcoes.FieldByName('ativo').AsBoolean  then
        begin
            TDBGrid(Sender).Canvas.Font.Color:= clWhite;
            TDBGrid(Sender).Canvas.Brush.Color:=clRed
        end;
        TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).Columns[datacol].Field, State);
    end;  }

procedure TfrmUsuarioVsAcoes.FormShow(Sender: TObject);
    begin
        Try
            QryUsuario.DisableControls;
            QryUsuario.Open;
            SelecionarAcoesAcessoPorUsuario;
        Finally
            QryUsuario.EnableControls;
        End;
    end;

procedure TfrmUsuarioVsAcoes.QryUsuarioAfterScroll(DataSet: TDataSet);
begin
  SelecionarAcoesAcessoPorUsuario;
end;

procedure TfrmUsuarioVsAcoes.SelecionarAcoesAcessoPorUsuario;
    begin
        QryAcoes.Close;
        QryAcoes.ParamByName('usuarioId').AsInteger := QryUsuario.FieldByName('usuarioID').AsInteger;
        QryAcoes.Open;
    end;
end.
