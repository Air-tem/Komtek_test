unit UnitSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TFrame2 = class(TFrame)
    Edit1: TEdit;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    CheckBox1: TCheckBox;
    DateTimePicker2: TDateTimePicker;
    Label3: TLabel;
    DateTimePicker3: TDateTimePicker;
    CheckBox2: TCheckBox;
    DBGrid1: TDBGrid;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    DateTimePicker4: TDateTimePicker;
    Label2: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

uses MAIN;

{$R *.dfm}

procedure TFrame2.CheckBox1Click(Sender: TObject);
var
  sq:string;
begin
      sq:= FDQuery1.SQL.Text;
      
      DateTimePicker2.Enabled:=CheckBox1.Checked;
      DateTimePicker3.Enabled:=CheckBox1.Checked;

      if CheckBox1.Checked then
        begin
             delete(sq,pos('-- wr',sq),5);
             delete(sq,pos('-- de',sq),5);
            FDQuery1.Params[3].Value:=DateTimePicker2.Date;
            FDQuery1.Params[4].Value:=DateTimePicker3.Date;
        end
          else
        begin
          insert('-- de',sq,pos('and mD',sq));
          insert('-- wr',sq,pos('WHERE ',sq));
        end;

        FDQuery1.Close;
        FDQuery1.SQL.Text:= sq;
        FDQuery1.Open;
end;

procedure TFrame2.CheckBox2Click(Sender: TObject);
var
  sq:string;
begin
      sq:= FDQuery1.SQL.Text;

      DateTimePicker4.Enabled:=CheckBox2.Checked;
      DateTimePicker1.Enabled:=CheckBox2.Checked;

      if CheckBox2.Checked then
        begin
            delete(sq,pos('-- db',sq),5);
            FDQuery1.Params[1].Value:=DateTimePicker1.Date;
            FDQuery1.Params[2].Value:=DateTimePicker4.Date;
        end
          else
          insert('-- db',sq,pos('and date_b',sq));
     FDQuery1.Close;
     FDQuery1.SQL.Text:= sq;
     FDQuery1.Open;
end;

procedure TFrame2.DateTimePicker1Change(Sender: TObject);
begin
      DateTimePicker4.MinDate:=DateTimePicker1.Date;
      CheckBox2Click(Sender);
end;

procedure TFrame2.DateTimePicker4Change(Sender: TObject);
begin
       DateTimePicker1.MaxDate:=DateTimePicker4.Date;
      CheckBox2Click(Sender);
end;

procedure TFrame2.Edit1Change(Sender: TObject);
begin
     FDQuery1.Close;
     FDQuery1.Params[0].Value:=Edit1.Text+'%';
     FDQuery1.open;
end;


end.
