unit UnitCliMan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  Tfrmcliman = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    ToolBarcli: TToolBar;
    ToolButton3: TToolButton;
    btn_excluir: TToolButton;
    ToolButton1: TToolButton;
    btn_imprimir: TToolButton;
    PanelMenuCadCli: TPanel;
    ImageList1: TImageList;
    ImageList3: TImageList;
    ImageList2: TImageList;
    btn_adicionar: TToolButton;
    btn_alterar: TToolButton;
    StatusBar1: TStatusBar;


    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_adicionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcliman: Tfrmcliman;

implementation

{$R *.dfm}

uses UnitDM,  UnitPrincipal, UnitCliCad, UnitCliRel;












procedure Tfrmcliman.btn_alterarClick(Sender: TObject);

begin
  frmclicad.DBEdit14.clear;
  DM.ADODSclientes.Edit;
  frmclicad.tipocli.Enabled:=false;
  Frmclicad.btn_salvar.Enabled   := True;
  Frmclicad.btn_cancelar.Enabled := True;
  Frmclicad.btn_sair.Enabled     := False;
  Frmclicad.Pnlcli.Enabled     := True;
  Frmclicad.ShowModal;
  end;

procedure Tfrmcliman.btn_excluirClick(Sender: TObject);
var confExcl: integer;
begin
  confExcl := Application.MessageBox('Confirma a exclusão deste registro?','Atenção',MB_YESNO+MB_DEFBUTTON2+MB_iCONQUESTION);

  if confExcl = IDYes then
    begin
      DM.ADODSclientes.Delete;
      Application.MessageBox('O Registro foi Excluído com sucesso.','Informação',MB_OK+MB_ICONINFORMATION);
    end
  else
    begin
      Application.MessageBox('A Exclusão do registro foi abortada.','Informação',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure Tfrmcliman.btn_imprimirClick(Sender: TObject);
begin
FrmRelCli.Showmodal;
end;

procedure Tfrmcliman.Edit1Change(Sender: TObject);
begin
DM.ADODSclientes.Active:=true;
DM.ADODSclientes.Close;
DM.ADODSclientes.CommandText:=('Select * from clientes '+
' where Nome_RazaoSocial like '+'''%'+edit1.text+'%'+''''+'');
DM.ADODSclientes.Open;
end;

procedure Tfrmcliman.FormActivate(Sender: TObject);
begin
  DM.ADODSclientes.Close;
  DM.ADODSclientes.CommandText := '';
  DM.ADODSclientes.CommandText := 'Select * from Clientes order by Nome_RazaoSocial';
  DM.ADODSclientes.Open;
end;

procedure Tfrmcliman.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM.ADODSclientes.Close;
end;

procedure Tfrmcliman.btn_adicionarClick(Sender: TObject);

begin
  DM.ADODSClientes.Insert;
  Frmclicad.btn_salvar.Enabled   := True;
  Frmclicad.btn_cancelar.Enabled := True;
  Frmclicad.btn_sair.Enabled     := False;
  Frmclicad.Pnlcli.Enabled     := True;
  Frmclicad.ShowModal;
end;




end.

