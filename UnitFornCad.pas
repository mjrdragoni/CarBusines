unit UnitFornCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  Tfrmforncad = class(TForm)
    Pnlforn: TPanel;
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
    Label18: TLabel;
    tipoforn: TDBComboBox;
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
    DBEdit11: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit14: TDBEdit;
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
    Label19: TLabel;
    procedure btn_salvarClick(Sender: TObject);
    procedure Btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tipofornExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmforncad: Tfrmforncad;

implementation

{$R *.dfm}

uses UnitDM;

procedure Tfrmforncad.Btn_cancelarClick(Sender: TObject);
begin
estados.Clear;
tipoforn.Clear;
DM.ADODSfornecedores.cancel;
Application.MessageBox(
'A alteração ou a inclusão deste registo foi abortada.',
'Atenção', MB_OK+MB_ICONERROR);

BTN_SALVAR.Enabled:= false;
btn_cancelar.Enabled:= false;
btn_sair.Enabled:=true;
pnlforn.Enabled:=FALSE;
end;

procedure Tfrmforncad.btn_sairClick(Sender: TObject);
begin
tipoforn.Enabled:=true;
close;
end;

procedure Tfrmforncad.btn_salvarClick(Sender: TObject);
begin
estados.Clear;
tipoforn.Clear;
dbedit14.text:= datetostr(date);
DM.ADODSfornecedores.Post;
Application.MessageBox(
'O registro foi incluído ou alterado com sucesso.',
'Informação', MB_OK+MB_ICONINFORMATION);

BTN_SALVAR.Enabled:= false;
btn_cancelar.Enabled:= false;
btn_sair.Enabled:=true;
pnlforn.Enabled:=FALSE;
end;

procedure Tfrmforncad.FormActivate(Sender: TObject);
begin
tipoforn.items.add('F');
tipoforn.items.add('J');

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

procedure Tfrmforncad.tipofornExit(Sender: TObject);
var data:tdatetime;
begin

if tipoforn.Text = 'F' then
begin
  Label5.Caption:= 'Nome';
  Label3.Caption:= 'CPF';
  Label4.Caption:= 'RG';
  label6.Visible:= false;
  dbedit4.visible:= false;
  DM.ADODSfornecedores.FieldByName('CPF_CNPJ').EditMask:= '000.000.000-00;1;_';
end
else
begin
  label6.Visible:= true;
  dbedit4.visible:= true;
  Label5.Caption:= 'Razão Social';
  Label3.Caption:= 'CNPJ';
  Label4.Caption:= 'IE';

  DM.ADODSfornecedores.FieldByName('CPF_CNPJ').EditMask:= '00.000.000/0000-00;1;_';
end;
data:=now;
dbedit13.Text:= datetostr(data);
dbedit14.Text:= datetostr(data);

end;


end.
