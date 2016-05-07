unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Buttons;

type
  Tfrmprincipal = class(TForm)
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    ToolBarSuperior: TToolBar;
    bnt_manut: TToolButton;
    btn_veiculo: TToolButton;
    btn_vendas: TToolButton;
    StatusBar1: TStatusBar;
    ToolButton1: TToolButton;
    departamentos: TToolButton;
    ToolButton3: TToolButton;
    cargos: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Panel1: TPanel;
    ToolButton7: TToolButton;
    usuarios: TToolButton;
    btn_oficina: TToolButton;


    procedure ToolButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cargosClick(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure departamentosClick(Sender: TObject);
    procedure btn_veiculoClick(Sender: TObject);
    procedure btn_oficinasClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure btn_vendasClick(Sender: TObject);
    procedure bnt_manutClick(Sender: TObject);
    procedure usuariosClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_oficinaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmprincipal: Tfrmprincipal;

implementation

{$R *.dfm}

uses UnitDM, Unitlogin, Unitclicad, UnitCliMan, UnitCargoMan, UnitFornCad,
  UnitFornMan, UnitDptoMan, UnitVeicMan, UnitOficiman, UnitFuncMan,
  Unitvendascad, UnitManuMan, UnitUsuarios, UnitUsuariosMan;









procedure Tfrmprincipal.bnt_manutClick(Sender: TObject);
begin
FrmManuMan.ShowModal;
end;

procedure Tfrmprincipal.btn_oficinaClick(Sender: TObject);
begin
FrmOfiMan.ShowModal;
end;

procedure Tfrmprincipal.btn_oficinasClick(Sender: TObject);
begin
FrmOfiMan.ShowModal;
end;

procedure Tfrmprincipal.btn_veiculoClick(Sender: TObject);
begin
frmveicMan.ShowModal;
end;

procedure Tfrmprincipal.btn_vendasClick(Sender: TObject);
begin
FrmVendas.showmodal;
end;

procedure Tfrmprincipal.FormActivate(Sender: TObject);
begin
if user ='admin' then
begin
cargos.Enabled:=true;
departamentos.Enabled:=true;
usuarios.Enabled:=true;
end;



end;

procedure Tfrmprincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Frmprincipal);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.terminate;;
end;

procedure Tfrmprincipal.departamentosClick(Sender: TObject);
begin
frmdptoman.showmodal;
end;

procedure Tfrmprincipal.ToolButton3Click(Sender: TObject);
begin
FrmFuncMan.ShowModal;
end;

procedure Tfrmprincipal.cargosClick(Sender: TObject);
begin
frmcargoman.showmodal;
end;

procedure Tfrmprincipal.ToolButton5Click(Sender: TObject);
begin

frmcliman.ShowModal;

end;

procedure Tfrmprincipal.ToolButton7Click(Sender: TObject);
begin
frmfornman.showmodal;
end;

procedure Tfrmprincipal.usuariosClick(Sender: TObject);
begin
frmusuman.showmodal;
end;

end.
