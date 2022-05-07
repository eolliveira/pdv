unit Cargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  Tfrm_cargos = class(TForm)
    gd_cargos: TDBGrid;
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
    procedure listarCargos;
    procedure FormShow(Sender: TObject);
    procedure gd_cargosCellClick(Column: TColumn);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_removerClick(Sender: TObject);
    procedure txt_nomeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cargos: Tfrm_cargos;
  id : String;

implementation

{$R *.dfm}

uses Modulo;

procedure Tfrm_cargos.associaCampos;
begin
  //associa campo do BD, ao campo do formulario
  dm.tb_cargos.FieldByName('cargo').Value := txt_nome.Text;
end;

procedure Tfrm_cargos.btn_editarClick(Sender: TObject);
begin

  id := dm.query_cargos.FieldByName('id').Value;

  associaCampos;

  dm.query_cargos.Close;
  dm.query_cargos.SQL.Clear;
  dm.query_cargos.SQL.Add('UPDATE cargos SET cargo = :cargo WHERE id = :id');
  dm.query_cargos.ParamByName('id').Value := id;
  dm.query_cargos.ParamByName('cargo').Value := txt_nome.Text;
  dm.query_cargos.ExecSQL();

  txt_nome.Text := '';
  btn_editar.Enabled := false;
  btn_remover.Enabled := false;

  listarCargos
end;

procedure Tfrm_cargos.btn_novoClick(Sender: TObject);
begin
  btn_salvar.Enabled := true;
  txt_nome.Enabled := true;
  txt_nome.Text := '';
  btn_novo.Enabled := false;
  txt_nome.SetFocus;

  //abre dataSet
  dm.tb_cargos.Active := true;

  //habilita inser��o na tb
  dm.tb_cargos.Insert;
end;

procedure Tfrm_cargos.btn_removerClick(Sender: TObject);
begin
  if txt_nome.Text = '' then
  exit;

  if MessageDlg('Deswja excluir o cargo?', mtInformation,[mbYes, mbNo], 0) = mrYes then
  begin
    id := dm.query_cargos.FieldByName('id').Value;

    dm.query_cargos.Close;
    dm.query_cargos.SQL.Clear;
    dm.query_cargos.SQL.Add('DELETE FROM cargos WHERE cargos.id = :id');
    dm.query_cargos.ParamByName('id').Value := id;
    dm.query_cargos.ExecSQL();

    txt_nome.Text := '';
    btn_editar.Enabled := false;
    btn_remover.Enabled := false;

    listarCargos;
  end;
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
  listarCargos;
  btn_salvar.Enabled := false;
  btn_novo.Enabled := true;
  txt_nome.Enabled := false;
  txt_nome.Text := '';
end;

procedure Tfrm_cargos.FormShow(Sender: TObject);
begin
  listarCargos;
end;

procedure Tfrm_cargos.gd_cargosCellClick(Column: TColumn);
begin
  txt_nome.Enabled := true;
  btn_editar.Enabled := true;
  btn_salvar.Enabled := false;
  btn_remover.Enabled := true;

  dm.tb_cargos.Edit;

  if dm.query_cargos.FieldByName('cargo').Value <> null then
  txt_nome.Text := dm.query_cargos.FieldByName('cargo').Value;

end;

procedure Tfrm_cargos.listarCargos;
begin
  dm.query_cargos.Close;
  dm.query_cargos.SQL.Clear;
  dm.query_cargos.SQL.Add('SELECT * FROM cargos Order by cargo');
  dm.query_cargos.Open();
end;

procedure Tfrm_cargos.txt_nomeChange(Sender: TObject);
begin

  txt_nome.SelStart := Length(txt_nome.Text);
end;

procedure Tfrm_cargos.verificaCargoExistente;
begin
  dm.query_cargos.Close;
  dm.query_cargos.SQL.Clear;
  dm.query_cargos.SQL.Add('SELECT * FROM cargos WHERE cargo = ' +  QuotedStr(Trim(txt_nome.Text)));
  dm.query_cargos.Open();
end;

end.
