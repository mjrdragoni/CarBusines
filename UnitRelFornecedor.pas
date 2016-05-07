unit UnitRelFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, frxExportImage, frxExportRTF,
  frxExportPDF, frxClass, frxExportHTML, Data.Win.ADODB, frxDBSet, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  Tfrmrelfornecedor = class(TForm)
    Panel1: TPanel;
    edtCodigoDe: TLabeledEdit;
    edtCodigoAte: TLabeledEdit;
    edtNomeDe: TLabeledEdit;
    edtNomeAte: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    frxDBDataset1: TfrxDBDataset;
    ADOQryforn: TADOQuery;
    frxReport1: TfrxReport;
    frxHTMLExport1: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    ADOQryfornIDfornecedor: TAutoIncField;
    ADOQryfornCPF_CNPJ: TStringField;
    ADOQryfornTipo: TStringField;
    ADOQryfornNome_RazaoSocial: TStringField;
    ADOQryfornNomeFantasia: TStringField;
    ADOQryfornIE_RG: TStringField;
    ADOQryfornEndereco: TStringField;
    ADOQryfornComplemento: TStringField;
    ADOQryfornCidade: TStringField;
    ADOQryfornBairro: TStringField;
    ADOQryfornEstado: TStringField;
    ADOQryfornCEP: TStringField;
    ADOQryfornTelefone: TStringField;
    ADOQryfornCelular: TStringField;
    ADOQryfornCelular_2: TStringField;
    ADOQryfornFax: TStringField;
    ADOQryfornE_mail: TStringField;
    ADOQryfornData_Inclusao: TDateTimeField;
    ADOQryfornData_Alteracao: TDateTimeField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelfornecedor: Tfrmrelfornecedor;

implementation

{$R *.dfm}

uses UnitDM;

procedure Tfrmrelfornecedor.Button1Click(Sender: TObject);
var StrLiga: String;
begin
  StrLiga:= 'where ';
  ADOQryforn.Close;
  with ADOQryforn.SQL do
  begin
    Clear;
    Add('select * from fornecedores  ');
    if edtCodigoDe.Text <> '' then
    try
      StrToInt(edtCodigoDe.Text);
      Add(StrLiga+'IDfornecedor >= '+EdtCodigoDe.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do ;
    end;
    if edtCodigoAte.Text <> '' then
    try
      StrToInt(edtCodigoAte.Text);
      Add(StrLiga+'IDfornecedor <= '+EdtCodigoAte.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do ;
    end;
    if edtNomeDe.Text <> '' then
    begin
      Add(StrLiga+'Nome_RazaoSocial >= '''
            + edtNomeDe.Text + '''');
      StrLiga:= ' and ';
    end;
    if edtNomeAte.Text <> '' then
    begin
      Add(StrLiga+'Nome_RazaoSocial <= '''
            + edtNomeAte.Text + 'zzz''');
      StrLiga:= ' and ';
    end;
        case RadioGroup1.ItemIndex of
      0: Add(' order by IDfornecedor');
      1: Add(' order by Nome_RazaoSocial');
      2: Add(' order by Cidade');
    end;
  end;
  ADOQryforn.Open;
  frxReport1.ShowReport();
end;


procedure Tfrmrelfornecedor.Button2Click(Sender: TObject);
begin
close;
end;

end.
