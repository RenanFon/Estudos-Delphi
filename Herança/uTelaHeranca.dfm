object frmTelaHeranca: TfrmTelaHeranca
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Informe Aqui o Titulo'
  ClientHeight = 619
  ClientWidth = 1012
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 1012
    Height = 544
    ActivePage = TabListagem
    Align = alClient
    TabOrder = 0
    object TabListagem: TTabSheet
      Caption = 'Listagem'
      object pnlListagemTopo: TPanel
        Left = 0
        Top = 0
        Width = 1004
        Height = 81
        Align = alTop
        TabOrder = 0
        object mskPesquisar: TMaskEdit
          Left = 8
          Top = 17
          Width = 353
          Height = 21
          TabOrder = 0
          Text = ''
          TextHint = 'Digite Sua Pesquisa'
        end
        object btnPesquisar: TBitBtn
          Left = 384
          Top = 15
          Width = 75
          Height = 25
          Caption = '&Pesquisar'
          TabOrder = 1
        end
      end
      object grdListagem: TDBGrid
        Left = 0
        Top = 81
        Width = 1004
        Height = 435
        Align = alClient
        DataSource = dtsListagem
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
    end
  end
  object btnlRodape: TPanel
    Left = 0
    Top = 544
    Width = 1012
    Height = 75
    Align = alBottom
    TabOrder = 1
    object btnNovo: TBitBtn
      Left = 12
      Top = 20
      Width = 93
      Height = 33
      Caption = '&Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object BtnAlterar: TBitBtn
      Left = 123
      Top = 20
      Width = 94
      Height = 33
      Caption = '&Alterar'
      TabOrder = 1
      OnClick = BtnAlterarClick
    end
    object btnCancelar: TBitBtn
      Left = 235
      Top = 20
      Width = 94
      Height = 33
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnGravar: TBitBtn
      Left = 347
      Top = 20
      Width = 94
      Height = 33
      Caption = '&Gravar'
      TabOrder = 3
      OnClick = btnGravarClick
    end
    object btnApagar: TBitBtn
      Left = 459
      Top = 20
      Width = 94
      Height = 33
      Caption = 'Apaga&r'
      TabOrder = 4
      OnClick = btnApagarClick
    end
    object btnFechar: TBitBtn
      Left = 883
      Top = 20
      Width = 94
      Height = 33
      Caption = '&Fechar'
      TabOrder = 5
      OnClick = btnFecharClick
    end
    object btnNavigator: TDBNavigator
      Left = 575
      Top = 20
      Width = 224
      Height = 33
      DataSource = dtsListagem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 6
    end
  end
  object qryListagem: TZQuery
    Connection = dtmPrincipal.conexaoDB
    Params = <>
    Left = 740
    Top = 32
  end
  object dtsListagem: TDataSource
    DataSet = qryListagem
    Left = 836
    Top = 32
  end
end
