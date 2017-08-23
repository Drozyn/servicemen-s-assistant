unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form4: TForm4;

implementation


{$R *.lfm}

{ TForm4 }

uses
  Unit3, unit1;

procedure TForm4.Button2Click(Sender: TObject);
begin
  Form4.Close;
  Form3.Enabled:=True;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  Form1.Enabled:=False;
  Form1.SQLQuery1.Close;
  Form1.SQLTransaction1.Active:= False;
  Form1.SQLite3Connection1.Connected:= False;

  Form3.SQLQuery1.Close;
  Form3.SQLQuery1.SQL.Text:='update zamowienia set imie = :imie, nazwisko = :nazwisko, sprzet = :sprzet, model = :model, numer = :numer, data = :data, telefon = :telefon, wyposazenie = :wyposazenie, tryb = :tryb, opis = :opis where id = :id';
  Form3.SQLQuery1.Params[0].AsString:=Form3.Edit1.Caption;
  Form3.SQLQuery1.Params[1].AsString:=Form3.Edit2.Caption;
  Form3.SQLQuery1.Params[2].AsString:=Form3.Edit3.Caption;
  Form3.SQLQuery1.Params[3].AsString:=Form3.Edit4.Caption;
  Form3.SQLQuery1.Params[4].AsString:=Form3.Edit5.Caption;
  Form3.SQLQuery1.Params[5].AsString:=Form3.Edit6.Caption;
  Form3.SQLQuery1.Params[6].AsString:=Form3.Edit7.Caption;
  Form3.SQLQuery1.Params[7].AsString:=Form3.Edit8.Caption;
  Form3.SQLQuery1.Params[8].AsString:=Form3.ComboBox1.Caption;
  Form3.SQLQuery1.Params[9].AsString:=Form3.Memo1.Text;
  Form3.SQLQuery1.Params[10].AsInteger:=unit3.identyfikator;
  Form3.SQLTransaction1.Active:= True;
  Form3.SQLQuery1.ExecSQL;
  Form3.SQLTransAction1.Commit;
  Form3.SQLQuery1.Close;
  Form3.SQLTransaction1.Active:= False;
  Form3.SQLite3Connection1.Connected:= False;

  Form1.SQLQuery1.Close;
  Form1.SQLQuery1.SQL.Text:= 'select * from zamowienia';
  Form1.SQLite3Connection1.Connected:= True;
  Form1.SQLTransaction1.Active:= True;
  Form1.SQLQuery1.Open;

  Form4.Close;
  Form3.Close;
  Form1.Enabled:=True;
end;

end.

