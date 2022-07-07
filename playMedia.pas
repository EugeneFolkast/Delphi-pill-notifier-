unit playMedia;

interface

uses FMX.Types, System.SysUtils, FMX.Media, System.UITypes, System.Types,
   FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, System.Classes, System.Variants, System.IOUtils;

type TPlayMedia = class
  mediaPlayer: TMediaPlayer;
  timer: TTimer;
  procedure create();
  procedure playSound();
  procedure stopPlaying();
  procedure MyOnTimer(Sender: TObject);
end;
implementation

procedure TPlayMedia.create();
begin
  mediaPlayer.Create(nil);
  mediaPlayer.FileName := TPath.GetDocumentsPath + PathDelim + 'cat.mp3';
end;

procedure TPlayMedia.MyOnTimer(Sender: TObject);
begin
  if timer.Enabled = false then
    stopPlaying;
    timer.Free;
end;

procedure TPlayMedia.playSound;
begin
  timer.Create(nil);
  timer.Interval:= 5000;
  timer.Enabled := True;

  timer.OnTimer:= MyOnTimer;

  mediaPlayer.Play;

end;

procedure TPlayMedia.stopPlaying;
begin
    mediaPlayer.Stop;
end;


end.
