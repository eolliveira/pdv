program PVD;

uses
  Vcl.Forms,
  Login in 'Login.pas' {frm_login},
  Menu in 'Menu.pas' {frm_menu},
  Funcionarios in 'Cadastros\Funcionarios.pas' {frm_funcionarios},
  Usuarios in 'Cadastros\Usuarios.pas' {frm_usuarios},
  Cargos in 'Cadastros\Cargos.pas' {frm_cargos},
  Modulo in 'Modulo.pas' {dm: TDataModule},
  CargosEdit in 'Cadastros\CargosEdit.pas' {frm_cargos_edit},
  FuncionariosEdit in 'Cadastros\FuncionariosEdit.pas' {frm_funcionarios_edit},
  UsuarioEdit in 'Cadastros\UsuarioEdit.pas' {frm_usuario_edit},
  Fornecedores in 'Cadastros\Fornecedores.pas' {frm_fornecedores},
  FornecedorEdit in 'Cadastros\FornecedorEdit.pas' {frm_fornecedores_edit};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tfrm_login, frm_login);
  Application.Run;
end.
