unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,udtmConexao, Enter, uFrmAtualizaDb;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    RELATORIO1: TMenuItem;
    CLIENTE1: TMenuItem;
    N1: TMenuItem;
    CATEGORIA1: TMenuItem;
    PRODUTO1: TMenuItem;
    N2: TMenuItem;
    menuFECHAR: TMenuItem;
    VENDAS1: TMenuItem;
    CLIENTE2: TMenuItem;
    CLIENTE3: TMenuItem;
    PRODUTO2: TMenuItem;
    N3: TMenuItem;
    VENDAPORDATA1: TMenuItem;
    procedure menuFECHARClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CLIENTE1Click(Sender: TObject);
    procedure PRODUTO1Click(Sender: TObject);
  private
    { Private declarations }
    TeclaEnter : TMREnter;
    procedure AtualizacaoDoBanco(aForm: TFrmAtualizaDb);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategoria, uCadCliente,uCadProduto,cCadProduto;

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
begin
    frmCadCategoria:= TfrmCadCategoria.Create(self);
    frmCadCategoria.showModal;
    frmCadCategoria.Release;
end;

procedure TfrmPrincipal.CLIENTE1Click(Sender: TObject);
begin
    frmCadCliente := TfrmCadCliente.Create(self);
    frmCadCliente.ShowModal;
    frmCadCliente.Release;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     FreeandNil(TeclaEnter);
     FreeAndNil(dtmPrincipal);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
    begin
         frmAtualizaDB := TfrmAtualizaDB.Create(Self);
         frmAtualizaDB.Show;
         frmAtualizaDB.Refresh;

         dtmPrincipal := TdtmPrincipal.create(self);
         dtmPrincipal.conexaoDB.SQLHourGlass := true;
         dtmPrincipal.conexaoDB.Connected := true;
         TeclaEnter := TMREnter.Create(Self);
         TeclaEnter.FocusEnabled := True;
         TeclaEnter.FocusColor := clInfoBk;

         AtualizacaoDoBanco(frmAtualizaDB);
         frmAtualizaDB.free;
    end;

procedure TfrmPrincipal.menuFECHARClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmPrincipal.PRODUTO1Click(Sender: TObject);
    begin
        frmCadProduto:= TfrmCadProduto.Create(Self);
        frmCadProduto.ShowModal;
        frmCadProduto.Release;
    end;

procedure TfrmPrincipal.AtualizacaoDoBanco(aForm:TFrmAtualizaDb);
    BEGIN
        aForm.chkConexao.Checked := true;
        aForm.Refresh;

        dtmPrincipal.qryScriptCategoria.ExecSQL;
        aForm.chkCategoria.Checked := True;
        aForm.Refresh;
        Sleep(300);

        dtmPrincipal.qryScriptCategoriaProdutos.ExecSQL;
        aForm.chkProduto.Checked := True;
        aForm.Refresh;
        sleep(300);

        dtmPrincipal.qryScriptClientes.ExecSQL;
        aForm.chkCliente.Checked := True;
        aForm.Refresh;
        sleep(300);

        dtmPrincipal.qryScriptVendas.ExecSQL;
        aForm.chkVendas.Checked := True;
        aForm.Refresh;
        sleep(300);

        dtmPrincipal.qryScriptItensVendas.ExecSQL;
        aForm.chkItennsVendas.Checked := True;
        aForm.Refresh;
        sleep(300);
    END;

end.
