unit UnitDM;

interface

uses
  System.SysUtils, Vcl.Dialogs, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DSusuarios: TDataSource;
    ADODSclientes: TADODataSet;
    ADODSusuarios: TADODataSet;
    DSclientes: TDataSource;
    ADODScargos: TADODataSet;
    DScargos: TDataSource;
    ADOQueryUsuarios: TADOQuery;
    ADODSFornecedores: TADODataSet;
    DSFornecedores: TDataSource;
    ADODSDepartamentos: TADODataSet;
    DSDepartamentos: TDataSource;
    DSVeiculos: TDataSource;
    ADODSOficina: TADODataSet;
    DSOficina: TDataSource;
    ADODSFunc: TADODataSet;
    DSFunc: TDataSource;
    DSVendas: TDataSource;
    DSVendas_item: TDataSource;
    ADOQueryveiculos: TADOQuery;
    ADODSveiculos: TADODataSet;
    DSveiculo: TDataSource;
    ADODSclientesIDcliente: TAutoIncField;
    ADODSclientesCPF_CNPJ: TStringField;
    ADODSclientesTipo: TStringField;
    ADODSclientesNome_RazaoSocial: TStringField;
    ADODSclientesNomeFantasia: TStringField;
    ADODSclientesIE_RG: TStringField;
    ADODSclientesEndereco: TStringField;
    ADODSclientesComplemento: TStringField;
    ADODSclientesCidade: TStringField;
    ADODSclientesBairro: TStringField;
    ADODSclientesEstado: TStringField;
    ADODSclientesCEP: TStringField;
    ADODSclientesTelefone: TStringField;
    ADODSclientesCelular: TStringField;
    ADODSclientesCelular_2: TStringField;
    ADODSclientesFax: TStringField;
    ADODSclientesE_mail: TStringField;
    ADODSclientesData_Inclusao: TDateTimeField;
    ADODSclientesData_Alteracao: TDateTimeField;
    ADODSclientesstatus: TStringField;
    ADODScargosidCargo: TAutoIncField;
    ADODScargosiddpto: TIntegerField;
    ADODScargosCargo: TStringField;
    ADODSFornecedoresIDfornecedor: TAutoIncField;
    ADODSFornecedoresCPF_CNPJ: TStringField;
    ADODSFornecedoresTipo: TStringField;
    ADODSFornecedoresNome_RazaoSocial: TStringField;
    ADODSFornecedoresNomeFantasia: TStringField;
    ADODSFornecedoresIE_RG: TStringField;
    ADODSFornecedoresEndereco: TStringField;
    ADODSFornecedoresComplemento: TStringField;
    ADODSFornecedoresCidade: TStringField;
    ADODSFornecedoresBairro: TStringField;
    ADODSFornecedoresEstado: TStringField;
    ADODSFornecedoresCEP: TStringField;
    ADODSFornecedoresTelefone: TStringField;
    ADODSFornecedoresCelular: TStringField;
    ADODSFornecedoresCelular_2: TStringField;
    ADODSFornecedoresFax: TStringField;
    ADODSFornecedoresE_mail: TStringField;
    ADODSFornecedoresData_Inclusao: TDateTimeField;
    ADODSFornecedoresData_Alteracao: TDateTimeField;
    ADODSDepartamentosidDepartamento: TAutoIncField;
    ADODSDepartamentosDepartamento: TStringField;
    ADODSOficinaIDOficina: TAutoIncField;
    ADODSOficinaCNPJ: TStringField;
    ADODSOficinaRazaoSocial: TStringField;
    ADODSOficinaNomeFantasia: TStringField;
    ADODSOficinaIE: TStringField;
    ADODSOficinaEndereco: TStringField;
    ADODSOficinaComplemento: TStringField;
    ADODSOficinaCidade: TStringField;
    ADODSOficinaBairro: TStringField;
    ADODSOficinaEstado: TStringField;
    ADODSOficinaCEP: TStringField;
    ADODSOficinaTelefone: TStringField;
    ADODSOficinaCelular: TStringField;
    ADODSOficinaCelular_2: TStringField;
    ADODSOficinaFax: TStringField;
    ADODSOficinaE_mail: TStringField;
    ADODSOficinaData_Inclusao: TDateTimeField;
    ADODSOficinaData_Alteracao: TDateTimeField;
    ADODSvendas_item: TADODataSet;
    ADODSvendas: TADODataSet;
    ADODSvendas_itemid_venda: TIntegerField;
    ADODSvendas_itemid_veiculo: TIntegerField;
    ADODSvendas_itemvalor_unitario: TBCDField;
    ADODSvendas_itemvalor_total: TBCDField;
    ADODSvendas_itemModelo: TStringField;
    ADODSvendasIDvenda: TAutoIncField;
    ADODSvendasIDcliente: TIntegerField;
    ADODSvendasIDvendedor: TIntegerField;
    ADODSvendasvalor_total: TBCDField;
    ADODSvendasdata_incl: TDateTimeField;
    ADODSvendasdata_alt: TDateTimeField;
    ADODSvendasvalor_desc: TBCDField;
    ADODSvendasvalor_unitario: TBCDField;
    ADODSManutencao: TADODataSet;
    DSManutencao: TDataSource;
    ADOQueryManutencao: TADOQuery;
    DSManut: TDataSource;
    ADODSveiculosIDveiculo: TAutoIncField;
    ADODSveiculosChassis: TStringField;
    ADODSveiculosIDFornecedor: TIntegerField;
    ADODSveiculosMarca: TStringField;
    ADODSveiculosModelo: TStringField;
    ADODSveiculosCor: TStringField;
    ADODSveiculosDescricao: TStringField;
    ADODSveiculosValor: TBCDField;
    ADODSveiculosano: TStringField;
    ADOQueryveiculosidveiculo: TIntegerField;
    ADOQueryveiculosmarca: TStringField;
    ADOQueryveiculosano: TStringField;
    ADOQueryveiculoscor: TStringField;
    ADOQueryveiculosvalor: TBCDField;
    ADOQueryveiculosmodelo: TStringField;
    ADODSFuncIDFuncionario: TAutoIncField;
    ADODSFuncIDcargo: TIntegerField;
    ADODSFuncNome: TStringField;
    ADODSFuncCPF: TStringField;
    ADODSFuncRG: TStringField;
    ADODSFuncEndereco: TStringField;
    ADODSFuncComplemento: TStringField;
    ADODSFuncCidade: TStringField;
    ADODSFuncBairro: TStringField;
    ADODSFuncEstado: TStringField;
    ADODSFuncCEP: TStringField;
    ADODSFuncTelefone: TStringField;
    ADODSFuncTelefone_2: TStringField;
    ADODSFuncCelular: TStringField;
    ADODSFuncCelular_2: TStringField;
    ADODSFuncE_mail: TStringField;
    ADODSFuncData_Inclusao: TDateTimeField;
    ADODSFuncData_Alteracao: TDateTimeField;
    ADODSFuncstatus: TStringField;
    ADODSusuariosIDusuario: TAutoIncField;
    ADODSusuariosusuario: TStringField;
    ADODSusuariossenha: TStringField;
    ADOQueryUsuariosIDusuario: TAutoIncField;
    ADOQueryUsuariosusuario: TStringField;
    ADOQueryUsuariossenha: TStringField;
    ADODSManutencaoidManutencao: TAutoIncField;
    ADODSManutencaoidOficina: TIntegerField;
    ADODSManutencaoIDVeiculo: TIntegerField;
    ADODSManutencaoData_Inicio: TDateTimeField;
    ADODSManutencaoData_Termino: TDateTimeField;
    ADODSManutencaoDescricao: TStringField;
    ADODSManutencaoValor: TFloatField;
    ADOQueryManutencaoNomeFantasia: TStringField;
    ADOQueryManutencaoValor: TFloatField;
    ADOQueryManutencaoDescricao: TStringField;
    ADOQueryManutencaoData_Termino: TDateTimeField;
    ADOQueryManutencaoData_Inicio: TDateTimeField;
    ADOQueryManutencaoChassis: TStringField;
    ADOQueryManutencaomodelo: TStringField;
    ADODSManutencaoModelo: TStringField;
    ADODSManutencaoOficina: TStringField;
    procedure ADODSvendas_itemid_veiculoValidate(Sender: TField);
    procedure ADODSvendas_itemNewRecord(DataSet: TDataSet);
    procedure ADODSvendasIDclienteValidate(Sender: TField);
    procedure ADODSvendasIDvendedorValidate(Sender: TField);
    procedure ADODSvendas_itemAfterPost(DataSet: TDataSet);
    procedure ADODSvendas_itemAfterDelete(DataSet: TDataSet);
    procedure ADODSvendasvalor_descChange(Sender: TField);
    procedure ADODSvendas_itemModeloValidate(Sender: TField);
  private
    { Private declarations }
    ValTot: Real;

  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Unitvendascad;

