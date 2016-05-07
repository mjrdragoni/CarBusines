unit UnitRelCargoFunc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, frxChart,
  frxExportImage, frxExportRTF, frxExportPDF, frxClass, frxExportHTML, frxDBSet,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    datade: TLabeledEdit;
    dataate: TLabeledEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxHTMLExport1: TfrxHTMLExport;
    frmrelveic: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxChartObject1: TfrxChartObject;
    ADOQrycargo: TADOQuery;
    ADOQrycargoCargo: TStringField;
    ADOQrycargoQuantidade: TIntegerField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var StrLiga: String;
    Data: TDateTime;
begin
  StrLiga:= ' where ';
  ADOQrycargo.Close;
  with ADOQrycargo.SQL do
  begin
    Clear;
    Add('SELECT Veiculos.Marca, '+
    'COUNT(Venda_item.id_venda) as qtde '+
    'FROM Vendas INNER JOIN '+
    'Venda_item ON '+
    'Vendas.IDvenda = Venda_item.Id_venda '+
    'INNER JOIN Veiculos ON '+
    'Venda_item.id_veiculo = Veiculos.IDVeiculo');

    if datade.Text <> '  /  /    ' then
    try
      Data:= StrToDate(datade.Text);
      Add(StrLiga+'Vendas.data_incl >= ''' +
      FormatDateTime('DD/MM/YYYY', Data)+'''');
      StrLiga:= ' and ';
    except
      on EConvertError do ;
    end;

    if dataate.Text <> '  /  /    ' then
    try
      Data:= StrToDate(dataate.Text);
      Add(StrLiga+'Vendas.data_incl <= ''' +
      FormatDateTime('DD/MM/YYYY', Data)+'''');
    except
      on EConvertError do ;
    end;
    Add(' group by Veiculos.Marca ');
    Add('order by Veiculos.Marca ');
  end;
  ADOQrycargo.Open;
  frxReport1.ADOQrycargo();
end;


end.
