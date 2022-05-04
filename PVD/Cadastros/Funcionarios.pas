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
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_funcionarios: Tfrm_funcionarios;

implementation

{$R *.dfm}

end.
