unit Cargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  Tfrm_cargos = class(TForm)
    DBGrid1: TDBGrid;
    btn_salvar: TButton;
    btn_editar: TButton;
    btn_remover: TButton;
    btn_novo: TButton;
    lb_nome: TLabel;
    txt_nome: TEdit;
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure associaCampos;
    procedure verificaCargoExistente;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cargos: Tfrm_cargos;

implementation

{$R *.dfm}

uses Modulo;

procedure Tfrm_cargos.associaCampos;
begin
  //associa campo do BD, ao campo do formulario
  dm.tb_cargos.FieldByName('cargo').Value := txt_nome.Text;
end;

procedure Tfrm_cargos.btn_novoClick(Sender: TObject);
begin
  btn_salvar.Enabled := true;
  txt_nome.Enabled := true;
  txt_nome.Text := '';
  txt_nome.SetFocus;

  //abre dataSet
  dm.tb_cargos.Active := true;

  //habilita inser��o na tb
  dm.tb_cargos.Insert;
end;

procedure Tfrm_cargos.btn_salvarClick(Sender: TObject);
begin

  if Trim(txt_nome.text) = '' then
  begin
    messageDlg('Insira um nome para o Cargo!', TMsgDlgType.mtInformation, mbOKCancel, 0);
    txt_nome.SetFocus;
    txt_nome.Text := '';
    Exit
  end;

  verificaCargoExistente;

  if not dm.query_cargos.IsEmpty then
  begin
    messageDlg('Cargo ja cadastrado! Por favor insira outro nome', TMsgDlgType.mtInformation, mbOKCancel, 0);
    txt_nome.SetFocus;
    txt_nome.Text := '';
    Exit
  end;

  associaCampos;

  //confirma a inser��o
  dm.tb_cargos.Post;
  messageDlg('Cargo foi cadastrado com sucesso!', TMsgDlgType.mtInformation, mbOKCancel, 0);
  btn_salvar.Enabled := false;
  txt_nome.Enabled := false;
  txt_nome.Text := '';
end;

procedure Tfrm_cargos.verificaCargoExistente;
begin
  dm.query_cargos.SQL.Clear;
  dm.query_cargos.SQL.Add('SELECT * FROM cargos WHERE cargo = ' +  QuotedStr(Trim(txt_nome.Text)));
  dm.query_cargos.Open();
end;

end.
