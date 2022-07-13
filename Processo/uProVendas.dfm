inherited frmProVendas: TfrmProVendas
  Caption = 'Vendas'
  ClientWidth = 1034
  ExplicitWidth = 1040
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 1034
    ActivePage = TabManutencao
    ExplicitLeft = -8
    ExplicitTop = -6
    ExplicitWidth = 1040
    ExplicitHeight = 573
    inherited TabListagem: TTabSheet
      ExplicitWidth = 1026
      inherited pnlListagemTopo: TPanel
        Width = 1026
        ExplicitWidth = 1032
      end
      inherited grdListagem: TDBGrid
        Width = 1026
        Columns = <
          item
            Expanded = False
            FieldName = 'vendaId'
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'clienteId'
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 287
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'datavenda'
            Width = 184
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'totalVenda'
            Width = 349
            Visible = True
          end>
      end
    end
    inherited TabManutencao: TTabSheet
      ExplicitWidth = 1026
      object Clinte: TLabel
        Left = 193
        Top = 36
        Width = 33
        Height = 13
        Caption = 'Cliente'
      end
      object Label1: TLabel
        Left = 792
        Top = 36
        Width = 56
        Height = 13
        Caption = 'Data Venda'
      end
      object edtVendasId: TLabeledEdit
        Tag = 1
        Left = 36
        Top = 53
        Width = 121
        Height = 21
        EditLabel.Width = 70
        EditLabel.Height = 13
        EditLabel.Caption = 'Numero Venda'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object lkpCliente: TDBLookupComboBox
        Tag = 1
        Left = 193
        Top = 53
        Width = 505
        Height = 21
        KeyField = 'clienteId'
        ListField = 'nome'
        ListSource = dtmVenda.dtsCliente
        TabOrder = 1
      end
      object edtDataVenda: TDateEdit
        Left = 792
        Top = 53
        Width = 121
        Height = 21
        ClickKey = 114
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        TabOrder = 2
      end
      object Panel1: TPanel
        Left = 0
        Top = 88
        Width = 1026
        Height = 428
        Align = alBottom
        TabOrder = 3
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 1024
          Height = 65
          Align = alTop
          TabOrder = 0
          object Produto: TLabel
            Left = 35
            Top = 8
            Width = 38
            Height = 13
            Caption = 'Produto'
          end
          object Label3: TLabel
            Left = 384
            Top = 8
            Width = 64
            Height = 13
            Caption = 'Valor Unitario'
          end
          object Label4: TLabel
            Left = 492
            Top = 8
            Width = 56
            Height = 13
            Caption = 'Quantidade'
          end
          object Label5: TLabel
            Left = 601
            Top = 8
            Width = 80
            Height = 13
            Caption = 'Total do Produto'
          end
          object edtUnitario: TCurrencyEdit
            Left = 384
            Top = 27
            Width = 81
            Height = 21
            DisplayFormat = ',0.00;- ,0.00'
            TabOrder = 0
          end
          object edtQuantidade: TCurrencyEdit
            Left = 492
            Top = 27
            Width = 77
            Height = 21
            DisplayFormat = ',0.00;- ,0.00'
            TabOrder = 1
            OnExit = edtQuantidadeExit
          end
          object edtTotalProduto: TCurrencyEdit
            Left = 601
            Top = 27
            Width = 80
            Height = 21
            TabStop = False
            DisplayFormat = ',0.00;- ,0.00'
            ReadOnly = True
            TabOrder = 2
          end
          object btnAdicionar: TBitBtn
            Left = 791
            Top = 16
            Width = 94
            Height = 33
            Caption = 'Adicionar'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6
              A4C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFCFBFEFCFBFEFCFBFEFCFBFE
              FCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBC2A6A4FF00FFFF00FFFF00FFFF00FF
              C2A6A4FEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFC
              FBC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFAF5FEFCFBFEFAF5FEFAF5FE
              FCFBFEFAF5FEFAF5FEFCFBFEFAF5FEFAF5C2A6A4FF00FFFF00FFFF00FFFF00FF
              C2A6A4FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFA
              F5C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF7F0FEF7F0FEF7F0FEF7F0FE
              F7F0FEF7F0FEF7F0FEF7F0FEF7F0FEF7F0C2A6A4FF00FFFF00FFFF00FFFF00FF
              C2A6A4FEF7F0FEF7F0FEF7F0FEF7F0FEF3E9FEF7F0FEF7F0FEF3E9FEF7F0FEF7
              F0C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF3E9FEF3E9FEF3E9FEF3E9FE
              F3E9FEF3E9FEF3E9FEF3E9FEF3E9FEF3E9C2A6A4FF00FFFF00FFFF00FFFF00FF
              C2A6A4FFF0E2FFF0E2FEF3E9FFEEDEFEF3E9FFEEDEFEF3E9FFEEDEFEF3E9FFEE
              DEC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF3E9FFEEDEFFF0E2FEF3E9FF
              EEDEFFF0E2DDCFC2DDCFC2DDCFC2DDCFC2C2A6A4FF00FFFF00FFFF00FFFF00FF
              C2A6A4FFEEDEFFEEDEFFEEDEFFEEDEFFEEDEFFEEDEC3B4A8C3B4A8C3B4A8C3B4
              A8C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FFEEDEFFEAD7FFEEDEFFEAD7FF
              EAD7FFEEDEB0A296B0A296B0A296B0A296C2A6A4FF00FFFF00FFFF00FFFF00FF
              C2A6A4FFEAD7FFEAD7FFEAD7FFEAD7FFEAD7C9B9ACFEFAF5FEF7F0E6DAD9C2A6
              A4FF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4FFEAD7FFE6D0FFEAD7FFE6D0FF
              EAD7C5B5A9FEFAF5DDCFC2C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              C2A6A4FFE6D0FFE6D0FFE6D0FFE6D0FFE6D0C9B9ACDDCFC2C2A6A4FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2
              A6A4C2A6A4C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            TabOrder = 3
            OnClick = btnAdicionarClick
          end
          object btnRemover: TBitBtn
            Left = 900
            Top = 16
            Width = 94
            Height = 33
            Caption = 'Remover'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFA4A4A4858585898989A1A1A1C6C6C6E0E0E0F5F5F5E2E2E2C2C2C2FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A1848484898989A3A3A3C7
              C7C7E0E0E0F5F5F5E2E2E2C2C2C2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              EBEBEBF2F2F2FEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFF8F8F8E6E6
              E6FF00FFFF00FFFF00FFFF00FFFF00FFE2E2E2F8F8F8FCFCFCFDFDFDFDFDFDFD
              FDFDFEFEFEFEFEFEFEFEFEFFFFFFE0E0E0FF00FFFF00FFFF00FFFF00FFFF00FF
              D9D9D9FCFCFCFCFCFCFCFCFCFCFCFCFDFDFDEAEAEAFEFEFEFEFEFEFEFEFEDCDC
              DCFF00FFFF00FFFF00FFFF00FFFF00FFDFDFDFFBFBFBE0E0E0A9A9A9A3A3A3E4
              E4E4A5A5A5A3A3A3CECECEFEFEFEE1E1E1FF00FFFF00FFFF00FFFF00FFFF00FF
              E6E6E6F3F3F3B0B0B0B7B7B7BBBBBBE9E9E9A9A9A9AEAEAEA3A3A3EAEAEAE9E9
              E9FF00FFFF00FFFF00FFFF00FFECECECEDEDEDF3F3F3B7B7B7B7B7B7EFEFEFFC
              FCFCF2F2F2AEAEAEA3A3A3EEEEEEF3F3F3E9E9E9FF00FFFF00FFFF00FFE5E5E5
              F0F0F0F6F6F6D2D2D2BDBDBDFAFAFAFAFAFAF6F6F6D2D2D2DDDDDDFCFCFCF7F7
              F7DFDFDFFF00FFFF00FFFF00FFDBDBDBFAFAFAF8F8F8F8F8F8EBEBEBCFCFCFE1
              E1E1A7A7A7B4B4B4FAFAFAFAFAFAFBFBFBD7D7D7FF00FFFF00FFFF00FFD6D6D6
              F7F7F7F7F7F7F7F7F7D5D5D5BEBEBEB4B4B4A7A7A7B9B9B9EFEFEFF9F9F9F9F9
              F9D9D9D9FF00FFFF00FFFF00FFDADADAF5F5F5F5F5F5F5F5F5EDEDEDC3C3C3B4
              B4B4ACACACF2F2F2F6F6F6F7F7F7F8F8F8DFDFDFFF00FFFF00FFFF00FFDFDFDF
              F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F4F4F4F4F4F4F5F5F5F5F5
              F5E2E2E2FF00FFFF00FFFF00FFDFDFDFDDDDDDD5D5D5D5D5D5D8D8D8DDDDDDE6
              E6E6ECECECECECECEBEBEBEAEAEAE9E9E9DFDFDFFF00FFFF00FFDBDBDBBEBEBE
              969696848484858585898989989898BEBEBED6D6D6D8D8D8D0D0D0C8C8C8C1C1
              C1BBBBBBB8B8B8FF00FFDBDBDBBEBEBE969696848484858585898989989898BE
              BEBED6D6D6D8D8D8D0D0D0C8C8C8C1C1C1BBBBBBB8B8B8FF00FF}
            TabOrder = 4
            OnClick = btnRemoverClick
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 66
          Width = 1024
          Height = 310
          Align = alClient
          TabOrder = 1
          object dbGridItensVendas: TDBGrid
            Left = 1
            Top = 1
            Width = 1022
            Height = 308
            Align = alClient
            DataSource = dtmVenda.dtsItensVenda
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = dbGridItensVendasDblClick
            OnKeyDown = DBGrid1KeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'produtoId'
                Width = 102
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeProduto'
                Width = 359
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Quantidade'
                Width = 132
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ValorUnitario'
                Width = 165
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ValorTotalProduto'
                Width = 304
                Visible = True
              end>
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 376
          Width = 1024
          Height = 51
          Align = alBottom
          TabOrder = 2
          object Label2: TLabel
            Left = 779
            Top = 19
            Width = 90
            Height = 13
            Caption = 'Valor da Venda :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtValorTotal: TCurrencyEdit
            Left = 883
            Top = 14
            Width = 86
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object lkpProduto: TDBLookupComboBox
        Left = 36
        Top = 116
        Width = 309
        Height = 21
        KeyField = 'produtoId'
        ListField = 'nome'
        ListSource = dtmVenda.dtsProdutos
        TabOrder = 4
        OnExit = lkpProdutoExit
      end
    end
  end
  inherited btnlRodape: TPanel
    Width = 1034
    ExplicitWidth = 1034
    inherited btnFechar: TBitBtn
      Left = 905
      ExplicitLeft = 905
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      
        'SELECT vendas.vendaId,vendas.clienteId,clientes.nome,vendas.data' +
        'venda,vendas.totalVenda'
      
        #9#9'FROM vendas INNER JOIN clientes ON clientes.clienteId = vendas' +
        '.clienteId;')
    Left = 476
    Top = 16
    object qryListagemvendaId: TIntegerField
      DisplayLabel = 'Numero Venda'
      FieldName = 'vendaId'
      Required = True
    end
    object qryListagemclienteId: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'clienteId'
      Required = True
    end
    object qryListagemnome: TWideStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object qryListagemdatavenda: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'datavenda'
    end
    object qryListagemtotalVenda: TFloatField
      DisplayLabel = 'Total da Venda'
      FieldName = 'totalVenda'
    end
  end
  inherited dtsListagem: TDataSource
    Left = 548
    Top = 16
  end
end
