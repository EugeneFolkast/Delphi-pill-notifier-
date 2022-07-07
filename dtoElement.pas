unit dtoElement;

interface

type TDtoElement = class
    fRepeatTime: TTime;
    fName: string;
    fRepeatEveryDay: boolean;
    fDescription: string;
    fRemindTime: TTime;
    constructor create(repeatTime: TTime; name: string; repeatEveryDay: boolean;
                          description: string; remindTime: TTime);

end;

implementation

constructor TDtoElement.create(repeatTime: TTime; name: string; repeatEveryDay: boolean;
                          description: string; remindTime: TTime);
  begin
    fRepeatTime := repeatTime;
    fName := name;
    fRepeatEveryDay := repeatEveryDay;
    fDescription := description;
    fRemindTime := remindTime;
  end;

end.
