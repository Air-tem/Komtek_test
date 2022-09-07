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
    DBNavigator1: TDBNavigator;
    DateTimePicker4: TDateTimePicker;
    Label2: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure FDQuery1AfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    minD,maxD:Tdate;
  end;

implementation

uses MAIN;

{$R *.dfm}

procedure TFrame2.CheckBox2Click(Sender: TObject);
var
  sq:string;
begin
      sq:= FDQuery1.SQL.Text;

      DateTimePicker4.Enabled:=CheckBox2.Checked;
      DateTimePicker1.Enabled:=CheckBox2.Checked;

      if CheckBox2.Checked then
        begin
            if (DateTimePicker1.Date>maxD)or(DateTimePicker1.Date<minD) then DateTimePicker1.Date:=minD;
            if (DateTimePicker4.Date>maxD)or(DateTimePicker4.Date<minD) then DateTimePicker4.Date:=maxD;
            delete(sq,pos('-- db',sq),5);
            FDQuery1.Params[1].Value:=DateTimePicker1.Date;
            FDQuery1.Params[2].Value:=DateTimePicker4.Date;
        end
          else
          insert('-- db',sq,pos('and date_b',sq));
     FDQuery1.Close;
     FDQuery1.SQL.Text:= sq;
     FDQuery1.Open;
  //    memo1.Text:=sq;
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

procedure TFrame2.FDQuery1AfterOpen(DataSet: TDataSet);
begin
       FDQuery1.First;
      minD:=FDQuery1.Fields[2].AsDatetime;
      maxD:=FDQuery1.Fields[2].AsDatetime;
      while not FDQuery1.eof do
        begin
             if minD>FDQuery1.Fields[2].AsDatetime then minD:=FDQuery1.Fields[2].AsDatetime;
             if maxD<FDQuery1.Fields[2].AsDatetime then maxD:=FDQuery1.Fields[2].AsDatetime;
              
             FDQuery1.Next;
        end;
        FDQuery1.First;
end;

end.
