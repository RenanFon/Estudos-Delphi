unit uCadCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,cCadCategoria,udtmConexao,uEnum;

type
  TfrmCadCategoria = class(TfrmTelaHeranca)
    qryListagemcategoriaID: TIntegerField;
    qryListagemdescricao: TWideStringField;
    edtCategoriaID: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
    oCategoria:TCategoria;
    function Apagar:Boolean ; override;
    function Gravar(EstadoDoCadastro : TEstadoDoCadastro ):Boolean ; override;
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}
 {$region override}
function TfrmCadCategoria.Apagar: Boolean;
begin
    Result := oCategoria.Apagar;
end;

function TfrmCadCategoria.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
    if(EstadoDoCadastro = ecInserir ) then
        Result := oCategoria.Gravar
     else if(EstadoDoCadastro = ecAlterar) then
        Result := oCategoria.Atualizar

end;

{$endregion}

procedure TfrmCadCategoria.btnGravarClick(Sender: TObject);
begin

  inherited;

end;

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCategoria) then
    begin
        FreeAndNil(oCategoria);
    end;
end;

procedure TfrmCadCategoria.FormCreate(Sender: TObject);
begin
  inherited;
        oCategoria  := TCategoria.Create(dtmPrincipal.conexaoDB);
        indiceAtual := 'descricao';
end;

end.
