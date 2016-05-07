unit UnitCargoCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  Data.DB, Data.Win.ADODB;

type
  Tfrmcargocad = class(TForm)
    Pnlcargo: TPanel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
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
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    ADOQueryCargos: TADOQuery;
    DSCargo: TDataSource;
    ADOQueryCargosidDepartamento: TAutoIncField;
    ADOQueryCargosDepartamento: TStringField;
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
  frmcargocad: Tfrmcargocad;

implementation

{$R *.dfm}

uses UnitDM, UnitFornCad, UnitDeptoCad, UnitDptoMan;

procedure Tfrmcargocad.Btn_cancelarClick(Sender: TObject);
begin
DM.ADODSCargos.cancel;
Application.MessageBox(
'A alteração ou a inclusão deste registo foi abortada.',
'Atenção', MB_OK+MB_ICONERROR);

BTN_SALVAR.Enabled:= false;
btn_cancelar.Enabled:= false;
btn_sair.Enabled:=true;
pnlcargo.Enabled:=FALSE
end;

procedure Tfrmcargocad.btn_sairClick(Sender: TObject);
begin
close;
end;

procedure Tfrmcargocad.btn_salvarClick(Sender: TObject);
begin

DM.ADODScargos.Post;
Application.MessageBox(
'O registro foi incluído ou alterado com sucesso.',
'Informação', MB_OK+MB_ICONINFORMATION);

BTN_SALVAR.Enabled:= false;
btn_cancelar.Enabled:= false;
btn_sair.Enabled:=true;
pnlcargo.Enabled:=FALSE;
end;

procedure Tfrmcargocad.FormActivate(Sender: TObject);
begin
ADOQueryCargos.close;
ADOQueryCargos.open;
end;

procedure Tfrmcargocad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ADOQueryCargos.close;
end;

end.
