object frmTelaHeranca: TfrmTelaHeranca
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Informe Aqui o Titulo'
  ClientHeight = 619
  ClientWidth = 995
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 995
    Height = 544
    ActivePage = TabListagem
    Align = alClient
    TabOrder = 0
    object TabListagem: TTabSheet
      Caption = 'Listagem'
      object pnlListagemTopo: TPanel
        Left = 0
        Top = 0
        Width = 987
        Height = 81
        Align = alTop
        TabOrder = 0
        object lblIndice: TLabel
          Left = 3
          Top = 14
          Width = 78
          Height = 13
          Caption = 'Campo Pesquisa'
        end
        object mskPesquisar: TMaskEdit
          Left = 1
          Top = 33
          Width = 353
          Height = 21
          TabOrder = 0
          Text = ''
          TextHint = 'Digite Sua Pesquisa'
          OnChange = mskPesquisarChange
        end
        object btnPesquisar: TBitBtn
          Left = 377
          Top = 31
          Width = 75
          Height = 25
          Caption = '&Pesquisar'
          TabOrder = 1
          Visible = False
        end
      end
      object grdListagem: TDBGrid
        Left = 0
        Top = 81
        Width = 987
        Height = 435
        Align = alClient
        DataSource = dtsListagem
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = grdListagemCellClick
        OnDblClick = grdListagemDblClick
        OnTitleClick = grdListagemTitleClick
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
    Width = 995
    Height = 75
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      995
      75)
    object btnNovo: TBitBtn
      Left = 12
      Top = 20
      Width = 93
      Height = 33
      Caption = '&Novo'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF828282
        828282828282818181818181818181818181818181408D4041A6413CB23C4AA5
        4A009900FF00FFFF00FFFF00FF8F8F8FFDFDFDADBBD7F9F9F9F9F9F9F9F9F9F9
        F9F936AE3649BB4965BB655FBF5FA8E8A882D5820D9F0DFF00FFFF00FF999999
        959596ADBBD7E2C1A3E2C1A3E2C1A371AD5125A9258AC38AC6C6C6C8D1C846BA
        4665C96547B847009900FF00FFA2A2A2FAFAFAADBBD7EBEBEBEBEBEBEBEBEB2A
        A82A77C477CCCCCCAAD1AACECECE9ACA9A31AE312CA72C069906FF00FFAAAAAA
        E2C1A3ADBBD7E2C1A3E2C1A3E2C1A30B9F0B6FC36F89CC8915A2158ACD8AF6F6
        F655BB553BAF3B19A219FF00FFAFAFAFFBFBFBADBBD7F0F0F0F0F0F0F0F0F053
        BA5374CC7447BB4744BE442EB12EDEF2DEEEF8EE49B8492FAD2FFF00FFB5B5B5
        E2C1A3ADBBD7E2C1A3E2C1A3E2C1A371AD5189D28986D18675CC7570CA705EBF
        5EFEFEFE9FD89F2FAD2FFF00FFB8B8B8959596ADBBD7F4F4F4F5F5F5F5F5F5E5
        EEE53CB03CA2DAA2AFDEAFA6DAA683CC836FC66F41B341FF00FFFF00FFBBBBBB
        E2C1A3ADBBD7E2C1A3E2C1A3E2C1A3E2C1A3D4BE9971AD5155B24936AF3655B2
        492FAD2FFF00FFFF00FFFF00FFBDBDBDFDFDFDADBBD7F8F8F8F8F8F8F8F8F8F8
        F8F8F7F7F7F6F6F6F5F5F5F4F4F4FCFCFCBDBDBDFF00FFFF00FFFF00FFBEBEBE
        E2C1A3ADBBD7E2C1A3E2C1A3E2C1A3E2C1A3E2C1A3E2C1A3E2C1A3E2C1A3E2C1
        A3BEBEBEFF00FFFF00FFFF00FFBFBFBFFDFDFDADBBD7FAFAFAFAFAFAFBFBFBFA
        FAFAFAFAFAF9F9F9F8F8F8F6F6F6FDFDFDBFBFBFFF00FFFF00FFFF00FFC0C0C0
        E2C1A3ADBBD7E2C1A3E2C1A3E2C1A3E2C1A3E2C1A3E2C1A3C0C0C0CBCBCBDBDB
        DBBFBFBFFF00FFFF00FFFF00FFC0C0C0959596ADBBD7FBFBFBFCFCFCFCFCFCFC
        FCFCFBFBFBFAFAFACBCBCBE2E2E2C0C0C0FF00FFFF00FFFF00FFFF00FFC0C0C0
        FFFFFFADBBD7FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAFAFADBDBDBC0C0C0FF00
        FFFF00FFFF00FFFF00FFFF00FFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object BtnAlterar: TBitBtn
      Left = 123
      Top = 20
      Width = 94
      Height = 33
      Caption = '&Alterar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000001FF00FFFF00FF
        FF00FF7F331B8833138A37128A3B168A3B16FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF84351E8E32107C321FFF00FFFF00FFFF00FF93
        4112853F1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF35221D35221D
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C4219984A13984A13FF00FFFF00
        FFFF00FFFF00FFFF00FF35221D1C63780076A900699A004C88FF00FFFF00FFFF
        00FFFF00FFFF00FF9A4E15A8590FA55A12A65C14B36810AA6214FF00FF02AAD8
        00B6EA036C970930940B0983FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0281AB00BEEE03161707119C0C16980B0C83FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0281AB
        056AF2061C7402000007119C0C17990B0C83FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0B1CBB2555FF061C7402000007119C0C
        169C0B0C82FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0F26BF2455FF061C7402000007119C0C169C0B0C83FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1028C22455FF061C7402
        000007119C0C169C0A0C83FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF1129C42454FF061C7402000007119C0B169D0B0C83FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF112CC924
        55FF061C7402000007119C07119C0A0C83FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF132FCD2354FF061C7400000007119C999C
        D9171895FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF1531D11E4EFF061C74A3A19A7B7BD700018FFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1532D2ACBFFF6C76E10000
        A6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF2F31A4020EAAFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 1
      OnClick = BtnAlterarClick
    end
    object btnCancelar: TBitBtn
      Left = 235
      Top = 20
      Width = 94
      Height = 33
      Caption = '&Cancelar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFE3BC7C
        E3BC7CE3BC7CE3BC7CE3BC7CE3BC7CE3BC7CE3BC7CE3BC7CE3BC7CE3BC7CE3BC
        7CE3BC7CE3BC7CFF00FFE2AB4BFED054FECD4DFECD4DFECD4DFECD4DFECD4DFE
        CD4DFECD4DFECD4DFECD4DFECD4DFECD4DFECD4DFED054E2AB4BDA9733EFB02E
        EFAC26EFAC26EFAC26EFAC26EFAC26EFAC26EFAC26EFAC26EFAC26EFAC26EFAC
        26EFAC26EFB02EDA9733CD8226DC9322DB8F1CDB8F1CAE5110C16A13C16A13C1
        6A13C16A13C16A13C67115D88B1BDB8F1CDB8F1CDC9322CD8226BE6B19C87516
        C77212C77212A6460CC88D62F3ECE7F3ECE7F3ECE7F4EDE7CD9670B4580FC570
        12C77212C87516BE6B19AF540EB55A0CB4580AB4580AA1400ABC754ADECBC1DB
        C4B8D5B6A3D7BBAAD4D4D4CA9676AC4C09B4580AB55A0CAF540EA23F04A54204
        A54203A54203A54103A13E07C67942A03C05A23F04A03C05DCC4B8E3DDDAA03C
        05A54203A54204A23F049B3500A74C1CA74C1CA64B1BA24315DEC2B3F1F1F1A1
        4011A14212A14112F0EAE7EAE4E1A14112A64A1AA64A199B3500B2653EB86F4A
        B76F4AAB552DE4CABDF9F9F9FCFCFCE5CCBFD6AD99FFFFFFFBFBFBCD9B83A74E
        23AC572CAB562AAD592EB06139B56B44B66C46AB552CEEDED6FEFEFEFEFEFEFA
        F4F1E9D2C8DFBFAFBC7957A5491DA85125A74D20A4481AA64C1FB2653EB9724E
        BA734FB86F4BAD5A32F1E4DEFAF4F2AA532AAA5329A95127AC582EAE5C32AC58
        2CA95326A74E20A84F21B8714DC28464C38566C38666C18060B1623CE6CDC1B0
        603ABD7B59BB7754B9734FB76E49B56A44B3653EB16038AD5B31BF7F5FCB977C
        CD9A80CD9B81CD9A80C99277B56A47B66D4AC89074C68D6FC4896AC28565C081
        60BE7C5BBC7754B56B45C78D70D7AE9AD7AC97D8B09BD7AF9AD7AD98D2A48DD4
        A892D3A58ED1A28ACF9F86CE9B82CC987DC99277C89174BD7C5ACD9B83E1C2B3
        E1C4B4E2C4B5E1C3B4E0C1B2E0BFAFDEBDACDDBAA9DBB8A5DAB5A2D9B29ED7AF
        9BD6AC97D4A993C68C70FF00FFD4AA94D4AB95D5AB95D4AA95D4A993D4A892D3
        A791D2A68FD2A48DD2A38CD1A28BD0A189CFA088CF9E86FF00FF}
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnGravar: TBitBtn
      Left = 347
      Top = 20
      Width = 94
      Height = 33
      Caption = '&Gravar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF823909
        8239098239096046296C6C6C6D6D6D6666667B7B7B6D6D6D6464645353536046
        297E2801652803652803FF00FF843A09B6510DB7510E6046296969697E28017E
        2801A4A4A4AAAAAA9090906D6D6D6046297E28017D2F03782C04FF00FF90410A
        BB560FBC560F6046296464647E28017E2801B6B6B6C1C1C1A1A1A17979796046
        297E28017D3004782C04FF00FF93440CC05B11C15C116046295E5E5E7E28017E
        2801C6C6C6DADADAB8B8B88686866046297E28017F3204792D04FF00FF97480D
        C56215C66416604629595959595959595959C9C9C9F3F3F3D0D0D09696966046
        297E28018033047B2E05FF00FF9A5016CA6E23CB702692561F60462960462960
        46296046296046296046296046296A3711772E03893A077D2F05FF00FF9E5920
        BB6A2CC4956FC1926DBF8F6ABC8C67BA8862B6835CB5815AB48059B27F59B17E
        58B07D58A3460F7E3005FF00FFA1632DC48653EBEBEBE7E7E7E2E2E2DDDDDDD9
        D9D9D4D4D4D0D0D0CBCBCBCACACACACACACACACAA95D2B7F3205FF00FFA56B38
        C2885ADCDCDCD8D8D8D4D4D4D1D1D1CECECECACACAC7C7C7C4C4C4C0C0C0BDBD
        BDBBBBBBA65B287F3306FF00FFA97343CC966AFEFEFEFBFBFBF7F7F7F2F2F2EE
        EEEEE9E9E9E5E5E5E0E0E0DADADAD7D7D7D1D1D1AB5F2D803306FF00FFAA784C
        C7936BE1E1E1E1E1E1E1E1E1E0E0E0DDDDDDD9D9D9D7D7D7D3D3D3CFCFCFCCCC
        CCC9C9C9AA5E2B803306FF00FFAB7A50CF9D75FEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFCFCFCF8F8F8F4F4F4EFEFEFEBEBEBE6E6E6B16530813406FF00FFAB794D
        C7956CE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1DEDEDEDCDC
        DCD8D8D8AD622D803406FF00FFAB794DBB835AFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAFAFAAA6030762D04FF00FFAB794D
        BB835A2A16792A16792A16792A16792A16792A16792A16792A16792A16792A16
        792A1679AA6030762D04FF00FF9D66427F412D340D59340D59340D59340D5934
        0D59340D59340D59340D59340D59340D59340D596B26146D2903}
      TabOrder = 3
      OnClick = btnGravarClick
    end
    object btnApagar: TBitBtn
      Left = 459
      Top = 20
      Width = 94
      Height = 33
      Caption = 'Apaga&r'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        2D2BAA252595FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0101
        60000073FF00FFFF00FFFF00FF3836B61111B81C1CB82F2FA4FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF06066D01018A00008B020074FF00FF3F3FBB1616C5
        0A0AC20A0AC02222C43737ADFF00FFFF00FFFF00FFFF00FF11117B0505910000
        9000009000008B0200743B3BB22C2CD30D0DD00D0DCE0C0CC92828CC3D3DB4FF
        00FFFF00FF1F1F8E0C0C9F00009200009000009000008800005DFF00FF4747C1
        3333DE1111DA0F0FD50D0DCF2A2AD13C3CB42F2FA41717B40303A30101990000
        91010189010160FF00FFFF00FFFF00FF5454CC3C3CE71313E11111DA0E0ED328
        28CF2222C60707B50505AA0303A0060693050566FF00FFFF00FFFF00FFFF00FF
        FF00FF5C5CD33F3FEA1414E31111DC0E0ED10C0CC70909BC0606B10D0DA40E0E
        77FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5B5BD03D3DE61414E311
        11DA0D0DCF0A0AC21616B5181886FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF6E6ECE5B5BE92020E71313E10F0FD40C0CC91616B7181887FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7878CE7474E75353EE4848ED35
        35E92020DD1111CE0A0ABF0F0FAB0E0E79FF00FFFF00FFFF00FFFF00FFFF00FF
        7F7FCB8787E56D6DF26363F05757EF5C5CDE5252D83B3BDA2D2DCE1F1FC01818
        A5111176FF00FFFF00FFFF00FF8484C79797E38484F47B7BF37070F27272E05B
        5BBB4D4DB15151CF4141D43838C92F2FBD2929A51B1B78FF00FF8686C2A0A0E0
        9999F69191F68888F48383DE6767BCFF00FFFF00FF4747A55050C54242CB3737
        C02E2EB52929A01D1D7A9393B7A5A5EAA1A1F79A9AF69292DD6E6EBDFF00FFFF
        00FFFF00FFFF00FF3F3F9C4A4ABC3B3BC03232B52D2DA92B2B8EFF00FF9594B6
        A7A7E99D9DDC7676BBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3C3C984141
        B53535B0343495FF00FFFF00FFFF00FF9796B68080C0FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF3636933E3E9AFF00FFFF00FF}
      TabOrder = 4
      OnClick = btnApagarClick
    end
    object btnFechar: TBitBtn
      Left = 866
      Top = 20
      Width = 94
      Height = 33
      Anchors = [akTop, akRight]
      Caption = '&Fechar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF000288010893010B99010C99010893000389FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000186010D9D021CAF021FB402
        1FB5021FB5021FB2021CB0010F9F000287FF00FFFF00FFFF00FFFF00FFFF00FF
        00038A0118B2021FB7021EB1021DB1021DB1021DB1021DB1021EB2021FB40219
        AC00048EFF00FFFF00FFFF00FF0001830118BB0220CC011CBF0015B4011AB002
        1DB1021DB1011CB00015AD011BB0021FB4021AAC000287FF00FFFF00FF010CA7
        0121E0011CD30726CC4966D70B28BC0018B00019AF0622B44A66CE0D2BB7011B
        B0021FB5010F9FFF00FF000187011CDC0120ED0017DC3655E2FFFFFFA4B4ED05
        20BB0119B28B9EE1FFFFFF4E6ACF0014AC021EB2021CB000038900069A0120F8
        011FF6001DE9031FE1738BEEFFFFFFA0B1ED93A5E7FFFFFF91A4E20823B4011B
        B0021DB1021FB4010895020CAA0A2EFE0323FB011FF6001CEB0018E1788FF0FF
        FFFFFFFFFF96A7EA021BB50019AF021DB1021DB10220B5010C99040EAC294DFE
        0D30FB011FFA001CF7011CEE8EA1F4FFFFFFFFFFFFA6B6EE0520C20018B6021D
        B1021DB10220B5010B980208A04162FB2F51FC001EFA0725FA8AA0FEFFFFFF8E
        A3F67991F2FFFFFFA3B4EE0C29C6011BB8021DB4021FB2000793000189314FEF
        7690FF0F2DFA3354FBFFFFFF91A5FE021EF30017E7738BF3FFFFFF4765E00016
        C2021FBD021CB2000288FF00FF0C1BBC819AFF728BFE1134FA3456FB0526FA00
        1CFA001CF40220ED3353ED0625DA011DD00220CB010DA1FF00FFFF00FF000189
        2943E6A5B7FF849AFC2341FB0323FA011FFA011FFA001EF7011BEE021FE50121
        E20118BF000184FF00FFFF00FFFF00FF01038F2A45E693A9FFABBBFF758FFE49
        69FC3658FB3153FC2346FC092CF70118CB00038BFF00FFFF00FFFF00FFFF00FF
        FF00FF0001890F1DBF3E5BF36B87FE728CFF5E7BFE395BFB1231EB010FB50001
        84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000189030AA306
        11B2050FB10107A0000188FF00FFFF00FFFF00FFFF00FFFF00FF}
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
