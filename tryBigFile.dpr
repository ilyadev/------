program tryBigFile;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  TMapMatrix = array[1..54, 1..100] of Byte;
  TBigMatrix = array[1..54, 1..100] of Byte;
  TMapFile = file of TBigMatrix;

var
  TestFileLoc: TextFile;
  FMapFile: TMapFile;
  i, j: Integer;
  mapMatrix: TMapMatrix;
  TestMatrix: TBigMatrix;

begin
  AssignFile (FMapFile, '54x100');
  Reset (FMapFile);
  Read (FMapFile, TestMatrix);
  AssignFile (TestFileLoc, 'text54x100.txt');
  Reset (TestFileLoc);
  for i := 1 to 54 do begin
    for j := 1 to 100 do begin
      read (TestFileLoc, mapMatrix[i,j]);
    end;
  end;
  CloseFile (FMapFile);
  CloseFile (TestFileLoc);
  for i := 1 to 54 do begin
    for j := 1 to 100 do begin
      write (mapMatrix[i,j]);
    end;
    Writeln;
  end;
  Writeln;
  for i := 1 to 54 do begin
    for j := 1 to 100 do begin
      write (TestMatrix[i,j]);
    end;
    Writeln;
  end;
  Readln;
end.
