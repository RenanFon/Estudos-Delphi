object dtmVenda: TdtmVenda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 536
  Width = 891
  object qryCliente: TZQuery
    Connection = dtmPrincipal.conexaoDB
    SQL.Strings = (
      '  SELECT clienteId,nome FROM clientes ;')
    Params = <>
    Left = 200
    Top = 48
    object qryClienteclienteId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      Required = True
    end
    object qryClientenome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 60
    end
  end
  object qryProdutos: TZQuery
    Connection = dtmPrincipal.conexaoDB
    SQL.Strings = (
      ' SELECT produtoId, nome,valor, quantidade FROM produtos;')
    Params = <>
    Left = 272
    Top = 56
    object qryProdutosprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
      Required = True
    end
    object qryProdutosnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object qryProdutosvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Required = True
    end
    object qryProdutosquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
      Required = True
    end
  end
  object cdsItensvenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 24
    object cdsItensvendaprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
    end
    object cdsItensvendaNomeProduto: TStringField
      DisplayLabel = 'Nome Do Produto'
      FieldName = 'NomeProduto'
      Size = 60
    end
    object cdsItensvendaQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object cdsItensvendaValorUnitario: TFloatField
      DisplayLabel = 'Valor Unitario'
      FieldName = 'ValorUnitario'
    end
    object cdsItensvendaValorTotalProduto: TFloatField
      DisplayLabel = 'Total Do Produto'
      FieldName = 'ValorTotalProduto'
    end
  end
  object dtsCliente: TDataSource
    DataSet = qryCliente
    Left = 424
    Top = 184
  end
  object dtsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 520
    Top = 184
  end
  object dtsItensVenda: TDataSource
    DataSet = cdsItensvenda
    Left = 608
    Top = 184
  end
end
