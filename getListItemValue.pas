unit getListItemValue;

interface

uses
  dtoElement;

type TGetListItemValue = class
     listOfItems : Array [1..49] of dtoElement.TDtoElement;
     listOfItemsIterator: integer;
     procedure WrightIntoArray(var dtoElementThing: dtoElement.TDtoElement);
     procedure giveIteratorValue(iterator: Integer);
end;

implementation
  procedure  TGetListItemValue.WrightIntoArray(var dtoElementThing: dtoElement.TDtoElement);
    begin
      if listOfItemsIterator < 50 then
        begin
          listOfItems[listOfItemsIterator]:= dtoElementThing;

          giveIteratorValue(listOfItemsIterator + 1);
        end;
    end;

  procedure TGetListItemValue.giveIteratorValue(iterator: Integer);
  begin
    listOfItemsIterator:= iterator;
  end;

end.

