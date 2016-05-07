unit UnitVeiculosCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  Data.DB, Data.Win.ADODB;

type
  TFrmVeicCad = class(TForm)
    Pnlveic: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit15: TDBEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton4: TToolButton;
    btn_salvar: TToolButton;
    Btn_cancelar: TToolButton;
    ToolButton5: TToolButton;
    btn_sair: TToolButton;
    StatusBar1: TStatusBar;
    ImageList2: TImageList;
    ImageList1: TImageList;
    ImageList3: TImageList;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    ADOQueryFornecedores: TADOQuery;
    DSFornecedor: TDataSource;
    ADOQueryFornecedoresIDfornecedor: TAutoIncField;
    ADOQueryFornecedoresNome_RazaoSocial: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
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
  FrmVeicCad: TFrmVeicCad;

implementation

{$R *.dfm}

uses UnitDM, UnitFornCad, UnitFornMan, UnitCliCad, UnitCliMan;

procedure TFrmVeicCad.Btn_cancelarClick(Sender: TObject);
begin

DM.ADODSVeiculos.cancel;
Application.MessageBox(
'A alteração ou a inclusão deste registo foi abortada.',
'Atenção', MB_OK+MB_ICONERROR);

BTN_SALVAR.Enabled:= false;
btn_cancelar.Enabled:= false;
btn_sair.Enabled:=true;
pnlveic.Enabled:=FALSE;
end;

procedure TFrmVeicCad.btn_sairClick(Sender: TObject);
begin

close;
end;

procedure TFrmVeicCad.btn_salvarClick(Sender: TObject);
begin

DM.ADODSVeiculos.Post;
Application.MessageBox(
'O registro foi incluído ou alterado com sucesso.',
'Informação', MB_OK+MB_ICONINFORMATION);

BTN_SALVAR.Enabled:= false;
btn_cancelar.Enabled:= false;
btn_sair.Enabled:=true;
pnlveic.Enabled:=FALSE;
end;

procedure TFrmVeicCad.FormActivate(Sender: TObject);
begin
ADOQueryFornecedores.Close;
ADOQueryFornecedores.Open;
end;

procedure TFrmVeicCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ADOQueryFornecedores.Close;
end;

end.
