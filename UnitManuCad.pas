unit UnitManuCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ToolWin, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Data.DB,
  Data.Win.ADODB;

type
  TFrmManu = class(TForm)
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton4: TToolButton;
    btn_salvar: TToolButton;
    Btn_cancelar: TToolButton;
    ToolButton5: TToolButton;
    btn_sair: TToolButton;
    Pnlmanut: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
    StatusBar1: TStatusBar;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    DSOficina: TDataSource;
    ADOQryOficina: TADOQuery;
    DSveiculo: TDataSource;
    ADOQueryVeiculo: TADOQuery;
    ADOQryOficinaIDOficina: TAutoIncField;
    ADOQryOficinaCNPJ: TStringField;
    ADOQryOficinaRazaoSocial: TStringField;
    ADOQryOficinaNomeFantasia: TStringField;
    ADOQryOficinaIE: TStringField;
    ADOQryOficinaEndereco: TStringField;
    ADOQryOficinaComplemento: TStringField;
    ADOQryOficinaCidade: TStringField;
    ADOQryOficinaBairro: TStringField;
    ADOQryOficinaEstado: TStringField;
    ADOQryOficinaCEP: TStringField;
    ADOQryOficinaTelefone: TStringField;
    ADOQryOficinaCelular: TStringField;
    ADOQryOficinaCelular_2: TStringField;
    ADOQryOficinaFax: TStringField;
    ADOQryOficinaE_mail: TStringField;
    ADOQryOficinaData_Inclusao: TDateTimeField;
    ADOQryOficinaData_Alteracao: TDateTimeField;
    ADOQueryVeiculoIDveiculo: TAutoIncField;
    ADOQueryVeiculoChassis: TStringField;
    ADOQueryVeiculoIDFornecedor: TIntegerField;
    ADOQueryVeiculoMarca: TStringField;
    ADOQueryVeiculoModelo: TStringField;
    ADOQueryVeiculoCor: TStringField;
    ADOQueryVeiculoDescricao: TStringField;
    ADOQueryVeiculoValor: TBCDField;
    ADOQueryVeiculoano: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure Btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManu: TFrmManu;

implementation

{$R *.dfm}

uses UnitDM, UnitManuMan, UnitOfiCad, UnitOficiman, UnitVeicMan,
  UnitVeiculosCad;

procedure TFrmManu.Btn_cancelarClick(Sender: TObject);
begin


Application.MessageBox(
'A alteração ou a inclusão deste registo foi abortada.',
'Atenção', MB_OK+MB_ICONERROR);

BTN_SALVAR.Enabled:= false;
btn_cancelar.Enabled:= false;
btn_sair.Enabled:=true;
pnlmanut.Enabled:=FALSE;
end;

procedure TFrmManu.btn_sairClick(Sender: TObject);
begin
close;
end;

procedure TFrmManu.btn_salvarClick(Sender: TObject);
begin
DM.ADODSManutencao.Post;


Application.MessageBox(
'O registro foi incluído ou alterado com sucesso.',
'Informação', MB_OK+MB_ICONINFORMATION);

BTN_SALVAR.Enabled:= false;
btn_cancelar.Enabled:= false;
btn_sair.Enabled:=true;
pnlmanut.Enabled:=FALSE;
end;

procedure TFrmManu.FormActivate(Sender: TObject);
var data:tdatetime;
begin
ADOQueryveiculo.Close;
ADOQueryveiculo.Open;
ADOQryoficina.Close;
ADOQryoficina.Open;
data:=now;
dbedit3.Text:= datetostr(data);

end;

procedure TFrmManu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ADOQueryveiculo.Close;
ADOQryoficina.close;
end;

end.
