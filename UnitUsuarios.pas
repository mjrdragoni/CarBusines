unit UnitUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls;

type
  Tfrmusuario = class(TForm)
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
    Pnlusuario: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    procedure btn_salvarClick(Sender: TObject);
    procedure Btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmusuario: Tfrmusuario;

implementation

{$R *.dfm}

uses UnitDM;

procedure Tfrmusuario.Btn_cancelarClick(Sender: TObject);
begin
DM.ADODSusuarios.cancel;
Application.MessageBox(
'A alteração ou a inclusão deste registo foi abortada.',
'Atenção', MB_OK+MB_ICONERROR);

BTN_SALVAR.Enabled:= false;
btn_cancelar.Enabled:= false;
btn_sair.Enabled:=true;
pnlusuario.Enabled:=FALSE
end;

procedure Tfrmusuario.btn_sairClick(Sender: TObject);
begin
close;
end;

procedure Tfrmusuario.btn_salvarClick(Sender: TObject);
begin
DM.ADODSusuarios.Post;
Application.MessageBox(
'O registro foi incluído ou alterado com sucesso.',
'Informação', MB_OK+MB_ICONINFORMATION);

BTN_SALVAR.Enabled:= false;
btn_cancelar.Enabled:= false;
btn_sair.Enabled:=true;
pnlusuario.Enabled:=FALSE;
end;

end.
