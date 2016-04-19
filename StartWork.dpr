program StartWork;

uses
  Forms,
  Start in 'Start.pas' {frmMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'QuestGame';
  Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.Run;
end.
