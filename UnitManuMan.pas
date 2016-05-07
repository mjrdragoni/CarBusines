unit UnitManuMan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB;

type
  TFrmManuMan = class(TForm)
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
    procedure btn_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManuMan: TFrmManuMan;

implementation

{$R *.dfm}

uses UnitDM, UnitManuCad, UnitRelManut;

procedure TFrmManuMan.btn_adicionarClick(Sender: TObject);
begin
 DM.ADODSmanutencao.Insert;
  Frmmanu.btn_salvar.Enabled   := True;
  Frmmanu.btn_cancelar.Enabled := True;
  Frmmanu.btn_sair.Enabled     := False;
  Frmmanu.Pnlmanut.Enabled     := True;
  Frmmanu.ShowModal;
end;

procedure TFrmManuMan.btn_alterarClick(Sender: TObject);
begin
  frmmanu.dbedit3.Enabled      :=false;
  DM.ADODSmanutencao.Edit;
  frmmanu.btn_salvar.Enabled   := True;
  frmmanu.btn_cancelar.Enabled := True;
  frmmanu.btn_sair.Enabled     := False;
  frmmanu.Pnlmanut.Enabled     := True;
  frmmanu.ShowModal;
end;

procedure TFrmManuMan.btn_excluirClick(Sender: TObject);
var confExcl: integer;
begin
  confExcl := Application.MessageBox('Confirma a exclusão deste registro?','Atenção',MB_YESNO+MB_DEFBUTTON2+MB_iCONQUESTION);

  if confExcl = IDYes then
    begin
      DM.ADODSmanutencao.Delete;
      Application.MessageBox('O Registro foi Excluído com sucesso.','Informação',MB_OK+MB_ICONINFORMATION);
    end
  else
    begin
      Application.MessageBox('A Exclusão do registro foi abortada.','Informação',MB_OK+MB_ICONINFORMATION);
    end;
end;

procedure TFrmManuMan.btn_imprimirClick(Sender: TObject);
begin
ftmrelmanut.showmodal;
end;

procedure TFrmManuMan.Edit1Change(Sender: TObject);

begin

DM.ADODSmanutencao.Close;
DM.ADODSmanutencao.CommandText:=('Select * from manutencoes '+
' where descricao like '+'''%'+edit1.text+'%'+''''+'');
DM.ADODSmanutencao.open;
DM.ADODSmanutencao.Active:=true;





end;

procedure TFrmManuMan.FormActivate(Sender: TObject);
begin
 DM.ADODSmanutencao.Close;
  DM.ADODSmanutencao.CommandText := '';
  DM.ADODSmanutencao.CommandText := 'Select * from manutencoes order by idveiculo';
  DM.ADODSmanutencao.Open;
end;

end.
