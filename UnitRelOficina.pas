unit UnitRelOficina;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, frxExportImage, frxExportRTF,
  frxExportPDF, frxClass, frxExportHTML, Data.Win.ADODB, frxDBSet, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFrmRelOficina = class(TForm)
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
    ADOQryCliIDOficina: TAutoIncField;
    ADOQryCliCNPJ: TStringField;
    ADOQryCliRazaoSocial: TStringField;
    ADOQryCliNomeFantasia: TStringField;
    ADOQryCliIE: TStringField;
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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelOficina: TFrmRelOficina;

implementation

{$R *.dfm}

procedure TFrmRelOficina.Button1Click(Sender: TObject);
var StrLiga: String;
begin
  StrLiga:= 'where ';
  ADOQryCli.Close;
  with ADOQryCli.SQL do
  begin
    Clear;
    Add('select * from Oficinas  ');
    if edtCodigoDe.Text <> '' then
    try
      StrToInt(edtCodigoDe.Text);
      Add(StrLiga+'IDOficina >= '+EdtCodigoDe.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do ;
    end;
    if edtCodigoAte.Text <> '' then
    try
      StrToInt(edtCodigoAte.Text);
      Add(StrLiga+'IDOficina <= '+EdtCodigoAte.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do ;
    end;
    if edtNomeDe.Text <> '' then
    begin
      Add(StrLiga+'RazaoSocial >= '''
            + edtNomeDe.Text + '''');
      StrLiga:= ' and ';
    end;
    if edtNomeAte.Text <> '' then
    begin
      Add(StrLiga+'RazaoSocial <= '''
            + edtNomeAte.Text + 'zzz''');
      StrLiga:= ' and ';
    end;
        case RadioGroup1.ItemIndex of
      0: Add(' order by IDOficina');
      1: Add(' order by RazaoSocial');
      2: Add(' order by Cidade');
    end;
  end;
  ADOQryCli.Open;
  frxReport1.ShowReport();
end;

procedure TFrmRelOficina.Button2Click(Sender: TObject);
begin
Close;
end;

end.
