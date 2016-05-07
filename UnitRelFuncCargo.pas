unit UnitRelFuncCargo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxChart, frxExportImage, frxExportRTF,
  frxExportPDF, frxClass, frxExportHTML, Data.DB, Data.Win.ADODB, frxDBSet,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tfrmrelfuncargo = class(TForm)
    Panel1: TPanel;
    datade: TLabeledEdit;
    dataate: TLabeledEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    frxDBDataset1: TfrxDBDataset;
    ADOQrycargo: TADOQuery;
    frxReport1: TfrxReport;
    frxHTMLExport1: TfrxHTMLExport;
    frmrelveic: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxChartObject1: TfrxChartObject;
    ADOQrycargoCargo: TStringField;
    ADOQrycargoQuantidade: TIntegerField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelfuncargo: Tfrmrelfuncargo;

implementation

{$R *.dfm}

procedure Tfrmrelfuncargo.Button1Click(Sender: TObject);
var StrLiga: String;
    Data: TDateTime;
begin
  StrLiga:= ' where ';
  ADOQrycargo.Close;
  with ADOQrycargo.SQL do
  begin
    Clear;
    Add('SELECT Cargos.Cargo, COUNT(funcionarios.Nome) AS Quantidade '+
   'FROM Cargos INNER JOIN funcionarios ON Cargos.idCargo = funcionarios.IDcargo');

    if datade.Text <> '  /  /    ' then
    try
      Data:= StrToDate(datade.Text);
      Add(StrLiga+'funcionarios.data_inclusao >= ''' +
      FormatDateTime('DD/MM/YYYY', Data)+'''');
      StrLiga:= ' and ';
    except
      on EConvertError do ;
    end;

    if dataate.Text <> '  /  /    ' then
    try
      Data:= StrToDate(dataate.Text);
      Add(StrLiga+'funcionarios.data_inclusao <= ''' +
      FormatDateTime('DD/MM/YYYY', Data)+'''');
    except
      on EConvertError do ;
    end;
    Add(' group by cargos.cargo ');
    Add('order by cargos.cargo ');
  end;
  ADOQrycargo.Open;
  frxReport1.ShowReport();
end;


end.
