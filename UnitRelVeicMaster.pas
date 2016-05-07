unit UnitRelVeicmaster;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, frxExportImage, frxExportRTF,
  frxExportPDF, frxClass, frxExportHTML, Data.Win.ADODB, frxDBSet, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFrmRelVeicMaster = class(TForm)
    Panel1: TPanel;
    edtNumVend: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    DSLigacao: TDataSource;
    ADOryVenda: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQryVenda_Itens: TADOQuery;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxHTMLExport1: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    ADOryVendaIDvenda: TAutoIncField;
    ADOryVendaIDcliente: TIntegerField;
    ADOryVendaIDvendedor: TIntegerField;
    ADOryVendavalor_total: TBCDField;
    ADOryVendadata_incl: TDateTimeField;
    ADOryVendadata_alt: TDateTimeField;
    ADOryVendavalor_desc: TBCDField;
    ADOryVendavalor_unitario: TBCDField;
    ADOryVendaCPF_CNPJ: TStringField;
    ADOryVendaNome_RazaoSocial: TStringField;
    ADOryVendaNomeFantasia: TStringField;
    ADOryVendaEndereco: TStringField;
    ADOryVendaCidade: TStringField;
    ADOryVendaBairro: TStringField;
    ADOryVendaEstado: TStringField;
    ADOryVendaCEP: TStringField;
    ADOryVendaNome: TStringField;
    ADOQryVenda_Itensid_venda: TIntegerField;
    ADOQryVenda_Itensid_veiculo: TIntegerField;
    ADOQryVenda_Itensvalor_unitario: TBCDField;
    ADOQryVenda_Itensvalor_total: TBCDField;
    ADOQryVenda_ItensModelo: TStringField;
    ADOQryVenda_ItensAno: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelVeicMaster: TFrmRelVeicMaster;

implementation

{$R *.dfm}

uses UnitDM, UnitVeicMan, UnitVeiculosCad, Unitvendascad;

procedure TFrmRelVeicMaster.Button1Click(Sender: TObject);
begin
  ADOryVenda.Close;
  ADOQryVenda_Itens.Close;
  with ADOryVenda.SQL do
  begin
    clear;
    Add('SELECT  Vendas.*,Clientes.CPF_CNPJ, '+
    'Clientes.Nome_RazaoSocial,Clientes.NomeFantasia, '+
    'Clientes.Endereco,Clientes.Cidade, '+
    'Clientes.Bairro,Clientes.Estado, '+
    'Clientes.CEP,funcionarios.Nome '+
    'FROM Clientes INNER JOIN '+
    ' Vendas ON Clientes.IDCliente = Vendas.IDCliente '+
    'INNER JOIN '+
    ' funcionarios ON Vendas.IDVendedor = funcionarios.IDFuncionario ');

    if edtNumVend.Text <> '' then
    try
      StrToInt(edtNumVend.Text);
      Add('where Vendas.IDVenda = ' + edtNumVend.Text);
    except
      on EConvertError do ;
    end;
  end;
  ADOryVenda.Open;
 ADOQryVenda_Itens.Open;
  frxReport1.ShowReport();
end;

procedure TFrmRelVeicMaster.Button2Click(Sender: TObject);
begin
Close;
end;

procedure TFrmRelVeicMaster.FormActivate(Sender: TObject);
begin
edtNumVend.Clear;
end;

procedure TFrmRelVeicMaster.FormCreate(Sender: TObject);
begin
Close;
end;

end.






