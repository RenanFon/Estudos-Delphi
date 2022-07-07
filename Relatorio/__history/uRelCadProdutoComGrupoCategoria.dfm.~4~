object frmRelCadProdutoComGrupoCategoria: TfrmRelCadProdutoComGrupoCategoria
  Left = 0
  Top = 0
  Caption = 'frmRelCadProdutoComGrupoCategoria'
  ClientHeight = 662
  ClientWidth = 1195
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object relatorio: TRLReport
    Left = 104
    Top = -8
    Width = 794
    Height = 1123
    DataSource = dtsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object Cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 123
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 342
        Top = 125
        Width = 224
        Height = 22
        Caption = 'Listagem de Categorias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 3
        Top = 48
        Width = 353
        Height = 22
        Caption = 'Listagem de Produtos Por Categorias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 75
        Width = 718
        Height = 48
        Align = faBottom
        DrawKind = dkLine
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 478
      Width = 718
      Height = 80
      BandType = btFooter
      object RLDraw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 48
        Align = faTop
        DrawKind = dkLine
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 3
        Top = 48
        Width = 65
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = itFullDate
        ParentFont = False
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 640
        Top = 46
        Width = 20
        Height = 16
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 690
        Top = 46
        Width = 25
        Height = 16
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 666
        Top = 46
        Width = 18
        Height = 18
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 590
        Top = 46
        Width = 49
        Height = 16
        Caption = 'Pagina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 403
      Width = 718
      Height = 75
      object RLDBText1: TRLDBText
        Left = 72
        Top = 6
        Width = 67
        Height = 16
        DataField = 'categoriaId'
        DataSource = dtsProdutos
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 153
        Top = 3
        Width = 117
        Height = 16
        DataField = 'DescricaoCategoria'
        DataSource = dtsProdutos
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 476
        Top = 3
        Width = 60
        Height = 16
        DataField = 'descricao'
        DataSource = dtsProdutos
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 644
        Top = 6
        Width = 30
        Height = 16
        DataField = 'valor'
        DataSource = dtsProdutos
        Text = ''
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 161
      Width = 718
      Height = 64
      BandType = btColumnHeader
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 225
      Width = 718
      Height = 178
      object RLBand4: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 49
        BandType = btHeader
      end
    end
  end
  object qryProduto: TZQuery
    Connection = dtmPrincipal.conexaoDB
    Active = True
    SQL.Strings = (
      'SELECT produtos.produtoId,'
      #9#9'produtos.nome,'
      #9#9'produtos.descricao,'
      #9#9'produtos.valor,'
      #9#9'produtos.quantidade,'
      #9#9'produtos.categoriaId,'
      
        #9#9'categorias.descricao AS DescricaoCategoria FROM produtos LEFT ' +
        'JOIN categorias ON categorias.categoriaID = produtos.categoriaId'
      #9#9'ORDER BY produtos.categoriaId, produtos.produtoId;')
    Params = <>
    Left = 456
    Top = 40
    object qryProdutoprodutoId: TIntegerField
      FieldName = 'produtoId'
      Required = True
    end
    object qryProdutonome: TWideStringField
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object qryProdutodescricao: TWideStringField
      FieldName = 'descricao'
      Required = True
      Size = 255
    end
    object qryProdutovalor: TFloatField
      FieldName = 'valor'
      Required = True
    end
    object qryProdutoquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object qryProdutocategoriaId: TIntegerField
      FieldName = 'categoriaId'
      Required = True
    end
    object qryProdutoDescricaoCategoria: TWideStringField
      FieldName = 'DescricaoCategoria'
      Size = 30
    end
  end
  object dtsProdutos: TDataSource
    DataSet = qryProduto
    Left = 512
    Top = 40
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.0.1 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 568
    Top = 40
  end
end
