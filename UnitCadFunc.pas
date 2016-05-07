unit UnitCadFunc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ToolWin, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Data.DB,
  Data.Win.ADODB;

type
  TFrmFunc = class(TForm)
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btn_salvar: TToolButton;
    Btn_cancelar: TToolButton;
    ToolButton5: TToolButton;
    btn_sair: TToolButton;
    Pnlcli: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label1: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    estados: TDBComboBox;
    DBEdit7: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit14: TDBEdit;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label14: TLabel;
    ToolButton1: TToolButton;
    DScargo: TDataSource;
    ADOQuerycargo: TADOQuery;
    ADOQuerycargoidCargo: TAutoIncField;
    ADOQuerycargoCargo: TStringField;
    procedure btn_salvarClick(Sender: TObject);
    procedure Btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFunc: TFrmFunc;

implementation

{$R *.dfm}

uses UnitDM, UnitCargoCad, UnitCargoMan;

procedure TFrmFunc.Btn_cancelarClick(Sender: TObject);
begin
estados.Clear;
DM.ADODSFunc.cancel;
Application.MessageBox(
'A alteração ou a inclusão deste registo foi abortada.',
'Atenção', MB_OK+MB_ICONERROR);

BTN_SALVAR.Enabled:= false;
btn_cancelar.Enabled:= false;
btn_sair.Enabled:=true;
pnlcli.Enabled:=FALSE;
end;

procedure TFrmFunc.btn_sairClick(Sender: TObject);
begin
close;
end;

procedure TFrmFunc.btn_salvarClick(Sender: TObject);
begin
estados.Clear;
dbedit14.text:= datetostr(date);
DM.ADODSFunc.Post;
Application.MessageBox(
'O registro foi incluído ou alterado com sucesso.',
'Informação', MB_OK+MB_ICONINFORMATION);

BTN_SALVAR.Enabled:= false;
btn_cancelar.Enabled:= false;
btn_sair.Enabled:=true;
pnlcli.Enabled:=FALSE;
end;
procedure TFrmFunc.FormActivate(Sender: TObject);
var data:tdatetime;
begin
data:=now;
dbedit13.Text:= datetostr(data);


estados.Items.Add('AC');
estados.Items.Add('AL');
estados.Items.Add('AM');
estados.Items.Add('AP');
estados.Items.Add('BA');
estados.Items.Add('CE');
estados.Items.Add('DF');
estados.Items.Add('ES');
estados.Items.Add('GO');
estados.Items.Add('MA');
estados.Items.Add('MT');
estados.Items.Add('MS');
estados.Items.Add('MG');
estados.Items.Add('PA');
estados.Items.Add('PB');
estados.Items.Add('PR');
estados.Items.Add('PE');
estados.Items.Add('PI');
estados.Items.Add('RJ');
estados.Items.Add('RN');
estados.Items.Add('RS');
estados.Items.Add('RO');
estados.Items.Add('RR');
estados.Items.Add('SC');
estados.Items.Add('SP');
estados.Items.Add('SE');
estados.Items.Add('TO');


ADOQuerycargo.Close;
ADOQuerycargo.Open;





end;

procedure TFrmFunc.FormClose(Sender: TObject; var Action: TCloseAction);
begin

ADOQuerycargo.Close;
end;

end.
