unit Unitvendascad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  Tfrmvendas = class(TForm)
    Pnlvenda: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btn_salvar: TToolButton;
    Btn_cancelar: TToolButton;
    btn_sair: TToolButton;
    StatusBar1: TStatusBar;
    ImageList2: TImageList;
    ImageList1: TImageList;
    ImageList3: TImageList;
    ADOQueryCliente: TADOQuery;
    DScliente: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    DSvendedor: TDataSource;
    ADOQueryvendedor: TADOQuery;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    btn_primeiro: TToolButton;
    btn_ultimo: TToolButton;
    btn_anterior: TToolButton;
    btn_proximo: TToolButton;
    btn_imprimir: TToolButton;
    ToolButton7: TToolButton;
    btn_inserir: TToolButton;
    ToolButton9: TToolButton;
    ToolButton6: TToolButton;
    btn_alterar: TToolButton;
    btn_excluir: TToolButton;
    ToolButton12: TToolButton;
    DBText1: TDBText;
    ADOQueryvendedorIDfuncionario: TAutoIncField;
    ADOQueryvendedorNome: TStringField;
    DBEdit3: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    DBEdit4: TDBEdit;
    ADOQueryClienteIDcliente: TAutoIncField;
    ADOQueryClienteNome_RazaoSocial: TStringField;
    procedure btn_inserirClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure Btn_cancelarClick(Sender: TObject);
    procedure btn_anteriorClick(Sender: TObject);
    procedure btn_ultimoClick(Sender: TObject);
    procedure btn_proximoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_primeiroClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
  private
    { Private declarations }
    Procedure botoes (ativa: boolean);
  public
    { Public declarations }
  end;

var
  frmvendas: Tfrmvendas;
  operacao: integer;
  Desc: real;

implementation

{$R *.dfm}

uses UnitDM, UnitCadFunc, UnitCliCad, UnitCliMan, UnitFuncMan, UnitVeicMan,
  UnitVeiculosCad, UnitRelVeicMaster;

  { Tfrmvendas }

procedure Tfrmvendas.botoes(ativa: boolean);
begin
desc:= 0;
dbedit3.Text:= floattostr(desc);
  if operacao = 1 then
  begin
    if DM.ADODSVendas.Eof = true then
    begin
      btn_proximo.Enabled:= false;
      btn_ultimo.Enabled:= false;
    end
    else
    begin
      btn_proximo.Enabled:= true;
      btn_ultimo.Enabled:= true;
    end;

    if DM.ADODSVendas.Bof = true then
    begin
      btn_primeiro.Enabled:= false;
      btn_anterior.Enabled:= false;
    end
    else
    begin
      btn_primeiro.Enabled:= true;
      btn_anterior.Enabled:= true;
   end;
  end
  else
  begin
    btn_primeiro.Enabled:= false;
    btn_anterior.Enabled:= false;
    btn_proximo.Enabled:= false;
    btn_ultimo.Enabled:= false;
  end;
  btn_inserir.Enabled:= Ativa;
  btn_sair.Enabled:= Ativa;
  btn_imprimir.Enabled:= Ativa;
  if DM.ADODSVendas.RecordCount > 0 then
  begin
    btn_alterar.Enabled:= Ativa;
    btn_excluir.Enabled:= Ativa;
  end;
  btn_salvar.Enabled:= not Ativa;
  btn_cancelar.Enabled:= not Ativa;
  Pnlvenda.Enabled:= not Ativa;
end;

procedure Tfrmvendas.btn_alterarClick(Sender: TObject);
begin
dbedit2.Enabled:=false;
dbedit3.Enabled:=false;
dbedit4.Enabled:=false;

 DM.ADODSVendas.Edit;
  DM.ADODSVendasDATA_ALT.AsDateTime:= date;

  Botoes(false);
  operacao:= 0;
end;

procedure Tfrmvendas.btn_anteriorClick(Sender: TObject);
begin
 DM.ADODSVendas.Prior;
  Botoes(true);
end;

procedure Tfrmvendas.Btn_cancelarClick(Sender: TObject);
begin
 DM.ADODSVendas.Cancel;

  Application.MessageBox(
  'Registro cancelado com sucesso.',
  'Aviso',MB_OK+MB_DEFBUTTON1+MB_ICONERROR);

  operacao:= 1;
  Botoes(True);
end;

procedure Tfrmvendas.btn_excluirClick(Sender: TObject);
var confExclusao: integer;
begin
  confExclusao:= Application.MessageBox(
  'Tem certeza que deseja excluir o registro?',
  'Atenção',MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

  if confExclusao = IDYES then
  begin
    ShowMessage('Registro nº ' +
    DM.ADODSVendasIDvenda.AsString + ' foi excluído com sucesso.');
    DM.ADODSVendas.Delete;

  end;
end;

procedure Tfrmvendas.btn_imprimirClick(Sender: TObject);
begin
frmrelveicmaster.showmodal;
end;

procedure Tfrmvendas.btn_inserirClick(Sender: TObject);
begin
dbedit3.enabled:=true;
DM.ADODSVendas.Insert;
  DM.ADODSVendasDATA_INCl.AsDateTime:= Date;
  DM.ADODSVendas.Post;
  StatusBar1.Panels[0].Text:= 'Venda Nº ' +
    DM.ADODSVendasIDvenda.AsString;

  DM.ADODSVendas.Edit;

  operacao:= 0;
  Botoes(false);
end;

procedure Tfrmvendas.btn_ultimoClick(Sender: TObject);
begin
DM.ADODSVendas.last;
  Botoes(true);
end;

procedure Tfrmvendas.DBEdit3Exit(Sender: TObject);
begin
dbedit3.Enabled:=false;
end;

procedure Tfrmvendas.btn_proximoClick(Sender: TObject);
begin
DM.ADODSVendas.Next;
  Botoes(True);
end;

procedure Tfrmvendas.btn_sairClick(Sender: TObject);
begin
close;
end;

procedure Tfrmvendas.btn_salvarClick(Sender: TObject);
begin
dbedit2.text:= datetostr(date);
DM.ADODSVendas.Post;
  Application.MessageBox(
  'O Registro foi salvo com sucesso.',
  'Informação',MB_OK+
  MB_DEFBUTTON1+MB_ICONINFORMATION);

  operacao:= 1;
  Botoes(True);
end;

procedure Tfrmvendas.btn_primeiroClick(Sender: TObject);
begin
DM.ADODSVendas.first;
  Botoes(true);
end;

procedure Tfrmvendas.FormActivate(Sender: TObject);
begin

  DM.ADODSVendas.Open;
  DM.ADODSVendas_item.Open;

  operacao:= 1;
  Botoes(true);

  ADOQueryCliente.Open;
  ADOQueryCliente.ExecSQL;

  ADOQueryVendedor.Open;
  ADOQueryVendedor.ExecSQL;

  DM.ADOQueryveiculos.Open;
  DM.ADOQueryveiculos.ExecSQL;


end;

procedure Tfrmvendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM.ADODSVendas.Close;
  DM.ADODSVendas_Item.Close;

  DM.ADOQueryveiculos.Close;
  ADOQueryCliente.Close;
  ADOQueryVendedor.Close;
end;

end.


