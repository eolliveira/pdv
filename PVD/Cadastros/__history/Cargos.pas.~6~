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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cargos: Tfrm_cargos;

implementation

{$R *.dfm}

procedure Tfrm_cargos.btn_novoClick(Sender: TObject);
begin
  btn_salvar.Enabled := true;
  txt_nome.SetFocus;
end;

end.
