object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 548
  ClientWidth = 1212
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mainPrincipal
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mainPrincipal: TMainMenu
    Left = 896
    Top = 8
    object Cadastro1: TMenuItem
      Caption = 'CADASTRO'
      object CLIENTE1: TMenuItem
        Caption = 'CLIENTE'
        OnClick = CLIENTE1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object CATEGORIA1: TMenuItem
        Caption = 'CATEGORIA'
        OnClick = CATEGORIA1Click
      end
      object PRODUTO1: TMenuItem
        Caption = 'PRODUTO'
        OnClick = PRODUTO1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object menuFECHAR: TMenuItem
        Caption = 'FECHAR'
        OnClick = menuFECHARClick
      end
    end
    object MOVIMENTAO1: TMenuItem
      Caption = 'MOVIMENTA'#199#194'O'
      object VENDAS1: TMenuItem
        Caption = 'VENDAS'
        OnClick = VENDAS1Click
      end
    end
    object RELATORIO1: TMenuItem
      Caption = 'RELATORIO'
      object CLIENTE2: TMenuItem
        Caption = 'CLIENTE'
        OnClick = CLIENTE2Click
      end
      object CLIENTE3: TMenuItem
        Caption = '-'
      end
      object PRODUTO2: TMenuItem
        Caption = 'PRODUTO'
        OnClick = PRODUTO2Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object VENDAPORDATA1: TMenuItem
        Caption = 'VENDA POR DATA'
      end
      object Categoria2: TMenuItem
        Caption = 'CATEGORIA'
        OnClick = Categoria2Click
      end
      object FICHADOCLIENTE1: TMenuItem
        Caption = 'FICHA DO CLIENTE'
        OnClick = FICHADOCLIENTE1Click
      end
    end
  end
end
