unit Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_funcionarios = class(TForm)
    txt_busca_nome: TEdit;
    txt_busca_cpf: TMaskEdit;
    Label1: TLabel;
    rb_nome: TRadioButton;
    rb_cpf: TRadioButton;
    btn_novo: TButton;
    DBGrid1: TDBGrid;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure atualizaGrid;
    procedure btn_novoClick(Sender: TObject);
    procedure txt_busca_nomeChange(Sender: TObject);
    procedure buscaPorNome;
    procedure buscaPorCpf;
    procedure rb_nomeClick(Sender: TObject);
    procedure rb_cpfClick(Sender: TObject);
    procedure txt_busca_cpfChange(Sender: TObject);
  private
    { Private declarations }
  public
    id_func : string;
    nome_func : string;
    cpf_func : string;
    telefone_func : string;
    endereco_func : string;
    id_cargo_func : string;
  end;

var
  frm_funcionarios: Tfrm_funcionarios;

implementation

{$R *.dfm}

uses Modulo, FuncionariosEdit;

{ Tfrm_funcionarios }

procedure Tfrm_funcionarios.btn_novoClick(Sender: TObject);
begin
  nome_func := 'novo';

  frm_funcionarios_edit := Tfrm_funcionarios_edit.Create(Self);
  frm_funcionarios_edit.ShowModal;
end;

procedure Tfrm_funcionarios.DBGrid1DblClick(Sender: TObject);
begin
   {
  dm.query_funcionario.Close;
  dm.query_funcionario.SQL.Clear;
  dm.query_funcionario.SQL.Add('SELECT * FROM tb_funcionario');
  dm.query_funcionario.Open();
    }

  id_func := dm.query_funcionario.FieldByName('id').Value;
  nome_func := dm.query_funcionario.FieldByName('nome').Value;
  cpf_func := dm.query_funcionario.FieldByName('cpf').Value;
  telefone_func := dm.query_funcionario.FieldByName('telefone').Value;
  endereco_func := dm.query_funcionario.FieldByName('endereco').Value;
  id_cargo_func := dm.query_funcionario.FieldByName('cargo_id').Value;

  frm_funcionarios_edit := Tfrm_funcionarios_edit.Create(Self);
  frm_funcionarios_edit.ShowModal;
end;

procedure Tfrm_funcionarios.buscaPorCpf;
begin
  dm.query_funcionario.Close;
  dm.query_funcionario.SQL.Clear;
  dm.query_funcionario.SQL.Add('SELECT * FROM tb_funcionario WHERE cpf = :cpf');
  dm.query_funcionario.ParamByName('cpf').Value := txt_busca_cpf.Text;
  dm.query_funcionario.Open();
end;


procedure Tfrm_funcionarios.buscaPorNome;
begin
  dm.query_funcionario.Close;
  dm.query_funcionario.SQL.Clear;
  dm.query_funcionario.SQL.Add('SELECT * FROM tb_funcionario WHERE nome LIKE :nome');
  dm.query_funcionario.ParamByName('nome').Value := txt_busca_nome.Text + '%';
  dm.query_funcionario.Open();
end;

procedure Tfrm_funcionarios.FormShow(Sender: TObject);
begin
    atualizaGrid;
end;

procedure Tfrm_funcionarios.rb_cpfClick(Sender: TObject);
begin
  txt_busca_nome.Visible := false;
  txt_busca_cpf.Visible := true;
  txt_busca_cpf.SetFocus;
  buscaPorCpf;
end;

procedure Tfrm_funcionarios.rb_nomeClick(Sender: TObject);
begin
  txt_busca_cpf.Visible := false;
  txt_busca_nome.Visible := true;
  atualizaGrid;
end;

procedure Tfrm_funcionarios.txt_busca_cpfChange(Sender: TObject);
begin
  if txt_busca_cpf.Text <> '___.___.___-__' then
  begin
    buscaPorCpf;
  end
  else
    begin
      atualizaGrid;
    end;
end;

procedure Tfrm_funcionarios.txt_busca_nomeChange(Sender: TObject);
begin
  buscaPorNome
end;

procedure Tfrm_funcionarios.atualizaGrid;
begin
  dm.query_funcionario.Close;
  dm.query_funcionario.SQL.Clear;
  dm.query_funcionario.SQL.Add('SELECT f.id, f.nome, f.cpf, f.telefone, f.endereco, f.cargo_id, c.cargo FROM tb_funcionario f JOIN tb_cargo c ON c.id = f.cargo_id');
  dm.query_funcionario.Open();
end;

end.
