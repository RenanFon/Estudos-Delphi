unit uFuncaoCriptografia;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

function Criptografar(const Aentrada:string) : string;
function Descriptografar(const aEntrada: string): string;

implementation

 {$region 'Criptografar'}
    function Criptografar(const Aentrada:string) : string;
    var i, iQtdeEnt, iIntervalo: integer;
        sSaida : String;
        sProximoCaracter : String;
    begin
        iIntervalo:= 6;
        i         := 0;
        iQtdeEnt  := 0;

        if (aEntrada <> EmptyStr) then
            Begin
                iQtdeEnt     := Length(Aentrada);
                for I := iQtdeEnt downto 1 do //faz o loop inverso
                    begin
                        sProximoCaracter := Copy(aEntrada, i, 1);
                        sSaida           := sSaida + (char(ord(sProximoCaracter[1])+iIntervalo));
                    end;
            End;
         Result := sSaida;
    end;
 {$endregion}

 {$region 'Descriptografar'}
function Descriptografar(const aEntrada: string): string;
    var i, iQtdeEnt, iIntervalo: integer;
        sSaida : String;
        sProximoCaracter : String;
    begin
        iIntervalo:= 6;
        i         := 0;
        iQtdeEnt  := 0;

        if (aEntrada <> EmptyStr) then
            Begin
                iQtdeEnt     := Length(Aentrada);
                for I := iQtdeEnt downto 1 do
                    begin
                        sProximoCaracter := Copy(aEntrada, i, 1);
                        sSaida           := sSaida + (char(ord(sProximoCaracter[1])-iIntervalo));
                    end;
            End;
         Result := sSaida;
    end;
{$endregion}

end.
