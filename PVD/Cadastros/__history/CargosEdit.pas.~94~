unit CargosEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tfrm_cargos_edit = class(TForm)
    btn_salvar: TButton;
    btn_editar: TButton;
    btn_remover: TButton;
    txt_cargo: TEdit;
    btn_cancelar: TButton;
    lb_cargo: TLabel;
    procedure btn_salvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_removerClick(Sender: TObject);
    procedure verificaCargoExistente;
    procedure verificaNomeCargo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txt_cargoKeyPress(Sender: TObject; var Key: Char);
  private
    id_cargo : string;
    nome_cargo : string;
    nome_cargo_antigo : string;
  public
    { Public declarations }
  end;

var
  frm_cargos_edit: Tfrm_cargos_edit;

implementation

{$R *.dfm}

uses Cargos, Modulo;

procedure Tfrm_cargos_edit.btn_cancelarClick(Sender: TObject);
begin
  dm.query_cargos.Close;
  Close;
end;

procedure Tfrm_cargos_edit.btn_editarClick(Sender: TObject);
begin
  btn_salvar.Enabled := true;
  btn_editar.Enabled := false;
  btn_remover.Enabled := false;
  btn_cancelar.Enabled := true;
  txt_cargo.Enabled := true;
  txt_cargo.SetFocus;

  nome_cargo_antigo := nome_cargo;

  dm.tb_cargo.Edit;

  frm_cargos.modoInsercao := false;
end;

procedure Tfrm_cargos_edit.btn_removerClick(Sender: TObject);
begin

  if MessageDlg('Deseja excluir o cargo?', mtInformation,[mbYes, mbNo], 0) = mrYes then
  begin

    dm.query_funcionario.Close;
    dm.query_funcionario.SQL.Clear;
    dm.query_funcionario.SQL.Add('SELECT * FROM tb_funcionario f JOIN tb_cargo c ON c.id = f.cargo_id WHERE cargo_id = :id');
    dm.query_funcionario.ParamByName('id').Value := id_cargo;
    dm.query_funcionario.Open;

    if not dm.query_funcionario.IsEmpty then
    begin
      messageDlg('Voce não pode remover esse cargo. Pois ele pertence a um ou mais funcionário(s)!', TMsgDlgType.mtWarning, mbOKCancel, 0);
      Close;
      Exit;
    end;

    dm.query_cargos.Close;
    dm.query_cargos.SQL.Clear;
    dm.query_cargos.SQL.Add('DELETE FROM tb_cargo WHERE tb_cargo.id = :id');
    dm.query_cargos.ParamByName('id').Value := id_cargo;
    dm.query_cargos.ExecSQL();

    messageDlg('Cargo foi removido com sucesso!', TMsgDlgType.mtInformation, mbOKCancel, 0);
    Close;
  end;
end;

procedure Tfrm_cargos_edit.btn_salvarClick(Sender: TObject);
begin

  //modo inserção
  if frm_cargos.modoInsercao = true then
  begin

     if txt_cargo.text = '' then
     begin
      messageDlg('Insira um nome para o Cargo!', TMsgDlgType.mtInformation, mbOKCancel, 0);
      txt_cargo.SetFocus;
      Exit
     end;

    verificaCargoExistente;

    if not dm.query_cargos.IsEmpty then
    begin
      messageDlg('Cargo ja existente! Por favor insira outro nome', TMsgDlgType.mtInformation, mbOKCancel, 0);
      txt_cargo.SetFocus;
      Exit
    end;

    //associa campo do BD, ao campo do formulario
    dm.tb_cargo.FieldByName('cargo').Value := txt_cargo.Text;
    dm.tb_cargo.Post;
    messageDlg('Cargo cadastrado com sucesso!', TMsgDlgType.mtInformation, mbOKCancel, 0);
    Close;
  end;

  //modo edição
  if frm_cargos.modoInsercao = false then
  begin

    //verifica se houve alteração no nome do cargo
    if nome_cargo_antigo = txt_cargo.Text then
    begin
      dm.query_cargos.Close;
      Close;
      Exit;
    end;


    if txt_cargo.text = '' then
    begin
      messageDlg('Insira um nome para o Cargo!', TMsgDlgType.mtInformation, mbOKCancel, 0);
      txt_cargo.SetFocus;
      Exit
    end;

    verificaCargoExistente;

    if not dm.query_cargos.IsEmpty then
    begin
      messageDlg('Cargo ja existente! Por favor insira outro nome', TMsgDlgType.mtInformation, mbOKCancel, 0);
      txt_cargo.SetFocus;
      Exit
    end;

    //associa campo do BD, ao campo do formulario
    dm.tb_cargo.FieldByName('cargo').Value := txt_cargo.Text;

    dm.query_cargos.Close;
    dm.query_cargos.SQL.Clear;
    dm.query_cargos.SQL.Add('UPDATE tb_cargo SET cargo = :cargo WHERE id = :id');
    dm.query_cargos.ParamByName('id').Value := id_cargo;
    dm.query_cargos.ParamByName('cargo').Value := txt_cargo.Text;
    dm.query_cargos.ExecSQL();

    messageDlg('Cargo alterado com sucesso!', TMsgDlgType.mtInformation, mbOKCancel, 0);
    Close;
  end;

end;

procedure Tfrm_cargos_edit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm_cargos.listarCargos;
end;

procedure Tfrm_cargos_edit.FormShow(Sender: TObject);
begin

  dm.tb_cargo.Active := true;

  if frm_cargos.modoInsercao = true then
  begin
    btn_salvar.Enabled := true;
    btn_editar.Enabled := false;
    btn_remover.Enabled := false;
    txt_cargo.Enabled := true;
    dm.tb_cargo.Active := true;
    dm.tb_cargo.Insert;
  end
  else
  begin
    id_cargo := frm_cargos.id_cargo;
    nome_cargo := frm_cargos.nome_cargo;

    txt_cargo.Text := nome_cargo;
    btn_salvar.Enabled := false;
  end;

end;

procedure Tfrm_cargos_edit.txt_cargoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
  btn_salvar.Click;
end;

procedure Tfrm_cargos_edit.verificaCargoExistente;
begin
  dm.query_cargos.Close;
  dm.query_cargos.SQL.Clear;
  dm.query_cargos.SQL.Add('SELECT * FROM tb_cargo WHERE cargo = ' + QuotedStr(Trim(txt_cargo.Text)));
  dm.query_cargos.Open();
end;

procedure Tfrm_cargos_edit.verificaNomeCargo;
begin
  if txt_cargo.text = '' then
  begin
    messageDlg('Insira um nome para o Cargo!', TMsgDlgType.mtInformation, mbOKCancel, 0);
    txt_cargo.SetFocus;
    Exit
  end;
end;

end.
