FOR /F "tokens=*" %%b IN ('echo %CD%') do (SET CDtemp=%%b)
cd /d c:\program files\
FOR /F "tokens=*" %%j IN ('Echo "Body"') do (SET SDKtemp=%%j)
FOR /F "tokens=*" %%g IN ('"dir /b /ad | findstr Azure | findstr Body"') do (SET BODY=%%g)
FOR /F "tokens=*" %%k IN ('"dir /b /ad | findstr Azure | find /v %SDKtemp%"') do (SET SDK=%%k)
setx AZUREKINECT_SDK "C:\Program Files\%SDK%" /M
setx AZUREKINECT_BODY_SDK "C:\Program Files\%BODY%" /M
setx /M path "%path%;C:\Program Files\%SDK%\sdk\windows-desktop\amd64\release\bin"
setx path "%path%;C:\Program Files\%BODY%\sdk\windows-desktop\amd64\release\bin"
cd /d %CDtemp%
del "k4a.dll"
del "k4abt.dll"
del "k4arecord.dll"
shutdown /r /t 90 /f