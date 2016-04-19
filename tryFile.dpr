program tryFile;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  TSetOfFlags = set of 1..30;
  TFlagsFile = file of TSetOfFlags;
  TMapMatrix = array[1..10, 1..7] of Byte;
  TBigMatrix = array[1..40, 1..40] of Byte;
  TMapFile = file of TBigMatrix;

var
  TestFileLoc: TextFile;
  MyFile: TFlagsFile;
  FMapFile: TMapFile;
  i, j: Integer;
  MySet, MySecondSet: TSetOfFlags;
  mapMatrix: TMapMatrix;
  TestMatrix: TBigMatrix;
begin
  AssignFile (MyFile, 'TestFile.txt');
  AssignFile (FMapFile, 'TestLocate');
  Reset (FMapFile);
  Read (FMapFile, TestMatrix);
  AssignFile (TestFileLoc, 'TestLoc.txt');
  Reset (TestFileLoc);
  for i := 1 to 10 do begin
    for j := 1 to 7 do begin
      read (TestFileLoc, mapMatrix[i,j]);
    end;
  end;
  Rewrite (MyFile);
  MySecondSet := [];
  MySet := [1, 4, 8, 5, 4, 20];
  write (MyFile, Myset);
  Reset (MyFile);
  Read (MyFile, MySecondSet);
  CloseFile (MyFile);
  CloseFile (FMapFile);
  CloseFile (TestFileLoc);
  for i := 1 to 30 do
  if i in MySecondSet then Writeln(i);
  for i := 1 to 10 do begin
    for j := 1 to 7 do begin
      write (mapMatrix[i,j]:3);
    end;
    Writeln;
  end;
  Writeln;
  for i := 1 to 40 do begin
    for j := 1 to 40 do begin
      write (TestMatrix[i,j]);
    end;
    Writeln;
  end;
  Readln;
end.
