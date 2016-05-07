object DM: TDM
  OldCreateOrder = False
  Height = 554
  Width = 629
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;User ID=sa;Initial Catalog=concessionaria;Data Source=n' +
      'ote-dragoni\sqlexpress;Use Procedure for Prepare=1;Auto Translat' +
      'e=True;Packet Size=4096;Workstation ID=NOTE-DRAGONI;Use Encrypti' +
      'on for Data=False;Tag with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 304
    Top = 16
  end
  object DSusuarios: TDataSource
    DataSet = ADODSusuarios
    Left = 160
    Top = 88
  end
  object ADODSclientes: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from Clientes'
    Parameters = <>
    Left = 56
    Top = 144
    object ADODSclientesIDcliente: TAutoIncField
      FieldName = 'IDcliente'
      ReadOnly = True
    end
    object ADODSclientesCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object ADODSclientesTipo: TStringField
      FieldName = 'Tipo'
      FixedChar = True
      Size = 2
    end
    object ADODSclientesNome_RazaoSocial: TStringField
      FieldName = 'Nome_RazaoSocial'
      Size = 100
    end
    object ADODSclientesNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Size = 100
    end
    object ADODSclientesIE_RG: TStringField
      FieldName = 'IE_RG'
      Size = 100
    end
    object ADODSclientesEndereco: TStringField
      FieldName = 'Endereco'
      Size = 100
    end
    object ADODSclientesComplemento: TStringField
      FieldName = 'Complemento'
      Size = 100
    end
    object ADODSclientesCidade: TStringField
      FieldName = 'Cidade'
      Size = 100
    end
    object ADODSclientesBairro: TStringField
      FieldName = 'Bairro'
      Size = 100
    end
    object ADODSclientesEstado: TStringField
      FieldName = 'Estado'
      FixedChar = True
      Size = 2
    end
    object ADODSclientesCEP: TStringField
      FieldName = 'CEP'
      EditMask = '00000\-000;1;_'
      Size = 15
    end
    object ADODSclientesTelefone: TStringField
      FieldName = 'Telefone'
      EditMask = '!\(999\)9000-0000;1;_'
    end
    object ADODSclientesCelular: TStringField
      FieldName = 'Celular'
      EditMask = '!\(999\)9000-0000;1;_'
    end
    object ADODSclientesCelular_2: TStringField
      FieldName = 'Celular_2'
      EditMask = '!\(999\)9000-0000;1;_'
    end
    object ADODSclientesFax: TStringField
      FieldName = 'Fax'
      EditMask = '!\(999\)9000-0000;1;_'
    end
    object ADODSclientesE_mail: TStringField
      FieldName = 'E_mail'
      Size = 50
    end
    object ADODSclientesData_Inclusao: TDateTimeField
      FieldName = 'Data_Inclusao'
    end
    object ADODSclientesData_Alteracao: TDateTimeField
      FieldName = 'Data_Alteracao'
    end
    object ADODSclientesstatus: TStringField
      FieldName = 'status'
      FixedChar = True
      Size = 1
    end
  end
  object ADODSusuarios: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from usuarios'
    Parameters = <>
    Left = 56
    Top = 88
    object ADODSusuariosIDusuario: TAutoIncField
      FieldName = 'IDusuario'
      ReadOnly = True
    end
    object ADODSusuariosusuario: TStringField
      FieldName = 'usuario'
    end
    object ADODSusuariossenha: TStringField
      FieldName = 'senha'
    end
  end
  object DSclientes: TDataSource
    DataSet = ADODSclientes
    Left = 160
    Top = 144
  end
  object ADODScargos: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from Cargos'#13#10
    Parameters = <>
    Left = 56
    Top = 200
    object ADODScargosidCargo: TAutoIncField
      FieldName = 'idCargo'
      ReadOnly = True
    end
    object ADODScargosiddpto: TIntegerField
      FieldName = 'iddpto'
    end
    object ADODScargosCargo: TStringField
      FieldName = 'Cargo'
      Size = 50
    end
  end
  object DScargos: TDataSource
    DataSet = ADODScargos
    Left = 160
    Top = 200
  end
  object ADOQueryUsuarios: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    DataSource = DSusuarios
    Parameters = <>
    SQL.Strings = (
      'select * from usuarios')
    Left = 248
    Top = 88
    object ADOQueryUsuariosIDusuario: TAutoIncField
      FieldName = 'IDusuario'
      ReadOnly = True
    end
    object ADOQueryUsuariosusuario: TStringField
      FieldName = 'usuario'
    end
    object ADOQueryUsuariossenha: TStringField
      FieldName = 'senha'
    end
  end
  object ADODSFornecedores: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from fornecedores'
    Parameters = <>
    Left = 56
    Top = 256
    object ADODSFornecedoresIDfornecedor: TAutoIncField
      FieldName = 'IDfornecedor'
      ReadOnly = True
    end
    object ADODSFornecedoresCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object ADODSFornecedoresTipo: TStringField
      FieldName = 'Tipo'
      FixedChar = True
      Size = 2
    end
    object ADODSFornecedoresNome_RazaoSocial: TStringField
      FieldName = 'Nome_RazaoSocial'
      Size = 100
    end
    object ADODSFornecedoresNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Size = 100
    end
    object ADODSFornecedoresIE_RG: TStringField
      FieldName = 'IE_RG'
      Size = 100
    end
    object ADODSFornecedoresEndereco: TStringField
      FieldName = 'Endereco'
      Size = 100
    end
    object ADODSFornecedoresComplemento: TStringField
      FieldName = 'Complemento'
      Size = 100
    end
    object ADODSFornecedoresCidade: TStringField
      FieldName = 'Cidade'
      Size = 100
    end
    object ADODSFornecedoresBairro: TStringField
      FieldName = 'Bairro'
      Size = 100
    end
    object ADODSFornecedoresEstado: TStringField
      FieldName = 'Estado'
      FixedChar = True
      Size = 2
    end
    object ADODSFornecedoresCEP: TStringField
      FieldName = 'CEP'
      EditMask = '00000\-000;1;_'
    end
    object ADODSFornecedoresTelefone: TStringField
      FieldName = 'Telefone'
      EditMask = '!\(999\)9000-0000;1;_'
    end
    object ADODSFornecedoresCelular: TStringField
      FieldName = 'Celular'
      EditMask = '!\(999\)9000-0000;1;_'
    end
    object ADODSFornecedoresCelular_2: TStringField
      FieldName = 'Celular_2'
      EditMask = '!\(999\)9000-0000;1;_'
    end
    object ADODSFornecedoresFax: TStringField
      FieldName = 'Fax'
      EditMask = '!\(999\)9000-0000;1;_'
    end
    object ADODSFornecedoresE_mail: TStringField
      FieldName = 'E_mail'
      Size = 50
    end
    object ADODSFornecedoresData_Inclusao: TDateTimeField
      FieldName = 'Data_Inclusao'
    end
    object ADODSFornecedoresData_Alteracao: TDateTimeField
      FieldName = 'Data_Alteracao'
    end
  end
  object DSFornecedores: TDataSource
    DataSet = ADODSFornecedores
    Left = 160
    Top = 256
  end
  object ADODSDepartamentos: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from Departamentos'
    Parameters = <>
    Left = 56
    Top = 312
    object ADODSDepartamentosidDepartamento: TAutoIncField
      FieldName = 'idDepartamento'
      ReadOnly = True
    end
    object ADODSDepartamentosDepartamento: TStringField
      FieldName = 'Departamento'
      Size = 50
    end
  end
  object DSDepartamentos: TDataSource
    DataSet = ADODSDepartamentos
    Left = 160
    Top = 312
  end
  object DSVeiculos: TDataSource
    DataSet = ADOQueryveiculos
    Left = 552
    Top = 288
  end
  object ADODSOficina: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from Oficinas'
    Parameters = <>
    Left = 56
    Top = 376
    object ADODSOficinaIDOficina: TAutoIncField
      FieldName = 'IDOficina'
      ReadOnly = True
    end
    object ADODSOficinaCNPJ: TStringField
      FieldName = 'CNPJ'
      EditMask = '00.000.000/0000-00;1;_'
    end
    object ADODSOficinaRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 100
    end
    object ADODSOficinaNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Size = 100
    end
    object ADODSOficinaIE: TStringField
      FieldName = 'IE'
      Size = 100
    end
    object ADODSOficinaEndereco: TStringField
      FieldName = 'Endereco'
      Size = 100
    end
    object ADODSOficinaComplemento: TStringField
      FieldName = 'Complemento'
      Size = 100
    end
    object ADODSOficinaCidade: TStringField
      FieldName = 'Cidade'
      Size = 100
    end
    object ADODSOficinaBairro: TStringField
      FieldName = 'Bairro'
      Size = 100
    end
    object ADODSOficinaEstado: TStringField
      FieldName = 'Estado'
      FixedChar = True
      Size = 2
    end
    object ADODSOficinaCEP: TStringField
      FieldName = 'CEP'
      EditMask = '00000\-000;1;_'
    end
    object ADODSOficinaTelefone: TStringField
      FieldName = 'Telefone'
      EditMask = '!\(999\)9000-0000;1;_'
    end
    object ADODSOficinaCelular: TStringField
      FieldName = 'Celular'
      EditMask = '!\(999\)9000-0000;1;_'
    end
    object ADODSOficinaCelular_2: TStringField
      FieldName = 'Celular_2'
      EditMask = '!\(999\)9000-0000;1;_'
    end
    object ADODSOficinaFax: TStringField
      FieldName = 'Fax'
      EditMask = '!\(999\)9000-0000;1;_'
    end
    object ADODSOficinaE_mail: TStringField
      FieldName = 'E_mail'
      Size = 50
    end
    object ADODSOficinaData_Inclusao: TDateTimeField
      FieldName = 'Data_Inclusao'
    end
    object ADODSOficinaData_Alteracao: TDateTimeField
      FieldName = 'Data_Alteracao'
    end
  end
  object DSOficina: TDataSource
    DataSet = ADODSOficina
    Left = 160
    Top = 376
  end
  object ADODSFunc: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from funcionarios'
    Parameters = <>
    Left = 56
    Top = 440
    object ADODSFuncIDFuncionario: TAutoIncField
      FieldName = 'IDFuncionario'
      ReadOnly = True
    end
    object ADODSFuncIDcargo: TIntegerField
      FieldName = 'IDcargo'
    end
    object ADODSFuncNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object ADODSFuncCPF: TStringField
      FieldName = 'CPF'
      EditMask = '000.000.000-00'
    end
    object ADODSFuncRG: TStringField
      FieldName = 'RG'
      Size = 100
    end
    object ADODSFuncEndereco: TStringField
      FieldName = 'Endereco'
      Size = 100
    end
    object ADODSFuncComplemento: TStringField
      FieldName = 'Complemento'
      Size = 100
    end
    object ADODSFuncCidade: TStringField
      FieldName = 'Cidade'
      Size = 100
    end
    object ADODSFuncBairro: TStringField
      FieldName = 'Bairro'
      Size = 100
    end
    object ADODSFuncEstado: TStringField
      FieldName = 'Estado'
      FixedChar = True
      Size = 2
    end
    object ADODSFuncCEP: TStringField
      FieldName = 'CEP'
      EditMask = '00000\-000;1;_'
    end
    object ADODSFuncTelefone: TStringField
      FieldName = 'Telefone'
      EditMask = '!\(999\)9000-0000;1;_'
    end
    object ADODSFuncTelefone_2: TStringField
      FieldName = 'Telefone_2'
      EditMask = '!\(999\)9000-0000;1;_'
    end
    object ADODSFuncCelular: TStringField
      FieldName = 'Celular'
      EditMask = '!\(999\)9000-0000;1;_'
    end
    object ADODSFuncCelular_2: TStringField
      FieldName = 'Celular_2'
      EditMask = '!\(999\)9000-0000;1;_'
    end
    object ADODSFuncE_mail: TStringField
      FieldName = 'E_mail'
      Size = 50
    end
    object ADODSFuncData_Inclusao: TDateTimeField
      FieldName = 'Data_Inclusao'
    end
    object ADODSFuncData_Alteracao: TDateTimeField
      FieldName = 'Data_Alteracao'
    end
    object ADODSFuncstatus: TStringField
      FieldName = 'status'
      FixedChar = True
      Size = 1
    end
  end
  object DSFunc: TDataSource
    DataSet = ADODSFunc
    Left = 160
    Top = 440
  end
  object DSVendas: TDataSource
    DataSet = ADODSvendas
    Left = 552
    Top = 160
  end
  object DSVendas_item: TDataSource
    DataSet = ADODSvendas_item
    Left = 552
    Top = 224
  end
  object ADOQueryveiculos: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select idveiculo, marca, ano, cor, valor, modelo'
      'from veiculos'
      'order by modelo')
    Left = 464
    Top = 288
    object ADOQueryveiculosidveiculo: TIntegerField
      FieldName = 'idveiculo'
      ReadOnly = True
    end
    object ADOQueryveiculosmarca: TStringField
      FieldName = 'marca'
      Size = 50
    end
    object ADOQueryveiculosano: TStringField
      FieldName = 'ano'
      Size = 4
    end
    object ADOQueryveiculoscor: TStringField
      FieldName = 'cor'
    end
    object ADOQueryveiculosvalor: TBCDField
      FieldName = 'valor'
      Precision = 18
      Size = 2
    end
    object ADOQueryveiculosmodelo: TStringField
      FieldName = 'modelo'
      Size = 50
    end
  end
  object ADODSveiculos: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from Veiculos'
    Parameters = <>
    Left = 464
    Top = 104
    object ADODSveiculosIDveiculo: TAutoIncField
      FieldName = 'IDveiculo'
      ReadOnly = True
    end
    object ADODSveiculosChassis: TStringField
      FieldName = 'Chassis'
    end
    object ADODSveiculosIDFornecedor: TIntegerField
      FieldName = 'IDFornecedor'
    end
    object ADODSveiculosMarca: TStringField
      FieldName = 'Marca'
      Size = 50
    end
    object ADODSveiculosModelo: TStringField
      FieldName = 'Modelo'
      Size = 50
    end
    object ADODSveiculosCor: TStringField
      FieldName = 'Cor'
    end
    object ADODSveiculosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object ADODSveiculosValor: TBCDField
      FieldName = 'Valor'
      Precision = 18
      Size = 2
    end
    object ADODSveiculosano: TStringField
      FieldName = 'ano'
      Size = 4
    end
  end
  object DSveiculo: TDataSource
    DataSet = ADODSveiculos
    Left = 552
    Top = 104
  end
  object ADODSvendas_item: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterPost = ADODSvendas_itemAfterPost
    AfterDelete = ADODSvendas_itemAfterDelete
    OnNewRecord = ADODSvendas_itemNewRecord
    CommandText = 'select * from Venda_item'#13#10'where id_venda =:idvenda'
    CommandType = cmdUnknown
    DataSource = DSVendas
    IndexFieldNames = 'id_venda'
    MasterFields = 'idvenda'
    Parameters = <
      item
        Name = 'idvenda'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 464
    Top = 224
    object ADODSvendas_itemid_venda: TIntegerField
      FieldName = 'id_venda'
    end
    object ADODSvendas_itemid_veiculo: TIntegerField
      FieldName = 'id_veiculo'
      OnValidate = ADODSvendas_itemid_veiculoValidate
    end
    object ADODSvendas_itemvalor_unitario: TBCDField
      FieldName = 'valor_unitario'
      LookupDataSet = ADODSveiculos
      LookupKeyFields = 'IDveiculo'
      LookupResultField = 'Valor'
      Precision = 18
      Size = 2
    end
    object ADODSvendas_itemvalor_total: TBCDField
      FieldName = 'valor_total'
      LookupDataSet = ADODSveiculos
      LookupKeyFields = 'IDveiculo'
      LookupResultField = 'Valor'
      Precision = 18
      Size = 2
    end
    object ADODSvendas_itemModelo: TStringField
      FieldKind = fkLookup
      FieldName = 'Modelo'
      LookupDataSet = ADOQueryveiculos
      LookupKeyFields = 'idveiculo'
      LookupResultField = 'modelo'
      KeyFields = 'id_veiculo'
      OnValidate = ADODSvendas_itemModeloValidate
      Size = 50
      Lookup = True
    end
  end
  object ADODSvendas: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from Vendas'
    Parameters = <>
    Left = 464
    Top = 160
    object ADODSvendasIDvenda: TAutoIncField
      FieldName = 'IDvenda'
      ReadOnly = True
    end
    object ADODSvendasIDcliente: TIntegerField
      FieldName = 'IDcliente'
    end
    object ADODSvendasIDvendedor: TIntegerField
      FieldName = 'IDvendedor'
    end
    object ADODSvendasvalor_total: TBCDField
      FieldName = 'valor_total'
      LookupDataSet = ADODSvendas_item
      Precision = 18
      Size = 2
    end
    object ADODSvendasdata_incl: TDateTimeField
      FieldName = 'data_incl'
    end
    object ADODSvendasdata_alt: TDateTimeField
      FieldName = 'data_alt'
    end
    object ADODSvendasvalor_desc: TBCDField
      FieldName = 'valor_desc'
      Precision = 18
      Size = 2
    end
    object ADODSvendasvalor_unitario: TBCDField
      FieldName = 'valor_unitario'
      Precision = 18
      Size = 2
    end
  end
  object ADODSManutencao: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from Manutencoes'
    Parameters = <>
    Left = 464
    Top = 360
    object ADODSManutencaoidManutencao: TAutoIncField
      FieldName = 'idManutencao'
      ReadOnly = True
    end
    object ADODSManutencaoidOficina: TIntegerField
      FieldName = 'idOficina'
    end
    object ADODSManutencaoIDVeiculo: TIntegerField
      FieldName = 'IDVeiculo'
    end
    object ADODSManutencaoData_Inicio: TDateTimeField
      FieldName = 'Data_Inicio'
    end
    object ADODSManutencaoData_Termino: TDateTimeField
      FieldName = 'Data_Termino'
    end
    object ADODSManutencaoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object ADODSManutencaoValor: TFloatField
      FieldName = 'Valor'
    end
    object ADODSManutencaoModelo: TStringField
      FieldKind = fkLookup
      FieldName = 'Modelo'
      LookupDataSet = ADODSveiculos
      LookupKeyFields = 'IDveiculo'
      LookupResultField = 'Modelo'
      KeyFields = 'IDVeiculo'
      Size = 50
      Lookup = True
    end
    object ADODSManutencaoOficina: TStringField
      FieldKind = fkLookup
      FieldName = 'Oficina'
      LookupDataSet = ADODSOficina
      LookupKeyFields = 'IDOficina'
      LookupResultField = 'NomeFantasia'
      KeyFields = 'IDVeiculo'
      Size = 50
      Lookup = True
    end
  end
  object DSManutencao: TDataSource
    DataSet = ADODSManutencao
    Left = 552
    Top = 360
  end
  object ADOQueryManutencao: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT        Oficinas.NomeFantasia, Manutencoes.Valor, Manutenc' +
        'oes.Descricao, Manutencoes.Data_Termino, Manutencoes.Data_Inicio' +
        ', Veiculos.Chassis, Veiculos.modelo'
      'FROM            Manutencoes INNER JOIN'
      
        '                         Oficinas ON Manutencoes.idOficina = Ofi' +
        'cinas.IDOficina INNER JOIN'
      
        '                         Veiculos ON Manutencoes.IDVeiculo = Vei' +
        'culos.IDveiculo')
    Left = 464
    Top = 424
    object ADOQueryManutencaoNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Size = 100
    end
    object ADOQueryManutencaoValor: TFloatField
      FieldName = 'Valor'
    end
    object ADOQueryManutencaoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object ADOQueryManutencaoData_Termino: TDateTimeField
      FieldName = 'Data_Termino'
    end
    object ADOQueryManutencaoData_Inicio: TDateTimeField
      FieldName = 'Data_Inicio'
    end
    object ADOQueryManutencaoChassis: TStringField
      FieldName = 'Chassis'
    end
    object ADOQueryManutencaomodelo: TStringField
      FieldName = 'modelo'
      Size = 50
    end
  end
  object DSManut: TDataSource
    DataSet = ADOQueryManutencao
    Left = 552
    Top = 424
  end
end
