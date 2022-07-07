unit dtoTimer;

interface

uses FMX.Types, System.SysUtils, playMedia;

type TdtoTimer = class
  fAlarmTime:double;
  timer:TTimer;
  playMedia: playMedia.TPlayMedia;
  constructor create(alarmTime: double);
  procedure alarm(Sender: TObject);
  function count_time(alarmTime: double): double;
end;

implementation

var
    now1: Double;
    alarmTime1: Double;

procedure TdtoTimer.alarm(Sender: TObject);
begin
  if Now = fAlarmTime then
    begin
       playMedia.create();

       playMedia.playSound;

       timer.Free;
    end;

end;

function TdtoTimer.count_time(alarmTime: Double) : double;
begin
  if alarmTime< Now then
    begin
        now1:= Now * 24;
        alarmTime1:= alarmTime*24;

        Result:= (now1 - alarmTime1) * 3600000;
    end
  else
    begin
      now1:= Now * 24;
      alarmTime1:= alarmTime*24;

      Result:= (now1 - alarmTime1) * (-3600000);
    end;



end;

constructor TdtoTimer.create(alarmTime: Double);
begin
     fAlarmTime:= alarmTime;
     timer.Create(nil);

     timer.Interval:= Trunc(count_time(alarmTime));
     timer.Enabled := True;

     timer.OnTimer:=alarm;
end;

end.
