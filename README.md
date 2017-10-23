# get_sysinfo
  windows 開機擷取系統硬體訊息，比對先前資料，並上傳到ftp

  setup.bat  把檔案複製到 c:\tools ，並設定為開機自動執行

  get_sysinfo.bat 擷取系統硬體訊息，比對是否有更換。

  compare_txt.vbs 文件檔案比對程式。

  如果要上傳到 ftp server ，修改 get_sysinfo.bat  
  REM ftp setting  
  set useFtpFG=1  
  set USERNAME=myname  
  set PASSWORD=mypassword  
  set ftpserver=nas.syps.tn.edu.tw  


改用其它ftp

  https://stackoverflow.com/questions/18643542/how-to-use-passive-ftp-mode-in-windows-command-prompt
