unit Modulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  Tdm = class(TDataModule)
    fd_cenecction: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    query_cargos: TFDQuery;
    query_cargosid: TFDAutoIncField;
    query_cargoscargo: TStringField;
    tb_cargo: TFDTable;
    tb_cargoid: TFDAutoIncField;
    tb_cargocargo: TStringField;
    ds_cargos: TDataSource;
    tb_funcionario: TFDTable;
    query_funcionario: TFDQuery;
    ds_funcionario: TDataSource;
    tb_funcionarioid: TFDAutoIncField;
    tb_funcionarionome: TStringField;
    tb_funcionariocpf: TStringField;
    tb_funcionariotelefone: TStringField;
    tb_funcionarioendereco: TStringField;
    tb_funcionariocargo_id: TIntegerField;
    query_usuarios: TFDQuery;
    query_usuariosid: TFDAutoIncField;
    query_usuarioslogin: TStringField;
    query_usuariossenha: TStringField;
    query_usuariosperfil: TStringField;
    query_usuariosfuncionario_id: TIntegerField;
    tb_usuario: TFDTable;
    ds_usuario: TDataSource;
    tb_usuarioid: TFDAutoIncField;
    tb_usuariologin: TStringField;
    tb_usuariosenha: TStringField;
    tb_usuarioperfil: TStringField;
    tb_usuariofuncionario_id: TIntegerField;
    tb_fornecedor: TFDTable;
    ds_fornecedor: TDataSource;
    query_fornecedores: TFDQuery;
    tb_fornecedorid: TFDAutoIncField;
    tb_fornecedornome: TStringField;
    tb_fornecedorendereco: TStringField;
    tb_fornecedortelefone: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    modoInsercao : Boolean;
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  dm.fd_cenecction.Connected := true;
end;

end.
