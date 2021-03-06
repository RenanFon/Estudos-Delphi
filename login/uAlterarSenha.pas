unit uAlterarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmAlterarSenha = class(TForm)
    Label1: TLabel;
    edtSenhaAtual: TEdit;
    Label2: TLabel;
    edtNovaSenha: TEdit;
    Label3: TLabel;
    edtSenhaNovamente: TEdit;
    btnFfechar: TBitBtn;
    btnAlterar: TBitBtn;
    lblUsuarioLogado: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    procedure LimparEdits;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlterarSenha: TfrmAlterarSenha;

implementation

uses
    cUsuario,uPrincipal,udtmConexao;

{$R *.dfm}

procedure TfrmAlterarSenha.btnAlterarClick(Sender: TObject);
Var oUsuario:TUsuario;
begin
  if (edtSenhaAtual.Text=oUsuarioLogado.senha) then begin
    if (edtNovaSenha.Text=edtSenhaNovamente.Text) then begin
      try
        oUsuario:=TUsuario.Create(DtmPrincipal.ConexaoDB);
        oUsuario.codigo := oUsuarioLogado.codigo;
        oUsuario.senha  := edtNovaSenha.Text;
        oUsuario.AlterarSenha;
        oUsuarioLogado.senha := edtNovaSenha.Text;
        MessageDlg('Senha Alterada',MtInformation,[mbok],0);
        LimparEdits;
        sleep(180);
        Close;
      finally
        FreeAndNil(oUsuario);
      end;
    end
    else begin
      MessageDlg('Senhas digitadas n?o coincidem,',mtinformation,[mbok],0);
      edtNovaSenha.SetFocus;
    end;

  end
  else begin
    MessageDlg('Senha Atual est? inv?lida',mtinformation,[mbok],0);
  end;
end;

procedure TfrmAlterarSenha.FormShow(Sender: TObject);
    begin
         lblUsuarioLogado.Caption := oUsuarioLogado.nome;
         LimparEdits;
    end;

procedure TfrmAlterarSenha.LimparEdits;
begin
  edtSenhaAtual.Clear;
  edtNovaSenha.Clear;
  edtSenhaNovamente.Clear;
  //lblUsuarioLogado.Caption:=oUsuarioLogado.nome;
end;

end.
