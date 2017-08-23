unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, sqlite3conn, FileUtil, LR_Class, LR_DBSet,
  Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Opis: TMemo;
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

uses
  unit1;


procedure TForm2.Button2Click(Sender: TObject);
begin
  Form1.Enabled:=True;
  Form2.Close;
end;

procedure TForm2.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if Form1.Enabled=False then Form1.Enabled:=True;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Form2.Opis.Clear;
  Form2.Edit6.Text:=DateToStr(Date);
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Form1.SQLQuery1.Close;
  Form1.SQLTransaction1.Active:= False;
  Form1.SQLite3Connection1.Connected:= False;

  Form2.SQLQuery1.Close;
  Form2.SQLQuery1.SQL.Text:='insert into zamowienia (imie, nazwisko, sprzet, model, numer, data, telefon, wyposazenie, tryb, opis) values (:imie,:nazwisko,:sprzet,:model,:numer,:data,:telefon,:wyposazenie,:tryb,:opis)';
  Form2.SQLQuery1.Params[0].AsString:=Form2.Edit1.Caption;
  Form2.SQLQuery1.Params[1].AsString:=Form2.Edit2.Caption;
  Form2.SQLQuery1.Params[2].AsString:=Form2.Edit3.Caption;
  Form2.SQLQuery1.Params[3].AsString:=Form2.Edit4.Caption;
  Form2.SQLQuery1.Params[4].AsString:=Form2.Edit5.Caption;
  Form2.SQLQuery1.Params[5].AsString:=Form2.Edit6.Caption;
  Form2.SQLQuery1.Params[6].AsString:=Form2.Edit7.Caption;
  Form2.SQLQuery1.Params[7].AsString:=Form2.Edit8.Caption;
  Form2.SQLQuery1.Params[8].AsString:=Form2.ComboBox1.Caption;
  Form2.SQLQuery1.Params[9].AsString:=Form2.Opis.Text;
  Form2.SQLTransaction1.Active:= True;
  Form2.SQLQuery1.ExecSQL;
  Form2.SQLTransAction1.Commit;
  Form2.SQLQuery1.Close;
  Form2.SQLTransaction1.Active:= False;
  Form2.SQLite3Connection1.Connected:= False;
  Form2.SQLQuery1.Close;
  Form2.SQLQuery1.SQL.Text:='select * from zamowienia where id = (select max(id) from zamowienia)';
  Form2.SQLite3Connection1.Connected:= True;
  Form2.SQLTransaction1.Active:= True;
  Form2.SQLQuery1.Open;
  Form2.frReport1.LoadFromFile('raport.lrf');
  Form2.frReport1.ShowReport;
  Form2.SQLQuery1.Close;
  Form2.SQLTransaction1.Active:= False;
  Form2.SQLite3Connection1.Connected:= False;

  Form1.SQLQuery1.Close;
  Form1.SQLQuery1.SQL.Text:= 'select * from zamowienia';
  Form1.SQLite3Connection1.Connected:= True;
  Form1.SQLTransaction1.Active:= True;
  Form1.SQLQuery1.Open;
  Form1.Enabled:=True;
  Form2.Close;

end;

end.

