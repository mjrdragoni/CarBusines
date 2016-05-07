unit UnitVeicMan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFrmVeicMan = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    ToolBarcli: TToolBar;
    ToolButton3: TToolButton;
    btn_adicionar: TToolButton;
    btn_alterar: TToolButton;
    btn_excluir: TToolButton;
    ToolButton1: TToolButton;
    btn_imprimir: TToolButton;
    PanelMenuCadCli: TPanel;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    ImageList3: TImageList;
    ImageList2: TImageList;
    procedure btn_adicionarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVeicMan: TFrmVeicMan;

implementation

{$R *.dfm}

uses UnitDM, UnitVeiculosCad, UnitRelVeic;

procedure TFrmVeicMan.btn_adicionarClick(Sender: TObject);
begin
  DM.ADODSVeiculos.Insert;
  FrmVeicCad.btn_salvar.Enabled   := True;
  FrmVeicCad.btn_cancelar.Enabled := True;
  FrmVeicCad.btn_sair.Enabled     := False;
  FrmVeicCad.PnlVeic.Enabled     := True;
  FrmVeicCad.ShowModal;
end;
procedure TFrmVeicMan.btn_alterarClick(Sender: TObject);
begin

  DM.ADODSVeiculos.Edit;
  FrmVeicCad.btn_salvar.Enabled   := True;
  FrmVeicCad.btn_cancelar.Enabled := True;
  FrmVeicCad.btn_sair.Enabled     := False;
  FrmVeicCad.PnlVeic.Enabled     := True;
  FrmVeicCad.ShowModal;

end;
procedure TFrmVeicMan.btn_excluirClick(Sender: TObject);
var confExcl: integer;
begin
  confExcl := Application.MessageBox('Confirma a exclusão deste registro?','Atenção',MB_YESNO+MB_DEFBUTTON2+MB_iCONQUESTION);

  if confExcl = IDYes then
    begin
      DM.ADODSVeiculos.Delete;
      Application.MessageBox('O Registro foi Excluído com sucesso.','Informação',MB_OK+MB_ICONINFORMATION);
    end
  else
    begin
      Application.MessageBox('A Exclusão do registro foi abortada.','Informação',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure TFrmVeicMan.btn_imprimirClick(Sender: TObject);
begin
frmrelveic.showmodal;
end;

procedure TFrmVeicMan.Edit1Change(Sender: TObject);
begin
DM.ADODSVeiculos.Active:=true;
DM.ADODSVeiculos.Close;
DM.ADODSVeiculos.CommandText:=('Select * from Veiculos '+
' where modelo like '+'''%'+edit1.text+'%'+''''+'');
DM.ADODSVeiculos.Open;
end;

procedure TFrmVeicMan.FormActivate(Sender: TObject);
begin
  DM.ADODSVeiculos.Close;
  DM.ADODSVeiculos.CommandText := '';
  DM.ADODSVeiculos.CommandText := 'Select * from Veiculos order by Modelo';
  DM.ADODSVeiculos.Open;
end;

procedure TFrmVeicMan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM.ADODSVeiculos.Close;
end;


end.
