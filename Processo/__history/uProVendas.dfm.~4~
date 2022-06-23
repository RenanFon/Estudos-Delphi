inherited frmProVendas: TfrmProVendas
  Caption = 'Vendas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    ActivePage = TabManutencao
    inherited TabListagem: TTabSheet
      inherited grdListagem: TDBGrid
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
      object Clinte: TLabel
        Left = 193
        Top = 36
        Width = 27
        Height = 25
        Caption = 'Clinte'
      end
      object Label1: TLabel
        Left = 792
        Top = 36
        Width = 56
        Height = 19
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
      object lkpCategoria: TDBLookupComboBox
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
        Width = 987
        Height = 428
        Align = alBottom
        TabOrder = 3
        ExplicitTop = 106
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 985
          Height = 65
          Align = alTop
          TabOrder = 0
          ExplicitTop = 0
          object Produto: TLabel
            Left = 35
            Top = 8
            Width = 38
            Height = 13
            Caption = 'Produto'
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 66
          Width = 985
          Height = 310
          Align = alClient
          TabOrder = 1
          ExplicitTop = 65
          ExplicitHeight = 176
          object DBGrid1: TDBGrid
            Left = 1
            Top = 1
            Width = 983
            Height = 308
            Align = alClient
            DataSource = dtmVenda.dtsItensVenda
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
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
          Width = 985
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
          object edtValor: TCurrencyEdit
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
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 36
        Top = 116
        Width = 505
        Height = 21
        KeyField = 'produtoId'
        ListField = 'nome'
        ListSource = dtmVenda.dtsProdutos
        TabOrder = 4
      end
    end
  end
  inherited btnlRodape: TPanel
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
