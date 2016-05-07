unit UnitOficiman;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrmOfiMan = class(TForm)
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
  FrmOfiMan: TFrmOfiMan;

implementation

{$R *.dfm}

uses UnitDM, UnitOfiCad, UnitRelOficina;

procedure TFrmOfiMan.btn_adicionarClick(Sender: TObject);
begin
  DM.ADODSOficina.Insert;
  Frmoficad.btn_salvar.Enabled   := True;
  Frmoficad.btn_cancelar.Enabled := True;
  Frmoficad.btn_sair.Enabled     := False;
  Frmoficad.Pnlcli.Enabled     := True;
  Frmoficad.ShowModal;
end;

procedure TFrmOfiMan.btn_alterarClick(Sender: TObject);
begin
  frmoficad.DBEdit14.clear;
  DM.ADODSOficina.Edit;
  Frmoficad.btn_salvar.Enabled   := True;
  Frmoficad.btn_cancelar.Enabled := True;
  Frmoficad.btn_sair.Enabled     := False;
  Frmoficad.Pnlcli.Enabled     := True;
  Frmoficad.ShowModal;
  end;

procedure TFrmOfiMan.btn_excluirClick(Sender: TObject);

var confExcl: integer;
begin
  confExcl := Application.MessageBox('Confirma a exclusão deste registro?','Atenção',MB_YESNO+MB_DEFBUTTON2+MB_iCONQUESTION);

  if confExcl = IDYes then
    begin
      DM.ADODSoficina.Delete;
      Application.MessageBox('O Registro foi Excluído com sucesso.','Informação',MB_OK+MB_ICONINFORMATION);
    end
  else
    begin
      Application.MessageBox('A Exclusão do registro foi abortada.','Informação',MB_OK+MB_ICONINFORMATION);
    end;
end;


procedure TFrmOfiMan.btn_imprimirClick(Sender: TObject);
begin
FrmRelOficina.showmodal;
end;

procedure TFrmOfiMan.Edit1Change(Sender: TObject);
begin
DM.ADODSOficina.Active:=true;
DM.ADODSOficina.Close;
DM.ADODSOficina.CommandText:=('Select * from Oficinas '+
' where RazaoSocial like '+'''%'+edit1.text+'%'+''''+'');
DM.ADODSOficina.Open;
end;

procedure TFrmOfiMan.FormActivate(Sender: TObject);
begin
  DM.ADODSoficina.Close;
  DM.ADODSoficina.CommandText := '';
  DM.ADODSoficina.CommandText := 'Select * from oficinas order by RazaoSocial';
  DM.ADODSoficina.Open;
end;

procedure TFrmOfiMan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM.ADODSoficina.Close;
end;

end.
