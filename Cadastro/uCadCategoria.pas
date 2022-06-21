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
    procedure BtnAlterarClick(Sender: TObject);
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
 {$region 'FUNCTIONS'}
function TfrmCadCategoria.Apagar: Boolean;
    begin
    if oCategoria.Seleciona(qryListagem.FieldByName('categoriaID').AsInteger) then
        BEGIN
            Result := oCategoria.Apagar;
        END;
    end;

function TfrmCadCategoria.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
    if edtCategoriaID.Text <> '' then
        oCategoria.codigo := strtoint(edtCategoriaID.Text)
     else
         oCategoria.codigo := 0;

    oCategoria.descricao:= edtDescricao.Text;

    if(EstadoDoCadastro = ecInserir ) then
        Result := oCategoria.Inserir
     else if(EstadoDoCadastro = ecAlterar) then
        Result := oCategoria.Atualizar

end;

{$endregion}

procedure TfrmCadCategoria.BtnAlterarClick(Sender: TObject);
begin
    if oCategoria.Seleciona(qryListagem.FieldByName('categoriaID').AsInteger) then
        BEGIN
            edtCategoriaID.Text := IntToStr(oCategoria.codigo);
            edtDescricao.Text   := oCategoria.descricao;
        END
     ELSE
        BEGIN
            btnCancelar.Click;
            abort;
        END;

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
