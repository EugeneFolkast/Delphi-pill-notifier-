unit Unit4;

interface

uses Unit1, Unit3;

type TUpdateList = class
      procedure UpdateForm(listElement: Unit3.TDtoElement);

end;


implementation

procedure TUpdateList.UpdateForm(listElement: Unit3.TDtoElement);
begin
    Unit1.Form1.ListActives.Items.AddObject(listElement.fName,
                                listElement);
end;
end.
