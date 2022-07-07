program PillNotifier;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  mainForm in 'mainForm.pas' {Form1},
  secondForm in 'secondForm.pas' {Form2},
  dtoElement in 'dtoElement.pas',
  showItem in 'showItem.pas' {Form3},
  dtoTimer in 'dtoTimer.pas',
  playMedia in 'playMedia.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
