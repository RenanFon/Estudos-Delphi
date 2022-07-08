unit cAquivoIni;

interface

uses System.Classes,
     Vcl.Controls,
     vcl.ExtCtrls,
     vcl.Dialogs,
     System.SysUtils,
     System.IniFiles,
     vcl.Forms;

     type
          TArquivoIni = class
          private

          public
    class function ArquivoIni:string; static;
    class function LerIni(aSecao:String; aEntrada:String):String; static;
    class procedure AtualizarIni(aSecao, aEntrada, aValor: String); static;
    end;

implementation

{ TArquivoIni }

class function TArquivoIni.ArquivoIni: string;
    begin
         result := ChangeFileExt( Application.ExeName, '.INI' );
    end;

class procedure TArquivoIni.AtualizarIni(aSecao, aEntrada, aValor: String);
var
  Ini: TIniFile;
begin
  try
    Ini := TIniFile.Create(ArquivoIni);
    Ini.WriteString( aSecao, aEntrada, aValor);
  finally
    Ini.Free;
  end;
end;

class function TArquivoIni.LerIni(aSecao, aEntrada: String): String;
    var
  Ini: TIniFile;
    begin
      try
        Ini := TIniFile.Create(ArquivoIni);
        Result := Ini.ReadString( aSecao, aEntrada, 'NAO ENCONTRADO' );
      finally
        Ini.Free;
      end;
    end;

end.
