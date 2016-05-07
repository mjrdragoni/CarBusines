unit UnitCliCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  Tfrmclicad = class(TForm)
    Pnlcli: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label1: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    tipocli: TDBComboBox;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    estados: TDBComboBox;
    DBEdit7: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit15: TDBEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton4: TToolButton;
    btn_salvar: TToolButton;
    Btn_cancelar: TToolButton;
    ToolButton5: TToolButton;
    btn_sair: TToolButton;
    ImageList2: TImageList;
    ImageList1: TImageList;
    ImageList3: TImageList;
    StatusBar1: TStatusBar;
    DBEdit11: TDBEdit;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    DBEdit14: TDBEdit;
    Label19: TLabel;
    procedure btn_salvarClick(Sender: TObject);
    procedure Btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tipocliExit(Sender: TObject);
    procedure DBEdit10Enter(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmclicad: Tfrmclicad;

implementation

{$R *.dfm}

uses UnitDM, UnitCliMan;

procedure Tfrmclicad.Btn_cancelarClick(Sender: TObject);

begin
estados.Clear;
tipocli.Clear;
DM.ADODSClientes.cancel;
Application.MessageBox(
'A alteração ou a inclusão deste registo foi abortada.',
'Atenção', MB_OK+MB_ICONERROR);

BTN_SALVAR.Enabled:= false;
btn_cancelar.Enabled:= false;
btn_sair.Enabled:=true;
pnlcli.Enabled:=FALSE;
end;

procedure Tfrmclicad.btn_sairClick(Sender: TObject);
begin
tipocli.Enabled:=true;
close;
end;

procedure Tfrmclicad.btn_salvarClick(Sender: TObject);

begin
estados.Clear;
tipocli.Clear;
dbedit14.text:= datetostr(date);
DM.ADODSclientes.Post;
Application.MessageBox(
'O registro foi incluído ou alterado com sucesso.',
'Informação', MB_OK+MB_ICONINFORMATION);

BTN_SALVAR.Enabled:= false;
btn_cancelar.Enabled:= false;
btn_sair.Enabled:=true;
pnlcli.Enabled:=FALSE;
end;

procedure Tfrmclicad.DBEdit10Enter(Sender: TObject);
begin
DM.ADODSclientes.FieldByName('telefone').EditMask:= '(00)0000-0000;1;_';
end;

procedure Tfrmclicad.FormActivate(Sender: TObject);

begin

tipocli.items.add('F');
tipocli.items.add('J');

estados.Items.Add('AC');
estados.Items.Add('AL');
estados.Items.Add('AM');
estados.Items.Add('AP');
estados.Items.Add('BA');
estados.Items.Add('CE');
estados.Items.Add('DF');
estados.Items.Add('ES');
estados.Items.Add('GO');
estados.Items.Add('MA');
estados.Items.Add('MT');
estados.Items.Add('MS');
estados.Items.Add('MG');
estados.Items.Add('PA');
estados.Items.Add('PB');
estados.Items.Add('PR');
estados.Items.Add('PE');
estados.Items.Add('PI');
estados.Items.Add('RJ');
estados.Items.Add('RN');
estados.Items.Add('RS');
estados.Items.Add('RO');
estados.Items.Add('RR');
estados.Items.Add('SC');
estados.Items.Add('SP');
estados.Items.Add('SE');
estados.Items.Add('TO');





end;

procedure Tfrmclicad.tipocliExit(Sender: TObject);
 var data:tdatetime;
begin

if tipocli.Text = 'F' then
begin
  Label5.Caption:= 'Nome';
  Label3.Caption:= 'CPF';
  Label4.Caption:= 'RG';
  label6.Visible:= false;
  dbedit4.visible:= false;
  DM.ADODSclientes.FieldByName('CPF_CNPJ').EditMask:= '000.000.000-00;1;_';
end
else
begin
  label6.Visible:= true;
  dbedit4.visible:= true;
  Label5.Caption:= 'Razão Social';
  Label3.Caption:= 'CNPJ';
  Label4.Caption:= 'IE';

  DM.ADODSclientes.FieldByName('CPF_CNPJ').EditMask:= '00.000.000/0000-00;1;_';
end;
data:=now;
dbedit13.Text:= datetostr(data);
dbedit14.Text:= datetostr(data);

end;

end.
