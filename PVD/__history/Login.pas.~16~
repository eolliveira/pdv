unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage;

type
  Tfrm_login = class(TForm)
    pnl_fundo: TPanel;
    img_fundo: TImage;
    pnl_login: TPanel;
    img_login: TImage;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
  private
    procedure centralizarPainel;
  public
    { Public declarations }
  end;

var
  frm_login: Tfrm_login;

implementation

{$R *.dfm}

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

end.
