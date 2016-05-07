unit Unitlogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, db;

type
  TFrmlogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Login: TBitBtn;
    Edt_user: TEdit;
    Edt_pass: TEdit;
    procedure LoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edt_passKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    procedure Logon(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Frmlogin: TFrmlogin;
  user: string;

implementation

{$R *.dfm}

uses UnitDM, UnitPrincipal;

procedure TFrmlogin.Edt_passKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_RETURN then logon(sender);

end;

procedure TFrmlogin.FormActivate(Sender: TObject);
begin
edt_user.SetFocus;
end;

procedure TFrmlogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin


Application.Terminate;

end;
procedure TFrmlogin.Logon(Sender: TObject);
var verif: boolean;

begin
user:= edt_user.text;
  //DM é o nome do form e ADOQueryUs é o nome da query(busca) responsável pela tabela users
  DM.ADOQueryUsuarios.close;
  DM.ADOQueryUsuarios.SQL.Clear;
  // os comandos a cima fecham e limpam a query
  DM.ADOQueryUsuarios.SQL.add('Select * from "usuarios" where "usuario" = :usuario');
  DM.ADOQueryUsuarios.Parameters.ParamByName('usuario').Value := edt_user.Text;
  {Um comando SQL é atribuido a query, selecionando a tebela usuario onde o campo ID seja
    igual ao texto que o usuario ira inserir no edt_id}
  DM.ADOQueryUsuarios.Open;
  try
    if (Not DM.ADOQueryUsuarios.isEmpty) and (edt_pass.Text = DM.ADOQueryUsuarios.FieldByName('senha').AsString) then
    {Se o resultado retornado pela query nao for vazio (Ou seja, aquele usuario existe)
    e o valor do campo edit senha for igual a busca da cary no campo senha do mesmo registro}
      begin
        Modalresult := mrok;
        verif := true;
      end
    else
      begin
         application.MessageBox('Senha ou usuário incorretos!','Atenção',MB_OK+MB_ICONINFORMATION);
         edt_pass.Clear;
         edt_pass.SetFocus;
         verif := false;
      end;
  finally
    DM.ADOQueryUsuarios.Close;
  end;


  if (verif = true) then
  begin
      FreeAndNil(FrmLogin); //Libera o form de Login da memória
      Application.CreateForm(TFrmprincipal, Frmprincipal); //Cria a janela main
      Application.Run; //Roda a aplicação
  end;
end;








procedure TFrmlogin.LoginClick(Sender: TObject);

begin
 logon(sender);
end;
end.