{$R *.dfm}

procedure TDM.ADODSvendasIDclienteValidate(Sender: TField);
begin
  if not FrmVendas.ADOQueryCliente.Locate
      ('IDCLIENTE',ADODSVendasIDCLIENTE.AsInteger,[]) then
begin
  MessageDlg('Cliente não encontrado',
  mtError,[mbOk],0);
  FrmVendas.DBLookupComboBox1.SetFocus;
  Abort;
end;
end;

procedure TDM.ADODSvendasIDvendedorValidate(Sender: TField);
begin
  if not FrmVendas.ADOQueryVendedor.Locate
      ('IDFUNCIONARIO',ADODSVendasIDVENDEDOR.AsInteger,[]) then
begin
  MessageDlg('Vendedor não encontrado',
  mtError,[mbOk],0);
  FrmVendas.DBLookupComboBox2.SetFocus;
  Abort;
end;
end;


procedure TDM.ADODSvendasvalor_descChange(Sender: TField);
begin
    ADODSVendasVALOR_TOTAL.AsFloat:=
    ADODSVendasVALOR_total.AsFloat -
    ADODSVendasVALOR_DESC.AsFloat;
end;

procedure TDM.ADODSvendas_itemAfterDelete(DataSet: TDataSet);
var
  bmk: TBookmark; //ponteiro do DataSource

