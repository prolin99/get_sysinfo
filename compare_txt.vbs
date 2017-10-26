Option Explicit
On Error Resume Next

Const ForReading = 1
Const TextCompare = 1

Dim File1, File2, OutputFile

File1 = WScript.Arguments(0)
File2 = WScript.Arguments(1)

OutputFile = "outfile.txt"

objStream.CharSet = "utf-8"
Dim objFSO : Set objFSO = CreateObject("Scripting.FileSystemObject")
If ObjFSO.FileExists(File1) Then
  Dim objFile1 : Set objFile1 = objFSO.OpenTextFile(File1, ForReading)
Else
  WScript.Quit
End If

' Dictionary object for reference file.
Dim RefDict : Set RefDict = CreateObject("Scripting.Dictionary")
RefDict.CompareMode = TextCompare

Dim StrLine, SearchLine, strNotFound

' Read reference file into dictionary object.
Do Until objFile1.AtEndOfStream
  StrLine = Trim(objFile1.ReadLine)
  msgbox "aaa" & StrLine

  if Not RefDict.Exists(StrLine) Then
    RefDict.Add StrLine, "1"
  End If
Loop

objFile1.Close

' File that may have more or less lines.
If ObjFSO.FileExists(File2) Then
  Dim objFile2 : Set objFile2 = objFSO.OpenTextFile(File2, ForReading)
Else
  WScript.Quit
End If

' Search 2nd file with reference file.
Do Until objFile2.AtEndOfStream
  SearchLine = Trim(objFile2.ReadLine)
  If Not RefDict.Exists(SearchLine) Then
    If IsEmpty(strNotFound) Then
      strNotFound = SearchLine
    Else
      strNotFound = strNotFound & vbCrLf & SearchLine
    End If
  End If
Loop

objFile2.Close

If IsEmpty(strNotFound) or trim(strNotFound) = "" Then
  ' Msgbox "hardware check ok ."
  WScript.Quit
else
   ' Msgbox "hardware check error."
   WScript.Quit
End If

'Dim objFile3 : Set objFile3 = objFSO.CreateTextFile(OutputFile, True)

'objFile3.WriteLine strNotFound
'objFile3.Close
' https://stackoverflow.com/questions/1410334/filesystemobject-reading-unicode-files
