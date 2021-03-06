inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    ActivePage = TabManutencao
    inherited TabListagem: TTabSheet
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'produtoId'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 232
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Width = 151
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Width = 137
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescricaoCategoria'
            Width = 411
            Visible = True
          end>
      end
    end
    inherited TabManutencao: TTabSheet
      object Label1: TLabel
        Left = 24
        Top = 173
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label2: TLabel
        Left = 32
        Top = 344
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Label3: TLabel
        Left = 184
        Top = 341
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object Label4: TLabel
        Left = 584
        Top = 101
        Width = 47
        Height = 13
        Caption = 'C'#233'tegoria'
      end
      object edtProdutoId: TLabeledEdit
        Tag = 1
        Left = 24
        Top = 72
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 24
        Top = 120
        Width = 473
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 60
        TabOrder = 1
      end
      object edtDescricao: TMemo
        Left = 24
        Top = 192
        Width = 473
        Height = 129
        MaxLength = 255
        TabOrder = 2
      end
      object edtValor: TCurrencyEdit
        Left = 24
        Top = 360
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object edtQuantidade: TCurrencyEdit
        Left = 184
        Top = 360
        Width = 121
        Height = 21
        DisplayFormat = ',0.00;- ,0.00'
        TabOrder = 5
      end
      object lkpCategoria: TDBLookupComboBox
        Left = 584
        Top = 120
        Width = 329
        Height = 21
        KeyField = 'categoriaId'
        ListField = 'descricao'
        ListSource = dtsCategoria
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
      'SELECT  p.produtoId,'
      '        p.nome,'
      '        p.descricao,'
      '        p.valor,'
      '        p.quantidade,'
      '        p.categoriaId,'
      '        c.descricao AS DescricaoCategoria'
      'FROM produtos AS p'
      'LEFT JOIN categorias AS c ON c.categoriaId = p.categoriaId')
    object qryListagemprodutoId: TIntegerField
      DisplayLabel = 'c'#243'digo'
      FieldName = 'produtoId'
      Required = True
    end
    object qryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object qryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 255
    end
    object qryListagemvalor: TFloatField
      DisplayLabel = 'V'#225'lor'
      FieldName = 'valor'
      Required = True
    end
    object qryListagemquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
      Required = True
    end
    object qryListagemcategoriaId: TIntegerField
      DisplayLabel = 'Cod. Categoria'
      FieldName = 'categoriaId'
      Required = True
    end
    object qryListagemDescricaoCategoria: TWideStringField
      DisplayLabel = 'Descri'#231#227'o da Categoria'
      FieldName = 'DescricaoCategoria'
      Size = 30
    end
  end
  object qryCategoria: TZQuery
    Connection = dtmPrincipal.conexaoDB
    SQL.Strings = (
      'SELECT categoriaId, descricao FROM categorias')
    Params = <>
    Left = 748
    Top = 272
    object qryCategoriacategoriaId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      Required = True
    end
    object qryCategoriadescricao: TWideStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dtsCategoria: TDataSource
    DataSet = qryCategoria
    Left = 844
    Top = 272
  end
end
