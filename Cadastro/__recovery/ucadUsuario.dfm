inherited frmCadUsuario: TfrmCadUsuario
  Caption = 'Cadastro de Usuario'
  ClientHeight = 503
  ExplicitHeight = 532
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Height = 428
    ActivePage = TabManutencao
    ExplicitHeight = 428
    inherited TabListagem: TTabSheet
      ExplicitHeight = 400
      inherited grdListagem: TDBGrid
        Height = 319
        Columns = <
          item
            Expanded = False
            FieldName = 'usuarioId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end>
      end
    end
    inherited TabManutencao: TTabSheet
      ExplicitHeight = 400
      object edtUsuarioId: TLabeledEdit
        Tag = 1
        Left = 8
        Top = 56
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
        Left = 8
        Top = 120
        Width = 473
        Height = 21
        EditLabel.Width = 52
        EditLabel.Height = 13
        EditLabel.Caption = 'edtUsuario'
        MaxLength = 50
        TabOrder = 1
      end
      object edtSenha: TLabeledEdit
        Tag = 2
        Left = 8
        Top = 184
        Width = 322
        Height = 21
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = 'Senha'
        MaxLength = 40
        PasswordChar = '*'
        TabOrder = 2
      end
      object cbMostar: TCheckBox
        Left = 8
        Top = 232
        Width = 97
        Height = 17
        Caption = 'Mostrar Senha'
        TabOrder = 3
        OnClick = cbMostarClick
      end
    end
  end
  inherited btnlRodape: TPanel
    Top = 428
    ExplicitTop = 428
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      #9'SELECT usuarioId, nome,senha FROM usuarios;')
    object qryListagemusuarioId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'usuarioId'
      Required = True
    end
    object qryListagemnome: TWideStringField
      DisplayLabel = 'Usuario'
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object qryListagemsenha: TWideStringField
      DisplayLabel = 'Senha'
      FieldName = 'senha'
      Required = True
      Size = 40
    end
  end
end
