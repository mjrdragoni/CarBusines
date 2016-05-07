unit UnitCadCli;

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
    tipo: TDBComboBox;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    DBComboBox2: TDBComboBox;
    DBEdit7: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
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
    DBEdit1: TDBEdit;
    DBEdit11: TDBEdit;
    Label17: TLabel;
    DBEdit15: TDBEdit;
    procedure btn_salvarClick(Sender: TObject);
    procedure tipoExit(Sender: TObject);
    procedure Btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure DBEdit8Enter(Sender: TObject);
    procedure DBEdit10Enter(Sender: TObject);
    procedure DBEdit11Enter(Sender: TObject);
    procedure DBEdit12Enter(Sender: TObject);
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
frmclicad.tipo.enabled:=true;
close;
end;

procedure Tfrmclicad.btn_salvarClick(Sender: TObject);
begin
DM.ADODSclientes.Post;
Application.MessageBox(
'O registro foi incluído ou alterado com sucesso.',
'Informação', MB_OK+MB_ICONINFORMATION);

BTN_SALVAR.Enabled:= false;
btn_cancelar.Enabled:= false;
btn_sair.Enabled:=true;
pnlcli.Enabled:=FALSE;


end;

procedure Tfrmclicad.tipoExit(Sender: TObject);

var
Data: TDateTime;

begin

  if tipo.Text='F' Then

   begin
   label3.caption := 'CPF';
   label4.Caption := 'RG';
   label5.Caption := 'Nome';
   DM.ADODSClientes.fieldByname('CPF_CNPJ').EditMask := '999.999.999-99;1;_';
   label6.Enabled:=false;
   dbedit4.Enabled:=false;
    end
  else
    begin
    label3.caption := 'CNPJ';
    label4.Caption := 'IE';
    label5.Caption := 'Razão Social';
    DM.ADODSClientes.fieldByname('CPF_CNPJ').EditMask := '99.999.999/9999-99;1;_';
    end;

  Data := (Now);
  DBEdit13.Text:= DateToStr(Data);
  DBEdit14.Text:= DateToStr(Data);
end;

procedure Tfrmclicad.DBEdit11Enter(Sender: TObject);
begin
DM.ADODSClientes.fieldByname('celular').EditMask := '(99) 09999-9999;1;_';
end;

procedure Tfrmclicad.DBEdit12Enter(Sender: TObject);
begin
DM.ADODSClientes.fieldByname('celular_2').EditMask := '(99) 09999-9999;1;_';
end;

procedure Tfrmclicad.DBEdit8Enter(Sender: TObject);
begin
DM.ADODSClientes.fieldByname('CEP').EditMask := '99999-999;1;_';
end;

procedure Tfrmclicad.DBEdit10Enter(Sender: TObject);
begin
DM.ADODSClientes.fieldByname('telefone').EditMask := '(99) 9999-9999;1;_';
end;

end.
