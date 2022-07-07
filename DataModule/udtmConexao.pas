unit udtmConexao;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TdtmPrincipal = class(TDataModule)
    conexaoDB: TZConnection;
    qryScriptCategoria: TZQuery;
    qryScriptClientes: TZQuery;
    qryScriptCategoriaProdutos: TZQuery;
    qryScriptVendas: TZQuery;
    qryScriptItensVendas: TZQuery;
    qryScriptUsuario: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
