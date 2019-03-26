@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\agile.us.dell.com\www" /v https /t REG_DWORD /d 2 /f
cmdkey /add： 172.16.2.2 /user:User1 /pass:Us111111 >nul
echo Please wait
robocopy "\\172.16.2.2\User\Johnny He" "jre-8u181*.*" c:\
REM xcopy "\\172.16.2.2\User\Johnny He\jre-8u181-windows-i586.exe" c:\ /s /y >nul
echo jre installing...
c:\jre-8u181-windows-i586.exe /s STATIC=1 WEB_JAVA=1 >nul
echo open agile...
start iexplore https://agile.us.dell.com/Agile/default 
del c:\jre-8u181-windows-i586.exe