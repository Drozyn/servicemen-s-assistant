unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, db, FileUtil, LR_Class, LR_Desgn,
  LR_DBSet, Forms, Controls, Graphics, Dialogs, StdCtrls, unit4;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
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
    frDesigner1: TfrDesigner;
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
    Memo1: TMemo;
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form3: TForm3;
  identyfikator:integer;

implementation
uses
  unit1;

{$R *.lfm}

{ TForm3 }

procedure TForm3.FormShow(Sender: TObject);
begin
  Form3.Enabled:=True;
  Form1.Enabled:=False;
  identyfikator:=(Form1.DBGrid1.DataSource.DataSet.Fields[0].Value);
  Form1.SQLQuery1.Close;
  Form1.SQLTransaction1.Active:= False;
  Form1.SQLite3Connection1.Connected:= False;

  Form3.SQLQuery1.Close;
  Form3.SQLQuery1.SQL.Text:='select * from zamowienia where id = :id';
  Form3.SQLQuery1.Params[0].AsInteger:=identyfikator;
  Form3.SQLQuery1.Transaction.Active:=True;
  Form3.SQLQuery1.Open;
  Form3.Edit1.Text:=Form3.SQLQuery1.Fields[1].AsString;
  Form3.Edit2.Text:=Form3.SQLQuery1.Fields[2].AsString;
  Form3.Edit3.Text:=Form3.SQLQuery1.Fields[3].AsString;
  Form3.Edit4.Text:=Form3.SQLQuery1.Fields[4].AsString;
  Form3.Edit5.Text:=Form3.SQLQuery1.Fields[5].AsString;
  Form3.Edit6.Text:=Form3.SQLQuery1.Fields[6].AsString;
  Form3.Edit7.Text:=Form3.SQLQuery1.Fields[7].AsString;
  Form3.Edit8.Text:=Form3.SQLQuery1.Fields[8].AsString;
  Form3.ComboBox1.Caption:=Form3.SQLQuery1.Fields[9].AsString;
  Form3.Memo1.Clear;
  Form3.Memo1.Text:=Form3.SQLQuery1.Fields[10].AsString;

  Form3.SQLQuery1.Close;
  Form3.SQLTransaction1.Active:= False;
  Form3.SQLite3Connection1.Connected:= False;

  Form1.SQLQuery1.Close;
  Form1.SQLQuery1.SQL.Text:= 'select * from zamowienia';
  Form1.SQLite3Connection1.Connected:= True;
  Form1.SQLTransaction1.Active:= True;
  Form1.SQLQuery1.Open;



end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Form3.Close;
  Form1.Enabled:=True;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  Form3.SQLQuery1.Close;
  Form3.SQLQuery1.SQL.Text:='select * from zamowienia where id = :id';
  Form3.SQLQuery1.Params[0].AsInteger:=identyfikator;
  Form3.SQLQuery1.Transaction.Active:=True;
  Form3.SQLQuery1.Active:=True;
  Form3.SQLQuery1.Open;
  frReport1.LoadFromFile('raport.lrf');
  frReport1.ShowReport;
  Form3.SQLQuery1.Active:=False;
  Form3.SQLQuery1.Close;
  Form3.SQLTransaction1.Active:= False;
  Form3.SQLite3Connection1.Connected:= False;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  Form4.Show;
  Form3.Enabled:=False;
end;

procedure TForm3.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if Form1.Enabled=False then Form1.Enabled:=True;
end;


end.

