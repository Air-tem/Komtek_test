program Mdiapp;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  CHILDWIN in 'CHILDWIN.PAS' {MDIChild},
  about in 'about.pas' {AboutBox},
  Unit_frChild in 'Unit_frChild.pas' {frChild},
  Unit_Add in 'Unit_Add.pas' {Frame1: TFrame},
  UnitSearch in 'UnitSearch.pas' {Frame2: TFrame};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
