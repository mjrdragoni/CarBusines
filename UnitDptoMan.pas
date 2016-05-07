unit UnitDptoMan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  Tfrmdptoman = class(TForm)
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
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Change(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmdptoman: Tfrmdptoman;

implementation

{$R *.dfm}

uses UnitDM, UnitDeptoCad, UnitRelDepartamentos;

procedure Tfrmdptoman.btn_adicionarClick(Sender: TObject);
begin
DM.ADODSdepartamentos.Insert;
  Frmdptocad.btn_salvar.Enabled   := True;
  Frmdptocad.btn_cancelar.Enabled := True;
  Frmdptocad.btn_sair.Enabled     := False;
  Frmdptocad.Pnldpto.Enabled     := True;
  Frmdptocad.ShowModal;
end;

procedure Tfrmdptoman.btn_alterarClick(Sender: TObject);
begin
 DM.ADODSdepartamentos.Edit;
  Frmdptocad.btn_salvar.Enabled   := True;
  Frmdptocad.btn_cancelar.Enabled := True;
  Frmdptocad.btn_sair.Enabled     := False;
  Frmdptocad.Pnldpto.Enabled     := True;
  Frmdptocad.ShowModal;
end;

procedure Tfrmdptoman.btn_excluirClick(Sender: TObject);
var confExcl: integer;
begin
  confExcl := Application.MessageBox('Confirma a exclusão deste registro?','Atenção',MB_YESNO+MB_DEFBUTTON2+MB_iCONQUESTION);

  if confExcl = IDYes then
    begin
      DM.ADODSdepartamentos.Delete;
      Application.MessageBox('O Registro foi Excluído com sucesso.','Informação',MB_OK+MB_ICONINFORMATION);
    end
  else
    begin
      Application.MessageBox('A Exclusão do registro foi abortada.','Informação',MB_OK+MB_ICONINFORMATION);
    end;

end;

procedure Tfrmdptoman.btn_imprimirClick(Sender: TObject);
begin
frmreldep.showmodal;
end;

procedure Tfrmdptoman.Edit1Change(Sender: TObject);
begin
DM.ADODSdepartamentos.Active:=true;
DM.ADODSdepartamentos.Close;
DM.ADODSdepartamentos.CommandText:=('Select * from departamentos '+
' where departamento like '+'''%'+edit1.text+'%'+''''+'');
DM.ADODSdepartamentos.Open;
end;

procedure Tfrmdptoman.FormActivate(Sender: TObject);
begin
DM.ADODSdepartamentos.Close;
  DM.ADODSdepartamentos.CommandText := '';
  DM.ADODSdepartamentos.CommandText := 'Select * from departamentos order by departamento';
  DM.ADODSdepartamentos.Open;
end;

procedure Tfrmdptoman.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM.ADODSdepartamentos.Close;
end;

end.
