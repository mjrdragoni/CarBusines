unit UnitUsuariosMan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  Tfrmusuman = class(TForm)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmusuman: Tfrmusuman;

implementation

{$R *.dfm}

uses UnitDM, UnitUsuarios, UnitRelUusaios;

procedure Tfrmusuman.btn_adicionarClick(Sender: TObject);
begin
 DM.ADODSusuarios.Insert;
  Frmusuario.btn_salvar.Enabled   := True;
  Frmusuario.btn_sair.Enabled     := False;
  Frmusuario.btn_cancelar.Enabled := True;
  Frmusuario.Pnlusuario.Enabled     := True;
  Frmusuario.ShowModal;
end;

procedure Tfrmusuman.btn_alterarClick(Sender: TObject);
begin
  DM.ADODSusuarios.Edit;
  Frmusuario.btn_salvar.Enabled   := True;
  Frmusuario.btn_cancelar.Enabled := True;
  Frmusuario.btn_sair.Enabled     := False;
  Frmusuario.Pnlusuario.Enabled     := True;
  Frmusuario.ShowModal;
end;

procedure Tfrmusuman.btn_excluirClick(Sender: TObject);
var confExcl: integer;
begin
  confExcl := Application.MessageBox('Confirma a exclusão deste registro?','Atenção',MB_YESNO+MB_DEFBUTTON2+MB_iCONQUESTION);

  if confExcl = IDYes then
    begin
      DM.ADODSusuarios.Delete;
      Application.MessageBox('O Registro foi Excluído com sucesso.','Informação',MB_OK+MB_ICONINFORMATION);
    end
  else
    begin
      Application.MessageBox('A Exclusão do registro foi abortada.','Informação',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure Tfrmusuman.btn_imprimirClick(Sender: TObject);
begin
frmrelusuarios.showmodal;
end;

procedure Tfrmusuman.Edit1Change(Sender: TObject);
begin
DM.ADODSusuarios.Active:=true;
DM.ADODSusuarios.Close;
DM.ADODSusuarios.CommandText:=('Select * from usuarios '+
' where usuario like '+'''%'+edit1.text+'%'+''''+'');
DM.ADODSusuarios.Open;
end;

procedure Tfrmusuman.FormActivate(Sender: TObject);
begin
 DM.ADODSusuarios.Close;
  DM.ADODSusuarios.CommandText := '';
  DM.ADODSusuarios.CommandText := 'Select * from usuarios order by usuario';
  DM.ADODSusuarios.Open;
end;

procedure Tfrmusuman.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM.ADODSusuarios.Close;
end;

end.
