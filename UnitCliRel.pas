unit UnitCliRel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, frxClass,
  Data.DB, Data.Win.ADODB, frxGradient,frxDBSet, frxExportRTF, frxExportPDF,
  frxExportHTML, frxExportImage;

type
  TFrmRelCli = class(TForm)
    Panel1: TPanel;
    edtCodigoDe: TLabeledEdit;
    edtCodigoAte: TLabeledEdit;
    edtNomeDe: TLabeledEdit;
    edtNomeAte: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    frxDBDataset1: TfrxDBDataset;
    ADOQryCli: TADOQuery;
    frxReport1: TfrxReport;
    frxHTMLExport1: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    ADOQryCliIDcliente: TAutoIncField;
    ADOQryCliCPF_CNPJ: TStringField;
    ADOQryCliTipo: TStringField;
    ADOQryCliNome_RazaoSocial: TStringField;
    ADOQryCliNomeFantasia: TStringField;
    ADOQryCliIE_RG: TStringField;
    ADOQryCliEndereco: TStringField;
    ADOQryCliComplemento: TStringField;
    ADOQryCliCidade: TStringField;
    ADOQryCliBairro: TStringField;
    ADOQryCliEstado: TStringField;
    ADOQryCliCEP: TStringField;
    ADOQryCliTelefone: TStringField;
    ADOQryCliCelular: TStringField;
    ADOQryCliCelular_2: TStringField;
    ADOQryCliFax: TStringField;
    ADOQryCliE_mail: TStringField;
    ADOQryCliData_Inclusao: TDateTimeField;
    ADOQryCliData_Alteracao: TDateTimeField;
    ADOQryClistatus: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCli: TFrmRelCli;

implementation

{$R *.dfm}

uses UnitDM;

procedure TFrmRelCli.Button1Click(Sender: TObject);
var StrLiga: String;
begin
  StrLiga:= 'where ';
  ADOQryCli.Close;
  with ADOQryCli.SQL do
  begin
    Clear;
    Add('select * from Clientes  ');
    if edtCodigoDe.Text <> '' then
    try
      StrToInt(edtCodigoDe.Text);
      Add(StrLiga+'IDcliente >= '+EdtCodigoDe.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do ;
    end;
    if edtCodigoAte.Text <> '' then
    try
      StrToInt(edtCodigoAte.Text);
      Add(StrLiga+'IDcliente <= '+EdtCodigoAte.Text);
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
      0: Add(' order by IDcliente');
      1: Add(' order by Nome_RazaoSocial');
      2: Add(' order by Cidade');
    end;
  end;
  ADOQryCli.Open;
  frxReport1.ShowReport();
end;

procedure TFrmRelCli.Button2Click(Sender: TObject);
begin
Close;
end;

procedure TFrmRelCli.FormActivate(Sender: TObject);
begin
edtCodigoDe.Clear;
  edtCodigoAte.Clear;
  edtNomeDe.Clear;
  edtNomeAte.Clear;
  RadioGroup1.ItemIndex:= 0;
end;

end.
