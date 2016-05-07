unit UnitFuncMan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrmFuncMan = class(TForm)
    DBGrid1: TDBGrid;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    PanelMenuCadCli: TPanel;
    StatusBar1: TStatusBar;
    ToolBarcli: TToolBar;
    ToolButton3: TToolButton;
    btn_adicionar: TToolButton;
    btn_alterar: TToolButton;
    btn_excluir: TToolButton;
    ToolButton1: TToolButton;
    btn_imprimir: TToolButton;
    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_adicionarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFuncMan: TFrmFuncMan;

implementation

{$R *.dfm}

uses UnitDM, UnitCadFunc, UnitRelFuncionarios, UnitRelFuncCargo;

procedure TFrmFuncMan.btn_adicionarClick(Sender: TObject);
begin
  DM.ADODSFunc.Insert;
  FrmFunc.btn_salvar.Enabled   := True;
  FrmFunc.btn_cancelar.Enabled := True;
  FrmFunc.btn_sair.Enabled     := False;
  FrmFunc.Pnlcli.Enabled     := True;
  FrmFunc.ShowModal;
end;


procedure TFrmFuncMan.btn_alterarClick(Sender: TObject);
begin
  FrmFunc.DBEdit14.clear;
  DM.ADODSFunc.Edit;
  FrmFunc.btn_salvar.Enabled   := True;
  FrmFunc.btn_cancelar.Enabled := True;
  FrmFunc.btn_sair.Enabled     := False;
  FrmFunc.Pnlcli.Enabled     := True;
  FrmFunc.ShowModal;
  end;


procedure TFrmFuncMan.btn_excluirClick(Sender: TObject);
var confExcl: integer;
begin
  confExcl := Application.MessageBox('Confirma a exclusão deste registro?','Atenção',MB_YESNO+MB_DEFBUTTON2+MB_iCONQUESTION);

  if confExcl = IDYes then
    begin
      DM.ADODSFunc.Delete;
      Application.MessageBox('O Registro foi Excluído com sucesso.','Informação',MB_OK+MB_ICONINFORMATION);
    end
  else
    begin
      Application.MessageBox('A Exclusão do registro foi abortada.','Informação',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure TFrmFuncMan.btn_imprimirClick(Sender: TObject);
begin
frmrelfuncargo.showmodal;
end;

procedure TFrmFuncMan.Edit1Change(Sender: TObject);
begin
DM.ADODSFunc.Active:=true;
DM.ADODSFunc.Close;
DM.ADODSFunc.CommandText:=('Select * from funcionarios '+
' where Nome like '+'''%'+edit1.text+'%'+''''+'');
DM.ADODSFunc.Open;
end;
procedure TFrmFuncMan.FormActivate(Sender: TObject);
begin
  DM.ADODSFunc.Close;
  DM.ADODSFunc.CommandText := '';
  DM.ADODSFunc.CommandText := 'Select * from funcionarios order by Nome';
  DM.ADODSFunc.Open;
end;

end.
