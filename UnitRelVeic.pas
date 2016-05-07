unit UnitRelVeic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, frxExportImage, frxExportRTF,
  frxExportPDF, frxClass, frxExportHTML, Data.Win.ADODB, frxDBSet, Vcl.StdCtrls,
  Vcl.ExtCtrls, frxChart, Vcl.Buttons;

type
  TFrmRelVeic = class(TForm)
    Panel1: TPanel;
    datade: TLabeledEdit;
    dataate: TLabeledEdit;
    Button1: TButton;
    frxDBDataset1: TfrxDBDataset;
    ADOQryVei: TADOQuery;
    frxReport1: TfrxReport;
    frxHTMLExport1: TfrxHTMLExport;
    frmrelveic: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    ADOQryVeiMarca: TStringField;
    ADOQryVeiqtde: TIntegerField;
    frxChartObject1: TfrxChartObject;
    BitBtn1: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelVeic: TFrmRelVeic;

implementation

{$R *.dfm}

uses UnitDM, UnitVeicMan, UnitVeiculosCad;

procedure TFrmRelVeic.BitBtn1Click(Sender: TObject);
begin
Close;
end;

procedure TFrmRelVeic.Button1Click(Sender: TObject);
var StrLiga: String;
    Data: TDateTime;
begin
  StrLiga:= ' where ';
  ADOQryVei.Close;
  with ADOQryVei.SQL do
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
  ADOQryVei.Open;
  frxReport1.ShowReport();
end;

end.
