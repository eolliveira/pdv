unit Fornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  Tfrm_fornecedores = class(TForm)
    grid_fornecedores: TDBGrid;
    btn_novo: TButton;
    procedure btn_novoClick(Sender: TObject);
    procedure grid_fornecedoresDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    id_fornec : string;
    nome_fornec : string;
    endereco_fornec : string;
    telefone_fornec : string;

    modoInsercao : Boolean;
  end;

var
  frm_fornecedores: Tfrm_fornecedores;

implementation

{$R *.dfm}

uses Modulo, FornecedorEdit;

procedure Tfrm_fornecedores.btn_novoClick(Sender: TObject);
begin
  modoInsercao := true;
  frm_fornecedores_edit := Tfrm_fornecedores_edit.Create(Self);
  frm_fornecedores_edit.ShowModal;
end;

procedure Tfrm_fornecedores.grid_fornecedoresDblClick(Sender: TObject);
begin
    id_fornec := dm.query_fornecedores.FieldByName('id').Value;
    nome_fornec := dm.query_fornecedores.FieldByName('nome').Value;
    endereco_fornec := dm.query_fornecedores.FieldByName('endereco').Value;
    telefone_fornec := dm.query_fornecedores.FieldByName('telefone').Value;

    modoInsercao := false;

    frm_fornecedores_edit := Tfrm_fornecedores_edit.Create(Self);
    frm_fornecedores_edit.ShowModal;

end;

end.
