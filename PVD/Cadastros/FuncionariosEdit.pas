unit FuncionariosEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls;

type
  Tfrm_funcionarios_edit = class(TForm)
    lb_nome: TLabel;
    lb_cpf: TLabel;
    lb_telefone: TLabel;
    lb_endereco: TLabel;
    Label2: TLabel;
    txt_nome: TEdit;
    txt_endereco: TEdit;
    cb_cargo: TComboBox;
    txt_cpf: TMaskEdit;
    txt_telefone: TMaskEdit;
    btn_salvar: TButton;
    btn_editar: TButton;
    btn_remover: TButton;
    btn_cancelar: TButton;
    procedure carregaComboBox;
    procedure FormShow(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure preencheCampos;
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_removerClick(Sender: TObject);
    procedure verificaFuncionarioExistente;
  private
    id_func : string;
    nome_func : string;
    cpf_func : string;
    telefone_func : string;
    endereco_func : string;
    cargo_func : string;
  public
    { Public declarations }
  end;

var
  frm_funcionarios_edit: Tfrm_funcionarios_edit;

implementation

{$R *.dfm}

uses Modulo, Funcionarios;

procedure Tfrm_funcionarios_edit.btn_cancelarClick(Sender: TObject);
begin
  dm.query_funcionario.Close;
  Close;
end;

procedure Tfrm_funcionarios_edit.btn_editarClick(Sender: TObject);
begin
  btn_salvar.Enabled := true;
  btn_editar.Enabled := false;
  btn_remover.Enabled := false;
  btn_cancelar.Enabled := true;

  txt_nome.Enabled := true;
  txt_cpf.Enabled := true;
  txt_telefone.Enabled := true;
  txt_endereco.Enabled := true;
  cb_cargo.Enabled := true;

  dm.tb_funcionario.Edit;
end;

procedure Tfrm_funcionarios_edit.btn_removerClick(Sender: TObject);
begin
   if MessageDlg('Deseja excluir o Funcion�rio?', mtInformation,[mbYes, mbNo], 0) = mrYes then
  begin
    dm.query_funcionario.Close;
    dm.query_funcionario.SQL.Clear;
    dm.query_funcionario.SQL.Add('DELETE FROM tb_funcionario WHERE tb_funcionario.id = :id');
    dm.query_funcionario.ParamByName('id').Value := id_func;
    dm.query_funcionario.ExecSQL();

    messageDlg('Funcion�rio foi removido com sucesso!', TMsgDlgType.mtInformation, mbOKCancel, 0);
    Close;
  end;
end;

procedure Tfrm_funcionarios_edit.btn_salvarClick(Sender: TObject);
begin

  //modo inser��o
  if frm_funcionarios.nome_func = 'novo' then
  begin

    if Trim(txt_nome.text) = '' then
    begin
      messageDlg('Informe um nome para o Funcion�rio!', TMsgDlgType.mtInformation, mbOKCancel, 0);
      txt_nome.SetFocus;
      Exit
    end;

    {
    verificaFuncionarioExistente;

    if not dm.query_funcionario.IsEmpty then
    begin
      messageDlg('Nome inforado ja pertence a um Funcion�rio!', TMsgDlgType.mtInformation, mbOKCancel, 0);
      txt_cpf.SetFocus;
      Exit
    end;

    }


    //associa campo do BD, ao campo do formulario
    dm.tb_funcionario.FieldByName('nome').Value := txt_nome.Text;
    dm.tb_funcionario.FieldByName('cpf').Value := txt_cpf.Text;
    dm.tb_funcionario.FieldByName('telefone').Value := txt_telefone.Text;
    dm.tb_funcionario.FieldByName('endereco').Value := txt_endereco.Text;
    dm.tb_funcionario.FieldByName('cargo').Value := cb_cargo.Text;
    dm.tb_funcionario.Post;
    messageDlg('Funcion�rio foi cadastrado com sucesso!', TMsgDlgType.mtInformation, mbOKCancel, 0);
    Close;
  end
  else
  //modo de edi��o
  begin
    if Trim(txt_nome.text) = '' then
    begin
      messageDlg('Informe um nome para o Funcion�rio!', TMsgDlgType.mtInformation, mbOKCancel, 0);
      txt_nome.SetFocus;
      Exit
    end;

    verificaFuncionarioExistente;

    if not dm.query_funcionario.IsEmpty then
    begin
      messageDlg('CPF informado ja pertence a outra pessoa!', TMsgDlgType.mtInformation, mbOKCancel, 0);
      txt_cpf.SetFocus;
      Exit
    end;

    //associa campo do BD, ao campo do formulario
    dm.tb_funcionario.FieldByName('nome').Value := txt_nome.Text;
    dm.tb_funcionario.FieldByName('cpf').Value := txt_cpf.Text;
    dm.tb_funcionario.FieldByName('telefone').Value := txt_telefone.Text;
    dm.tb_funcionario.FieldByName('endereco').Value := txt_endereco.Text;
    dm.tb_funcionario.FieldByName('cargo').Value := cb_cargo.Text;

    dm.query_cargos.Close;
    dm.query_cargos.SQL.Clear;
    dm.query_cargos.SQL.Add('UPDATE tb_funcionario SET nome = :nome, cpf = :cpf, telefone = :telefone, endereco =:endereco, cargo = :cargo WHERE id = :id');
    dm.query_cargos.ParamByName('id').Value := id_func;
    dm.query_cargos.ParamByName('nome').Value := txt_nome.Text;
    dm.query_cargos.ParamByName('cpf').Value := txt_cpf.Text;
    dm.query_cargos.ParamByName('telefone').Value := txt_telefone.Text;
    dm.query_cargos.ParamByName('endereco').Value := txt_endereco.Text;
    dm.query_cargos.ParamByName('cargo').Value := cb_cargo.Text;
    dm.query_cargos.ExecSQL();

    messageDlg('Dados do Funcion�rio alterados com sucesso!', TMsgDlgType.mtInformation, mbOKCancel, 0);
    Close;

  end;

end;

procedure Tfrm_funcionarios_edit.carregaComboBox;
begin

  dm.query_cargos.Close;
  dm.query_cargos.SQL.Clear;
  dm.query_cargos.SQL.Add('SELECT * FROM cargos ORDER BY cargo');
  dm.query_cargos.Open;

  //se houver registros em tb_cargos
  if not dm.query_cargos.IsEmpty then
  begin

    //eof aponta para o ultimo registro da query
    while not dm.query_cargos.Eof do
    begin
      cb_cargo.Items.Add(dm.query_cargos.FieldByName('cargo').AsString);
      dm.query_cargos.Next;
    end;

    //exibe no ComboBox o primeiro registro da query
    cb_cargo.ItemIndex := 0;
  end;
end;

procedure Tfrm_funcionarios_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_funcionarios.atualizaGrid;
end;

procedure Tfrm_funcionarios_edit.FormShow(Sender: TObject);
begin

  //ativa dataSet da TB
    dm.tb_funcionario.Active := true;

  if frm_funcionarios.nome_func = 'novo' then
  begin
    btn_salvar.Enabled := true;
    btn_editar.Enabled := false;
    btn_remover.Enabled := false;

    txt_nome.Enabled := true;
    txt_endereco.Enabled := true;
    txt_cpf.Enabled := true;
    txt_telefone.Enabled := true;
    cb_cargo.Enabled := true;
    carregaComboBox;

    txt_nome.Text := '';
    dm.tb_funcionario.Insert;
  end
  else
  begin
    carregaComboBox;

    //associa variaveis da tela Formulario
    id_func := frm_funcionarios.id_func;
    nome_func := frm_funcionarios.nome_func;
    cpf_func := frm_funcionarios.cpf_func;
    telefone_func := frm_funcionarios.telefone_func;
    cargo_func := frm_funcionarios.cargo_func;

    preencheCampos;
  end;

end;

procedure Tfrm_funcionarios_edit.preencheCampos;
begin
  txt_nome.Text := nome_func;
  txt_endereco.Text := telefone_func;
  txt_cpf.Text := cpf_func;
  txt_telefone.Text := telefone_func;
  cb_cargo.Text := cargo_func;
end;

procedure Tfrm_funcionarios_edit.verificaFuncionarioExistente;
begin
  dm.query_funcionario.Close;
  dm.query_funcionario.SQL.Clear;
  dm.query_funcionario.SQL.Add('SELECT * FROM `tb_funcionario` WHERE nome = ' + txt_nome.Text);
  dm.query_funcionario.Open;
end;

end.