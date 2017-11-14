# get_sysinfo
  windows 開機擷取系統硬體訊息，比對先前資料，並上傳到網頁中。

  setup.bat  把檔案複製到 c:\tools ，並設定為開機自動執行。（安裝時需要以管理員權限身份執行。）  

  get_sysinfo.bat 擷取系統硬體訊息，比對是否有更換。

  可以自動下載最新的版本。   

  compare_txt.vbs 文件檔案比對程式，檢查是否硬體有更改。

  REM ===========================
  REM setting
  set UploadFG=1
  set Web=http://120.116.25.31:8080/x259/modules/info_whats/
  set key=info_whats
  REM ===========================


  REM 要上傳的系統網址，配合 Xoops 模組： https://github.com/prolin99/info_whats  
  set Web=http://120.116.25.31:8080/x259/modules/info_whats/  

  REM 該模組設定的連線代號
  set key=info_whats  


  當有新的 get_sysinfo.bat 或 compare_txt.vbs ，需放在該模組中 news 目錄下。  
