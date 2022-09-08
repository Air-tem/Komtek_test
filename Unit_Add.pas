unit Unit_Add;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls;

type
  TFrame1 = class(TFrame)
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FDQuery1: TFDQuery;
    Edit1: TEdit;
    Panel1: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses MAIN;

{$R *.dfm}

procedure TFrame1.BitBtn1Click(Sender: TObject);
begin
      FDQuery1.Params[0].Value:=Edit1.Text;
      FDQuery1.Params[1].Value:=DateTimePicker1.Date;
      FDQuery1.Params[2].Value:=now;
      FDQuery1.Execute();
end;

procedure TFrame1.BitBtn2Click(Sender: TObject);
begin
     Edit1.Text:='';
     DateTimePicker1.Date:=now;
end;

end.
