Option Explicit
On Error Resume Next

Const ForReading = 1
Const TextCompare = 1
Const OpenAsUnicode = true 


Dim File1, File2, OutputFile
Dim TextContent1,TextContent2

File1 = WScript.Arguments(0)
File2 = WScript.Arguments(1)


Dim ObjFSO : Set ObjFSO = CreateObject("Scripting.FileSystemObject")
'msgbox File1
 

 
If ObjFSO.FileExists(File1) Then
 
  Dim objFile1 : Set objFile1 = objFSO.OpenTextFile(File1, ForReading,0 , OpenAsUnicode)
  TextContent1 =  objFile1.ReadAll()
  objFile1.close 
  'msgbox  TextContent1
Else

  WScript.Quit
End If

'msgbox File2

If ObjFSO.FileExists(File2) Then
  Dim objFile2 : Set objFile2 = objFSO.OpenTextFile(File2, ForReading,0 , OpenAsUnicode)
  TextContent2 =  objFile2.ReadAll()
  objFile2.close 
  'msgbox  TextContent2
Else
  WScript.Quit
End If


If (StrComp(trim(TextContent1),trim(TextContent2)) <>0) Then
   Msgbox "hardware check maybe  error ."
end if   
 

 