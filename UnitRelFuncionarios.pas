unit UnitRelFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, frxExportImage, frxExportRTF,
  frxExportPDF, frxClass, frxExportHTML, Data.Win.ADODB, frxDBSet, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  Tfrmrelfunc = class(TForm)
    Panel1: TPanel;
    edtCodigoDe: TLabeledEdit;
    edtNomeDe: TLabeledEdit;
    edtNomeAte: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    frxDBDataset1: TfrxDBDataset;
    ADOQryfunc: TADOQuery;
    frxReport1: TfrxReport;
    frxHTMLExport1: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    ADOQryfuncIDFuncionario: TAutoIncField;
    ADOQryfuncIDcargo: TIntegerField;
    ADOQryfuncNome: TStringField;
    ADOQryfuncCPF: TStringField;
    ADOQryfuncRG: TStringField;
    ADOQryfuncEndereco: TStringField;
    ADOQryfuncComplemento: TStringField;
    ADOQryfuncCidade: TStringField;
    ADOQryfuncBairro: TStringField;
    ADOQryfuncEstado: TStringField;
    ADOQryfuncCEP: TStringField;
    ADOQryfuncTelefone: TStringField;
    ADOQryfuncTelefone_2: TStringField;
    ADOQryfuncCelular: TStringField;
    ADOQryfuncCelular_2: TStringField;
    ADOQryfuncE_mail: TStringField;
    ADOQryfuncData_Inclusao: TDateTimeField;
    ADOQryfuncData_Alteracao: TDateTimeField;
    ADOQryfuncstatus: TStringField;
    ADOQryfuncCargo: TStringField;
    ADOQryfuncDepartamento: TStringField;
    edtCodigoAte: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelfunc: Tfrmrelfunc;

implementation

{$R *.dfm}

procedure Tfrmrelfunc.Button1Click(Sender: TObject);
var StrLiga: String;
begin
  StrLiga:= 'where ';
  ADOQryfunc.Close;
  with ADOQryfunc.SQL do
  begin
    Clear;
    Add('SELECT funcionarios.*, Cargos.Cargo, Departamentos.Departamento ' +
        'FROM Cargos INNER JOIN '+
        'Departamentos ON Cargos.iddpto = Departamentos.idDepartamento ' +
        'INNER JOIN ' +
        'funcionarios ON Cargos.idCargo = funcionarios.IDcargo ');

     if edtCodigoDe.Text <> '' then
    try
      StrToInt(edtCodigoDe.Text);
      Add(StrLiga+'IDfuncionario >= '+EdtCodigoDe.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do ;
    end;
    if edtCodigoAte.Text <> '' then
    try
      StrToInt(edtCodigoAte.Text);
      Add(StrLiga+'IDfuncionario <= '+EdtCodigoAte.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do ;
    end;
    if edtNomeDe.Text <> '' then
    begin
      Add(StrLiga+'Nome >= '''
            + edtNomeDe.Text + '''');
      StrLiga:= ' and ';
    end;
    if edtNomeAte.Text <> '' then
    begin
      Add(StrLiga+'Nome <= '''
            + edtNomeAte.Text + 'zzz''');
      StrLiga:= ' and ';
    end;
        case RadioGroup1.ItemIndex of
      0: Add(' order by CPF');
      1: Add(' order by Nome');
      2: Add(' order by Cargo');
    end;
  end;
  ADOQryfunc.Open;
  frxReport1.ShowReport();
end;

procedure TFrmRelfunc.Button2Click(Sender: TObject);
begin
Close;
end;



end.
