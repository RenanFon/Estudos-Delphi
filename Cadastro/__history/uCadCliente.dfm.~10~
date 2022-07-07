inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    ActivePage = TabManutencao
    inherited TabListagem: TTabSheet
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'clienteId'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 274
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cep'
            Width = 161
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'endereco'
            Width = 622
            Visible = True
          end>
      end
    end
    inherited TabManutencao: TTabSheet
      object Label1: TLabel
        Left = 571
        Top = 101
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Teefone: TLabel
        Left = 571
        Top = 208
        Width = 40
        Height = 13
        Caption = 'Teefone'
      end
      object Label2: TLabel
        Left = 24
        Top = 307
        Width = 95
        Height = 13
        Caption = 'Data de nascimento'
      end
      object edtClienteId: TLabeledEdit
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
      object edtCep: TMaskEdit
        Left = 571
        Top = 120
        Width = 102
        Height = 21
        EditMask = '99.999-999;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  .   -   '
      end
      object edtEndereço: TLabeledEdit
        Left = 24
        Top = 174
        Width = 473
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o'
        MaxLength = 60
        TabOrder = 3
      end
      object edtBairro: TLabeledEdit
        Left = 571
        Top = 174
        Width = 373
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'Bairro'
        MaxLength = 40
        TabOrder = 4
      end
      object edtCidade: TLabeledEdit
        Left = 24
        Top = 222
        Width = 473
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Cidade'
        MaxLength = 50
        TabOrder = 5
      end
      object edtTelefone: TMaskEdit
        Left = 571
        Top = 227
        Width = 102
        Height = 21
        EditMask = '(99) 99999-9999;1;_'
        MaxLength = 15
        TabOrder = 6
        Text = '(  )      -    '
      end
      object edtEmail: TLabeledEdit
        Left = 24
        Top = 270
        Width = 473
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'E-mail'
        MaxLength = 100
        TabOrder = 7
      end
      object edtDataNascimento: TDateEdit
        Left = 24
        Top = 326
        Width = 121
        Height = 21
        ClickKey = 114
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        TabOrder = 8
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
      ''
      'SELECT '
      #9#9'clienteId,'
      #9#9'nome,'
      #9#9'endereco,'
      #9#9'cidade,'
      #9#9'bairro,'
      #9#9'estado,'
      #9#9'cep,'
      #9#9'telefone,'
      #9#9'email,'
      #9#9'dataNascimento'
      #9'FROM clientes;')
    object qryListagemclienteId: TIntegerField
      FieldName = 'clienteId'
      Required = True
    end
    object qryListagemnome: TWideStringField
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object qryListagemendereco: TWideStringField
      FieldName = 'endereco'
      Required = True
      Size = 60
    end
    object qryListagemcidade: TWideStringField
      FieldName = 'cidade'
      Required = True
      Size = 50
    end
    object qryListagembairro: TWideStringField
      FieldName = 'bairro'
      Required = True
      Size = 40
    end
    object qryListagemestado: TWideStringField
      FieldName = 'estado'
      Required = True
      Size = 2
    end
    object qryListagemcep: TWideStringField
      FieldName = 'cep'
      Required = True
      Size = 10
    end
    object qryListagemtelefone: TWideStringField
      FieldName = 'telefone'
      Required = True
      Size = 14
    end
    object qryListagememail: TWideStringField
      FieldName = 'email'
      Required = True
      Size = 100
    end
    object qryListagemdataNascimento: TDateTimeField
      FieldName = 'dataNascimento'
      Required = True
    end
  end
end
