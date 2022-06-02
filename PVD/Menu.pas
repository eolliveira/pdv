unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  Tfrm_menu = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Cadastro2: TMenuItem;
    Sair1: TMenuItem;
    PRODUTOS1: TMenuItem;
    Fornecedores1: TMenuItem;
    Fornecedores2: TMenuItem;
    Cargos1: TMenuItem;
    Relatrios1: TMenuItem;
    Estoque1: TMenuItem;
    Funcionarios1: TMenuItem;
    procedure Fornecedores2Click(Sender: TObject);
    procedure Funcionarios1Click(Sender: TObject);
    procedure Cargos1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_menu: Tfrm_menu;

implementation

{$R *.dfm}

uses Funcionarios, Usuarios, Cargos, Fornecedores;


procedure Tfrm_menu.Cargos1Click(Sender: TObject);
begin
  frm_cargos := Tfrm_cargos.Create(Self);
  frm_cargos.ShowModal;
end;

procedure Tfrm_menu.Fornecedores1Click(Sender: TObject);
begin
  frm_fornecedores := Tfrm_fornecedores.Create(Self);
  frm_fornecedores.ShowModal;
end;

procedure Tfrm_menu.Fornecedores2Click(Sender: TObject);
begin
  frm_usuarios := Tfrm_usuarios.Create(Self);
  frm_usuarios.ShowModal;
end;

procedure Tfrm_menu.Funcionarios1Click(Sender: TObject);
begin
   frm_funcionarios := Tfrm_funcionarios.Create(Self);
   frm_funcionarios.ShowModal;
end;

end.
