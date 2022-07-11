inherited frmCadAcaoAcesso: TfrmCadAcaoAcesso
  Caption = 'A'#231#227'o de acesso'
  ClientWidth = 946
  ExplicitWidth = 952
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 946
    ExplicitWidth = 863
    inherited TabListagem: TTabSheet
      ExplicitWidth = 938
      inherited pnlListagemTopo: TPanel
        Width = 938
        ExplicitWidth = 855
      end
      inherited grdListagem: TDBGrid
        Width = 938
        Columns = <
          item
            Expanded = False
            FieldName = 'acaoAcessoId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 404
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'chave'
            Visible = True
          end>
      end
    end
    inherited TabManutencao: TTabSheet
      ExplicitWidth = 938
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 24
        Top = 160
        Width = 771
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 100
        TabOrder = 0
      end
      object edtAcaoAcessoId: TLabeledEdit
        Tag = 1
        Left = 24
        Top = 96
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 1
      end
      object edtChave: TLabeledEdit
        Tag = 2
        Left = 24
        Top = 208
        Width = 771
        Height = 21
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = 'Chave'
        MaxLength = 60
        TabOrder = 2
      end
    end
  end
  inherited btnlRodape: TPanel
    Width = 946
    ExplicitWidth = 863
    inherited btnFechar: TBitBtn
      Left = 825
      ExplicitLeft = 825
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'SELECT acaoAcessoId, descricao,chave FROM acaoAcesso;'#9)
    object qryListagemacaoAcessoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'acaoAcessoId'
      Required = True
    end
    object qryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object qryListagemchave: TWideStringField
      DisplayLabel = 'Chave'
      FieldName = 'chave'
      Required = True
      Size = 60
    end
  end
end
