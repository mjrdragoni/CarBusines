unit UnitFornMan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  Tfrmfornman = class(TForm)
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
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure btn_adicionarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmfornman: Tfrmfornman;

implementation

{$R *.dfm}

uses UnitDM, UnitFornCad, UnitRelFornecedor;

procedure Tfrmfornman.btn_adicionarClick(Sender: TObject);
begin
  DM.ADODSfornecedores.Insert;
  Frmforncad.btn_salvar.Enabled   := True;
  Frmforncad.btn_cancelar.Enabled := True;
  Frmforncad.btn_sair.Enabled     := False;
  Frmforncad.Pnlforn.Enabled     := True;
  Frmforncad.ShowModal
end;

procedure Tfrmfornman.btn_alterarClick(Sender: TObject);
begin
 frmforncad.DBEdit14.clear;
  DM.ADODSfornecedores.Edit;
  frmforncad.tipoforn.Enabled:=false;
  frmforncad.btn_salvar.Enabled   := True;
  frmforncad.btn_cancelar.Enabled := True;
  frmforncad.btn_sair.Enabled     := False;
  frmforncad.Pnlforn.Enabled     := True;
  frmforncad.ShowModal;
  end;

procedure Tfrmfornman.btn_excluirClick(Sender: TObject);
var confExcl: integer;
begin
  confExcl := Application.MessageBox('Confirma a exclusão deste registro?','Atenção',MB_YESNO+MB_DEFBUTTON2+MB_iCONQUESTION);

  if confExcl = IDYes then
    begin
      DM.ADODSfornecedores.Delete;
      Application.MessageBox('O Registro foi Excluído com sucesso.','Informação',MB_OK+MB_ICONINFORMATION);
    end
  else
    begin
      Application.MessageBox('A Exclusão do registro foi abortada.','Informação',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure Tfrmfornman.btn_imprimirClick(Sender: TObject);
begin
frmrelfornecedor.showmodal;
end;

procedure Tfrmfornman.Edit1Change(Sender: TObject);
begin
DM.ADODSfornecedores.Active:=true;
DM.ADODSfornecedores.Close;
DM.ADODSfornecedores.CommandText:=('Select * from fornecedores '+
' where Nome_RazaoSocial like '+'''%'+edit1.text+'%'+''''+'');
DM.ADODSclientes.Open;
end;

procedure Tfrmfornman.FormActivate(Sender: TObject);
begin
  DM.ADODSfornecedores.Close;
  DM.ADODSfornecedores.CommandText := '';
  DM.ADODSfornecedores.CommandText := 'Select * from fornecedores order by Nome_RazaoSocial';
  DM.ADODSfornecedores.Open;
end;

procedure Tfrmfornman.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM.ADODSfornecedores.Close;
end;

end.
