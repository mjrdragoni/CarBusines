unit Unitrelcargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, frxExportImage, frxExportRTF,
  frxExportPDF, frxClass, frxExportHTML, Data.Win.ADODB, frxDBSet, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  Tfrmrelcargos = class(TForm)
    Panel1: TPanel;
    edtCodigoDe: TLabeledEdit;
    edtNomeDe: TLabeledEdit;
    edtNomeAte: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    edtCodigoAte: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    frxDBDataset1: TfrxDBDataset;
    ADOQrycargos: TADOQuery;
    frxReport1: TfrxReport;
    frxHTMLExport1: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    ADOQrycargosidCargo: TAutoIncField;
    ADOQrycargosiddpto: TIntegerField;
    ADOQrycargosCargo: TStringField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelcargos: Tfrmrelcargos;

implementation

{$R *.dfm}

procedure Tfrmrelcargos.Button1Click(Sender: TObject);
var StrLiga: String;
begin
  StrLiga:= 'where ';
  ADOQrycargos.Close;
  with ADOQrycargos.SQL do
  begin
    Clear;
    Add('SELECT * from cargos');

     if edtCodigoDe.Text <> '' then
    try
      StrToInt(edtCodigoDe.Text);
      Add(StrLiga+'idcargo >= '+EdtCodigoDe.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do ;
    end;
    if edtCodigoAte.Text <> '' then
    try
      StrToInt(edtCodigoAte.Text);
      Add(StrLiga+'idcargo <= '+EdtCodigoAte.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do ;
    end;
    if edtNomeDe.Text <> '' then
    begin
      Add(StrLiga+'cargo >= '''
            + edtNomeDe.Text + '''');
      StrLiga:= ' and ';
    end;
    if edtNomeAte.Text <> '' then
    begin
      Add(StrLiga+'cargo <= '''
            + edtNomeAte.Text + 'zzz''');
      StrLiga:= ' and ';
    end;
        case RadioGroup1.ItemIndex of
      0: Add(' order by idcargo');
      1: Add(' order by cargo');


    end;
  end;
  ADOQrycargos.Open;
  frxReport1.ShowReport();
end;

end.
