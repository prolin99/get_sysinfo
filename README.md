# get_sysinfo
  windows 開機擷取系統硬體訊息，比對先前資料，並上傳到ftp

  setup.bat  把檔案複製到 c:\tools ，並設定為開機自動執行。安裝時需要以管理員權限身份執行。

  get_sysinfo.bat 擷取系統硬體訊息，比對是否有更換。第一次執行需要允許 ftp 通過防火牆。

  可以配合 ftp 上傳及下載最新的版本。   

  compare_txt.vbs 文件檔案比對程式，檢查是否硬體有更改。

  如果要上傳到 ftp server ，修改 get_sysinfo.bat  
  REM ftp setting  
  set useFtpFG=1  
  set USERNAME=myname  
  set PASSWORD=ftppassword  


  REM 要上傳上去的位置  
  set ftpserver=ftp://nas.syps.tn.edu.tw/home  

  REM 新版本存放位置，提供客戶端下載  
  set newftp=ftp://120.116.24.2/home/new/  

  REM 取得 IPv4 的網頁（在虚擬IP段，對外使用的真實IP）
  set RealIpPage=http://120.116.24.6/xoops/modules/info_whats/yourip.php  
