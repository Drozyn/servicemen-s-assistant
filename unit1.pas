unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, db, FileUtil, Forms, Controls,
  Graphics, Dialogs, DBGrids, StdCtrls, Grids, ComCtrls, Menus, unit2, unit3, unit5, Unit6;

type

  { TForm1 }

  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.SQLQuery1.Close;
  Form1.SQLQuery1.SQL.Text:= 'select * from zamowienia';
  Form1.SQLite3Connection1.Connected:= True;
  Form1.SQLTransaction1.Active:= True;
  Form1.SQLQuery1.Open;
  Form1.MenuItem9.Checked:=True;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  Form1.Enabled:=False;
  Form2.Show;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
Form1.SQLQuery1.Close;
   Form1.SQLQuery1.SQL.Text:= 'select * from zamowienia where tryb="Naprawione"';
   Form1.SQLQuery1.Open;
   Form1.MenuItem6.Checked:=False;
   Form1.MenuItem7.Checked:=False;
   Form1.MenuItem2.Checked:=True;
   Form1.MenuItem8.Checked:=False;
   Form1.MenuItem9.Checked:=False;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  Form1.Enabled:=False;
  Form5.Show;
  Form1.MenuItem6.Checked:=False;
   Form1.MenuItem7.Checked:=False;
   Form1.MenuItem2.Checked:=False;
   Form1.MenuItem8.Checked:=False;
   Form1.MenuItem9.Checked:=False;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  Form1.Enabled:=False;
  Form6.Show;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
   Form1.SQLQuery1.Close;
   Form1.SQLQuery1.SQL.Text:= 'select * from zamowienia where tryb="Oczekuje"';
   Form1.SQLQuery1.Open;
   Form1.MenuItem6.Checked:=True;
   Form1.MenuItem7.Checked:=False;
   Form1.MenuItem2.Checked:=False;
   Form1.MenuItem8.Checked:=False;
   Form1.MenuItem9.Checked:=False;
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
Form1.SQLQuery1.Close;
Form1.SQLQuery1.SQL.Text:= 'select * from zamowienia where tryb="Nieodebrane"';
Form1.SQLQuery1.Open;
Form1.MenuItem6.Checked:=False;
Form1.MenuItem7.Checked:=True;
Form1.MenuItem2.Checked:=False;
Form1.MenuItem8.Checked:=False;
Form1.MenuItem9.Checked:=False;
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
Form1.SQLQuery1.Close;
Form1.SQLQuery1.SQL.Text:= 'select * from zamowienia where tryb="Odebrane"';
Form1.SQLQuery1.Open;
Form1.MenuItem6.Checked:=False;
Form1.MenuItem7.Checked:=False;
Form1.MenuItem2.Checked:=False;
Form1.MenuItem8.Checked:=True;
Form1.MenuItem9.Checked:=False;
end;

procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  Form1.SQLQuery1.Close;
  Form1.SQLQuery1.SQL.Text:= 'select * from zamowienia';
  Form1.SQLQuery1.Open;
     Form1.MenuItem6.Checked:=False;
   Form1.MenuItem7.Checked:=False;
   Form1.MenuItem2.Checked:=False;
   Form1.MenuItem8.Checked:=False;
   Form1.MenuItem9.Checked:=True;
end;


procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Form1.SQLQuery1.Close;
  Form1.SQLTransaction1.Active:= False;
  Form1.SQLite3Connection1.Connected:= False;
end;


procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
  Form3.Show;
end;

end.

