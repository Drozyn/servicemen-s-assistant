unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form5: TForm5;

implementation
uses
  unit1;
{$R *.lfm}

{ TForm5 }

procedure TForm5.Button2Click(Sender: TObject);
begin
  Form5.Close;
  Form1.Enabled:=True;
  Form1.FormStyle:=fsStayOnTop;
  Form1.FormStyle:=fsNormal;
end;

procedure TForm5.Button1Click(Sender: TObject);
var
  fraza:string;
begin
   fraza:=Form5.Edit1.Text;
  Form1.SQLQuery1.Close;
  if Form5.RadioButton1.Checked=True then
  begin
    Form1.SQLQuery1.SQL.Text:= 'select * from zamowienia where id = :fraza';
    Form1.SQLQuery1.Params[0].AsString:=fraza;
  end
  else
  if Form5.RadioButton2.Checked=True then
  begin
   Form1.SQLQuery1.SQL.Text:= 'select * from zamowienia where nazwisko like :fraza';
   Form1.SQLQuery1.Params[0].AsString:='%'+fraza+'%';
  end
  else
  if Form5.RadioButton3.Checked=True then
  begin
  Form1.SQLQuery1.SQL.Text:= 'select * from zamowienia where data like :fraza';
    Form1.SQLQuery1.Params[0].AsString:='%'+fraza+'%';
  end
  else
  if Form5.RadioButton4.Checked=True then
  begin
    Form1.SQLQuery1.SQL.Text:= 'select * from zamowienia where numer like :fraza';
    Form1.SQLQuery1.Params[0].AsString:='%'+fraza+'%';
  end
  else
  if Form5.RadioButton5.Checked=True then
  begin
    Form1.SQLQuery1.SQL.Text:= 'select * from zamowienia where model like :fraza';
    Form1.SQLQuery1.Params[0].AsString:='%'+fraza+'%';
  end
  else
  if Form5.RadioButton6.Checked=True then
  begin
    Form1.SQLQuery1.SQL.Text:= 'select * from zamowienia where sprzet like :fraza';
    Form1.SQLQuery1.Params[0].AsString:='%'+fraza+'%';
  end;
  Form1.SQLite3Connection1.Connected:= True;
  Form1.SQLTransaction1.Active:= True;
  Form1.SQLQuery1.Open;
  Form1.MenuItem6.Checked:=False;
   Form1.MenuItem7.Checked:=False;
   Form1.MenuItem2.Checked:=False;
   Form1.MenuItem8.Checked:=False;
   Form1.MenuItem9.Checked:=False;
  Form5.Close;
  Form1.Enabled:=True;
  Form1.FormStyle:=fsStayOnTop;
  Form1.FormStyle:=fsNormal;

end;

end.

