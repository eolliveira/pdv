unit Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  Tfrm_usuarios = class(TForm)
    txt_busca_nome: TEdit;
    btn_novo: TButton;
    grid_usuarios: TDBGrid;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure atualizaGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_usuarios: Tfrm_usuarios;

implementation

{$R *.dfm}

uses Modulo;

procedure Tfrm_usuarios.FormCreate(Sender: TObject);
begin
  atualizaGrid;
end;

procedure Tfrm_usuarios.atualizaGrid;
begin
  dm.query_usuarios.Close;
  dm.query_usuarios.SQL.Clear;
  dm.query_usuarios.SQL.Add('SELECT * FROM tb_usuario');
  dm.query_usuarios.Open();
end;

end.
