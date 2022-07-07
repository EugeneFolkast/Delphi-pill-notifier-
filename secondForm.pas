unit secondForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox,
  FMX.DateTimeCtrls, FMX.Edit, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo,
  FMX.Calendar, FMX.EditBox, FMX.NumberBox, FMX.Objects, dtoElement, dtoTimer;

type
  TForm2 = class(TForm)
    ToolBar1: TToolBar;
    CancelBtn: TButton;
    AddBtn: TButton;
    Splitter1: TSplitter;
    Panel1: TPanel;
    DescriptionOfNotify: TMemo;
    Label1: TLabel;
    NameOfOneNotify: TEdit;
    Label2: TLabel;
    ToolBar2: TToolBar;
    Label3: TLabel;
    ToolBar3: TToolBar;
    Label4: TLabel;
    NotifyOnCurrentTime: TTimeEdit;
    RepeatEveryChooseTime: TTimeEdit;
    RepeatRbtn: TRadioButton;
    Image1: TImage;


    procedure CancelBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure NameOfOneNotifyClick(Sender: TObject);


  end;

var
  Form2: TForm2;
  i : integer = 1;
  result: Integer;
  dto : dtoElement.TDtoElement;
  timer: dtoTimer.TdtoTimer;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses
mainForm;



procedure TForm2.AddBtnClick(Sender: TObject);
begin
  if (NameOfOneNotify.Text = '') or (NameOfOneNotify.Text = 'Впишите название...') then
    begin
      ShowMessage('Поле "Название" пусто или содержит стандартный текст.');

      NameOfOneNotify.SetFocus;
    end
  else
    begin
       if i<50 then
        begin
            dto := dtoElement.TDtoElement.create(RepeatEveryChooseTime.Time,
                                          NameOfOneNotify.Text,
                                          RepeatRbtn.IsPressed,
                                          DescriptionOfNotify.Text,
                                          NotifyOnCurrentTime.Time);

            result := mainForm.Form1.ListActives.Items.Add(dto.fName + ' ' +
                                                            FloatToStr(Trunc(dto.fRemindTime*24)) +
                                                            ':' + FloatToStr(Trunc(Trunc((Frac(dto.fRepeatTime*24)*60)) + Frac((Frac(dto.fRepeatTime*24)*60)/10))));



            mainForm.recordsArray[i]:=dto;

            timer := dtoTimer.TdtoTimer.create(NotifyOnCurrentTime.Time);

            mainForm.timersArray[i]:= timer;

            i:=i+1;

            ShowMessage(Format('Запись %s успешно добавлена', [dto.fName]));
        end;


    end;

end;

procedure TForm2.CancelBtnClick(Sender: TObject);
begin
  Form1.Show;
end;


procedure TForm2.NameOfOneNotifyClick(Sender: TObject);
begin
  NameOfOneNotify.Text := '';
end;

end.
