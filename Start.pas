unit Start;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TfrmMainForm = class(TForm)
    imgLocation: TImage;
    pnlMenu: TPanel;
    imgPerson: TImage;
    pnlLog: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainForm: TfrmMainForm;

procedure FillMapMatrix(mapName: string);
procedure GoingOnLocation(var corX, corY: word);

implementation

{$R *.dfm}

type
  TBigMatrix = array[0..99, 0..53] of Byte;
  TMapFile = file of TBigMatrix;

var
  CoordX, CoordY: word;
  MapMatrix: TBigMatrix;
  FMapFile: TMapFile;

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  imgLocation.Canvas.Brush.Color:=clYellow;
  imgLocation.Canvas.FillRect(rect(0,0,imgLocation.Canvas.ClipRect.Right,imgLocation.Canvas.ClipRect.Bottom));
  imgPerson.Canvas.Brush.Color:=clred;
  imgPerson.Canvas.FillRect(rect(0,0,imgLocation.Canvas.ClipRect.Right,imgLocation.Canvas.ClipRect.Bottom));
  FillMapMatrix ('100x54');
end;


{procedure TfrmMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (GetKeyState(Ord('W')) and 128)=128 then frmMainForm.imgPerson.Top:=frmMainForm.imgPerson.Top-10;
  if (GetKeyState(Ord('S')) and 128)=128 then frmMainForm.imgPerson.Top:=frmMainForm.imgPerson.Top+10;
  if (GetKeyState(Ord('A')) and 128)=128 then frmMainForm.imgPerson.Left:=frmMainForm.imgPerson.Left-10;
  if (GetKeyState(Ord('D')) and 128)=128 then frmMainForm.imgPerson.Left:=frmMainForm.imgPerson.Left+10;

  if (GetKeyState(VK_UP) and 128)=128 then frmMainForm.imgPerson.Top:=frmMainForm.imgPerson.Top-10;
  if (GetKeyState(VK_DOWN) and 128)=128 then frmMainForm.imgPerson.Top:=frmMainForm.imgPerson.Top+10;
  if (GetKeyState(VK_LEFT) and 128)=128 then frmMainForm.imgPerson.Left:=frmMainForm.imgPerson.Left-10;
  if (GetKeyState(VK_RIGHT) and 128)=128 then frmMainForm.imgPerson.Left:=frmMainForm.imgPerson.Left+10;

  if (((GetKeyState(VK_RIGHT) and 128)=128) and ((GetKeyState(VK_DOWN) and 128)=128))
  or (((GetKeyState(Ord('D')) and 128)=128) and ((GetKeyState(Ord('S')) and 128)=128)) then
  begin
    frmMainForm.imgPerson.Left:=frmMainForm.imgPerson.Left+1;
    frmMainForm.imgPerson.Top:=frmMainForm.imgPerson.Top+1;
  end;

  if (((GetKeyState(VK_RIGHT) and 128)=128) and ((GetKeyState(VK_UP) and 128)=128))
  or (((GetKeyState(Ord('D')) and 128)=128) and ((GetKeyState(Ord('W')) and 128)=128)) then
  begin
    frmMainForm.imgPerson.Left:=frmMainForm.imgPerson.Left+1;
    frmMainForm.imgPerson.Top:=frmMainForm.imgPerson.Top-1;
  end;

  if (((GetKeyState(VK_LEFT) and 128)=128) and ((GetKeyState(VK_DOWN) and 128)=128))
  or (((GetKeyState(Ord('A')) and 128)=128) and ((GetKeyState(Ord('S')) and 128)=128)) then
  begin
    frmMainForm.imgPerson.Left:=frmMainForm.imgPerson.Left-1;
    frmMainForm.imgPerson.Top:=frmMainForm.imgPerson.Top+1;
  end;

  if (((GetKeyState(VK_LEFT) and 128)=128) and ((GetKeyState(VK_UP) and 128)=128))
  or (((GetKeyState(Ord('A')) and 128)=128) and ((GetKeyState(Ord('W')) and 128)=128)) then
  begin
    frmMainForm.imgPerson.Left:=frmMainForm.imgPerson.Left-1;
    frmMainForm.imgPerson.Top:=frmMainForm.imgPerson.Top-1;
  end;

end;   }

procedure TfrmMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //FillMapMatrix ('TestLocate');

  //frmMainForm.imgPerson.Left := CoordX * 10;
 // frmMainForm.imgPerson.Top := CoordY * 10;
  if ((GetKeyState(Ord('W')) and 128)=128) and (MapMatrix[CoordX,CoordY-1]=0) then  Dec(CoordY);
  if ((GetKeyState(Ord('S')) and 128)=128) and (MapMatrix[CoordX,CoordY+1]=0) then  Inc(CoordY);
  if ((GetKeyState(Ord('A')) and 128)=128) and (MapMatrix[CoordX-1,CoordY]=0) then  Dec(CoordX);
  if ((GetKeyState(Ord('D')) and 128)=128) and (MapMatrix[CoordX+1,CoordY]=0) then  Inc(CoordX);
  frmMainForm.imgPerson.Left := CoordX * 10;
  frmMainForm.imgPerson.Top := CoordY * 10;
  GoingOnLocation(CoordX, CoordY);
end;

procedure FillMapMatrix(mapName: string);
begin
  AssignFile (FMapFile, mapName);
  Reset (FMapFile);
  read (FMapFile, MapMatrix);
  Close (FMapFile);
end;

procedure GoToLocation(var corX, corY: word);
begin
  if (corX = 98) and (corY = 52) then
  begin
    FillMapMatrix('loc2_100x54');
    frmMainForm.imgLocation.Canvas.Brush.Color:=clGreen;
    frmMainForm.imgLocation.Canvas.FillRect(rect(0,0, frmMainForm.imgLocation.Canvas.ClipRect.Right, frmMainForm.imgLocation.Canvas.ClipRect.Bottom));
    corX := 1;
    corY := 1;
  end;
end;

initialization
  CoordX := 1;
  CoordY := 1;
end.
