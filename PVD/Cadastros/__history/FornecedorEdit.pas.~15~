unit FornecedorEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask;

type
  Tfrm_fornecedores_edit = class(TForm)
    lb_nome: TLabel;
    btn_salvar: TButton;
    btn_editar: TButton;
    btn_remover: TButton;
    btn_cancelar: TButton;
    txt_nome: TEdit;
    lb_endereco: TLabel;
    txt_endereco: TEdit;
    lb_telefone: TLabel;
    txt_telefone: TMaskEdit;
    procedure btn_editarClick(Sender: TObject);
    procedure habilitaCampos;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_removerClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure desabilitaCampos;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atualizaGrid;

    private
      id_fornec : string;
      nome_fornec : string;
      endereco_fornec : string;
      telefone_fornec : string;
    procedure desabiliaCampos;
    public
    { Public declarations }
  end;

var
  frm_fornecedores_edit: Tfrm_fornecedores_edit;

implementation

{$R *.dfm}

uses Modulo, Fornecedores;

procedure Tfrm_fornecedores_edit.atualizaGrid;
begin
  dm.query_fornecedores.Close;
  dm.query_fornecedores.SQL.Clear;
  dm.query_fornecedores.SQL.Add('SELECT * FROM tb_fornecedor');
  dm.query_fornecedores.Open();
end;

procedure Tfrm_fornecedores_edit.btn_cancelarClick(Sender: TObject);
begin
  dm.tb_fornecedor.Close;
  Close;
end;

procedure Tfrm_fornecedores_edit.btn_editarClick(Sender: TObject);
begin
  btn_salvar.Enabled := true;
  btn_editar.Enabled := false;
  btn_remover.Enabled := false;
  btn_cancelar.Enabled := true;
  habilitaCampos;

  dm.tb_funcionario.Edit;

  dm.modoInsercao := false;
end;

procedure Tfrm_fornecedores_edit.btn_removerClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o Fornecedor?', mtInformation,[mbYes, mbNo], 0) = mrYes then
  begin

    dm.query_fornecedores.Close;
    dm.query_fornecedores.SQL.Clear;
    dm.query_fornecedores.SQL.Add('DELETE FROM tb_fornecedor WHERE id = :id');
    dm.query_fornecedores.ParamByName('id').Value := id_fornec;
    dm.query_fornecedores.ExecSQL();

    messageDlg('Fornecedor foi removido com sucesso!', TMsgDlgType.mtInformation, mbOKCancel, 0);
    Close;
  end;
end;

procedure Tfrm_fornecedores_edit.btn_salvarClick(Sender: TObject);
begin
  //modo inserção
  if dm.modoInsercao = true then
  begin

    //validação, campo usuário vazio
     if txt_nome.text = '' then
     begin
      messageDlg('Insira um nome para o Fornecedor!', TMsgDlgType.mtInformation, mbOKCancel, 0);
      txt_nome.SetFocus;
      Exit
     end;


    //associa campo do BD, ao campo do formulario
    dm.tb_fornecedor.FieldByName('nome').Value := txt_nome.Text;
    dm.tb_fornecedor.FieldByName('endereco').Value := txt_endereco.Text;
    dm.tb_fornecedor.FieldByName('telefone').Value := txt_telefone.Text;


    dm.tb_fornecedor.Post;
    messageDlg('Fornecedor foi cadastrado com sucesso!', TMsgDlgType.mtInformation, mbOKCancel, 0);
    Close;
  end;

  //modo edição
  if dm.modoInsercao = false then
  begin

    //validação, campo usuário vazio
     if txt_nome.text = '' then
     begin
      messageDlg('Insira um login para o Fornecedor!', TMsgDlgType.mtInformation, mbOKCancel, 0);
      txt_nome.SetFocus;
      Exit
     end;

    //associa campo do BD, ao campo do formulario
    dm.tb_fornecedor.FieldByName('nome').Value := txt_nome.Text;
    dm.tb_fornecedor.FieldByName('endereco').Value := txt_endereco.Text;
    dm.tb_fornecedor.FieldByName('telefone').Value := txt_telefone.Text;


    dm.query_fornecedores.Close;
    dm.query_fornecedores.SQL.Clear;
    dm.query_fornecedores.SQL.Add('UPDATE tb_fornecedor SET nome = :nome, endereco = :endereco, telefone = :telefone WHERE id = :id');
    dm.query_fornecedores.ParamByName('nome').Value := txt_nome.Text;
    dm.query_fornecedores.ParamByName('endereco').Value := txt_endereco.Text;
    dm.query_fornecedores.ParamByName('telefone').Value := txt_telefone.Text;
    dm.query_fornecedores.ParamByName('id').Value := id_fornec;
    dm.query_fornecedores.ExecSQL();

    messageDlg('Fornecedor foi alterado com sucesso!', TMsgDlgType.mtInformation, mbOKCancel, 0);
    Close;
  end;
end;

procedure Tfrm_fornecedores_edit.desabiliaCampos;
begin
  txt_nome.Enabled := false;
  txt_endereco.Enabled := false;
  txt_telefone.Enabled := false;
end;

procedure Tfrm_fornecedores_edit.desabilitaCampos;
begin
  txt_nome.Enabled := false;
  txt_endereco.Enabled := false;
  txt_telefone.Enabled := false;
end;

procedure Tfrm_fornecedores_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  atualizaGrid;
end;

procedure Tfrm_fornecedores_edit.FormShow(Sender: TObject);
begin
  dm.tb_fornecedor.Active := true;

  if dm.modoInsercao = true then
  begin
    btn_salvar.Enabled := true;
    btn_editar.Enabled := false;
    btn_remover.Enabled := false;
    habilitaCampos;
    dm.tb_fornecedor.Insert;
  end
  else
  begin
    id_fornec := frm_fornecedores.id_fornec;
    nome_fornec := frm_fornecedores.nome_fornec;
    endereco_fornec := frm_fornecedores.endereco_fornec;
    telefone_fornec := frm_fornecedores.telefone_fornec;

    desabilitaCampos;

    txt_nome.Text := nome_fornec;
    txt_endereco.Text := endereco_fornec;
    txt_telefone.Text := telefone_fornec;

    btn_salvar.Enabled := false;
  end;
end;

procedure Tfrm_fornecedores_edit.habilitaCampos;
begin
  txt_nome.Enabled := true;
  txt_endereco.Enabled := true;
  txt_telefone.Enabled := true;
end;

end.
