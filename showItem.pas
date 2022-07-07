unit showItem;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.Objects, FMX.StdCtrls, FMX.DateTimeCtrls, FMX.Edit, FMX.ScrollBox,
  FMX.Memo, FMX.Controls.Presentation;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    DescriptionOfNotify: TMemo;
    Label1: TLabel;
    NameOfOneNotify: TEdit;
    Label2: TLabel;
    ToolBar2: TToolBar;
    Label3: TLabel;
    RepeatEveryChooseTime: TTimeEdit;
    ToolBar3: TToolBar;
    Label4: TLabel;
    NotifyOnCurrentTime: TTimeEdit;
    RepeatRbtn: TRadioButton;
    Image1: TImage;
    ToolBar1: TToolBar;
    Button1: TButton;
    Button2: TButton;
    Splitter1: TSplitter;
    procedure setId(idNew:Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  bufName: string;
  bufRepeatBtn:boolean;
  bufDescription: string;
  bufOnCurTime:TTime;
  bufEveryTime:TTime;
  id: integer;
  bufferTime:Double;

implementation
{$R *.fmx}

uses mainForm;

procedure TForm3.Button1Click(Sender: TObject);
begin

  bufferTime:= NotifyOnCurrentTime.Time;

  mainForm.Form1.ListActives.Items[mainForm.Form1.ListActives.ItemIndex]:=Form3.NameOfOneNotify.Text + ' '
  + FloatToStr(Trunc(bufferTime*24))
  + ':' + FloatToStr(Trunc(Trunc((Frac(bufferTime*24)*60))
  + Frac((Frac(bufferTime*24)*60)/10)));

  bufName:= Form3.NameOfOneNotify.Text;
  bufRepeatBtn:= Form3.RepeatRbtn.IsChecked;
  bufDescription:= Form3.DescriptionOfNotify.Text;
  bufOnCurTime:= Form3.NotifyOnCurrentTime.Time;
  bufEveryTime:= Form3.RepeatEveryChooseTime.Time;

  mainForm.recordsArray[mainForm.Form1.ListActives.ItemIndex+1].fName:=bufName;
  mainForm.recordsArray[mainForm.Form1.ListActives.ItemIndex+1].fRemindTime:= bufOnCurTime;
  mainForm.recordsArray[mainForm.Form1.ListActives.ItemIndex+1].fRepeatTime:= bufEveryTime;
  mainForm.recordsArray[mainForm.Form1.ListActives.ItemIndex+1].fRepeatEveryDay:= bufRepeatBtn;
  mainForm.recordsArray[mainForm.Form1.ListActives.ItemIndex+1].fDescription:= bufDescription;

  mainForm.Form1.Show;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Form3.NameOfOneNotify.Text := bufName;
  Form3.NameOfOneNotify.Text:= bufName;
  Form3.RepeatRbtn.IsChecked:= bufRepeatBtn;
  Form3.DescriptionOfNotify.Text:= bufDescription;
  Form3.NotifyOnCurrentTime.Time:= bufOnCurTime;
  Form3.RepeatEveryChooseTime.Time:= bufEveryTime;

  mainForm.Form1.Show;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
  bufName:= Form3.NameOfOneNotify.Text;
  bufRepeatBtn:= Form3.RepeatRbtn.IsChecked;
  bufDescription:= Form3.DescriptionOfNotify.Text;
  bufOnCurTime:= Form3.NotifyOnCurrentTime.Time;
  bufEveryTime:= Form3.RepeatEveryChooseTime.Time;
end;

procedure TForm3.setId(idNew: Integer);
begin
  id := idNew;
end;

end.
