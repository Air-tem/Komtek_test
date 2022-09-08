unit Unit_frChild;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Unit_Add, UnitSearch, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,UnitRef;

type
  TfrChild = class(TForm)
    Frame21: TFrame2;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    ScrollBox1: TScrollBox;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    Frame11: TFrame1;
    procedure FormResize(Sender: TObject);
    procedure Frame21DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Frame11BitBtn1Click(Sender: TObject);
    procedure Frame11BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure ClickOk(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    apm:boolean;   // тип арм, true - статист, false - оператор;
  end;

var
  frChild: TfrChild;
  RefFr:TFrame3;

implementation

 uses MAIN;

{$R *.dfm}

procedure TfrChild.ClickOk(Sender: TObject);            // сохранение справки.
    begin
      RefFr.FDQuery1.Params[0].Value:=RefFr.Edit1.Text;
      RefFr.FDQuery1.Params[1].Value:=RefFr.DateTimePicker1.Date;
      RefFr.FDQuery1.Params[2].Value:= frame21.FDQuery1.Fields[0].Value;
      RefFr.FDQuery1.Params[3].Value:=RefFr.memo1.Text;
      RefFr.FDQuery1.Execute();
      RefFr.Free;
      FDQuery1.Refresh;
    end;

procedure TfrChild.Button1Click(Sender: TObject);   //создаем форму(фрейм) для добавления справки
begin
      RefFr:=TFrame3.Create(ScrollBox1);
      RefFr.Parent:=ScrollBox1;
      RefFr.Align:=alclient;
      RefFr.Label5.Caption:=frame21.FDQuery1.Fields[1].Value;
      RefFr.DateTimePicker1.Date:=now;
      RefFr.Memo1.Text:='';
      RefFr.Edit1.Text:='';
      RefFr.FDQuery1.Connection:=MainForm.FDConnection1;
      RefFr.Button1.OnClick:=ClickOk;
end;



procedure TfrChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
      if MdiChildCount=0 then
  begin
      MainForm.ToolButton12.Enabled:=false;
      MainForm.ToolButton5.Enabled:=false;
  end;
end;

procedure TfrChild.FormResize(Sender: TObject);
begin
       if ScrollBox1.Width > 990 then
                    Frame21.Align:=alClient
          else
            begin
               Frame21.Align:=alnone;
               Frame21.Width:=990;
            end;

end;



procedure TfrChild.Frame11BitBtn1Click(Sender: TObject);
begin
  Frame11.BitBtn1Click(Sender);
  Frame11BitBtn2Click(Sender);
end;

procedure TfrChild.Frame11BitBtn2Click(Sender: TObject);
begin
  Frame11.BitBtn2Click(Sender);
  Frame11.Visible:=false;
  Panel2.Visible:=not Frame11.Visible;

end;

procedure TfrChild.Frame21DataSource1DataChange(Sender: TObject; Field: TField);
begin
     FDQuery1.Close;
     FDQuery1.Params[0].Value:=frame21.FDQuery1.Fields[0].Value;
     FDQuery1.open;
end;

end.
