unit UnitCargoMan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  Tfrmcargoman = class(TForm)
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
    procedure Edit1Change(Sender: TObject);
    procedure btn_adicionarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcargoman: Tfrmcargoman;

implementation

{$R *.dfm}

uses UnitDM, UnitCargoCad, UnitCliCad, Unitrelcargos;

procedure Tfrmcargoman.btn_adicionarClick(Sender: TObject);
begin
  DM.ADODScargos.Insert;
  Frmcargocad.btn_salvar.Enabled   := True;
  Frmcargocad.btn_sair.Enabled     := False;
  Frmcargocad.btn_cancelar.Enabled := True;
  Frmcargocad.Pnlcargo.Enabled     := True;
  Frmcargocad.ShowModal;
end;

procedure Tfrmcargoman.btn_alterarClick(Sender: TObject);
begin

  DM.ADODScargos.Edit;
  Frmcargocad.btn_salvar.Enabled   := True;
  Frmcargocad.btn_cancelar.Enabled := True;
  Frmcargocad.btn_sair.Enabled     := False;
  Frmcargocad.Pnlcargo.Enabled     := True;
  Frmcargocad.ShowModal;

end;

procedure Tfrmcargoman.btn_excluirClick(Sender: TObject);
var confExcl: integer;
begin
  confExcl := Application.MessageBox('Confirma a exclusão deste registro?','Atenção',MB_YESNO+MB_DEFBUTTON2+MB_iCONQUESTION);

  if confExcl = IDYes then
    begin
      DM.ADODScargos.Delete;
      Application.MessageBox('O Registro foi Excluído com sucesso.','Informação',MB_OK+MB_ICONINFORMATION);
    end
  else
    begin
      Application.MessageBox('A Exclusão do registro foi abortada.','Informação',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure Tfrmcargoman.btn_imprimirClick(Sender: TObject);
begin
frmrelcargos.showmodal;
end;

procedure Tfrmcargoman.Edit1Change(Sender: TObject);
begin
DM.ADODScargos.Active:=true;
DM.ADODScargos.Close;
DM.ADODScargos.CommandText:=('Select * from cargos '+
' where cargo like '+'''%'+edit1.text+'%'+''''+'');
DM.ADODScargos.Open;
end;

procedure Tfrmcargoman.FormActivate(Sender: TObject);
begin
DM.ADODScargos.Close;
  DM.ADODScargos.CommandText := '';
  DM.ADODScargos.CommandText := 'Select * from cargos order by cargo';
  DM.ADODScargos.Open;
end;

procedure Tfrmcargoman.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM.ADODScargos.Close;
end;

end.
