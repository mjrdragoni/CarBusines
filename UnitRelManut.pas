unit UnitRelManut;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, frxExportImage, frxExportRTF,
  frxExportPDF, frxClass, frxExportHTML, Data.Win.ADODB, frxDBSet, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  Tftmrelmanut = class(TForm)
    Panel1: TPanel;
    edtCodigoDe: TLabeledEdit;
    edtCodigoAte: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    frxDBDataset1: TfrxDBDataset;
    ADOQrymanut: TADOQuery;
    frxReport1: TfrxReport;
    frxHTMLExport1: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    ADOQrymanutNomeFantasia: TStringField;
    ADOQrymanutValor: TFloatField;
    ADOQrymanutDescricao: TStringField;
    ADOQrymanutData_Termino: TDateTimeField;
    ADOQrymanutData_Inicio: TDateTimeField;
    ADOQrymanutChassis: TStringField;
    ADOQrymanutmodelo: TStringField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ftmrelmanut: Tftmrelmanut;

implementation

{$R *.dfm}

procedure Tftmrelmanut.Button1Click(Sender: TObject);
var StrLiga: String;
begin
  StrLiga:= 'where ';
  ADOQrymanut.Close;
  with ADOQrymanut.SQL do
  begin
    Clear;
    Add('SELECT Oficinas.NomeFantasia, Manutencoes.Valor, '+
 'Manutencoes.Descricao, Manutencoes.Data_Termino, Manutencoes.Data_Inicio, '+
  'Veiculos.Chassis, Veiculos.modelo '+
  'FROM  Manutencoes INNER JOIN ' +
  'Oficinas ON Manutencoes.idOficina = Oficinas.IDOficina INNER JOIN '+
   'Veiculos ON Manutencoes.IDVeiculo = Veiculos.IDveiculo');
    if edtCodigoDe.Text <> '' then
    try
      StrToInt(edtCodigoDe.Text);
      Add(StrLiga+'IDmanutencao >= '+EdtCodigoDe.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do ;
    end;
    if edtCodigoAte.Text <> '' then
    try
      StrToInt(edtCodigoAte.Text);
      Add(StrLiga+'IDmanutencao <= '+EdtCodigoAte.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do ;
    end;


        case RadioGroup1.ItemIndex of
      0: Add(' order by IDmanutencao');
      1: Add(' order by nomefantasia');
      2: Add(' order by modelo');
    end;

  end;
  ADOQrymanut.Open;
  frxReport1.ShowReport();
end;
end.
