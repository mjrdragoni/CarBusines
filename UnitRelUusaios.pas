unit UnitRelUusaios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxExportImage, frxExportRTF,
  frxExportPDF, frxClass, frxExportHTML, Data.DB, Data.Win.ADODB, frxDBSet,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tfrmrelusuarios = class(TForm)
    Panel1: TPanel;
    edtCodigoDe: TLabeledEdit;
    edtNomeDe: TLabeledEdit;
    edtNomeAte: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    edtCodigoAte: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    frxDBDataset1: TfrxDBDataset;
    ADOQryusuarios: TADOQuery;
    frxReport1: TfrxReport;
    frxHTMLExport1: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    ADOQryusuariosIDusuario: TAutoIncField;
    ADOQryusuariosusuario: TStringField;
    ADOQryusuariossenha: TStringField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelusuarios: Tfrmrelusuarios;

implementation

{$R *.dfm}

procedure Tfrmrelusuarios.Button1Click(Sender: TObject);
var StrLiga: String;
begin
  StrLiga:= 'where ';
  ADOQryusuarios.Close;
  with ADOQryusuarios.SQL do
  begin
    Clear;
    Add('SELECT * from usuarios');

     if edtCodigoDe.Text <> '' then
    try
      StrToInt(edtCodigoDe.Text);
      Add(StrLiga+'idusuario >= '+EdtCodigoDe.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do ;
    end;
    if edtCodigoAte.Text <> '' then
    try
      StrToInt(edtCodigoAte.Text);
      Add(StrLiga+'idusuario <= '+EdtCodigoAte.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do ;
    end;
    if edtNomeDe.Text <> '' then
    begin
      Add(StrLiga+'usuario >= '''
            + edtNomeDe.Text + '''');
      StrLiga:= ' and ';
    end;
    if edtNomeAte.Text <> '' then
    begin
      Add(StrLiga+'usuario <= '''
            + edtNomeAte.Text + 'zzz''');
      StrLiga:= ' and ';
    end;
        case RadioGroup1.ItemIndex of
      0: Add(' order by idusuario');
      1: Add(' order by usuario');


    end;
  end;
  ADOQryusuarios.Open;
  frxReport1.ShowReport();
end;


end.
