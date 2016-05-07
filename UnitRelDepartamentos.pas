unit UnitRelDepartamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxExportImage, frxExportRTF,
  frxExportPDF, frxClass, frxExportHTML, Data.DB, Data.Win.ADODB, frxDBSet,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tfrmreldep = class(TForm)
    Panel1: TPanel;
    edtCodigoDe: TLabeledEdit;
    edtNomeDe: TLabeledEdit;
    edtNomeAte: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    frxDBDataset1: TfrxDBDataset;
    ADOQrydep: TADOQuery;
    frxReport1: TfrxReport;
    frxHTMLExport1: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    edtCodigoAte: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    ADOQrydepidDepartamento: TAutoIncField;
    ADOQrydepDepartamento: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmreldep: Tfrmreldep;

implementation

{$R *.dfm}

procedure Tfrmreldep.Button1Click(Sender: TObject);
var StrLiga: String;
begin
  StrLiga:= 'where ';
  ADOQrydep.Close;
  with ADOQrydep.SQL do
  begin
    Clear;
    Add('SELECT * from departamentos');

     if edtCodigoDe.Text <> '' then
    try
      StrToInt(edtCodigoDe.Text);
      Add(StrLiga+'IDdepartamento >= '+EdtCodigoDe.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do ;
    end;
    if edtCodigoAte.Text <> '' then
    try
      StrToInt(edtCodigoAte.Text);
      Add(StrLiga+'IDdepartamento <= '+EdtCodigoAte.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do ;
    end;
    if edtNomeDe.Text <> '' then
    begin
      Add(StrLiga+'Departamento >= '''
            + edtNomeDe.Text + '''');
      StrLiga:= ' and ';
    end;
    if edtNomeAte.Text <> '' then
    begin
      Add(StrLiga+'Departamento <= '''
            + edtNomeAte.Text + 'zzz''');
      StrLiga:= ' and ';
    end;
        case RadioGroup1.ItemIndex of
      0: Add(' order by iddepartamento');
      1: Add(' order by departamento');


    end;
  end;
  ADOQrydep.Open;
  frxReport1.ShowReport();
end;
procedure Tfrmreldep.Button2Click(Sender: TObject);
begin
close;
end;

end.
