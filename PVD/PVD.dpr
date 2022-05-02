program PVD;

uses
  Vcl.Forms,
  Login in 'Login.pas' {frm_login};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_login, frm_login);
  Application.Run;
end.