begin
  with ADODSVendas_Item do
  begin
    bmk:= GetBookmark;
    DisableControls;
    try
      ValTot:= 0.0;
      First;
      while not eof do
      begin
        ValTot:= ValTot + ADODSVendas_ItemValor_UNITario.AsFloat;
        Next;
      end;
    finally
    EnableControls;
    if bmk <> nil then
      begin
        GotoBookmark(Bmk);
        FreeBookmark(bmk);
      end;
    end;
    {if not (ADODSVendas.State in [dsInsert, dsEdit]) then
    begin
       ADODSVendas.Edit;
       //Passa os valores para o total de produtos
       ADODSVendasVALOR_unitario.AsFloat:= ValTot;
       ADODSVendasVALOR_TOTAL.AsFloat:= ValTot;

       if ADODSVendasVALOR_DESC.AsFloat > 0 then
       ADODSVendasVALOR_TOTAL.AsFloat:= ADODSVendasVALOR_unitario.AsFloat -
            ADODSVendasVALOR_DESC.AsFloat;
    end
       else
       ADODSVendasVALOR_DESC.AsFloat:= 0;}
  end;
end;

procedure TDM.ADODSvendas_itemAfterPost(DataSet: TDataSet);
var
  bmk: TBookmark; //ponteiro do DataSource

begin
  with ADODSVendas_Item do
  begin
    bmk:= GetBookmark;
    DisableControls;
    try
      ValTot:= 0.0;
      First;
      while not eof do
      begin
        ValTot:= ValTot + ADODSVendas_ItemValor_UNITario.AsFloat;
        Next;
      end;
    finally
    EnableControls;
    if bmk <> nil then
      begin
        GotoBookmark(Bmk);
        FreeBookmark(bmk);
      end;
    end;
   { if not (ADODSVendas.State in [dsInsert, dsEdit]) then
    begin
       ADODSVendas.Edit;
       //Passa os valores para o total de produtos
       ADODSVendasVALOR_unitario.AsFloat:= ValTot;
       ADODSVendasVALOR_TOTAL.AsFloat:= ValTot;

       if ADODSVendasVALOR_DESC.AsFloat > 0 then
       ADODSVendasVALOR_TOTAL.AsFloat:= ADODSVendasVALOR_unitario.AsFloat -
            ADODSVendasVALOR_DESC.AsFloat;
    end
       else
       ADODSVendasVALOR_DESC.AsFloat:= 0; }
  end;
end;

procedure TDM.ADODSvendas_itemid_veiculoValidate(Sender: TField);
begin
  if not ADOQueryveiculos.Locate
      ('IDVeiculo',ADODSVendas_ItemID_veiculo.AsInteger,[]) then
begin
  MessageDlg('Produto não encontrado',
  mtError,[mbOk],0);
  Abort;
end
else
begin

  ADODSVendas_ItemValor_unitario.AsFloat:=
      ADOQueryVeiculosVALOR.AsFloat;
  ADODSVendas_ItemValor_TOTAL.AsFloat:=
      ADOQueryVeiculosVALOR.AsFloat;
end;
end;

procedure TDM.ADODSvendas_itemModeloValidate(Sender: TField);

begin
  if not ADOQueryveiculos.Locate
      ('IDveiculo',ADODSVendas_ItemID_veiculo.AsInteger,[]) then
begin
  MessageDlg('Produto não encontrado',
  mtError,[mbOk],0);
  Abort;
end
else
begin

  ADODSVendas_ItemValor_unitario.AsFloat:=
      ADOQueryveiculosVALOR.AsFloat;
  ADODSVendas_ItemValor_TOTAL.AsFloat:=
      ADOQueryveiculosVALOR.AsFloat;
end;
end;

procedure TDM.ADODSvendas_itemNewRecord(DataSet: TDataSet);
begin
ADODSvendas_itemid_venda.asinteger:= ADODSvendasIDvenda.AsInteger;
valtot:= valtot- strtofloat( frmvendas.DBEdit3.Text);
frmvendas.DBEdit4.Text:= floattostr(valtot);


end;

end.
