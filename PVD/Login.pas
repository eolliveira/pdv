unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Buttons;

type
  Tfrm_login = class(TForm)
    pnl_fundo: TPanel;
    img_fundo: TImage;
    pnl_login: TPanel;
    img_login: TImage;
    txt_usuario: TEdit;
    txt_senha: TEdit;
    btn_entrar: TSpeedButton;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure btn_entrarClick(Sender: TObject);
  private
    procedure centralizarPainel;
    procedure login;
  public
    { Public declarations }
  end;

var
  frm_login: Tfrm_login;

implementation

{$R *.dfm}

uses Menu;

procedure Tfrm_login.btn_entrarClick(Sender: TObject);
begin
  if Trim(txt_usuario.text) = '' then
  begin
    messageDlg('Insira um usu�rio!', TMsgDlgType.mtInformation, mbOKCancel, 0);
    txt_usuario.SetFocus;
    Exit
  end;

  if Trim(txt_senha.Text) = '' then
  begin
    messageDlg('Insira a Senha!', TMsgDlgType.mtInformation, mbOKCancel, 0);
    txt_senha.SetFocus;
    Exit
  end;

  login;

end;

procedure Tfrm_login.centralizarPainel;
begin
  pnl_login.top := (Self.Height div 2) - (pnl_login.Height div 2);
  pnl_login.Left := (Self.Width div 2) - (pnl_login.Width div 2);
end;

procedure Tfrm_login.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  centralizarPainel;
end;

procedure Tfrm_login.login;
begin
  frm_menu := Tfrm_menu.Create(Self);
  frm_menu.ShowModal;
end;

end.
