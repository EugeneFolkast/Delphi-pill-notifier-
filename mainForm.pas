unit mainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Calendar, FMX.Layouts, FMX.ListBox,
  FMX.DateTimeCtrls, FMX.ExtCtrls, FMX.Objects, secondForm, FMX.Media, showItem,
  dtoElement, dtoTimer;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    AddToListBtn: TButton;
    ListActives: TListBox;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Image1: TImage;


    procedure AddToListBtnClick(Sender: TObject);
    procedure ListActivesItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  recordsArray: array[1..49] of dtoElement.TDtoElement;
  timersArray: array[1..49] of  dtoTimer.TdtoTimer;


implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.Windows.fmx MSWINDOWS}

procedure TForm1.AddToListBtnClick(Sender: TObject);
begin
  secondForm.Form2.Show;
end;


procedure TForm1.ListActivesItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  showItem.Form3.NameOfOneNotify.Text:=recordsArray[Item.Index+1].fName;
  showItem.Form3.RepeatEveryChooseTime.Time:=recordsArray[Item.Index+1].fRemindTime;
  showItem.Form3.NotifyOnCurrentTime.Time:=recordsArray[Item.Index+1].fRepeatTime;
  showItem.Form3.RepeatRbtn.IsChecked:=recordsArray[Item.Index+1].fRepeatEveryDay;
  showItem.Form3.DescriptionOfNotify.Text:=recordsArray[Item.Index+1].fDescription;



  showItem.Form3.Show;
end;

end.




