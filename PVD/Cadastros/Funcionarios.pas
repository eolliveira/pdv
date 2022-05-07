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
    txt_nome: TEdit;
    txt_endereco: TEdit;
    cb_cargo: TComboBox;
    lb_nome: TLabel;
    lb_cpf: TLabel;
    lb_telefone: TLabel;
    lb_endereco: TLabel;
    Label2: TLabel;
    btn_salvar: TButton;
    btn_editar: TButton;
    btn_remover: TButton;
    btn_novo: TButton;
    txt_cpf: TMaskEdit;
    txt_telefone: TMaskEdit;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
  private
    procedure carregarComboxBox;
  public
    { Public declarations }
  end;

var
  frm_funcionarios: Tfrm_funcionarios;

implementation

{$R *.dfm}

uses Modulo;

{ Tfrm_funcionarios }

procedure Tfrm_funcionarios.carregarComboxBox;
begin
  dm.tb_cargos.Open;
  cb_cargo.Enabled := true;

  //se houver registros em tb_cargos
  if not dm.query_cargos.IsEmpty then
  begin

    //eof aponta para o ultimo registro da query
    while not dm.query_cargos.Eof do
    begin
      cb_cargo.Items.Add(dm.query_cargos.FieldByName('cargo').AsString);
      dm.query_cargos.Next;
    end;
  end;

end;

procedure Tfrm_funcionarios.FormShow(Sender: TObject);
begin
  carregarComboxBox;

  //exibe o registro da query
  cb_cargo.ItemIndex := 0
end;

end.
