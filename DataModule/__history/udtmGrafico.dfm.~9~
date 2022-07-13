object dtmGrafico: TdtmGrafico
  OldCreateOrder = False
  Height = 364
  Width = 766
  object qryProdutoEstoque: TZQuery
    Connection = dtmPrincipal.conexaoDB
    SQL.Strings = (
      'SELECT CONVERT(produtoId,CHAR), nome '
      'AS Label, quantidade AS Value FROM produtos;')
    Params = <>
    Left = 48
    Top = 17
    object qryProdutoEstoqueCONVERTprodutoIdCHAR: TWideStringField
      FieldName = 'CONVERT(produtoId,CHAR)'
      ReadOnly = True
      Size = 11
    end
    object qryProdutoEstoqueLabel: TWideStringField
      FieldName = 'Label'
      Required = True
      Size = 60
    end
    object qryProdutoEstoqueValue: TFloatField
      FieldName = 'Value'
      Required = True
    end
  end
  object dtsProdutoEstoque: TDataSource
    DataSet = qryVendaValorPorCliente
    Left = 112
    Top = 17
  end
  object qryVendaValorPorCliente: TZQuery
    Connection = dtmPrincipal.conexaoDB
    SQL.Strings = (
      
        'SELECT CONVERT(vendas.clienteId, CHAR),clientes.nome AS label, S' +
        'UM(vendas.totalVenda)AS VALUE'
      'FROM vendas'
      'INNER JOIN clientes ON clientes.clienteId = vendas.clienteId'
      
        'WHERE vendas.datavenda BETWEEN CONVERT(CURDATE()-7,DATE) AND CON' +
        'VERT(CURDATE(),DATE)'
      'GROUP BY vendas.clienteId, clientes.nome;')
    Params = <>
    Left = 216
    Top = 32
    object qryVendaValorPorClienteCONVERTvendasclienteIdCHAR: TWideStringField
      FieldName = 'CONVERT(vendas.clienteId, CHAR)'
      ReadOnly = True
      Size = 11
    end
    object qryVendaValorPorClientelabel: TWideStringField
      FieldName = 'label'
      Required = True
      Size = 60
    end
    object qryVendaValorPorClienteVALUE: TFloatField
      FieldName = 'VALUE'
      ReadOnly = True
    end
  end
  object qryProdutosMaisVendidos: TZQuery
    Connection = dtmPrincipal.conexaoDB
    SQL.Strings = (
      'SELECT CONVERT(vi.produtoId,CHAR),p.nome AS label,'
      'SUM(vi.totalProduto) AS VALUE'
      'FROM vendasitens AS vi'
      'INNER JOIN produtos AS p ON p.produtoId = vi.produtoId'
      'GROUP BY vi.produtoId, p.nome;')
    Params = <>
    Left = 96
    Top = 152
    object qryProdutosMaisVendidosCONVERTviprodutoIdCHAR: TWideStringField
      FieldName = 'CONVERT(vi.produtoId,CHAR)'
      ReadOnly = True
      Size = 11
    end
    object qryProdutosMaisVendidoslabel: TWideStringField
      FieldName = 'label'
      Required = True
      Size = 60
    end
    object qryProdutosMaisVendidosVALUE: TFloatField
      FieldName = 'VALUE'
      ReadOnly = True
    end
  end
  object qryVendasUltimasSemanas: TZQuery
    Connection = dtmPrincipal.conexaoDB
    SQL.Strings = (
      
        '  SELECT categorias.descricao AS Label , categorias.categoriaID ' +
        'AS VALUE FROM categorias;  '
      ''
      '')
    Params = <>
    Left = 376
    Top = 136
    object qryVendasUltimasSemanasLabel: TWideStringField
      FieldName = 'Label'
      Size = 30
    end
    object qryVendasUltimasSemanasVALUE: TIntegerField
      FieldName = 'VALUE'
      Required = True
    end
  end
end
