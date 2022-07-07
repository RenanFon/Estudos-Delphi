unit uSelecionarData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms,System.DateUtils, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  RxToolEdit;

type
  TfrmSelecionarData = class(TForm)
    edtDataInicio: TDateEdit;
    Label1: TLabel;
    edtDataFinal: TDateEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionarData: TfrmSelecionarData;

implementation

{$R *.dfm}

procedure TfrmSelecionarData.BitBtn1Click(Sender: TObject);
    begin
        if (edtDataFinal.Date) < (edtDataInicio.Date) then
            begin
                MessageDlg('Data Final n�o pode ser maior que a data inicio ',TMsgDlgType.mtInformation,[MBOK],0);
                edtDataFinal.setFOCUS;
                abort;
            end;
         if (edtDataFinal.Date=0) or (edtDataInicio.Date=0) then
            begin
                MessageDlg('Data inicial ou final s�o campos obrigatorios ',TMsgDlgType.mtInformation,[MBOK],0);
                edtDataFinal.setFOCUS;
                abort;
            end;
        Close;
    end;

procedure TfrmSelecionarData.FormShow(Sender: TObject);
    begin
        edtDataInicio.Date := startOfTheMonth(Date);
        edtDataFinal.Date  := EndOfTheMonth(Date);
    end;

end.
