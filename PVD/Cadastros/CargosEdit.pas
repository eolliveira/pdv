unit CargosEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tfrm_cargos_edit = class(TForm)
   // procedure btn_salvarClick(Sender: TObject);
    //procedure FormShow(Sender: TObject);
    //procedure btn_editarClick(Sender: TObject);
    //procedure btn_cancelarClick(Sender: TObject);
    //procedure btn_removerClick(Sender: TObject);
    //procedure verificaCargoExistente;
    //procedure verificaNomeCargo;
    //procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //procedure txt_cargoKeyPress(Sender: TObject; var Key: Char);
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



end.
