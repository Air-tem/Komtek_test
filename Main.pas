unit MAIN;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.Menus, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Buttons, Winapi.Messages,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin,
  Vcl.ImgList, System.ImageList, System.Actions,Unit_frChild, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client,Unitmodalapm;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileNewItem: TMenuItem;
    Window1: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    WindowArrangeItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    Edit1: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    StatusBar: TStatusBar;
    WindowTileItem2: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ImageList1: TImageList;
    ToolButton12: TToolButton;
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    N2: TMenuItem;
    ActionList1: TActionList;
    FileNew1: TAction;
    FileOpen1: TAction;
    FileClose1: TWindowClose;
    FileSave1: TAction;
    FileSaveAs1: TAction;
    FileExit1: TAction;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowArrangeAll1: TWindowArrange;
    HelpAbout1: TAction;
    Action1: TAction;
    Action2: TAction;
    procedure FileNew1Execute(Sender: TObject);
    procedure HelpAbout1Execute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CreateMDIChild(const Name: string; const typeApm: boolean);
  public
    { Public declarations }
    apm:boolean;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses CHILDWIN, About;

procedure TMainForm.CreateMDIChild(const Name: string; const typeApm: boolean);
var
  Child: TfrChild;
begin
  { create a new MDI child window }
  Child := TfrChild.Create(Application);
  Child.Caption := Name;
  Child.apm:=typeApm;
  Child.Frame21.CheckBox1.Visible:=typeApm;
  Child.Frame21.CheckBox2.Visible:=typeApm;

  Child.Frame21.DateTimePicker1.Visible:=typeApm;
  Child.Frame21.DateTimePicker2.Visible:=typeApm;
  Child.Frame21.DateTimePicker3.Visible:=typeApm;
  Child.Frame21.DateTimePicker4.Visible:=typeApm;
  Child.Frame21.Label2.Visible:=typeApm;
  Child.Frame21.label3.Visible:=typeApm;
  Child.Frame21.FDQuery1.Open;
  //if FileExists(Name) then Child.Memo1.Lines.LoadFromFile(Name);
end;

procedure TMainForm.FileNew1Execute(Sender: TObject);
begin
   if apm then
      CreateMDIChild('АРМ Cтатиста №' + IntToStr(MDIChildCount + 1),apm)
   else
      CreateMDIChild('АРМ оператора №' + IntToStr(MDIChildCount + 1),apm);

  if (MdiChildCount>0)  then
  begin
      ToolButton12.Enabled:=not apm;
      ToolButton5.Enabled:=not apm;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  fileName:string;
  buttonSelected : Integer;
  myopenDialog : TOpenDialog;
begin
  if FDPhysMySQLDriverLink1.VendorLib = '' then
  begin
   fileName:=GetCurrentDir+'\libmysql.dll';
   while not FileExists(fileName) do
    Begin
       buttonSelected:=MessageDlg('Не найдена библиотека libmySQL.dll. Желаете указать директорию библиотеки? ',mtConfirmation , mbOKCancel, 0);
       if buttonSelected = mrCancel then
          begin
            Application.Terminate;
            Exit;
          end;
        myopenDialog := TOpenDialog.Create(self);
        myopenDialog.InitialDir := GetCurrentDir;
        myopenDialog.Filter :='*.dll' ;
        if myopenDialog.Execute then
           CopyFile(PChar(myopenDialog.FileName), PChar(myopenDialog.InitialDir+'\libmysql.dll'), false);
          myopenDialog.Free;
    End;
    FDPhysMySQLDriverLink1.VendorLib:= myopenDialog.FileName;
  end;

    FDConnection1.Connected:=true;

end;

procedure TMainForm.FormShow(Sender: TObject);
var
  apmres:integer;
begin
     apmres:=modalapm.ShowModal;
      if apmres = mrclose then
        begin
            Application.Terminate;
            Exit;
        end;

        apm:= apmres =mryes;

end;

procedure TMainForm.HelpAbout1Execute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.N2Click(Sender: TObject);
var
  apmres,i:integer;
begin
  if MessageDlg('Смена АРМ закроет все дочерние окна!',mtConfirmation , mbOKCancel, 0)=mrok then  begin
     for i:= 0 to MdiChildCount - 1 do
        MDIChildren[i].Close;

      apmres:=modalapm.ShowModal;       //форма выбора арм
      if (apmres = mryes)or(apmres = mrok) then
        begin
            apm:= apmres =mryes;
        end;
  end;
      ToolButton12.Enabled:=not apm;               //эти кнопки доступны только оператору арм = fasle;
      ToolButton5.Enabled:=not apm;

end;



procedure TMainForm.ToolButton12Click(Sender: TObject);
begin
     (ActiveMDIChild as TfrChild).Button1Click(Sender);
end;

procedure TMainForm.ToolButton5Click(Sender: TObject);
begin
     (ActiveMDIChild as TfrChild).Frame11.Visible:=not (ActiveMDIChild as TfrChild).Frame11.Visible;
     (ActiveMDIChild as TfrChild).Panel2.Visible:=not (ActiveMDIChild as TfrChild).Panel2.Visible ;
end;

procedure TMainForm.FileExit1Execute(Sender: TObject);
begin
  Close;
end;

end.
